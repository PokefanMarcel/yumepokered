PokemonMansion3F_Script:
	call PokemonMansion3FCheckReplaceSwitchDoorBlocks
	call EnableAutoTextBoxDrawing
	ld hl, PokemonMansion3F_TrainerHeaders
	ld de, PokemonMansion3F_ScriptPointers
	ld bc, wPokemonMansion3FCurScript
	jp ExecuteCurMapScriptInTable

PokemonMansion3FCheckReplaceSwitchDoorBlocks: ; marcelnote - modified for new special warp engine
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	res BIT_CUR_MAP_LOADED_1, [hl]
	CheckEvent EVENT_POKEMON_MANSION_SWITCH_ON
	jr nz, .switchTurnedOn
	ld a, $e
	lb bc, 2, 7
	call PokemonMansion2FReplaceBlock
	ld a, $5f
	lb bc, 5, 7
	jp PokemonMansion2FReplaceBlock

.switchTurnedOn
	ld a, $5f
	lb bc, 2, 7
	call PokemonMansion2FReplaceBlock
	ld a, $e
	lb bc, 5, 7
	jp PokemonMansion2FReplaceBlock

PokemonMansion3F_ScriptPointers:
	def_script_pointers
	dw_const PokemonMansion3FDefaultScript,         SCRIPT_POKEMONMANSION3F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_POKEMONMANSION3F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_POKEMONMANSION3F_END_BATTLE

PokemonMansion3FDefaultScript: ; marcelnote - modified for new special warp engine
	ld d, DUNGEON_WARP_POKEMON_MANSION_3F_LEFT
	ld hl, .HolesCoords
	call IsPlayerOnDungeonWarp
	jp nc, CheckFightingMapTrainers
	ret

.HolesCoords:
	dbmapcoord 16, 14
	dbmapcoord 17, 14
	dbmapcoord 19, 14
	db -1 ; end

PokemonMansion3FScript_Switches::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_POKEMONMANSION3F_SWITCH
	ldh [hTextID], a
	jp DisplayTextID

PokemonMansion3F_TextPointers:
	def_text_pointers
	dw_const PokemonMansion3FSuperNerdText, TEXT_POKEMONMANSION3F_SUPER_NERD
	dw_const PokemonMansion3FScientistText, TEXT_POKEMONMANSION3F_SCIENTIST
	dw_const PickUpItemText,                TEXT_POKEMONMANSION3F_MAX_POTION
	dw_const PickUpItemText,                TEXT_POKEMONMANSION3F_IRON
	dw_const PokemonMansion3FDiaryText,     TEXT_POKEMONMANSION3F_DIARY
	dw_const PokemonMansion2FSwitchText,    TEXT_POKEMONMANSION3F_SWITCH ; This switch uses the text script from the 2F.

PokemonMansion3F_TrainerHeaders:
	def_trainers
PokemonMansion3FTrainerHeader0:
	trainer EVENT_BEAT_POKEMON_MANSION_3F_TRAINER_0, 0, PokemonMansion3FSuperNerdBattleText, PokemonMansion3FSuperNerdEndBattleText, PokemonMansion3FSuperNerdAfterBattleText
PokemonMansion3FTrainerHeader1:
	trainer EVENT_BEAT_POKEMON_MANSION_3F_TRAINER_1, 2, PokemonMansion3FScientistBattleText, PokemonMansion3FScientistEndBattleText, PokemonMansion3FScientistAfterBattleText
	db -1 ; end

PokemonMansion3FSuperNerdText:
	text_asm
	ld hl, PokemonMansion3FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

PokemonMansion3FScientistText:
	text_asm
	ld hl, PokemonMansion3FTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

PokemonMansion3FSuperNerdBattleText:
	text_far _PokemonMansion3FSuperNerdBattleText
	text_end

PokemonMansion3FSuperNerdEndBattleText:
	text_far _PokemonMansion3FSuperNerdEndBattleText
	text_end

PokemonMansion3FSuperNerdAfterBattleText:
	text_far _PokemonMansion3FSuperNerdAfterBattleText
	text_end

PokemonMansion3FScientistBattleText:
	text_far _PokemonMansion3FScientistBattleText
	text_end

PokemonMansion3FScientistEndBattleText:
	text_far _PokemonMansion3FScientistEndBattleText
	text_end

PokemonMansion3FScientistAfterBattleText:
	text_far _PokemonMansion3FScientistAfterBattleText
	text_end

PokemonMansion3FDiaryText:
	text_far _PokemonMansion3FDiaryText
	text_end
