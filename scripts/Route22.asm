Route22_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route22_ScriptPointers
	ld a, [wRoute22CurScript]
	jp CallFunctionInTable

Route22_ScriptPointers:
	def_script_pointers
	dw_const Route22DefaultScript,           SCRIPT_ROUTE22_DEFAULT
	dw_const Route22Rival1StartBattleScript, SCRIPT_ROUTE22_RIVAL1_START_BATTLE
	dw_const Route22Rival1AfterBattleScript, SCRIPT_ROUTE22_RIVAL1_AFTER_BATTLE
	dw_const Route22Rival1ExitScript,        SCRIPT_ROUTE22_RIVAL1_EXIT
	dw_const Route22Rival2StartBattleScript, SCRIPT_ROUTE22_RIVAL2_START_BATTLE
	dw_const Route22Rival2AfterBattleScript, SCRIPT_ROUTE22_RIVAL2_AFTER_BATTLE
	dw_const Route22Rival2ExitScript,        SCRIPT_ROUTE22_RIVAL2_EXIT
	dw_const DoRet,                          SCRIPT_ROUTE22_NOOP ; PureRGB - DoRet

Route22MoveRivalRightScript:
	ld de, Route22RivalMovementData
	ld a, [wSavedCoordIndex]
	cp $1
	jr z, .skipFirstRight
	inc de
.skipFirstRight
	call MoveSprite
	ld a, SPRITE_FACING_RIGHT
	ldh [hSpriteFacingDirection], a
	jp SetSpriteFacingDirectionAndDelay

Route22RivalMovementData:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

Route22DefaultScript:
	CheckEvent EVENT_ROUTE22_RIVAL_WANTS_BATTLE
	ret z
	ld hl, .Route22RivalBattleCoords
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wCoordIndex]
	ld [wSavedCoordIndex], a
	xor a
	ldh [hJoyHeld], a
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	CheckEvent EVENT_1ST_ROUTE22_RIVAL_BATTLE
	jr nz, Route22FirstRivalBattleScript
	CheckEventReuseA EVENT_2ND_ROUTE22_RIVAL_BATTLE
	jp nz, Route22SecondRivalBattleScript
	ret

.Route22RivalBattleCoords
	dbmapcoord 29,  6 ; marcelnote - modified to accommodate Route22OldRodHouse
	dbmapcoord 29,  7 ; marcelnote - idem
	db -1 ; end

Route22FirstRivalBattleScript:
	ld a, ROUTE22_RIVAL1
	ld [wEmotionBubbleSpriteIndex], a
	xor a ; EXCLAMATION_BUBBLE
	ld [wWhichEmotionBubble], a
	predef EmotionBubble
	ld a, [wWalkBikeSurfState]
	and a ; WALKING
	jr z, .walking
	ld a, SFX_STOP_ALL_MUSIC
;	ld [wNewSoundID], a
	call PlaySound
.walking
	ld c, 0 ; BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld a, ROUTE22_RIVAL1
	ldh [hSpriteIndex], a
	call Route22MoveRivalRightScript
	ld a, SCRIPT_ROUTE22_RIVAL1_START_BATTLE
	ld [wRoute22CurScript], a
	ret

Route22Rival1StartBattleScript: ; marcelnote - optimized
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, [wSavedCoordIndex]
	dec a
	ld a, SPRITE_FACING_RIGHT
	jr nz, .setRivalFacingDirection
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ld a, SPRITE_FACING_UP
.setRivalFacingDirection
	ldh [hSpriteFacingDirection], a
	ld a, ROUTE22_RIVAL1
	ldh [hSpriteIndex], a
	call SetSpriteFacingDirectionAndDelay
	xor a
	ld [wJoyIgnore], a
	ld a, TEXT_ROUTE22_RIVAL1
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, Route22Rival1DefeatedText
	ld de, Route22Rival1VictoryText
	call SaveEndBattleTextPointers
	ld a, OPP_RIVAL1
	ld [wCurOpponent], a

	; select which team to use during the encounter
	ld a, [wRivalStarter]
	ld b, 4     ; 4 = Squirtle team
	cp STARTER2 ; Squirtle
	jr z, .gotTeam
	inc b       ; 5 = Bulbasaur team
	cp STARTER3 ; Bulbasaur
	jr z, .gotTeam
	inc b       ; 6 = Charmander team
