PokemonTower6F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower6TrainerHeaders
	ld de, PokemonTower6F_ScriptPointers
	ld a, [wPokemonTower6FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower6FCurScript], a
	ret

PokemonTower6FSetDefaultScript:
	xor a
	ld [wJoyIgnore], a
	ld [wPokemonTower6FCurScript], a ; SCRIPT_POKEMONTOWER6F_DEFAULT
	ld [wCurMapScript], a ; SCRIPT_POKEMONTOWER6F_DEFAULT
	ret

PokemonTower6F_ScriptPointers:
	def_script_pointers
	dw_const PokemonTower6FDefaultScript,           SCRIPT_POKEMONTOWER6F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_POKEMONTOWER6F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_POKEMONTOWER6F_END_BATTLE
	dw_const PokemonTower6FPlayerMovingScript,      SCRIPT_POKEMONTOWER6F_PLAYER_MOVING
	dw_const PokemonTower6FMarowakBattleScript,     SCRIPT_POKEMONTOWER6F_MAROWAK_BATTLE
	dw_const PokemonTower6FGhostBattleScript,       SCRIPT_POKEMONTOWER6F_GHOST_BATTLE  ; marcelnote - postgame Agatha event

PokemonTower6FDefaultScript:
IF DEF(_DEBUG) ; marcelnote - added to skip in debug mode
	call DebugPressedOrHeldB
	ret nz
