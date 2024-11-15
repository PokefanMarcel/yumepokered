; marcelnote - merged Copycat's house floors
CopycatsHouse_Script:
	jp EnableAutoTextBoxDrawing

CopycatsHouse_TextPointers:
	def_text_pointers
	; 1F
	dw_const CopycatsHouse1FMiddleAgedWomanText, TEXT_COPYCATSHOUSE1F_MIDDLE_AGED_WOMAN
	dw_const CopycatsHouse1FMiddleAgedManText,   TEXT_COPYCATSHOUSE1F_MIDDLE_AGED_MAN
	dw_const CopycatsHouse1FChanseyText,         TEXT_COPYCATSHOUSE1F_CHANSEY
	; 2F
	dw_const CopycatsHouse2FCopycatText,      TEXT_COPYCATSHOUSE2F_COPYCAT
	dw_const CopycatsHouse2FDoduoText,        TEXT_COPYCATSHOUSE2F_DODUO
	dw_const CopycatsHouse2FRareDollText,     TEXT_COPYCATSHOUSE2F_MONSTER
	dw_const CopycatsHouse2FRareDollText,     TEXT_COPYCATSHOUSE2F_BIRD
	dw_const CopycatsHouse2FRareDollText,     TEXT_COPYCATSHOUSE2F_FAIRY
	dw_const CopycatsHouse2FSNESText,         TEXT_COPYCATSHOUSE2F_SNES
	dw_const CopycatsHouse2FPCText,           TEXT_COPYCATSHOUSE2F_PC

CopycatsHouse1FMiddleAgedWomanText:
	text_far _CopycatsHouse1FMiddleAgedWomanText
	text_end

CopycatsHouse1FMiddleAgedManText:
	text_far _CopycatsHouse1FMiddleAgedManText
	text_end

CopycatsHouse1FChanseyText:
	text_far _CopycatsHouse1FChanseyText
	text_asm
	ld a, CHANSEY
	call PlayCry
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd


CopycatsHouse2FCopycatText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_GOT_TM31
	ld hl, .TM31Explanation2Text
	jr nz, .print_text
	ld a, TRUE
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .DoYouLikePokemonText
	call PrintText
	ld b, POKE_DOLL
	call IsItemInBag
	jr z, .text_script_end
	ld hl, .TM31PreReceiveText
	call PrintText
	lb bc, TM_MIMIC, 1
	call GiveItem
	ld hl, .TM31NoRoomText
	jr nc, .print_text
	ld a, POKE_DOLL
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	SetEvent EVENT_GOT_TM31
	ld hl, .ReceivedTM31Text
.print_text
	call PrintText
.text_script_end
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.DoYouLikePokemonText:
	text_far _CopycatsHouse2FCopycatDoYouLikePokemonText
	text_end

.TM31PreReceiveText:
	text_far _CopycatsHouse2FCopycatTM31PreReceiveText
	text_end

.ReceivedTM31Text:
	text_far _CopycatsHouse2FCopycatReceivedTM31Text
	sound_get_item_1
.TM31Explanation1Text:
	text_far _CopycatsHouse2FCopycatTM31Explanation1Text
	text_waitbutton
	text_end

.TM31Explanation2Text:
	text_far _CopycatsHouse2FCopycatTM31Explanation2Text
	text_end

.TM31NoRoomText:
	text_far _CopycatsHouse2FCopycatTM31NoRoomText
	text_waitbutton
	text_end

CopycatsHouse2FDoduoText:
	text_far _CopycatsHouse2FDoduoText
	text_end

CopycatsHouse2FRareDollText:
	text_far _CopycatsHouse2FRareDollText
	text_end

CopycatsHouse2FSNESText:
	text_far _CopycatsHouse2FSNESText
	text_end

CopycatsHouse2FPCText: ; marcelnote - simplified because can only be seen from below anyway
	text_far _CopycatsHouse2FPCMySecretsText
	text_end
;	text_asm
;	ld a, [wSpritePlayerStateData1FacingDirection]
;	cp SPRITE_FACING_UP
;	ld hl, .CantSeeText
;	jr nz, .notUp
;	ld hl, .MySecretsText
;.notUp
;	call PrintText
;	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

;.MySecretsText:
;	text_far _CopycatsHouse2FPCMySecretsText
;	text_end

;.CantSeeText:
;	text_far _CopycatsHouse2FPCCantSeeText
;	text_end
