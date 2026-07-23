PokemonMansion2F_Script:
	call PokemonMansion2FCheckReplaceSwitchDoorBlocks
	call EnableAutoTextBoxDrawing
	ld hl, PokemonMansion2F_TrainerHeaders
	ld de, PokemonMansion2F_ScriptPointers
	ld bc, wPokemonMansion2FCurScript
	jp ExecuteCurMapScriptInTable

PokemonMansion2FCheckReplaceSwitchDoorBlocks:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	res BIT_CUR_MAP_LOADED_1, [hl]
	CheckEvent EVENT_POKEMON_MANSION_SWITCH_ON
	jr nz, .switchTurnedOn
	ld a, $e
	lb bc, 2, 4
	call PokemonMansion2FReplaceBlock
	ld a, $54
	lb bc, 4, 9
	call PokemonMansion2FReplaceBlock
	ld a, $5f
	lb bc, 11, 3
	jr PokemonMansion2FReplaceBlock
.switchTurnedOn
	ld a, $5f
	lb bc, 2, 4
	call PokemonMansion2FReplaceBlock
	ld a, $e
	lb bc, 4, 9
	call PokemonMansion2FReplaceBlock
	ld a, $e
	lb bc, 11, 3
	jr PokemonMansion2FReplaceBlock

PokemonMansion2FReplaceBlock:
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock

PokemonMansion2FScript_Switches::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_POKEMONMANSION2F_SWITCH
	ldh [hTextID], a
	jp DisplayTextID

PokemonMansion2F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_POKEMONMANSION2F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_POKEMONMANSION2F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_POKEMONMANSION2F_END_BATTLE

PokemonMansion2F_TextPointers:
	def_text_pointers
	dw_const PokemonMansion2FSuperNerdText, TEXT_POKEMONMANSION2F_SUPER_NERD
	dw_const PickUpItemText,                TEXT_POKEMONMANSION2F_CALCIUM
	dw_const PokemonMansion2FDiary1Text,    TEXT_POKEMONMANSION2F_DIARY1
	dw_const PokemonMansion2FDiary2Text,    TEXT_POKEMONMANSION2F_DIARY2
	dw_const PokemonMansion2FSwitchText,    TEXT_POKEMONMANSION2F_SWITCH

PokemonMansion2F_TrainerHeaders:
	def_trainers
PokemonMansion2FTrainerHeader0:
	trainer EVENT_BEAT_POKEMON_MANSION_2F_TRAINER_0, 0, PokemonMansion2FSuperNerdBattleText, PokemonMansion2FSuperNerdEndBattleText, PokemonMansion2FSuperNerdAfterBattleText
	db -1 ; end

PokemonMansion2FSuperNerdText:
	text_asm
	ld hl, PokemonMansion2FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

PokemonMansion2FSuperNerdBattleText:
	text_far _PokemonMansion2FSuperNerdBattleText
	text_end

PokemonMansion2FSuperNerdEndBattleText:
	text_far _PokemonMansion2FSuperNerdEndBattleText
	text_end

PokemonMansion2FSuperNerdAfterBattleText:
	text_far _PokemonMansion2FSuperNerdAfterBattleText
	text_end

PokemonMansion2FDiary1Text:
	text_far _PokemonMansion2FDiary1Text
	text_end

PokemonMansion2FDiary2Text:
	text_far _PokemonMansion2FDiary2Text
	text_end

PokemonMansion2FSwitchText: ; marcelnote - optimized
	text_asm
	ld hl, .Text
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .notPressed
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	ld hl, .PressedText
	call PrintText
	ld a, SFX_GO_INSIDE
	call PlaySound
	CheckAndSetEvent EVENT_POKEMON_MANSION_SWITCH_ON
	jr z, .done
	ResetEventReuseHL EVENT_POKEMON_MANSION_SWITCH_ON
.done
	rst TextScriptEnd
.notPressed
	ld hl, .NotPressed
	call PrintText
	rst TextScriptEnd

.Text:
	text_far _PokemonMansion2FSwitchText
	text_end

.PressedText:
	text_far _PokemonMansion2FSwitchPressedText
	text_end

.NotPressed:
	text_far _PokemonMansion2FSwitchNotPressedText
	text_end
