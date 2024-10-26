PokemonTower5F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower5TrainerHeaders
	ld de, PokemonTower5F_ScriptPointers
	ld a, [wPokemonTower5FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower5FCurScript], a
	ret

PokemonTower5FSetDefaultScript: ; marcelnote - postgame Agatha event
	xor a
	ld [wJoyIgnore], a
	ld [wPokemonTower5FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower5F_ScriptPointers:
	def_script_pointers
	dw_const PokemonTower5FDefaultScript,           SCRIPT_POKEMONTOWER5F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_POKEMONTOWER5F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_POKEMONTOWER5F_END_BATTLE
	dw_const PokemonTower5FGhostBattleScript,       SCRIPT_POKEMONTOWER5F_GHOST_BATTLE  ; marcelnote - postgame Agatha event
    dw_const PokemonTower5FPlayerMovingScript,      SCRIPT_POKEMONTOWER5F_PLAYER_MOVING ; marcelnote - postgame Agatha event

PokemonTower5FDefaultScript:
	ld hl, PokemonTower5FPurifiedZoneCoords
	call ArePlayerCoordsInArray
	jr c, .in_purified_zone
	ld hl, wStatusFlags4
	res BIT_NO_BATTLES, [hl]
	ResetEvent EVENT_IN_PURIFIED_ZONE
	CheckHideShow HS_POKEMON_TOWER_6F_AGATHA ; marcelnote - postgame Agatha event
	jp z, PokemonTower5FAgathaEventScript
	jp CheckFightingMapTrainers
.in_purified_zone
	CheckAndSetEvent EVENT_IN_PURIFIED_ZONE
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld hl, wStatusFlags4
	set BIT_NO_BATTLES, [hl]
	predef HealParty
	call GBFadeOutToWhite
	call Delay3
	call Delay3
	call GBFadeInFromWhite
	ld a, TEXT_POKEMONTOWER5F_PURIFIEDZONE
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ret

PokemonTower5FPurifiedZoneCoords:
	dbmapcoord 10,  8
	dbmapcoord 11,  8
	dbmapcoord 10,  9
	dbmapcoord 11,  9
	db -1 ; end

PokemonTower5FAgathaEventScript: ; marcelnote - postgame Agatha event
	CheckEvent EVENT_BEAT_GHOST_5F
	jp nz, CheckFightingMapTrainers
	ld hl, PokemonTower5FGhostBattleCoords
	call ArePlayerCoordsInArray
	ret nc
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_POKEMONTOWER5F_GHOST_BATTLE
	ldh [hTextID], a
	call DisplayTextID
	ld a, GHOST_NINETALES
	ld [wCurOpponent], a
	ld a, 60
	ld [wCurEnemyLevel], a
	ld a, SCRIPT_POKEMONTOWER5F_GHOST_BATTLE
	ld [wPokemonTower5FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower5FGhostBattleCoords: ; marcelnote - postgame Agatha event
	dbmapcoord 17,  7
	dbmapcoord 13, 11
	dbmapcoord 13, 12
	db -1 ; end

PokemonTower5FGhostBattleScript: ; marcelnote - postgame Agatha event
	ld a, [wIsInBattle]
	cp $ff
	jp z, PokemonTower5FSetDefaultScript
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
	SetEvent EVENT_BEAT_GHOST_5F
	ld a, TEXT_POKEMONTOWER5F_GHOST_DEPARTED
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_POKEMONTOWER5F_DEFAULT
	ld [wPokemonTower5FCurScript], a
	ld [wCurMapScript], a
	ret
.did_not_defeat
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_LEFT
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, SCRIPT_POKEMONTOWER5F_PLAYER_MOVING
	ld [wPokemonTower5FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower5FPlayerMovingScript: ; marcelnote - postgame Agatha event
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wPokemonTower5FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower5F_TextPointers:
	def_text_pointers
	dw_const PokemonTower5FChanneler1Text,    TEXT_POKEMONTOWER5F_CHANNELER1
	dw_const PokemonTower5FChanneler2Text,    TEXT_POKEMONTOWER5F_CHANNELER2
	dw_const PokemonTower5FChanneler3Text,    TEXT_POKEMONTOWER5F_CHANNELER3
	dw_const PokemonTower5FChanneler4Text,    TEXT_POKEMONTOWER5F_CHANNELER4
	dw_const PokemonTower5FChanneler5Text,    TEXT_POKEMONTOWER5F_CHANNELER5
	dw_const PickUpItemText,                  TEXT_POKEMONTOWER5F_NUGGET
	dw_const PokemonTower5FPurifiedZoneText,  TEXT_POKEMONTOWER5F_PURIFIEDZONE
	dw_const PokemonTower5FGhostBattleText,   TEXT_POKEMONTOWER5F_GHOST_BATTLE   ; marcelnote - postgame Agatha event
	dw_const PokemonTower5FGhostDepartedText, TEXT_POKEMONTOWER5F_GHOST_DEPARTED ; marcelnote - postgame Agatha event

PokemonTower5TrainerHeaders:
	def_trainers 2
PokemonTower5TrainerHeader0:
	trainer EVENT_BEAT_POKEMONTOWER_5_TRAINER_0, 2, PokemonTower5FChanneler2BattleText, PokemonTower5FChanneler2EndBattleText, PokemonTower5FChanneler2AfterBattleText
PokemonTower5TrainerHeader1:
	trainer EVENT_BEAT_POKEMONTOWER_5_TRAINER_1, 3, PokemonTower5FChanneler3BattleText, PokemonTower5FChanneler3EndBattleText, PokemonTower5FChanneler3AfterBattleText
PokemonTower5TrainerHeader2:
	trainer EVENT_BEAT_POKEMONTOWER_5_TRAINER_2, 2, PokemonTower5FChanneler4BattleText, PokemonTower5FChanneler4EndBattleText, PokemonTower5FChanneler4AfterBattleText
PokemonTower5TrainerHeader3:
	trainer EVENT_BEAT_POKEMONTOWER_5_TRAINER_3, 2, PokemonTower5FChanneler5BattleText, PokemonTower5FChanneler5EndBattleText, PokemonTower5FChanneler5AfterBattleText
	db -1 ; end

PokemonTower5FChanneler1Text:
	text_far _PokemonTower5FChanneler1Text
	text_end

PokemonTower5FChanneler2Text:
	text_asm
	ld hl, PokemonTower5TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

PokemonTower5FChanneler2BattleText:
	text_far _PokemonTower5FChanneler2BattleText
	text_end

PokemonTower5FChanneler2EndBattleText:
	text_far _PokemonTower5FChanneler2EndBattleText
	text_end

PokemonTower5FChanneler2AfterBattleText:
	text_far _PokemonTower5FChanneler2AfterBattleText
	text_end

PokemonTower5FChanneler3Text:
	text_asm
	ld hl, PokemonTower5TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

PokemonTower5FChanneler3BattleText:
	text_far _PokemonTower5FChanneler3BattleText
	text_end

PokemonTower5FChanneler3EndBattleText:
	text_far _PokemonTower5FChanneler3EndBattleText
	text_end

PokemonTower5FChanneler3AfterBattleText:
	text_far _PokemonTower5FChanneler3AfterBattleText
	text_end

PokemonTower5FChanneler4Text:
	text_asm
	ld hl, PokemonTower5TrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

PokemonTower5FChanneler4BattleText:
	text_far _PokemonTower5FChanneler4BattleText
	text_end

PokemonTower5FChanneler4EndBattleText:
	text_far _PokemonTower5FChanneler4EndBattleText
	text_end

PokemonTower5FChanneler4AfterBattleText:
	text_far _PokemonTower5FChanneler4AfterBattleText
	text_end

PokemonTower5FChanneler5Text:
	text_asm
	ld hl, PokemonTower5TrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

PokemonTower5FChanneler5BattleText:
	text_far _PokemonTower5FChanneler5BattleText
	text_end

PokemonTower5FChanneler5EndBattleText:
	text_far _PokemonTower5FChanneler5EndBattleText
	text_end

PokemonTower5FChanneler5AfterBattleText:
	text_far _PokemonTower5FChanneler5AfterBattleText
	text_end

PokemonTower5FPurifiedZoneText:
	text_far _PokemonTower5FPurifiedZoneText
	text_end

PokemonTower5FGhostBattleText: ; marcelnote - postgame Agatha event
	text_far _PokemonTower2FGhostBattleText
	text_end

PokemonTower5FGhostDepartedText: ; marcelnote - postgame Agatha event
	text_far _PokemonTower2FGhostDepartedText
	text_end
