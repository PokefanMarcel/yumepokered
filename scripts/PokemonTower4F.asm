PokemonTower4F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower4TrainerHeaders
	ld de, PokemonTower4F_ScriptPointers
	ld a, [wPokemonTower4FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower4FCurScript], a
	ret

PokemonTower4FSetDefaultScript:
	xor a
	ld [wJoyIgnore], a
	ld [wPokemonTower4FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower4F_ScriptPointers:
	def_script_pointers
	dw_const PokemonTower4FDefaultScript,           SCRIPT_POKEMONTOWER4F_DEFAULT ; marcelnote - was CheckFightingMapTrainers
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_POKEMONTOWER4F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_POKEMONTOWER4F_END_BATTLE
	dw_const PokemonTower4FGhostBattleScript,       SCRIPT_POKEMONTOWER4F_GHOST_BATTLE  ; marcelnote - postgame Agatha event
	dw_const PokemonTower4FPlayerMovingScript,      SCRIPT_POKEMONTOWER4F_PLAYER_MOVING ; marcelnote - postgame Agatha event

PokemonTower4FDefaultScript: ; marcelnote - postgame Agatha event
;IF DEF(_DEBUG)
;	call DebugPressedOrHeldB
;	ret nz
;ENDC
	CheckHideShow HS_POKEMON_TOWER_6F_AGATHA ; marcelnote - postgame Agatha event
	;ret nz
	jp nz, CheckFightingMapTrainers
	CheckEvent EVENT_BEAT_GHOST_4F
	ret nz
	ld hl, PokemonTower4FGhostBattleCoords
	call ArePlayerCoordsInArray
	ret nc
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_POKEMONTOWER4F_GHOST_BATTLE
	ldh [hTextID], a
	call DisplayTextID
	ld a, GHOST_JOLTEON
	ld [wCurOpponent], a
	ld a, 60
	ld [wCurEnemyLevel], a
	ld a, SCRIPT_POKEMONTOWER4F_GHOST_BATTLE
	ld [wPokemonTower4FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower4FGhostBattleCoords: ; marcelnote - postgame Agatha event
	dbmapcoord 13,  6
	dbmapcoord 13,  8
	dbmapcoord 14, 12
	db -1 ; end

PokemonTower4FGhostBattleScript: ; marcelnote - postgame Agatha event
	ld a, [wIsInBattle]
	cp $ff
	jp z, PokemonTower4FSetDefaultScript
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
	SetEvent EVENT_BEAT_GHOST_4F
	ld a, TEXT_POKEMONTOWER4F_GHOST_DEPARTED
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_POKEMONTOWER4F_DEFAULT
	ld [wPokemonTower4FCurScript], a
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
	ld a, SCRIPT_POKEMONTOWER4F_PLAYER_MOVING
	ld [wPokemonTower4FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower4FPlayerMovingScript: ; marcelnote - postgame Agatha event
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wPokemonTower4FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower4F_TextPointers:
	def_text_pointers
	dw_const PokemonTower4FChanneler1Text, TEXT_POKEMONTOWER4F_CHANNELER1
	dw_const PokemonTower4FChanneler2Text, TEXT_POKEMONTOWER4F_CHANNELER2
	dw_const PokemonTower4FChanneler3Text, TEXT_POKEMONTOWER4F_CHANNELER3
	dw_const PickUpItemText,               TEXT_POKEMONTOWER4F_ELIXIR
	dw_const PickUpItemText,               TEXT_POKEMONTOWER4F_AWAKENING
	dw_const PickUpItemText,               TEXT_POKEMONTOWER4F_HP_UP

PokemonTower4TrainerHeaders:
	def_trainers
PokemonTower4TrainerHeader0:
	trainer EVENT_BEAT_POKEMONTOWER_4_TRAINER_0, 2, PokemonTower4FChanneler1BattleText, PokemonTower4FChanneler1EndBattleText, PokemonTower4FChanneler1AfterBattleText
PokemonTower4TrainerHeader1:
	trainer EVENT_BEAT_POKEMONTOWER_4_TRAINER_1, 2, PokemonTower4FChanneler2BattleText, PokemonTower4FChanneler2EndBattleText, PokemonTower4FChanneler2AfterBattleText
PokemonTower4TrainerHeader2:
	trainer EVENT_BEAT_POKEMONTOWER_4_TRAINER_2, 2, PokemonTower4FChanneler3BattleText, PokemonTower4FChanneler3EndBattleText, PokemonTower4FChanneler3AfterBattleText
	db -1 ; end

PokemonTower4FChanneler1Text:
	text_asm
	ld hl, PokemonTower4TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

PokemonTower4FChanneler2Text:
	text_asm
	ld hl, PokemonTower4TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

PokemonTower4FChanneler3Text:
	text_asm
	ld hl, PokemonTower4TrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

PokemonTower4FChanneler1BattleText:
	text_far _PokemonTower4FChanneler1BattleText
	text_end

PokemonTower4FChanneler1EndBattleText:
	text_far _PokemonTower4FChanneler1EndBattleText
	text_end

PokemonTower4FChanneler1AfterBattleText:
	text_far _PokemonTower4FChanneler1AfterBattleText
	text_end

PokemonTower4FChanneler2BattleText:
	text_far _PokemonTower4FChanneler2BattleText
	text_end

PokemonTower4FChanneler2EndBattleText:
	text_far _PokemonTower4FChanneler2EndBattleText
	text_end

PokemonTower4FChanneler2AfterBattleText:
	text_far _PokemonTower4FChanneler2AfterBattleText
	text_end

PokemonTower4FChanneler3BattleText:
	text_far _PokemonTower4FChanneler3BattleText
	text_end

PokemonTower4FChanneler3EndBattleText:
	text_far _PokemonTower4FChanneler3EndBattleText
	text_end

PokemonTower4FChanneler3AfterBattleText:
	text_far _PokemonTower4FChanneler3AfterBattleText
	text_end