ENDC
	CheckEvent EVENT_BEAT_GHOST_MAROWAK
	jp nz, PokemonTower6FCheckGhostEncounterScript ; marcelnote - postgame Agatha event, was jp nz, CheckFightingMapTrainers
	ld hl, PokemonTower6FMarowakCoords
	call ArePlayerCoordsInArray
	jp nc, PokemonTower6FCheckGhostEncounterScript ; marcelnote - postgame Agatha event, was jp nc, CheckFightingMapTrainers
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_POKEMONTOWER6F_BEGONE
	ldh [hTextID], a
	call DisplayTextID
	ld a, RESTLESS_SOUL
	ld [wCurOpponent], a
	ld a, 30
	ld [wCurEnemyLevel], a
	ld a, SCRIPT_POKEMONTOWER6F_MAROWAK_BATTLE
	ld [wPokemonTower6FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower6FMarowakCoords:
	dbmapcoord 10, 16
	db -1 ; end

PokemonTower6FMarowakBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, PokemonTower6FSetDefaultScript
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, [wStatusFlags3]
	bit BIT_TALKED_TO_TRAINER, a
	ret nz
	call UpdateSprites
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, [wBattleResult]
	and a
	jr nz, .did_not_defeat
	SetEvent EVENT_BEAT_GHOST_MAROWAK
	ld a, TEXT_POKEMONTOWER6F_MAROWAK_DEPARTED
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_POKEMONTOWER6F_DEFAULT
	ld [wPokemonTower6FCurScript], a
	ld [wCurMapScript], a
	ret
.did_not_defeat
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_RIGHT ; marcelnote - replaced $10
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, SCRIPT_POKEMONTOWER6F_PLAYER_MOVING
	ld [wPokemonTower6FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower6FPlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wPokemonTower6FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower6FCheckGhostEncounterScript: ; marcelnote - postgame Agatha event
	CheckHideShow HS_POKEMON_TOWER_6F_AGATHA
	jp nz, CheckFightingMapTrainers
	CheckEvent EVENT_BEAT_GHOST_6F
	jp nz, CheckFightingMapTrainers
	ld hl, PokemonTower6FGhostBattleCoords
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_POKEMONTOWER6F_GHOST_BATTLE
	ldh [hTextID], a
	call DisplayTextID
	ld a, GHOST_NINETALES
	ld [wCurOpponent], a
	ld a, 64
	ld [wCurEnemyLevel], a
	ld a, SCRIPT_POKEMONTOWER6F_GHOST_BATTLE
	ld [wPokemonTower6FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower6FGhostBattleCoords: ; marcelnote - postgame Agatha event
	dbmapcoord  6,  8
	db -1 ; end

PokemonTower6FGhostBattleScript: ; marcelnote - postgame Agatha event
	ld a, [wIsInBattle]
	cp $ff
	jp z, PokemonTower6FSetDefaultScript
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, [wStatusFlags3]
	bit BIT_TALKED_TO_TRAINER, a
	ret nz
	call UpdateSprites
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, [wBattleResult]
	and a
	jr nz, .did_not_defeat
	SetEvent EVENT_BEAT_GHOST_6F
	ld a, TEXT_POKEMONTOWER6F_GHOST_VANISHED
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_POKEMONTOWER6F_DEFAULT
	ld [wPokemonTower6FCurScript], a
	ld [wCurMapScript], a
	ret
.did_not_defeat
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, SCRIPT_POKEMONTOWER6F_PLAYER_MOVING
	ld [wPokemonTower6FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower6F_TextPointers:
	def_text_pointers
	dw_const PokemonTower6FChanneler1Text,      TEXT_POKEMONTOWER6F_CHANNELER1
	dw_const PokemonTower6FChanneler2Text,      TEXT_POKEMONTOWER6F_CHANNELER2
	dw_const PokemonTower6FChanneler3Text,      TEXT_POKEMONTOWER6F_CHANNELER3
	dw_const PokemonTower6FAgathaText,          TEXT_POKEMONTOWER6F_AGATHA ; marcelnote - postgame Agatha event
	dw_const PickUpItemText,                    TEXT_POKEMONTOWER6F_RARE_CANDY
	dw_const PickUpItemText,                    TEXT_POKEMONTOWER6F_X_ACCURACY
	dw_const PokemonTower6FTombText,            TEXT_POKEMONTOWER6F_TOMB ; marcelnote - postgame Agatha event
	dw_const PokemonTower6FBeGoneText,          TEXT_POKEMONTOWER6F_BEGONE
	dw_const PokemonTower6FMarowakDepartedText, TEXT_POKEMONTOWER6F_MAROWAK_DEPARTED
	dw_const PokemonTower6FGhostBattleText,     TEXT_POKEMONTOWER6F_GHOST_BATTLE   ; marcelnote - postgame Agatha event
	dw_const PokemonTower6FGhostVanishedText,   TEXT_POKEMONTOWER6F_GHOST_VANISHED ; marcelnote - postgame Agatha event

PokemonTower6TrainerHeaders:
	def_trainers
PokemonTower6TrainerHeader0:
	trainer EVENT_BEAT_POKEMONTOWER_6_TRAINER_0, 3, PokemonTower6FChanneler1BattleText, PokemonTower6FChanneler1EndBattleText, PokemonTower6FChanneler1AfterBattleText
PokemonTower6TrainerHeader1:
	trainer EVENT_BEAT_POKEMONTOWER_6_TRAINER_1, 3, PokemonTower6FChanneler2BattleText, PokemonTower6FChanneler2EndBattleText, PokemonTower6FChanneler2AfterBattleText
PokemonTower6TrainerHeader2:
	trainer EVENT_BEAT_POKEMONTOWER_6_TRAINER_2, 2, PokemonTower6FChanneler3BattleText, PokemonTower6FChanneler3EndBattleText, PokemonTower6FChanneler3AfterBattleText
	db -1 ; end

PokemonTower6FChanneler1Text:
	text_asm
	ld hl, PokemonTower6TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

PokemonTower6FChanneler2Text:
	text_asm
	ld hl, PokemonTower6TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

PokemonTower6FChanneler3Text:
	text_asm
	ld hl, PokemonTower6TrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

PokemonTower6FMarowakDepartedText:
	text_asm
	ld hl, PokemonTower6FGhostWasCubonesMotherText
	call PrintText
	ld a, RESTLESS_SOUL
	call PlayCry
	call WaitForSoundToFinish
	ld c, 30
	call DelayFrames
	ld hl, PokemonTower6FSoulWasCalmedText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

PokemonTower6FGhostWasCubonesMotherText:
	text_far _PokemonTower6FGhostWasCubonesMotherText
	text_end

PokemonTower6FSoulWasCalmedText:
	text_far _PokemonTower6FSoulWasCalmedText
	text_end

PokemonTower6FChanneler1BattleText:
	text_far _PokemonTower6FChanneler1BattleText
	text_end

PokemonTower6FChanneler1EndBattleText:
	text_far _PokemonTower6FChanneler1EndBattleText
	text_end

PokemonTower6FChanneler1AfterBattleText:
	text_far _PokemonTower6FChanneler1AfterBattleText
	text_end

PokemonTower6FChanneler2BattleText:
	text_far _PokemonTower6FChanneler2BattleText
	text_end

PokemonTower6FChanneler2EndBattleText:
	text_far _PokemonTower6FChanneler2EndBattleText
	text_end

PokemonTower6FChanneler2AfterBattleText:
	text_far _PokemonTower6FChanneler2AfterBattleText
	text_end

PokemonTower6FChanneler3BattleText:
	text_far _PokemonTower6FChanneler3BattleText
	text_end

PokemonTower6FChanneler3EndBattleText:
	text_far _PokemonTower6FChanneler3EndBattleText
	text_end

PokemonTower6FChanneler3AfterBattleText:
	text_far _PokemonTower6FChanneler3AfterBattleText
	text_end

PokemonTower6FBeGoneText:
	text_far _PokemonTower6FBeGoneText
	text_end

PokemonTower6FAgathaText: ; marcelnote - postgame Agatha event
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .text
	call PrintText
	call Delay3
	call GBFadeOutToBlack
	ld a, HS_POKEMON_TOWER_6F_AGATHA
	ld [wMissableObjectIndex], a
	predef HideObject
	call UpdateSprites
	call Delay3
	SetEvent EVENT_POSTGAME_AGATHA
	CheckBothEventsSet EVENT_POSTGAME_LORELEI, EVENT_POSTGAME_BRUNO ; sets Z flag when events are set
	jr nz, .end
	CheckBothEventsSet EVENT_POSTGAME_LANCE, EVENT_POSTGAME_RIVAL
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
	ld a, SCRIPT_POKEMONTOWER6F_DEFAULT
	ld [wPokemonTower6FCurScript], a
	ld [wCurMapScript], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.text
	text_far _PokemonTower6FAgathaText
	text_waitbutton
	text_end

PokemonTower6FGhostBattleText: ; marcelnote - postgame Agatha event
	text_far _PokemonTower6FGhostBattleText
	text_end

PokemonTower6FGhostVanishedText: ; marcelnote - postgame Agatha event
	text_far _PokemonTower6FGhostVanishedText
	text_end

PokemonTower6FTombText: ; marcelnote - postgame Agatha event
	text_far _PokemonTower6FTombText
	text_end
