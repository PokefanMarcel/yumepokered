UndergroundPathRoute7_Script:
	ld a, ROUTE_7
	ld [wLastMap], a
	jp EnableAutoTextBoxDrawing

UndergroundPathRoute7_TextPointers:
	def_text_pointers
	dw_const UndergroundPathRoute7MiddleAgedManText, TEXT_UNDERGROUNDPATHROUTE7_MIDDLE_AGED_MAN
	; marcelnote - below belonged to UNDERGROUND_PATH_ROUTE_7_COPY
	;dw_const UndergroundPathRoute7CopyUnusedGirlText,          TEXT_UNDERGROUNDPATHROUTE7COPY_UNUSED_GIRL
	;dw_const UndergroundPathRoute7CopyUnusedMiddleAgedManText, TEXT_UNDERGROUNDPATHROUTE7COPY_UNUSED_MIDDLE_AGED_MAN

UndergroundPathRoute7MiddleAgedManText:
	text_far _UndergroundPathRoute7MiddleAgedManText
	text_end

; marcelnote - below belonged to UNDERGROUND_PATH_ROUTE_7_COPY

;UndergroundPathRoute7CopyUnusedGirlText:
;	text_far _UndergroundPathRoute7CopyUnusedGirlText
;	text_end

;UndergroundPathRoute7CopyUnusedTeamRocketHadAHideoutText:
;	text_far _UndergroundPathRoute7CopyUnusedTeamRocketHadAHideoutText
;	text_end

;UndergroundPathRoute7CopyUnusedMiddleAgedManText:
;	text_far _UndergroundPathRoute7CopyUnusedMiddleAgedManText
;	text_end

;UndergroundPathRoute7CopyUnusedGoesUnderSaffronText:
;	text_far _UndergroundPathRoute7CopyUnusedGoesUnderSaffronText
;	text_end
