; marcelnote - merged Viridian Pokecenter and Mart
ViridianPokecenterMart_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	; marcelnote - deleted ViridianMartCheckParcelDeliveredScript to handle the event differently
	;call ViridianMartCheckParcelDeliveredScript
	call EnableAutoTextBoxDrawing
	ld hl, ViridianPokecenterMart_ScriptPointers
	ld a, [wViridianPokecenterMartCurScript]
	jp CallFunctionInTable

ViridianPokecenterMart_ScriptPointers:
	def_script_pointers
	dw_const ViridianMartDefaultScript,    SCRIPT_VIRIDIANMART_DEFAULT
	dw_const ViridianMartOaksParcelScript, SCRIPT_VIRIDIANMART_OAKS_PARCEL
	dw_const DoRet,                        SCRIPT_VIRIDIANMART_NOOP ; PureRGB - DoRet

ViridianMartDefaultScript:
	;;;;;; marcelnote - this new part checks if we entered the Pokecenter or Mart
	ld a, [wXCoord]
	cp 23 ; x-coordinate of the Mart entrance
	ret nz
	;;;;;;
	call UpdateSprites
	ld a, TEXT_VIRIDIANMART_CLERK_YOU_CAME_FROM_PALLET_TOWN
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wSimulatedJoypadStatesEnd
	ld de, .PlayerMovement
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_VIRIDIANMART_OAKS_PARCEL
	ld [wViridianPokecenterMartCurScript], a
	ret

.PlayerMovement:
	db D_LEFT, 1
	db D_UP, 2
	db -1 ; end

ViridianMartOaksParcelScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, TEXT_VIRIDIANMART_CLERK_PARCEL_QUEST
	ldh [hTextID], a
	call DisplayTextID
	lb bc, OAKS_PARCEL, 1
	call GiveItem
	SetEvent EVENT_GOT_OAKS_PARCEL
	ld a, HS_REDS_YELLOWS_HOUSES_ASLEEP ; marcelnote - hide Yellow asleep
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_REDS_YELLOWS_HOUSES_DAD1 ; marcelnote - hide Yellow's dad unpacking
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_REDS_YELLOWS_HOUSES_DAD2 ; marcelnote - show Yellow's dad sitting
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	ld a, SCRIPT_VIRIDIANMART_NOOP
	ld [wViridianPokecenterMartCurScript], a
	ret

ViridianPokecenterMart_TextPointers: ; marcelnote - merged ViridianMart_TextPointers and ViridianMart_TextPointers2
	def_text_pointers
	; Pokecenter
	dw_const ViridianPokecenterNurseText,            TEXT_VIRIDIANPOKECENTER_NURSE
	dw_const ViridianPokecenterGentlemanText,        TEXT_VIRIDIANPOKECENTER_GENTLEMAN
	dw_const ViridianPokecenterCooltrainerMText,     TEXT_VIRIDIANPOKECENTER_COOLTRAINER_M
	dw_const ViridianPokecenterLinkReceptionistText, TEXT_VIRIDIANPOKECENTER_LINK_RECEPTIONIST
	; Mart
	dw_const ViridianMartClerkText,                      TEXT_VIRIDIANMART_CLERK
	dw_const ViridianMartYoungsterText,                  TEXT_VIRIDIANMART_YOUNGSTER
	dw_const ViridianMartCooltrainerMText,               TEXT_VIRIDIANMART_COOLTRAINER_M
	dw_const ViridianMartClerkYouCameFromPalletTownText, TEXT_VIRIDIANMART_CLERK_YOU_CAME_FROM_PALLET_TOWN
	dw_const ViridianMartClerkParcelQuestText,           TEXT_VIRIDIANMART_CLERK_PARCEL_QUEST

ViridianPokecenterNurseText:
	script_pokecenter_nurse

ViridianPokecenterGentlemanText:
	text_far _ViridianPokecenterGentlemanText
	text_end

ViridianPokecenterCooltrainerMText:
	text_far _ViridianPokecenterCooltrainerMText
	text_end

ViridianPokecenterLinkReceptionistText:
	script_cable_club_receptionist


ViridianMartClerkYouCameFromPalletTownText:
	text_far _ViridianMartClerkYouCameFromPalletTownText
	text_end

ViridianMartClerkParcelQuestText:
	text_far _ViridianMartClerkParcelQuestText
	sound_get_key_item
	text_end

ViridianMartYoungsterText:
	text_far _ViridianMartYoungsterText
	text_end

ViridianMartCooltrainerMText:
	text_far _ViridianMartCooltrainerMText
	text_end

; marcelnote - remaking this to merge ViridianMart_TextPointers and ViridianMart_TextPointers2
ViridianMartClerkText: ; marcelnote - moved Mart inventories
	text_asm
	CheckEvent EVENT_GOT_POKEDEX
	jr z, .NoPokedex
	call ViridianMartClerkDialogue
;	ld hl, .NormalClerkText
;	call TextCommandProcessor
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.NoPokedex
	ld hl, .SayHiToOakText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.SayHiToOakText:
	text_far _ViridianMartClerkSayHiToOakText
	text_end

;.NormalClerkText:
;	script_mart POKE_BALL, ANTIDOTE, PARLYZ_HEAL, BURN_HEAL

ViridianMartClerkDialogue:
; marcelnote - recreating item list manually because I do not know
;              how to integrate script_mart in text_asm
	;script_mart POKE_BALL, ANTIDOTE, PARLYZ_HEAL, BURN_HEAL
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld hl, wItemList
	ld a, 4 ; 1st entry = total number of items in the list
	ld [hli], a
	ld a, POKE_BALL
	ld [hli], a
	ld a, ANTIDOTE
	ld [hli], a
	ld a, PARLYZ_HEAL
	ld [hli], a
	ld a, BURN_HEAL
	ld [hli], a
	ld a, -1 ; ends the list
	ld [hl], a
   	ld hl, PokemartGreetingText
   	call PrintText
   	ld a, PRICEDITEMLISTMENU
   	ld [wListMenuID], a
   	callfar DisplayPokemartDialogue_
   	ret
