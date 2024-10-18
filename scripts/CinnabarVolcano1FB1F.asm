; marcelnote - new location
CinnabarVolcano1FB1F_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl] ; this is set upon entering the map
	res BIT_CUR_MAP_LOADED_1, [hl]
	call nz, CinnabarVolcano1FB1FCheckBoulderEventScript
	call EnableAutoTextBoxDrawing
	; new
	ld hl, CinnabarVolcano1FB1FTrainerHeaders
    ld de, CinnabarVolcano1FB1F_ScriptPointers
    ld a, [wCinnabarVolcano1FB1FCurScript]
    call ExecuteCurMapScriptInTable
    ld [wCinnabarVolcano1FB1FCurScript], a
    ;
	ld a, CINNABAR_VOLCANO_1FB1F
	ld [wDungeonWarpDestinationMap], a
	ld hl, CinnabarVolcano1FHolesCoords
	jp IsPlayerOnDungeonWarp

CinnabarVolcano1FHolesCoords:
	dbmapcoord 20, 13
	db -1 ; end

CinnabarVolcano1FB1FCheckBoulderEventScript:
	CheckEvent EVENT_CINNABAR_VOLCANO_1F_BOULDER_ON_SWITCH
	ret z
	ld a, $1D
	lb bc, 16, 11
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	ret

CinnabarVolcano1FB1F_ScriptPointers:
	def_script_pointers
	dw_const CinnabarVolcano1FB1FDefaultScript,              SCRIPT_CINNABARVOLCANO1FB1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle,          SCRIPT_CINNABARVOLCANO1FB1F_START_BATTLE
	dw_const EndTrainerBattle,                               SCRIPT_CINNABARVOLCANO1FB1F_END_BATTLE
	dw_const CinnabarVolcano1FLanceExitsScript,              SCRIPT_CINNABARVOLCANO1F_LANCE_EXITS
	dw_const CinnabarVolcanoB1FPlayerMovesToCharizardScript, SCRIPT_CINNABARVOLCANOB1F_PLAYER_MOVES_TO_CHARIZARD
	dw_const CinnabarVolcanoB1FCharizardBattleStartsScript,  SCRIPT_CINNABARVOLCANOB1F_CHARIZARD_BATTLE_STARTS
	dw_const CinnabarVolcanoB1FCharizardBattleScript,        SCRIPT_CINNABARVOLCANOB1F_CHARIZARD_BATTLE
	dw_const CinnabarVolcanoB1FLanceGreatJobScript,          SCRIPT_CINNABARVOLCANOB1F_LANCE_GREAT_JOB

CinnabarVolcano1FB1FDefaultScript:
	CheckHideShow HS_CINNABAR_VOLCANO_1F_LANCE
	jr nz, .noLance1F
	ld hl, .Lance1FCoords
	call ArePlayerCoordsInArray
	jp c, CinnabarVolcano1FLanceGoesInScript
.noLance1F
	CheckHideShow HS_CINNABAR_VOLCANO_B1F_LANCE
	jr nz, .noLanceB1F
	ld hl, .LanceB1FCoords
	call ArePlayerCoordsInArray
	jp c, CinnabarVolcanoB1FLanceTogetherScript
.noLanceB1F
	ld hl, .SwitchCoords
	call CheckBoulderCoords
	jp nc, CheckFightingMapTrainers   ; if boulder not on switch coordinates
	EventFlagAddress hl, EVENT_CINNABAR_VOLCANO_1F_BOULDER_ON_SWITCH
	CheckEventReuseHL EVENT_CINNABAR_VOLCANO_1F_BOULDER_ON_SWITCH
	SetEventReuseHL EVENT_CINNABAR_VOLCANO_1F_BOULDER_ON_SWITCH
	ret nz  ; event already set, no need to set flag
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	ret

.SwitchCoords:
	dbmapcoord  9, 14
	db -1 ; end

.Lance1FCoords:
	dbmapcoord 25, 10
	dbmapcoord 24, 11
	db -1 ; end

.LanceB1FCoords:
	dbmapcoord 20, 26
	dbmapcoord 21, 26
	db -1 ; end

