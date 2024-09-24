PewterMart_Script:
	call EnableAutoTextBoxDrawing
	ld a, 1 << BIT_NO_AUTO_TEXT_BOX
	ld [wAutoTextBoxDrawingControl], a
	ret

PewterMart_TextPointers:
	def_text_pointers
	dw_const PewterMartClerkText,     TEXT_PEWTERMART_CLERK
	dw_const PewterMartYoungsterText, TEXT_PEWTERMART_YOUNGSTER
	dw_const PewterMartSuperNerdText, TEXT_PEWTERMART_SUPER_NERD

PewterMartYoungsterText:
	text_asm
	ld hl, .Text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _PewterMartYoungsterText
	text_end

PewterMartSuperNerdText:
	text_asm
	ld hl, .Text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _PewterMartSuperNerdText
	text_end

PewterMartClerkText: ; marcelnote - moved Mart inventories
	script_mart POKE_BALL, POTION, ESCAPE_ROPE, ANTIDOTE, BURN_HEAL, AWAKENING, PARLYZ_HEAL