.gotTeam
	ld a, b
	ld [wTrainerNo], a

	ld a, SCRIPT_ROUTE22_RIVAL1_AFTER_BATTLE
	ld [wRoute22CurScript], a
	ret


Route22Rival1AfterBattleScript: ; marcelnote - optimized
	ld a, [wIsInBattle]
	inc a ; lost battle?
	jr z, .setScript ; SCRIPT_ROUTE22_DEFAULT
	ld a, [wSpritePlayerStateData1FacingDirection]
	and a ; SPRITE_FACING_DOWN?
	ld a, SPRITE_FACING_UP
	jr z, .setRivalFacing
	ld a, SPRITE_FACING_RIGHT
.setRivalFacing
	ldh [hSpriteFacingDirection], a
	ld a, ROUTE22_RIVAL1
	ldh [hSpriteIndex], a
	call SetSpriteFacingDirectionAndDelay
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_ROUTE22_RIVAL_1ST_BATTLE
	ld a, TEXT_ROUTE22_RIVAL1
	ldh [hTextID], a
	call DisplayTextID
	ld a, SFX_STOP_ALL_MUSIC
;	ld [wNewSoundID], a
	call PlaySound
	callfar Music_RivalAlternateStart
	ld a, [wSavedCoordIndex]
	dec a
	ld de, .ExitMovementData1
	jr z, .gotExitMovement
	ld de, .ExitMovementData2
.gotExitMovement
	ld a, ROUTE22_RIVAL1
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_ROUTE22_RIVAL1_EXIT
.setScript
	ld [wRoute22CurScript], a
	ret

.ExitMovementData1:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

.ExitMovementData2:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

Route22Rival1ExitScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, TOGGLE_ROUTE_22_RIVAL_1
	ld [wToggleableObjectIndex], a
	predef HideObject
	call PlayDefaultMusic
	ResetEvents EVENT_1ST_ROUTE22_RIVAL_BATTLE, EVENT_ROUTE22_RIVAL_WANTS_BATTLE
	ld a, SCRIPT_ROUTE22_DEFAULT
	ld [wRoute22CurScript], a
	ret

Route22SecondRivalBattleScript:
	ld a, ROUTE22_RIVAL2
	ld [wEmotionBubbleSpriteIndex], a
	xor a ; EXCLAMATION_BUBBLE
	ld [wWhichEmotionBubble], a
	predef EmotionBubble
	ld a, [wWalkBikeSurfState] ; marcelnote - what's this for? maybe for before crysaudio?
	and a ; WALKING?
	jr z, .walking
	ld a, SFX_STOP_ALL_MUSIC
;	ld [wNewSoundID], a
	call PlaySound
.walking
	ld a, SFX_STOP_ALL_MUSIC
;	ld [wNewSoundID], a
	call PlaySound
	callfar Music_RivalAlternateTempo
	ld a, ROUTE22_RIVAL2
	ldh [hSpriteIndex], a
	call Route22MoveRivalRightScript
	ld a, SCRIPT_ROUTE22_RIVAL2_START_BATTLE
	ld [wRoute22CurScript], a
	ret

Route22Rival2StartBattleScript: ; marcelnote - optimized
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, ROUTE22_RIVAL2
	ldh [hSpriteIndex], a
	ld a, [wSavedCoordIndex]
	dec a
	ld a, PLAYER_DIR_DOWN
	ld b, SPRITE_FACING_UP
	jr z, .setFacingDirections
	ld a, PLAYER_DIR_LEFT
	ld b, SPRITE_FACING_RIGHT
.setFacingDirections
	ld [wPlayerMovingDirection], a
	ld a, b
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	xor a
	ld [wJoyIgnore], a
	ld a, TEXT_ROUTE22_RIVAL2
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, Route22Rival2DefeatedText
	ld de, Route22Rival2VictoryText
	call SaveEndBattleTextPointers
	ld a, OPP_RIVAL2
	ld [wCurOpponent], a

	; select which team to use during the encounter
	ld a, [wRivalStarter]
	ld b, 10    ; 10 = Squirtle team
	cp STARTER2 ; Squirtle
	jr z, .gotTeam
	inc b       ; 11 = Bulbasaur team
	cp STARTER3 ; Bulbasaur
	jr z, .gotTeam
	inc b       ; 12 = Charmander team
