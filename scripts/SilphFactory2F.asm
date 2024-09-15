; marcelnote - new location
SilphFactory2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SilphFactory2FTrainerHeaders
	ld de, SilphFactory2F_ScriptPointers
	ld a, [wSilphFactory2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphFactory2FCurScript], a
	ret

SilphFactory2F_ScriptPointers:
	def_script_pointers
	dw_const SilphFactory2FDefaultScript,           SCRIPT_SILPHFACTORY2F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SILPHFACTORY2F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SILPHFACTORY2F_END_BATTLE
	dw_const SilphFactory2FPlayerSpinningScript,    SCRIPT_SILPHFACTORY2F_PLAYER_SPINNING

SilphFactory2FDefaultScript:
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	ld hl, SilphFactory2FArrowTilePlayerMovement
	call DecodeArrowMovementRLE
	cp $ff
	jp z, CheckFightingMapTrainers
	call StartSimulatingJoypadStates
	ld hl, wd736
	set 7, [hl]
	ld a, SFX_ARROW_TILES
	call PlaySound
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, SCRIPT_SILPHFACTORY2F_PLAYER_SPINNING
	ld [wCurMapScript], a
	ret

SilphFactory2FArrowTilePlayerMovement:
	map_coord_movement 20,  3, SilphFactory2FArrowMovement1
	map_coord_movement 24,  3, SilphFactory2FArrowMovement2
	map_coord_movement 21,  4, SilphFactory2FArrowMovement3
	map_coord_movement 23,  4, SilphFactory2FArrowMovement4
	map_coord_movement 16,  5, SilphFactory2FArrowMovement5
	map_coord_movement 18,  5, SilphFactory2FArrowMovement6
	map_coord_movement 20,  5, SilphFactory2FArrowMovement7
	map_coord_movement 23,  5, SilphFactory2FArrowMovement8
	map_coord_movement 19,  6, SilphFactory2FArrowMovement9
	map_coord_movement 21,  6, SilphFactory2FArrowMovement10
	map_coord_movement 16,  7, SilphFactory2FArrowMovement11
	map_coord_movement 18,  7, SilphFactory2FArrowMovement12
	map_coord_movement 20,  7, SilphFactory2FArrowMovement13
	map_coord_movement 24,  7, SilphFactory2FArrowMovement14
	map_coord_movement 27,  7, SilphFactory2FArrowMovement15
	map_coord_movement 19,  8, SilphFactory2FArrowMovement16
	map_coord_movement 21,  8, SilphFactory2FArrowMovement17
	map_coord_movement 23,  8, SilphFactory2FArrowMovement18
	map_coord_movement 16,  9, SilphFactory2FArrowMovement19
	map_coord_movement 18,  9, SilphFactory2FArrowMovement20
	map_coord_movement 20,  9, SilphFactory2FArrowMovement21
	map_coord_movement 22,  9, SilphFactory2FArrowMovement22
	map_coord_movement 24,  9, SilphFactory2FArrowMovement23
	map_coord_movement 21, 10, SilphFactory2FArrowMovement24
	map_coord_movement 23, 10, SilphFactory2FArrowMovement25
	map_coord_movement 20, 11, SilphFactory2FArrowMovement26
	map_coord_movement 22, 11, SilphFactory2FArrowMovement27
	map_coord_movement 24, 11, SilphFactory2FArrowMovement28
	map_coord_movement 26, 11, SilphFactory2FArrowMovement29
	map_coord_movement 21, 12, SilphFactory2FArrowMovement30
	map_coord_movement 23, 12, SilphFactory2FArrowMovement31
	map_coord_movement 26, 12, SilphFactory2FArrowMovement32
	map_coord_movement 20, 13, SilphFactory2FArrowMovement33
	map_coord_movement 22, 13, SilphFactory2FArrowMovement34
	db -1 ; end

;format: direction, count
;each list is read starting from the $FF and working backwards
SilphFactory2FArrowMovement1:
	db D_LEFT, 4
	db -1 ; end

SilphFactory2FArrowMovement2:
	db D_LEFT, 8
	db -1 ; end

SilphFactory2FArrowMovement3:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 2
	db D_RIGHT, 2
	db D_DOWN, 6
	db -1 ; end

SilphFactory2FArrowMovement4:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 2
	db D_RIGHT, 2
	db D_DOWN, 6
	db D_LEFT, 2
	db -1 ; end

SilphFactory2FArrowMovement5:
	db D_LEFT, 4
	db D_UP, 2
	db D_RIGHT, 4
	db -1 ; end

SilphFactory2FArrowMovement6:
	db D_LEFT, 4
	db D_UP, 2
	db D_RIGHT, 2
	db -1 ; end

SilphFactory2FArrowMovement7:
	db D_LEFT, 4
	db D_UP, 2
	db -1 ; end

SilphFactory2FArrowMovement8:
	db D_LEFT, 4
	db D_UP, 2
	db D_LEFT, 3
	db -1 ; end

SilphFactory2FArrowMovement9:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 2
	db D_RIGHT, 2
	db D_DOWN, 2
	db D_RIGHT, 2
	db D_DOWN, 2
	db -1 ; end

SilphFactory2FArrowMovement10:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 2
	db D_RIGHT, 2
	db D_DOWN, 4
	db -1 ; end

