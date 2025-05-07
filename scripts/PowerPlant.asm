PowerPlant_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PowerPlantTrainerHeaders
	ld de, PowerPlant_ScriptPointers
	ld a, [wPowerPlantCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPowerPlantCurScript], a
	call PowerPlantSetWaterBlocksScript
	ret

PowerPlantSetWaterBlocksScript:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	CheckEvent EVENT_BEAT_POWER_PLANT_VOLTORB_0
	ld hl, .coordsVoltorb1
	call z, .switchBlocks
	CheckEvent EVENT_BEAT_POWER_PLANT_VOLTORB_2
	ld hl, .coordsVoltorb3
	call z, .switchBlocks
	CheckEvent EVENT_BEAT_POWER_PLANT_VOLTORB_3
	ld hl, .coordsElectrode1
	call z, .switchBlocks
	CheckEvent EVENT_BEAT_POWER_PLANT_VOLTORB_4
	ld hl, .coordsVoltorb4
	call z, .switchBlocks
	CheckEvent EVENT_BEAT_POWER_PLANT_VOLTORB_5
	ld hl, .coordsVoltorb5
	call z, .switchBlocks
	CheckEvent EVENT_BEAT_POWER_PLANT_VOLTORB_7
	ld hl, .coordsVoltorb6
	call z, .switchBlocks
	ret

.switchBlocks
	ld a, [hli]
	cp -1
	ret z
	ld [wNewTileBlockID], a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	push hl
	predef ReplaceTileBlock
	pop hl
	jr .switchBlocks

.coordsVoltorb1 ; #block, y, x
	db $25, 10,  3
	db $27, 10,  4
	db $29, 11,  4
	db $2b, 11,  5
	db -1

.coordsVoltorb3 ; #block, y, x
	db $31, 12,  8
	db $2d, 12, 10
	db $25, 14, 11
	db -1

.coordsElectrode1 ; #block, y, x
	db $35,  8, 12
	db $1f,  9, 12
	db -1

.coordsVoltorb4 ; #block, y, x
	db $21, 16, 10
	db $23, 17, 11
	db -1

.coordsVoltorb5 ; #block, y, x
	db $3b, 14, 13
	db $19, 15, 13
	db $1d, 16, 13
	db -1

.coordsVoltorb6 ; #block, y, x
	db $31, 13, 16
	db $37, 13, 17
	db $39, 16, 18
	db -1


PowerPlant_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_POWERPLANT_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_POWERPLANT_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_POWERPLANT_END_BATTLE

PowerPlant_TextPointers:
	def_text_pointers
	dw_const PowerPlantVoltorb1Text,   TEXT_POWERPLANT_VOLTORB1
	dw_const PowerPlantVoltorb2Text,   TEXT_POWERPLANT_VOLTORB2
	dw_const PowerPlantVoltorb3Text,   TEXT_POWERPLANT_VOLTORB3
	dw_const PowerPlantElectrode1Text, TEXT_POWERPLANT_ELECTRODE1
	dw_const PowerPlantVoltorb4Text,   TEXT_POWERPLANT_VOLTORB4
	dw_const PowerPlantVoltorb5Text,   TEXT_POWERPLANT_VOLTORB5
	dw_const PowerPlantElectrode2Text, TEXT_POWERPLANT_ELECTRODE2
	dw_const PowerPlantVoltorb6Text,   TEXT_POWERPLANT_VOLTORB6
	dw_const PowerPlantZapdosText,     TEXT_POWERPLANT_ZAPDOS
	dw_const PickUpItemText,           TEXT_POWERPLANT_CARBOS
	dw_const PickUpItemText,           TEXT_POWERPLANT_HP_UP
	dw_const PickUpItemText,           TEXT_POWERPLANT_RARE_CANDY
	dw_const PickUpItemText,           TEXT_POWERPLANT_TM_THUNDER
	dw_const PickUpItemText,           TEXT_POWERPLANT_TM_REFLECT
	dw_const PickUpItemText,           TEXT_POWERPLANT_THUNDER_STONE ; marcelnote - new ThunderStone
	dw_const PowerPlantComputerText,   TEXT_POWERPLANT_COMPUTER1 ; marcelnote - new
	dw_const PowerPlantComputerText,   TEXT_POWERPLANT_COMPUTER2 ; marcelnote - new

PowerPlantTrainerHeaders:
	def_trainers
Voltorb0TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_0, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb1TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_1, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb2TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_2, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb3TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_3, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb4TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_4, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb5TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_5, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb6TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_6, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb7TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_7, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
ZapdosTrainerHeader:
	trainer EVENT_BEAT_ZAPDOS, 0, PowerPlantZapdosBattleText, PowerPlantZapdosBattleText, PowerPlantZapdosBattleText
	db -1 ; end

PowerPlantInitBattleScript:
	call TalkToTrainer
	ld a, [wCurMapScript]
	ld [wPowerPlantCurScript], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

PowerPlantVoltorb1Text:
	text_asm
	ld hl, Voltorb0TrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantVoltorb2Text:
	text_asm
	ld hl, Voltorb1TrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantVoltorb3Text:
	text_asm
	ld hl, Voltorb2TrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantElectrode1Text:
	text_asm
	ld hl, Voltorb3TrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantVoltorb4Text:
	text_asm
	ld hl, Voltorb4TrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantVoltorb5Text:
	text_asm
	ld hl, Voltorb5TrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantElectrode2Text:
	text_asm
	ld hl, Voltorb6TrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantVoltorb6Text:
	text_asm
	ld hl, Voltorb7TrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantZapdosText:
	text_asm
	ld hl, ZapdosTrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantVoltorbBattleText:
	text_far _PowerPlantVoltorbBattleText
	text_end

PowerPlantZapdosBattleText:
	text_far _PowerPlantZapdosBattleText
	text_asm
	ld a, ZAPDOS
	call PlayCry
	call WaitForSoundToFinish
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

PowerPlantComputerText: ; marcelnote - new
	text_far _PowerPlantComputerText
	text_end
