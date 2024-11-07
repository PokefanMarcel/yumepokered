; marcelnote - merged Route11Gate floors
Route11Gate_Script:
	jp EnableAutoTextBoxDrawing
	; marcelnote - Route11Gate2F_Script used to be just:
	; jp DisableAutoTextBoxDrawing ; to avoid text box from showing up when looking at binoculars from the side

Route11Gate_TextPointers:
	def_text_pointers
	dw_const Route11Gate1FGuardText,           TEXT_ROUTE11GATE1F_GUARD
	dw_const Route11Gate2FYoungsterText,       TEXT_ROUTE11GATE2F_YOUNGSTER
	dw_const Route11Gate2FOaksAideText,        TEXT_ROUTE11GATE2F_OAKS_AIDE

Route11Gate1FGuardText:
	text_far _Route11Gate1FGuardText
	text_end

Route11Gate2FYoungsterText:
	text_asm
	xor a ; TRADE_FOR_TERRY
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

Route11Gate2FOaksAideText:
	text_asm
	CheckEvent EVENT_GOT_ITEMFINDER
	jr nz, .got_item
	ld a, 30
	ldh [hOaksAideRequirement], a
	ld a, ITEMFINDER
	ldh [hOaksAideRewardItem], a
	ld [wNamedObjectIndex], a
	call GetItemName
	ld h, d
	ld l, e
	ld de, wOaksAideRewardItemName
	ld bc, ITEM_NAME_LENGTH
	call CopyData
	predef OaksAideScript
	ldh a, [hOaksAideResult]
	dec a ; OAKS_AIDE_GOT_ITEM?
	jr nz, .no_item
	SetEvent EVENT_GOT_ITEMFINDER
.got_item
	ld hl, .ItemfinderDescriptionText
	call PrintText
.no_item
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.ItemfinderDescriptionText:
	text_far _Route11Gate2FOaksAideItemfinderDescriptionText
	text_end
