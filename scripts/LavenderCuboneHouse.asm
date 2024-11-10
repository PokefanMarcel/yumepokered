LavenderCuboneHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

LavenderCuboneHouse_TextPointers:
	def_text_pointers
	dw_const LavenderCuboneHouseCuboneText,       TEXT_LAVENDERCUBONEHOUSE_CUBONE
	dw_const LavenderCuboneHouseBrunetteGirlText, TEXT_LAVENDERCUBONEHOUSE_BRUNETTE_GIRL

LavenderCuboneHouseCuboneText:
	text_far _LavenderCuboneHouseCuboneText
	text_asm
	ld a, CUBONE
	call PlayCry
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

LavenderCuboneHouseBrunetteGirlText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_RESCUED_MR_FUJI
	ld hl, .TheGhostIsGoneText
	jr nz, .rescued_mr_fuji
	ld hl, .PoorCubonesMotherText
.rescued_mr_fuji
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.PoorCubonesMotherText:
	text_far _LavenderCuboneHouseBrunetteGirlPoorCubonesMotherText
	text_end

.TheGhostIsGoneText:
	text_far _LavenderCuboneHouseBrunetteGirlGhostIsGoneText
	text_end