SilphFactory2FArrowMovement11:
	db D_LEFT, 4
	db D_UP, 2
	db D_RIGHT, 2
	db D_UP, 2
	db D_RIGHT, 2
	db -1 ; end

SilphFactory2FArrowMovement12:
	db D_LEFT, 4
	db D_UP, 2
	db D_RIGHT, 2
	db D_UP, 2
	db -1 ; end

SilphFactory2FArrowMovement13:
	db D_RIGHT, 2
	db -1 ; end

SilphFactory2FArrowMovement14:
	db D_UP, 4
	db D_RIGHT, 3
	db -1 ; end

SilphFactory2FArrowMovement15:
	db D_UP, 4
	db -1 ; end

SilphFactory2FArrowMovement16:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 2
	db D_RIGHT, 2
	db D_DOWN, 2
	db D_RIGHT, 2
	db -1 ; end

SilphFactory2FArrowMovement17:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 2
	db D_RIGHT, 2
	db D_DOWN, 2
	db -1 ; end

SilphFactory2FArrowMovement18:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 4
	db -1 ; end

SilphFactory2FArrowMovement19:
	db D_RIGHT, 2
	db D_UP, 2
	db D_RIGHT, 4
	db -1 ; end

SilphFactory2FArrowMovement20:
	db D_RIGHT, 2
	db D_UP, 2
	db D_RIGHT, 2
	db -1 ; end

SilphFactory2FArrowMovement21:
	db D_RIGHT, 2
	db D_UP, 2
	db -1 ; end

SilphFactory2FArrowMovement22:
	db D_RIGHT, 4
	db -1 ; end

SilphFactory2FArrowMovement23:
	db D_RIGHT, 2
	db -1 ; end

SilphFactory2FArrowMovement24:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 2
	db D_RIGHT, 2
	db -1 ; end

SilphFactory2FArrowMovement25:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db D_DOWN, 2
	db -1 ; end

SilphFactory2FArrowMovement26:
	db D_RIGHT, 2
	db D_UP, 4
	db -1 ; end

SilphFactory2FArrowMovement27:
	db D_RIGHT, 4
	db D_UP, 2
	db -1 ; end

SilphFactory2FArrowMovement28:
	db D_RIGHT, 1
	db -1 ; end

SilphFactory2FArrowMovement29:
	db D_LEFT, 1
	db -1 ; end

SilphFactory2FArrowMovement30:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 5
	db -1 ; end

SilphFactory2FArrowMovement31:
	db D_LEFT, 1
	db D_UP, 1
	db D_RIGHT, 3
	db -1 ; end

SilphFactory2FArrowMovement32:
	db D_LEFT, 1
	db D_UP, 1
	db -1 ; end

SilphFactory2FArrowMovement33:
	db D_RIGHT, 2
	db D_UP, 6
	db -1 ; end

SilphFactory2FArrowMovement34:
	db D_RIGHT, 4
	db D_UP, 4
	db -1 ; end

SilphFactory2FPlayerSpinningScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	jr nz, .LoadSpinnerArrow
	xor a
	ld [wJoyIgnore], a
	ld hl, wd736
	res 7, [hl]
	ld a, SCRIPT_SILPHFACTORY2F_DEFAULT
	ld [wCurMapScript], a
	ret
.LoadSpinnerArrow
	farjp LoadSpinnerArrowTiles


SilphFactory2F_TextPointers:
	def_text_pointers
	dw_const SilphFactory2FRocket1Text,      TEXT_SILPHFACTORY2F_ROCKET1
	dw_const SilphFactory2FScientist1Text,   TEXT_SILPHFACTORY2F_SCIENTIST1
	dw_const SilphFactory2FScientist2Text,   TEXT_SILPHFACTORY2F_SCIENTIST2
	dw_const SilphFactory2FScientist3Text,   TEXT_SILPHFACTORY2F_SCIENTIST3
	dw_const SilphFactory2FSilphWorkerMText, TEXT_SILPHFACTORY2F_SILPH_WORKER_M
	;dw_const PickUpItemText,                TEXT_ROCKETHIDEOUTB1F_ESCAPE_ROPE

SilphFactory2FTrainerHeaders:
	def_trainers
SilphFactory2FTrainerHeader0:
	trainer EVENT_BEAT_SILPH_FACTORY_2F_TRAINER_0, 0, SilphFactory2FRocket1BattleText, SilphFactory2FRocket1EndBattleText, SilphFactory2FRocket1AfterBattleText
	db -1 ; end

SilphFactory2FRocket1Text:
	text_asm
	ld hl, SilphFactory2FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

SilphFactory2FRocket1BattleText:
	text_far _SilphFactory2FRocket1BattleText
	text_end

SilphFactory2FRocket1EndBattleText:
	text_far _SilphFactory2FRocket1EndBattleText
	text_end

SilphFactory2FRocket1AfterBattleText:
	text_far _SilphFactory2FRocket1AfterBattleText
	text_end

SilphFactory2FScientist1Text:
	text_far _SilphFactory2FScientist1Text
	text_end

SilphFactory2FScientist2Text:
	text_far _SilphFactory2FScientist2Text
	text_end

SilphFactory2FScientist3Text:
	text_far _SilphFactory2FScientist3Text
	text_end

SilphFactory2FSilphWorkerMText:
	text_far _SilphFactory2FSilphWorkerMUpdateCardText
	text_end
