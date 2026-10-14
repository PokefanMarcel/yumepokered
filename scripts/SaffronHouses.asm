SaffronHouses_Script:
	jp EnableAutoTextBoxDrawing

SaffronHouses_TextPointers:
	def_text_pointers
	; Pidgey house
	dw_const SaffronPidgeyHouseBrunetteGirlText, TEXT_SAFFRONPIDGEYHOUSE_BRUNETTE_GIRL
	dw_const SaffronPidgeyHousePidgeyText,       TEXT_SAFFRONPIDGEYHOUSE_PIDGEY
	dw_const SaffronPidgeyHouseYoungsterText,    TEXT_SAFFRONPIDGEYHOUSE_YOUNGSTER
	dw_const SaffronPidgeyHousePaperText,        TEXT_SAFFRONPIDGEYHOUSE_PAPER
	; Mr Psychic's house
	dw_const MrPsychicsHouseMrPsychicText, TEXT_MRPSYCHICSHOUSE_MR_PSYCHIC


SaffronPidgeyHouseBrunetteGirlText:
	text_far _SaffronPidgeyHouseBrunetteGirlText
	text_end

SaffronPidgeyHousePidgeyText:
	text_far _SaffronPidgeyHousePidgeyText
	text_asm
	ld a, PIDGEY
	call PlayCry
	rst TextScriptEnd

SaffronPidgeyHouseYoungsterText:
	text_far _SaffronPidgeyHouseYoungsterText
	text_end

SaffronPidgeyHousePaperText:
	text_far _SaffronPidgeyHousePaperText
	text_end


MrPsychicsHouseMrPsychicText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_GOT_TM29
	ld hl, .TM29ExplanationText
	ret nz
	ld hl, .YouWantedThisText
	call PrintText
	lb bc, TM_PSYCHIC_M, 1
	call GiveItem
	ld hl, .TM29NoRoomText
	jr nc, .printText
	SetEvent EVENT_GOT_TM29
	ld hl, .ReceivedTM29Text
.printText
	call PrintText
	rst TextScriptEnd

.YouWantedThisText:
	text_far _MrPsychicsHouseMrPsychicYouWantedThisText
	text_end

.ReceivedTM29Text:
	text_far _MrPsychicsHouseMrPsychicReceivedTM29Text
	sound_get_item_1
	text_end

.TM29ExplanationText:
	text_far _MrPsychicsHouseMrPsychicTM29ExplanationText
	text_end

.TM29NoRoomText:
	text_far _MrPsychicsHouseMrPsychicTM29NoRoomText
	text_end
