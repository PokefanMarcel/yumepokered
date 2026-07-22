; marcelnote - new map
DrJabarasLab_Script:
	jp EnableAutoTextBoxDrawing

;DrJabarasLab_ScriptPointers:
;	def_script_pointers

DrJabarasLab_TextPointers:
	def_text_pointers
	dw_const DrJabarasLabJabaraText,     TEXT_DRJABARASLAB_JABARA
	dw_const DrJabarasLabNotesText,      TEXT_DRJABARASLAB_NOTES
	dw_const DrJabarasLabEmailsText,     TEXT_DRJABARASLAB_EMAILS

DrJabarasLabJabaraText:
	text_asm
	CheckEvent EVENT_JABARA_RETURNED_FLUTE
	ld hl, .FinalText
	ret nz
	CheckEvent EVENT_JABARA_RUNNING_TESTS
	jr nz, .runningTests
	CheckEvent EVENT_GAVE_JABARA_FLUTE
	jr nz, .gaveFlute
	ld hl, .IntroText
	call PrintText
	ld b, POKE_FLUTE
	call IsItemInBag
	jr z, .textScriptEnd
	ld hl, TextScriptPromptButton
	call TextCommandProcessor
	ld hl, .HaveFluteText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .RefusedText
	jr nz, .printText
	ld a, POKE_FLUTE
	ldh [hItemToRemoveID], a
	callfar RemoveItemByID
	SetEvent EVENT_GAVE_JABARA_FLUTE
	SetEvent EVENT_JABARA_RUNNING_TESTS
	ld hl, .GaveFluteText
	call PrintText
	ld hl, .NeedTimeText
.printText
	call PrintText
.textScriptEnd
	rst TextScriptEnd
.gaveFlute
	ld hl, .ExperimentsOverText
	call PrintText
	lb bc, POKE_FLUTE, 1
	call GiveItem
	ld hl, .NoRoomText
	jr nc, .printText
	SetEvent EVENT_JABARA_RETURNED_FLUTE
	ld hl, .ReturnedFluteText
	jr .printText

.IntroText:
	text_far _DrJabarasLabJabaraIntroText
	text_end

.HaveFluteText:
	text_far _DrJabarasLabHaveFluteText
	text_end

.RefusedText:
	text_far _DrJabarasLabRefusedText
	text_end

.GaveFluteText:
	text_far _DrJabarasLabGaveFluteText
	sound_get_item_1
	text_end

.NeedTimeText:
	text_far _DrJabarasLabNeedTimeText
	text_end

.ExperimentsOverText:
	text_far _DrJabarasLabExperimentsOverText
	text_end

.NoRoomText:
	text_far _DrJabarasLabNoRoomText
	text_end

.ReturnedFluteText:
	text_far _DrJabarasLabReturnedFluteText
	sound_get_key_item
	text_end

.FinalText:
	text_far _DrJabarasLabJabaraFinalText
	text_end



DrJabarasLabNotesText:
	text_far _DrJabarasLabNotesText
	text_end

DrJabarasLabEmailsText:
	text_asm
	ld hl, .ReceivedEmailText
    CheckEvent EVENT_GAVE_JABARA_FLUTE ; preserves hl
	ret z
    CheckEvent EVENT_JABARA_RUNNING_TESTS
	ret nz
    ld hl, .EmailDraftText
	ret

.ReceivedEmailText:
	text_far _DrJabarasLabReceivedEmailText
	text_end

.EmailDraftText:
	text_far _DrJabarasLabEmailDraftText
	text_end