CinnabarVolcano1FLanceGoesInScript: ; marcelnote - adapted from PokemonTower2F rival script
	ld a, [wCoordIndex]
	cp $1
	ld a, PLAYER_DIR_UP
	ld b, SPRITE_FACING_DOWN
	jr nz, .player_below_Lance
	ld a, PLAYER_DIR_LEFT
	ld b, SPRITE_FACING_RIGHT
.player_below_Lance
	ld [wPlayerMovingDirection], a
	ld a, CINNABARVOLCANO1F_LANCE
	ldh [hSpriteIndex], a
	ld a, b
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_CINNABARVOLCANO1F_LANCE_CAME_IN_HASTE
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ldh [hJoyHeld], a
	ldh [hJoyPressed], a
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld de, .LanceGoesInMovementFacingDown
	ld a, [wPlayerMovingDirection]
	cp PLAYER_DIR_LEFT
	jr nz, .LanceFacingDown
	ld de, .LanceGoesInMovementFacingRight
.LanceFacingDown
	ld a, CINNABARVOLCANO1F_LANCE
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_CINNABARVOLCANO1F_LANCE_EXITS
	ld [wCinnabarVolcano1FB1FCurScript], a
	ld [wCurMapScript], a
	ret

.LanceGoesInMovementFacingRight:
	db NPC_MOVEMENT_UP
.LanceGoesInMovementFacingDown:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1 ; end

CinnabarVolcano1FLanceExitsScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, HS_CINNABAR_VOLCANO_1F_LANCE
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_CINNABAR_VOLCANO_B1F_LANCE
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_CINNABAR_VOLCANO_B1F_CHARIZARD
	ld [wMissableObjectIndex], a
	predef ShowObject
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_CINNABARVOLCANO1FB1F_DEFAULT
	ld [wCinnabarVolcano1FB1FCurScript], a
	ld [wCurMapScript], a
	ret

CinnabarVolcanoB1FLanceTogetherScript:
	ld a, TEXT_CINNABARVOLCANOB1F_LANCE_TOGETHER
	ldh [hTextID], a
	call DisplayTextID
	ld a, SCRIPT_CINNABARVOLCANOB1F_PLAYER_MOVES_TO_CHARIZARD
	ld [wCinnabarVolcano1FB1FCurScript], a
	ld [wCurMapScript], a
	ret

CinnabarVolcanoB1FPlayerMovesToCharizardScript:
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, $3
	ld [wSimulatedJoypadStatesIndex], a
	ld hl, wSimulatedJoypadStatesEnd
	ld a, D_UP
	ld [hli], a
	ld a, D_LEFT
	ld [hli], a
	ld a, [wXCoord]
	cp 20 ; Xcoord of left event tile
	jr z, .left_tile
	ld a, D_LEFT ; if on right tile, do one more step to the left
	ld [hli], a
	ld a, $4     ; and increase the total number of steps
	ld [wSimulatedJoypadStatesIndex], a
.left_tile
	ld a, D_UP
	ld [hl], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_CINNABARVOLCANOB1F_CHARIZARD_BATTLE_STARTS
	ld [wCinnabarVolcano1FB1FCurScript], a
	ld [wCurMapScript], a
	ret

CinnabarVolcanoB1FCharizardBattleStartsScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, CINNABARVOLCANOB1F_CHARIZARD ; load the sprite ID so that it remains
	ldh [hTextID], a      ; during the pre-battle animation
	ld a, CHARIZARD
	ld [wCurOpponent], a
	ld a, 60
	ld [wCurEnemyLevel], a
	ld a, SCRIPT_CINNABARVOLCANOB1F_CHARIZARD_BATTLE
	ld [wCinnabarVolcano1FB1FCurScript], a
	ld [wCurMapScript], a
	ret

