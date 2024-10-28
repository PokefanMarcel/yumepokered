PokemonTower3F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower3TrainerHeaders
	ld de, PokemonTower3F_ScriptPointers
	ld a, [wPokemonTower3FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower3FCurScript], a
	ret

PokemonTower3FSetDefaultScript:
	xor a
	ld [wJoyIgnore], a
	ld [wPokemonTower3FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower3F_ScriptPointers:
	def_script_pointers
	dw_const PokemonTower3FDefaultScript,           SCRIPT_POKEMONTOWER3F_DEFAULT ; marcelnote - was CheckFightingMapTrainers
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_POKEMONTOWER3F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_POKEMONTOWER3F_END_BATTLE
	dw_const PokemonTower3FGhostBattleScript,       SCRIPT_POKEMONTOWER3F_GHOST_BATTLE  ; marcelnote - postgame Agatha event
	dw_const PokemonTower3FPlayerMovingScript,      SCRIPT_POKEMONTOWER3F_PLAYER_MOVING ; marcelnote - postgame Agatha event

PokemonTower3FDefaultScript: ; marcelnote - postgame Agatha event
	CheckHideShow HS_POKEMON_TOWER_6F_AGATHA
	jp nz, CheckFightingMapTrainers
	CheckEvent EVENT_BEAT_GHOST_3F
	jp nz, CheckFightingMapTrainers
	ld hl, PokemonTower3FGhostBattleCoords
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_POKEMONTOWER3F_GHOST_BATTLE
	ldh [hTextID], a
	call DisplayTextID
	ld a, GHOST_PRIMEAPE
	ld [wCurOpponent], a
	ld a, 60
	ld [wCurEnemyLevel], a
	ld a, SCRIPT_POKEMONTOWER3F_GHOST_BATTLE
	ld [wPokemonTower3FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower3FGhostBattleCoords: ; marcelnote - postgame Agatha event
	dbmapcoord 16,  6
	dbmapcoord 14, 13
	db -1 ; end

PokemonTower3FGhostBattleScript: ; marcelnote - postgame Agatha event
	ld a, [wIsInBattle]
	cp $ff
	jp z, PokemonTower3FSetDefaultScript
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
	SetEvent EVENT_BEAT_GHOST_3F
	ld a, TEXT_POKEMONTOWER3F_GHOST_VANISHED
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_POKEMONTOWER3F_DEFAULT
	ld [wPokemonTower3FCurScript], a
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
	ld a, SCRIPT_POKEMONTOWER3F_PLAYER_MOVING
	ld [wPokemonTower3FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower3FPlayerMovingScript: ; marcelnote - postgame Agatha event
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wPokemonTower3FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower3F_TextPointers:
	def_text_pointers
	dw_const PokemonTower3FChanneler1Text,    TEXT_POKEMONTOWER3F_CHANNELER1
	dw_const PokemonTower3FChanneler2Text,    TEXT_POKEMONTOWER3F_CHANNELER2
	dw_const PokemonTower3FChanneler3Text,    TEXT_POKEMONTOWER3F_CHANNELER3
	dw_const PickUpItemText,                  TEXT_POKEMONTOWER3F_ESCAPE_ROPE
	dw_const PokemonTower3FGhostBattleText,   TEXT_POKEMONTOWER3F_GHOST_BATTLE   ; marcelnote - postgame Agatha event
	dw_const PokemonTower3FGhostVanishedText, TEXT_POKEMONTOWER3F_GHOST_VANISHED ; marcelnote - postgame Agatha event

PokemonTower3TrainerHeaders:
	def_trainers
PokemonTower3TrainerHeader0:
	trainer EVENT_BEAT_POKEMONTOWER_3_TRAINER_0, 2, PokemonTower3FChanneler1BattleText, PokemonTower3FChanneler1EndBattleText, PokemonTower3FChanneler1AfterBattleText
PokemonTower3TrainerHeader1:
	trainer EVENT_BEAT_POKEMONTOWER_3_TRAINER_1, 3, PokemonTower3FChanneler2BattleText, PokemonTower3FChanneler2EndBattleText, PokemonTower3FChanneler2AfterBattleText
PokemonTower3TrainerHeader2:
	trainer EVENT_BEAT_POKEMONTOWER_3_TRAINER_2, 2, PokemonTower3FChanneler3BattleText, PokemonTower3FChanneler3EndBattleText, PokemonTower3FChanneler3AfterBattleText
	db -1 ; end

PokemonTower3FChanneler1Text:
	text_asm
	ld hl, PokemonTower3TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

PokemonTower3FChanneler2Text:
	text_asm
	ld hl, PokemonTower3TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

PokemonTower3FChanneler3Text:
	text_asm
	ld hl, PokemonTower3TrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

PokemonTower3FChanneler1BattleText:
	text_far _PokemonTower3FChanneler1BattleText
	text_end

PokemonTower3FChanneler1EndBattleText:
	text_far _PokemonTower3FChanneler1EndBattleText
	text_end

PokemonTower3FChanneler1AfterBattleText:
	text_far _PokemonTower3FChanneler1AfterBattleText
	text_end

PokemonTower3FChanneler2BattleText:
	text_far _PokemonTower3FChanneler2BattleText
	text_end

PokemonTower3FChanneler2EndBattleText:
	text_far _PokemonTower3FChanneler2EndBattleText
	text_end

PokemonTower3FChanneler2AfterBattleText:
	text_far _PokemonTower3FChanneler2AfterBattleText
	text_end

PokemonTower3FChanneler3BattleText:
	text_far _PokemonTower3FChanneler3BattleText
	text_end

PokemonTower3FChanneler3EndBattleText:
	text_far _PokemonTower3FChanneler3EndBattleText
	text_end

PokemonTower3FChanneler3AfterBattleText:
	text_far _PokemonTower3FChanneler3AfterBattleText
	text_end

PokemonTower3FGhostBattleText: ; marcelnote - postgame Agatha event
	text_far _PokemonTower3FGhostBattleText
	text_end

PokemonTower3FGhostVanishedText: ; marcelnote - postgame Agatha event
	text_far _PokemonTower3FGhostVanishedText
	text_end
