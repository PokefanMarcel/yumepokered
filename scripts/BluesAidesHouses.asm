; marcelnote - merged Blue's house with new Aide's house
BluesAidesHouses_Script:
	;call EnableAutoTextBoxDrawing
	;ld hl, BluesAidesHouses_ScriptPointers
	;ld a, [wBluesHouseCurScript]
	;jp CallFunctionInTable
	jp EnableAutoTextBoxDrawing

; marcelnote - Blue's house script was purely for setting up EVENT_ENTERED_BLUES_HOUSE,
;              but this event was actually redundant with EVENT_GOT_TOWN_MAP

;BluesAidesHouses_ScriptPointers:
;	def_script_pointers
;	dw_const BluesAidesHousesDefaultScript, SCRIPT_BLUESAIDESHOUSES_DEFAULT
;	dw_const DoRet,                         SCRIPT_BLUESAIDESHOUSES_NOOP ; PureRGB - DoRet

;BluesAidesHousesDefaultScript:
;;;;;; marcelnote - adjusted for second house on same map
;	ld a, [wXCoord]
;	cp 14 ; marcelnote - start of second house on the map
;	ret nc ; if XCoord >= 14, player in Aide's house
;;;;;;
;	SetEvent EVENT_ENTERED_BLUES_HOUSE
;	ld a, SCRIPT_BLUESAIDESHOUSES_NOOP
;	ld [wBluesHouseCurScript], a
;	ret

BluesAidesHouses_TextPointers:
	def_text_pointers
	dw_const BluesHouseDaisySittingText,         TEXT_BLUESHOUSE_DAISY_SITTING
	dw_const BluesHouseDaisyWalkingText,         TEXT_BLUESHOUSE_DAISY_WALKING
	dw_const AidesHouseMiddleAgedWomanText,      TEXT_AIDESHOUSE_MIDDLE_AGED_WOMAN ; marcelnote - new Pallet house
	dw_const BluesHouseTownMapText,              TEXT_BLUESHOUSE_TOWN_MAP
	dw_const AidesHouseMemoText,                 TEXT_AIDESHOUSE_MEMO  ; marcelnote - new Pallet house
	dw_const BluesHousePhoneText,                TEXT_BLUESHOUSE_PHONE ; marcelnote - new for pay phone

BluesHouseDaisySittingText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_GOT_TOWN_MAP
	ld hl, BluesHouseDaisyUseMapText
	jr nz, .print_text
	CheckEvent EVENT_GOT_POKEDEX
	ld hl, BluesHouseDaisyRivalAtLabText
	jr z, .print_text
	ld hl, BluesHouseDaisyOfferMapText
	call PrintText
	lb bc, TOWN_MAP, 1
	call GiveItem
	ld hl, BluesHouseDaisyBagFullText
	jr nc, .print_text
	SetEvent EVENT_GOT_TOWN_MAP
	ld a, TOGGLE_TOWN_MAP
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld hl, GotMapText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

BluesHouseDaisyRivalAtLabText:
	text_far _BluesHouseDaisyRivalAtLabText
	text_end

BluesHouseDaisyOfferMapText:
	text_far _BluesHouseDaisyOfferMapText
	text_end

GotMapText:
	text_far _GotMapText
	sound_get_key_item
	text_end

BluesHouseDaisyBagFullText:
	text_far _BluesHouseDaisyBagFullText
	text_end

BluesHouseDaisyUseMapText:
	text_far _BluesHouseDaisyUseMapText
	text_end

BluesHouseDaisyWalkingText: ; marcelnote - modified for pay phones
	text_asm
	ldh a, [hRandomAdd]
	ld hl, .LivingThingsText
	cp 85 ; 85/256 chance of 1st dialogue
	jr c, .print_text
	ld hl, .PhoneText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.LivingThingsText
	text_far _BluesHouseDaisyWalkingLivingThingsText
	text_end

.PhoneText
	text_far _BluesHouseDaisyWalkingPhoneText
	text_end

BluesHouseTownMapText:
	text_far _BluesHouseTownMapText
	text_end

BluesHousePhoneText: ; marcelnote - new for pay phones
	text_far _BluesHousePhoneText
	text_end

AidesHouseMiddleAgedWomanText: ; marcelnote - new Pallet house
	text_far _AidesHouseMiddleAgedWomanText
	text_end
; marcelnote - this is code to make her give rare candy instead
;	text_asm
;	ld hl, TakeThisRareCandyText
;	call PrintText
;	lb bc, RARE_CANDY, 5
;	call GiveItem
;	ld hl, BluesHouseDaisyBagFullText
;	jr nc, .print_text
;	ld hl, GotMapText
;.print_text
;	call PrintText
;	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

;TakeThisRareCandyText:
;	text_far _TakeThisRareCandyText
;	text_end

AidesHouseMemoText: ; marcelnote - new Pallet house
	text_far _AidesHouseMemoText
	text_end