CinnabarVolcanoB1FCharizardBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CinnabarVolcano1FB1FDefaultScript
	ld a, TEXT_CINNABARVOLCANOB1F_LANCE_POKE_BALL
	ldh [hTextID], a
	call DisplayTextID
	ld a, HS_CINNABAR_VOLCANO_B1F_CHARIZARD
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, TEXT_CINNABARVOLCANOB1F_CHARIZARD_CAUGHT
	ldh [hTextID], a
	call DisplayTextID
	ld de, .LanceMovement
	ld a, CINNABARVOLCANOB1F_LANCE
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_CINNABARVOLCANOB1F_LANCE_GREAT_JOB
	ld [wCinnabarVolcano1FB1FCurScript], a
	ld [wCurMapScript], a
	ret

.LanceMovement:
	db NPC_MOVEMENT_DOWN
	db -1 ; end

CinnabarVolcanoB1FLanceGreatJobScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	ld a, CINNABARVOLCANOB1F_LANCE
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	xor a
	ld [wJoyIgnore], a
	ld a, TEXT_CINNABARVOLCANOB1F_LANCE_GREAT_JOB
	ldh [hTextID], a
	call DisplayTextID
	call GBFadeOutToBlack
	ld a, HS_CINNABAR_VOLCANO_B1F_LANCE
	ld [wMissableObjectIndex], a
	predef HideObject
	call UpdateSprites
	call Delay3
	SetEvent EVENT_POSTGAME_LANCE
	CheckBothEventsSet EVENT_POSTGAME_LORELEI, EVENT_POSTGAME_BRUNO ; sets Z flag when events are set
	jr nz, .end
	CheckBothEventsSet EVENT_POSTGAME_AGATHA, EVENT_POSTGAME_RIVAL
	jr nz, .end
	ld a, HS_INDIGO_PLATEAU_LOBBY_GIRL1 ; marcelnote - remove girl from E4 entrance
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	ld a, HS_INDIGO_PLATEAU_LOBBY_GIRL2 ; marcelnote - remove girl from E4 entrance
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_INDIGO_PLATEAU_LOBBY_RIVAL ; marcelnote - show Rival
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
.end
	call GBFadeInFromBlack
	xor a
	ldh [hJoyHeld], a ; marcelnote - BUG: there is a slight twitch at the end, why?
	ldh [hJoyPressed], a
	ld a, SCRIPT_CINNABARVOLCANO1FB1F_DEFAULT
	ld [wCinnabarVolcano1FB1FCurScript], a
	ld [wCurMapScript], a
	ret

CinnabarVolcano1FB1F_TextPointers:
	def_text_pointers
	; object_events
	dw_const CinnabarVolcanoB1FScientistText,       TEXT_CINNABARVOLCANOB1F_SCIENTIST
	dw_const CinnabarVolcanoB1FHikerText,           TEXT_CINNABARVOLCANOB1F_HIKER
	dw_const CinnabarVolcanoB1FCooltrainerFText,    TEXT_CINNABARVOLCANOB1F_COOLTRAINER_F
	dw_const CinnabarVolcano1FCooltrainerMText,     TEXT_CINNABARVOLCANO1F_COOLTRAINER_M
	dw_const CinnabarVolcano1FBurglarText,          TEXT_CINNABARVOLCANO1F_BURGLAR
	dw_const CinnabarVolcano1FGentlemanText,        TEXT_CINNABARVOLCANO1F_GENTLEMAN
	dw_const CinnabarVolcano1FBeautyText,           TEXT_CINNABARVOLCANO1F_BEAUTY
	dw_const CinnabarVolcanoB1FCharizardText,       TEXT_CINNABARVOLCANOB1F_CHARIZARD
	dw_const CinnabarVolcano1FLanceCameInHasteText, TEXT_CINNABARVOLCANO1F_LANCE_CAME_IN_HASTE
	dw_const CinnabarVolcanoB1FLanceTogetherText,   TEXT_CINNABARVOLCANOB1F_LANCE_TOGETHER
	dw_const PickUpItemText,                        TEXT_CINNABARVOLCANOB1F_IRON
	dw_const PickUpItemText,                        TEXT_CINNABARVOLCANOB1F_ICE_HEAL
	dw_const PickUpItemText,                        TEXT_CINNABARVOLCANO1F_FULL_RESTORE
	dw_const BoulderText,                           TEXT_CINNABARVOLCANO1F_BOULDER
	; bg_events
	dw_const CinnabarVolcanoB1FLavaSignText,        TEXT_CINNABARVOLCANOB1F_LAVA_SIGN
	dw_const CinnabarVolcano1FBurnHealSignText,     TEXT_CINNABARVOLCANO1F_BURNHEAL_SIGN
	; neither
	dw_const CinnabarVolcanoB1FLancePokeBallText,   TEXT_CINNABARVOLCANOB1F_LANCE_POKE_BALL
	dw_const CinnabarVolcanoB1FCharizardCaughtText, TEXT_CINNABARVOLCANOB1F_CHARIZARD_CAUGHT
	dw_const CinnabarVolcanoB1FLanceGreatJobText,   TEXT_CINNABARVOLCANOB1F_LANCE_GREAT_JOB

