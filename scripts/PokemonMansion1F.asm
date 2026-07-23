PokemonMansion1F_Script:
	call PokemonMansion1FCheckReplaceSwitchDoorBlocks
	call EnableAutoTextBoxDrawing
	ld hl, PokemonMansion1F_TrainerHeaders
	ld de, PokemonMansion1F_ScriptPointers
	ld bc, wPokemonMansion1FCurScript
	jp ExecuteCurMapScriptInTable

PokemonMansion1FCheckReplaceSwitchDoorBlocks:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	CheckEvent EVENT_POKEMON_MANSION_SWITCH_ON
	jr nz, .switchTurnedOn
	lb bc, 6, 12
	call PokemonMansion1FLoadEmptyFloorTileBlock
	lb bc, 3, 8
	call PokemonMansion1FLoadHorizontalGateBlock
	lb bc, 8, 10
	call PokemonMansion1FLoadHorizontalGateBlock
	lb bc, 13, 13
	jr PokemonMansion1FLoadHorizontalGateBlock
.switchTurnedOn
	lb bc, 6, 12
	call PokemonMansion1FLoadHorizontalGateBlock
	lb bc, 3, 8
	call PokemonMansion1FLoadEmptyFloorTileBlock
	lb bc, 8, 10
	call PokemonMansion1FLoadEmptyFloorTileBlock
	lb bc, 13, 13
	jr PokemonMansion1FLoadEmptyFloorTileBlock

PokemonMansion1FLoadHorizontalGateBlock:
	ld a, $2d
	ld [wNewTileBlockID], a
	jr PokemonMansion1FReplaceBlock

PokemonMansion1FLoadEmptyFloorTileBlock:
	ld a, $e
	ld [wNewTileBlockID], a
PokemonMansion1FReplaceBlock:
	predef ReplaceTileBlock
	ret

PokemonMansion1FScript_Switches::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_POKEMONMANSION1F_SWITCH
	ldh [hTextID], a
	jp DisplayTextID

PokemonMansion1F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_POKEMONMANSION1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_POKEMONMANSION1F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_POKEMONMANSION1F_END_BATTLE

PokemonMansion1F_TextPointers:
	def_text_pointers
	dw_const PokemonMansion1FScientistText, TEXT_POKEMONMANSION1F_SCIENTIST
	dw_const PickUpItemText,                TEXT_POKEMONMANSION1F_ESCAPE_ROPE
	dw_const PickUpItemText,                TEXT_POKEMONMANSION1F_CARBOS
	dw_const PokemonMansion1FSwitchText,    TEXT_POKEMONMANSION1F_SWITCH

PokemonMansion1F_TrainerHeaders:
	def_trainers
PokemonMansion1FTrainerHeader0:
	trainer EVENT_BEAT_POKEMON_MANSION_1F_TRAINER_0, 3, PokemonMansion1FScientistBattleText, PokemonMansion1FScientistEndBattleText, PokemonMansion1FScientistAfterBattleText
	db -1 ; end

PokemonMansion1FScientistText:
	text_asm
	ld hl, PokemonMansion1FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

PokemonMansion1FScientistBattleText:
	text_far _PokemonMansion1FScientistBattleText
	text_end

PokemonMansion1FScientistEndBattleText:
	text_far _PokemonMansion1FScientistEndBattleText
	text_end

PokemonMansion1FScientistAfterBattleText:
	text_far _PokemonMansion1FScientistAfterBattleText
	text_end

PokemonMansion1FSwitchText:
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
	ld hl, .NotPressedText
	call PrintText
	rst TextScriptEnd

.Text:
	text_far _PokemonMansion1FSwitchText
	text_end

.PressedText:
	text_far _PokemonMansion1FSwitchPressedText
	text_end

.NotPressedText:
	text_far _PokemonMansion1FSwitchNotPressedText
	text_end
