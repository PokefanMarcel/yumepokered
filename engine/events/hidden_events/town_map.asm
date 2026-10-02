TownMapText::
	text_far _TownMapText
	text_promptbutton
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	call GBPalWhiteOutWithDelay3
	xor a
	ldh [hWY], a
	inc a
	ldh [hAutoBGTransferEnabled], a
;	call LoadFontTilePatterns ; marcelnote - DisplayTextIDInit already loaded the font
	callfar DisplayTownMap
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	rst TextScriptEnd ; marcelnote - optimized tail