CinnabarVolcano1FB1FTrainerHeaders:
	def_trainers
CinnabarVolcanoB1FTrainerHeader0:
	trainer EVENT_BEAT_CINNABAR_VOLCANO_B1F_TRAINER_0, 2, CinnabarVolcanoB1FScientistBattleText, CinnabarVolcanoB1FScientistEndBattleText, CinnabarVolcanoB1FScientistAfterBattleText
CinnabarVolcanoB1FTrainerHeader1:
	trainer EVENT_BEAT_CINNABAR_VOLCANO_B1F_TRAINER_1, 2, CinnabarVolcanoB1FHikerBattleText, CinnabarVolcanoB1FHikerEndBattleText, CinnabarVolcanoB1FHikerAfterBattleText
CinnabarVolcanoB1FTrainerHeader2:
	trainer EVENT_BEAT_CINNABAR_VOLCANO_B1F_TRAINER_2, 3, CinnabarVolcanoB1FCooltrainerFBattleText, CinnabarVolcanoB1FCooltrainerFEndBattleText, CinnabarVolcanoB1FCooltrainerFAfterBattleText
CinnabarVolcano1FTrainerHeader0:
	trainer EVENT_BEAT_CINNABAR_VOLCANO_1F_TRAINER_0, 4, CinnabarVolcano1FCooltrainerMBattleText, CinnabarVolcano1FCooltrainerMEndBattleText, CinnabarVolcano1FCooltrainerMAfterBattleText
CinnabarVolcano1FTrainerHeader1:
	trainer EVENT_BEAT_CINNABAR_VOLCANO_1F_TRAINER_1, 4, CinnabarVolcano1FBurglarBattleText, CinnabarVolcano1FBurglarEndBattleText, CinnabarVolcano1FBurglarAfterBattleText
CinnabarVolcano1FTrainerHeader2:
	trainer EVENT_BEAT_CINNABAR_VOLCANO_1F_TRAINER_2, 3, CinnabarVolcano1FGentlemanBattleText, CinnabarVolcano1FGentlemanEndBattleText, CinnabarVolcano1FGentlemanAfterBattleText
CinnabarVolcano1FTrainerHeader3:
	trainer EVENT_BEAT_CINNABAR_VOLCANO_1F_TRAINER_3, 3, CinnabarVolcano1FBeautyBattleText, CinnabarVolcano1FBeautyEndBattleText, CinnabarVolcano1FBeautyAfterBattleText
	db -1 ; end

CinnabarVolcanoB1FScientistText:
	text_asm
	ld hl, CinnabarVolcanoB1FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcanoB1FHikerText:
	text_asm
	ld hl, CinnabarVolcanoB1FTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcanoB1FCooltrainerFText:
	text_asm
	ld hl, CinnabarVolcanoB1FTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcano1FCooltrainerMText:
	text_asm
	ld hl, CinnabarVolcano1FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcano1FBurglarText:
	text_asm
	ld hl, CinnabarVolcano1FTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcano1FGentlemanText:
	text_asm
	ld hl, CinnabarVolcano1FTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcano1FBeautyText:
	text_asm
	ld hl, CinnabarVolcano1FTrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcanoB1FScientistBattleText:
	text_far _CinnabarVolcanoB1FScientistBattleText
	text_end

CinnabarVolcanoB1FScientistEndBattleText:
	text_far _CinnabarVolcanoB1FScientistEndBattleText
	text_end