.gotTeam
	ld a, b
	ld [wTrainerNo], a

	ld a, SCRIPT_ROUTE22_RIVAL2_AFTER_BATTLE
	ld [wRoute22CurScript], a
	ret

Route22Rival2AfterBattleScript: ; marcelnote - optimized
	ld a, [wIsInBattle]
	inc a ; lost battle?
	jr z, .setScript ; SCRIPT_ROUTE22_DEFAULT
	ld a, ROUTE22_RIVAL2
	ldh [hSpriteIndex], a
	ld a, [wSavedCoordIndex]
	dec a
	ld a, PLAYER_DIR_DOWN
	ld b, SPRITE_FACING_UP
	jr z, .setFacingDirections
	ld a, PLAYER_DIR_LEFT
	ld b, SPRITE_FACING_RIGHT
.setFacingDirections
	ld [wPlayerMovingDirection], a
	ld a, b
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_ROUTE22_RIVAL_2ND_BATTLE
	ld a, TEXT_ROUTE22_RIVAL2
	ldh [hTextID], a
	call DisplayTextID
	ld a, SFX_STOP_ALL_MUSIC
;	ld [wNewSoundID], a
	call PlaySound
	callfar Music_RivalAlternateStartAndTempo
	ld a, [wSavedCoordIndex]
	dec a
	ld de, .ExitMovementData1
	jr z, .gotExitMovement
	ld de, .ExitMovementData2
.gotExitMovement
	ld a, ROUTE22_RIVAL2
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_ROUTE22_RIVAL2_EXIT
.setScript
	ld [wRoute22CurScript], a
	ret

.ExitMovementData1:
	db NPC_MOVEMENT_LEFT
.ExitMovementData2:
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_LEFT
	db -1 ; end

Route22Rival2ExitScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, TOGGLE_ROUTE_22_RIVAL_2
	ld [wToggleableObjectIndex], a
	predef HideObject
	call PlayDefaultMusic
	ResetEvents EVENT_2ND_ROUTE22_RIVAL_BATTLE, EVENT_ROUTE22_RIVAL_WANTS_BATTLE
	ld a, SCRIPT_ROUTE22_NOOP
	ld [wRoute22CurScript], a
	ret

Route22_TextPointers:
	def_text_pointers
	dw_const Route22Rival1Text,            TEXT_ROUTE22_RIVAL1
	dw_const Route22Rival2Text,            TEXT_ROUTE22_RIVAL2
	dw_const Route22PokemonLeagueSignText, TEXT_ROUTE22_POKEMON_LEAGUE_SIGN

Route22Rival1Text: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_BEAT_ROUTE22_RIVAL_1ST_BATTLE
	ld hl, Route22RivalBeforeBattleText1
	ret z
	ld hl, Route22RivalAfterBattleText1
	ret

Route22Rival2Text: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_BEAT_ROUTE22_RIVAL_2ND_BATTLE
	ld hl, Route22RivalBeforeBattleText2
	ret z
	ld hl, Route22RivalAfterBattleText2
	ret

Route22RivalBeforeBattleText1:
	text_far _Route22RivalBeforeBattleText1
	text_end

Route22RivalAfterBattleText1:
	text_far _Route22RivalAfterBattleText1
	text_end

Route22Rival1DefeatedText:
	text_far _Route22Rival1DefeatedText
	text_end

Route22Rival1VictoryText:
	text_far _Route22Rival1VictoryText
	text_end

Route22RivalBeforeBattleText2:
	text_far _Route22RivalBeforeBattleText2
	text_end

Route22RivalAfterBattleText2:
	text_far _Route22RivalAfterBattleText2
	text_end

Route22Rival2DefeatedText:
	text_far _Route22Rival2DefeatedText
	text_end

Route22Rival2VictoryText:
	text_far _Route22Rival2VictoryText
	text_end

Route22PokemonLeagueSignText:
	text_far _Route22PokemonLeagueSignText
	text_end
