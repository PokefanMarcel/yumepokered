; marcelnote - new for floor signs, only readable facing up
PrintFloorSign:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	ld a, [wHiddenEventFunctionArgument]
	jp PrintPredefTextID


CeladonMansion1FManagersSuiteSignText::
	text_far _CeladonMansion1FManagersSuiteSignText
	text_end

CeladonMansion2FMeetingRoomSignText::
	text_far _CeladonMansion2FMeetingRoomSignText
	text_end

CeladonMansion3FDevRoomSignText::
	text_far _CeladonMansion3FDevRoomSignText
	text_end

CeladonMansion4FYumeLabsSignText::
	text_far _CeladonMansion4FYumeLabsSignText
	text_end

MandarinSilphCo2FSalesSignText::
	text_far _MandarinSilphCo2FSalesSignText
	text_end

MandarinSilphCo3FMeetingRoomSignText::
	text_far _MandarinSilphCo3FMeetingRoomSignText
	text_end

MandarinSilphCo4FRegionalDirectorSignText::
	text_far _MandarinSilphCo4FRegionalDirectorSignText
	text_end