CinnabarVolcanoB1FScientistAfterBattleText:
	text_far _CinnabarVolcanoB1FScientistAfterBattleText
	text_end

CinnabarVolcanoB1FHikerBattleText:
	text_far _CinnabarVolcanoB1FHikerBattleText
	text_end

CinnabarVolcanoB1FHikerEndBattleText:
	text_far _CinnabarVolcanoB1FHikerEndBattleText
	text_end

CinnabarVolcanoB1FHikerAfterBattleText:
	text_far _CinnabarVolcanoB1FHikerAfterBattleText
	text_end

CinnabarVolcanoB1FCooltrainerFBattleText:
	text_far _CinnabarVolcanoB1FCooltrainerFBattleText
	text_end

CinnabarVolcanoB1FCooltrainerFEndBattleText:
	text_far _CinnabarVolcanoB1FCooltrainerFEndBattleText
	text_end

CinnabarVolcanoB1FCooltrainerFAfterBattleText:
	text_far _CinnabarVolcanoB1FCooltrainerFAfterBattleText
	text_end

CinnabarVolcano1FCooltrainerMBattleText:
	text_far _CinnabarVolcano1FCooltrainerMBattleText
	text_end

CinnabarVolcano1FCooltrainerMEndBattleText:
	text_far _CinnabarVolcano1FCooltrainerMEndBattleText
	text_end

CinnabarVolcano1FCooltrainerMAfterBattleText:
	text_far _CinnabarVolcano1FCooltrainerMAfterBattleText
	text_end

CinnabarVolcano1FBurglarBattleText:
	text_far _CinnabarVolcano1FBurglarBattleText
	text_end

CinnabarVolcano1FBurglarEndBattleText:
	text_far _CinnabarVolcano1FBurglarEndBattleText
	text_end

CinnabarVolcano1FBurglarAfterBattleText:
	text_far _CinnabarVolcano1FBurglarAfterBattleText
	text_end

CinnabarVolcano1FGentlemanBattleText:
	text_far _CinnabarVolcano1FGentlemanBattleText
	text_end

CinnabarVolcano1FGentlemanEndBattleText:
	text_far _CinnabarVolcano1FGentlemanEndBattleText
	text_end

CinnabarVolcano1FGentlemanAfterBattleText:
	text_far _CinnabarVolcano1FGentlemanAfterBattleText
	text_end

CinnabarVolcano1FBeautyBattleText:
	text_far _CinnabarVolcano1FBeautyBattleText
	text_end

CinnabarVolcano1FBeautyEndBattleText:
	text_far _CinnabarVolcano1FBeautyEndBattleText
	text_end

CinnabarVolcano1FBeautyAfterBattleText:
	text_far _CinnabarVolcano1FBeautyAfterBattleText
	text_end

CinnabarVolcanoB1FLavaSignText:
	text_far _CinnabarVolcanoB1FLavaSignText
	text_end

CinnabarVolcano1FBurnHealSignText:
	text_far _CinnabarVolcano1FBurnHealSignText
	text_end

CinnabarVolcano1FLanceCameInHasteText:
	text_far _CinnabarVolcano1FLanceCameInHasteText
	text_end

CinnabarVolcanoB1FLanceTogetherText:
	text_far _CinnabarVolcanoB1FLanceTogetherText
	text_end

CinnabarVolcanoB1FLancePokeBallText:
	text_far _CinnabarVolcanoB1FLancePokeBallText
	text_end
	;text_asm
	;ld a, SFX_BALL_TOSS ; marcelnote - to add after crysaudio
	;ld c, BANK(SFX_Ball_Toss)
	;call PlaySound
	;call WaitForSoundToFinish
	;rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarVolcanoB1FCharizardCaughtText:
	text_far _CinnabarVolcanoB1FCharizardCaughtText
	text_end

CinnabarVolcanoB1FLanceGreatJobText:
	text_far _CinnabarVolcanoB1FLanceGreatJobText
	text_end

CinnabarVolcanoB1FCharizardText:
	text_far _CinnabarVolcanoB1FCharizardText
	text_end
