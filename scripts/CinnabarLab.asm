; marcelnote - merged Cinnabar Lab maps
CinnabarLab_Script:
	jp EnableAutoTextBoxDrawing

CinnabarLab_TextPointers:
	def_text_pointers
	; object
	; Lobby
	dw_const CinnabarLabFishingGuruText,     TEXT_CINNABARLAB_FISHING_GURU
	; Trade room
	dw_const CinnabarLabTradeRoomSuperNerdText, TEXT_CINNABARLABTRADEROOM_SUPER_NERD
	dw_const CinnabarLabTradeRoomGrampsText,    TEXT_CINNABARLABTRADEROOM_GRAMPS
	dw_const CinnabarLabTradeRoomBeautyText,    TEXT_CINNABARLABTRADEROOM_BEAUTY
	; Metronome room
	dw_const CinnabarLabMetronomeRoomScientist1Text, TEXT_CINNABARLABMETRONOMEROOM_SCIENTIST1
	dw_const CinnabarLabMetronomeRoomScientist2Text, TEXT_CINNABARLABMETRONOMEROOM_SCIENTIST2
	; Fossil room
	dw_const CinnabarLabFossilRoomScientist1Text, TEXT_CINNABARLABFOSSILROOM_SCIENTIST1
	dw_const CinnabarLabFossilRoomScientist2Text, TEXT_CINNABARLABFOSSILROOM_SCIENTIST2
	; bg
	; Lobby
	dw_const CinnabarLabPhotoText,           TEXT_CINNABARLAB_PHOTO
	dw_const CinnabarLabMeetingRoomSignText, TEXT_CINNABARLAB_MEETING_ROOM_SIGN
	dw_const CinnabarLabRAndDSignText,       TEXT_CINNABARLAB_R_AND_D_SIGN
	dw_const CinnabarLabTestingRoomSignText, TEXT_CINNABARLAB_TESTING_ROOM_SIGN
	; Trade room
	; none
	; Metronome room
	dw_const CinnabarLabMetronomeRoomPCText,         TEXT_CINNABARLABMETRONOMEROOM_PC_KEYBOARD
	dw_const CinnabarLabMetronomeRoomPCText,         TEXT_CINNABARLABMETRONOMEROOM_PC_MONITOR
	dw_const CinnabarLabMetronomeRoomAmberPipeText,  TEXT_CINNABARLABMETRONOMEROOM_AMBER_PIPE
	; Fossil room
	; none

CinnabarLabFishingGuruText:
	text_far _CinnabarLabFishingGuruText
	text_end

CinnabarLabPhotoText:
	text_far _CinnabarLabPhotoText
	text_end

CinnabarLabMeetingRoomSignText:
	text_far _CinnabarLabMeetingRoomSignText
	text_end

CinnabarLabRAndDSignText:
	text_far _CinnabarLabRAndDSignText
	text_end

CinnabarLabTestingRoomSignText:
	text_far _CinnabarLabTestingRoomSignText
	text_end


CinnabarLabTradeRoomSuperNerdText:
	text_far _CinnabarLabTradeRoomSuperNerdText
	text_end

CinnabarLabTradeRoomGrampsText:
	text_asm
	ld a, TRADE_FOR_DORIS
	ld [wWhichTrade], a
	jr CinnabarLabTradeRoomDoTrade

CinnabarLabTradeRoomBeautyText:
	text_asm
	ld a, TRADE_FOR_CRINKLES
	ld [wWhichTrade], a
CinnabarLabTradeRoomDoTrade:
	predef DoInGameTradeDialogue
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd


CinnabarLabMetronomeRoomScientist1Text: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_GOT_TM35
	ld hl, .TM35ExplanationText
	jr nz, .print_text
	ld hl, .Text
	call PrintText
	lb bc, TM_METRONOME, 1
	call GiveItem
	ld hl, .TM35NoRoomText
	jr nc, .print_text
	SetEvent EVENT_GOT_TM35
	ld hl, .ReceivedTM35Text
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _CinnabarLabMetronomeRoomScientist1Text
	text_end

.ReceivedTM35Text:
	text_far _CinnabarLabMetronomeRoomScientist1ReceivedTM35Text
	sound_get_item_1
	text_end

.TM35ExplanationText:
	text_far _CinnabarLabMetronomeRoomScientist1TM35ExplanationText
	text_end

.TM35NoRoomText:
	text_far _CinnabarLabMetronomeRoomScientist1TM35NoRoomText
	text_end

CinnabarLabMetronomeRoomScientist2Text:
	text_far _CinnabarLabMetronomeRoomScientist2Text
	text_end

CinnabarLabMetronomeRoomPCText:
	text_far _CinnabarLabMetronomeRoomPCText
	text_end

CinnabarLabMetronomeRoomAmberPipeText:
	text_far _CinnabarLabMetronomeRoomAmberPipeText
	text_end


CinnabarLabScript_GetFossilsInBag:
; construct a list of all fossils in the player's bag
	xor a
	ld [wFilteredBagItemsCount], a
	ld de, wFilteredBagItems
	ld hl, FossilsList
.loop
	ld a, [hli]
	and a
	jr z, .done
	push hl
	push de
	ld [wTempByteValue], a
	ld b, a
	predef GetQuantityOfItemInBag
	pop de
	pop hl
	ld a, b
	and a
	jr z, .loop
	; A fossil is in the bag
	ld a, [wTempByteValue]
	ld [de], a
	inc de
	push hl
	ld hl, wFilteredBagItemsCount
	inc [hl]
	pop hl
	jr .loop
.done
	ld a, $ff
	ld [de], a
	ret

FossilsList:
	db DOME_FOSSIL
	db HELIX_FOSSIL
	db OLD_AMBER
	db 0 ; end

CinnabarLabFossilRoomScientist1Text: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_GAVE_FOSSIL_TO_LAB
	jr nz, .check_done_reviving
	ld hl, .Text
	call PrintText
	call CinnabarLabScript_GetFossilsInBag
	ld a, [wFilteredBagItemsCount]
	and a
	ld hl, .NoFossilsText
	jr z, .print_text
	farcall GiveFossilToCinnabarLab
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.check_done_reviving
	CheckEventAfterBranchReuseA EVENT_LAB_STILL_REVIVING_FOSSIL, EVENT_GAVE_FOSSIL_TO_LAB
	jr z, .done_reviving
	ld hl, .GoForAWalkText
.print_text
	call PrintText
.text_script_end
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.done_reviving
	call LoadFossilItemAndMonNameBank1D
	ld hl, .FossilIsBackToLifeText
	call PrintText
	SetEvent EVENT_LAB_HANDING_OVER_FOSSIL_MON
	ld a, [wFossilMon]
	ld b, a
	ld c, 30
	call GivePokemon
	jr nc, .text_script_end
	ResetEvents EVENT_GAVE_FOSSIL_TO_LAB, EVENT_LAB_STILL_REVIVING_FOSSIL, EVENT_LAB_HANDING_OVER_FOSSIL_MON
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _CinnabarLabFossilRoomScientist1Text
	text_end

.NoFossilsText:
	text_far _CinnabarLabFossilRoomScientist1NoFossilsText
	text_end

.GoForAWalkText:
	text_far _CinnabarLabFossilRoomScientist1GoForAWalkText
	text_end

.FossilIsBackToLifeText:
	text_far _CinnabarLabFossilRoomScientist1FossilIsBackToLifeText
	text_end

CinnabarLabFossilRoomScientist2Text:
	text_asm
	ld a, TRADE_FOR_SAILOR
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

LoadFossilItemAndMonNameBank1D:
	farjp LoadFossilItemAndMonName
