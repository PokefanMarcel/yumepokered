; marcelnote - new location
MandarinSilphCo_Script:
	jp EnableAutoTextBoxDrawing

MandarinSilphCo_TextPointers:
	def_text_pointers
	dw_const MandarinSilphCo1FReceptionistText,         TEXT_MANDARINSILPHCO1F_RECEPTIONIST_TEXT
	dw_const MandarinSilphCo2FSilphWorkerFText,         TEXT_MANDARINSILPHCO2F_SILPH_WORKER_F_TEXT
	dw_const MandarinSilphCo2FSilphWorkerMText,         TEXT_MANDARINSILPHCO2F_SILPH_WORKER_M_TEXT
	dw_const MandarinSilphCo2FCooltrainerMText,         TEXT_MANDARINSILPHCO2F_COOLTRAINER_M_TEXT
	dw_const MandarinSilphCo3FScientistText,            TEXT_MANDARINSILPHCO3F_SCIENTIST_TEXT
	dw_const MandarinSilphCo4FDirectorText,             TEXT_MANDARINSILPHCO4F_DIRECTOR_TEXT
	dw_const MandarinSilphCo2FSalesSignText,            TEXT_MANDARINSILPHCO2F_SALES_SIGN
	dw_const MandarinSilphCo3FMeetingRoomSignText,      TEXT_MANDARINSILPHCO3F_MEETING_ROOM_SIGN
	dw_const MandarinSilphCo4FRegionalDirectorSignText, TEXT_MANDARINSILPHCO4F_REGIONAL_DIRECTOR_SIGN


MandarinSilphCo1FReceptionistText:
	text_far _MandarinSilphCo1FReceptionistText
	text_end

MandarinSilphCo2FSilphWorkerFText:
	text_far _MandarinSilphCo2FSilphWorkerFText
	text_end

MandarinSilphCo2FSilphWorkerMText:
	text_far _MandarinSilphCo2FSilphWorkerMText
	text_end

MandarinSilphCo2FCooltrainerMText:
	text_far _MandarinSilphCo2FCooltrainerMText
	text_end

MandarinSilphCo3FScientistText:
	text_far _MandarinSilphCo3FScientistText
	text_end

MandarinSilphCo4FDirectorText:
	text_asm
	ld hl, .FromNowOnText
	CheckEvent EVENT_GOT_MANDARIN_SILPH_DIRECTOR_NUGGET
	jr nz, .print
	ld hl, .BusyText
	CheckEvent EVENT_POSTGAME_LORELEI
	jr z, .print
	ld hl, .PleaseTakeThisText
	call PrintText
	lb bc, NUGGET, 1
	call GiveItem
	ld hl, .NoRoomText
	jr nc, .print
	SetEvent EVENT_GOT_MANDARIN_SILPH_DIRECTOR_NUGGET
	ld hl, .ReceivedNuggetText
	jr .print
.print
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.BusyText:
	text_far _MandarinSilphCo4FDirectorBusyText
	text_end

.PleaseTakeThisText:
	text_far _MandarinSilphCo4FDirectorPleaseTakeThisText
	text_end

.NoRoomText:
	text_far _MandarinSilphCo4FDirectorNoRoomText
	text_end

.ReceivedNuggetText:
	text_far _MandarinSilphCo4FDirectorReceivedNuggetText
	sound_get_item_1
	text_end

.FromNowOnText:
	text_far _MandarinSilphCo4FDirectorFromNowOnText
	text_end

MandarinSilphCo2FSalesSignText:
	text_far _MandarinSilphCo2FSalesSignText
	text_end

MandarinSilphCo3FMeetingRoomSignText:
	text_far _MandarinSilphCo3FMeetingRoomSignText
	text_end

MandarinSilphCo4FRegionalDirectorSignText:
	text_far _MandarinSilphCo4FRegionalDirectorSignText
	text_end
