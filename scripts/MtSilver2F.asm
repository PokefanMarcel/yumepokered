; marcelnote - new location
MtSilver2F_Script:
	;ld a, 0
	;ld [wMuteAudioAndPauseMusic], a
	jp EnableAutoTextBoxDrawing

MtSilver2F_TextPointers:
	def_text_pointers
	dw_const PickUpItemText, TEXT_MTSILVER2F_PP_UP
	dw_const PickUpItemText, TEXT_MTSILVER2F_CALCIUM
	dw_const PickUpItemText, TEXT_MTSILVER2F_ULTRA_BALL
	dw_const PickUpItemText, TEXT_MTSILVER2F_MAX_REVIVE
	dw_const PickUpItemText, TEXT_MTSILVER2F_FULL_RESTORE

;MtMoon1FBewareZubatSign:
;	text_far _MtMoon1FBewareZubatSign
;	text_end
