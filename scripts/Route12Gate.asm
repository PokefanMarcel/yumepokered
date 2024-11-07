; marcelnote - merged Route12Gate floors
Route12Gate_Script:
	jp EnableAutoTextBoxDrawing
	; marcelnote - Route12Gate2F_Script used to be just:
	; jp DisableAutoTextBoxDrawing ; to avoid text box from showing up when looking at binoculars from the side

Route12Gate_TextPointers:
	def_text_pointers
	dw_const Route12Gate1FGuardText,           TEXT_ROUTE12GATE1F_GUARD
	dw_const Route12Gate2FBrunetteGirlText,    TEXT_ROUTE12GATE2F_BRUNETTE_GIRL

Route12Gate1FGuardText:
	text_far _Route12Gate1FGuardText
	text_end

Route12Gate2FBrunetteGirlText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_GOT_TM39
	ld hl, .TM39ExplanationText
	jr nz, .got_text
	ld hl, .YouCanHaveThisText
	call PrintText
	lb bc, TM_SWIFT, 1
	call GiveItem
	ld hl, .TM39NoRoomText
	jr nc, .got_text
	SetEvent EVENT_GOT_TM39
	ld hl, .ReceivedTM39Text
.got_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.YouCanHaveThisText:
	text_far _Route12Gate2FBrunetteGirlYouCanHaveThisText
	text_end

.ReceivedTM39Text:
	text_far _Route12Gate2FBrunetteGirlReceivedTM39Text
	sound_get_item_1
	text_end

.TM39ExplanationText:
	text_far _Route12Gate2FBrunetteGirlTM39ExplanationText
	text_end

.TM39NoRoomText:
	text_far _Route12Gate2FBrunetteGirlTM39NoRoomText
	text_end
