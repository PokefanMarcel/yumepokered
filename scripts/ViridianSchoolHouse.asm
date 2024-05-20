ViridianSchoolHouse_Script:
	jp EnableAutoTextBoxDrawing

ViridianSchoolHouse_TextPointers:
	def_text_pointers
	dw_const ViridianSchoolHouseBrunetteGirlText, TEXT_VIRIDIANSCHOOLHOUSE_BRUNETTE_GIRL
	dw_const ViridianSchoolHouseCooltrainerFText, TEXT_VIRIDIANSCHOOLHOUSE_COOLTRAINER_F
	dw_const ViridianSchoolHouseYoungsterText,    TEXT_VIRIDIANSCHOOLHOUSE_YOUNGSTER    ; marcelnote - new NPC

ViridianSchoolHouseBrunetteGirlText:
	text_far _ViridianSchoolHouseBrunetteGirlText
	text_end

ViridianSchoolHouseCooltrainerFText:
	text_far _ViridianSchoolHouseCooltrainerFText
	text_end

ViridianSchoolHouseYoungsterText:    ; marcelnote - new NPC
	text_far _ViridianSchoolHouseYoungsterText
	text_end
