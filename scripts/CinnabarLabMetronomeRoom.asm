CinnabarLabMetronomeRoom_Script:
	jp EnableAutoTextBoxDrawing

CinnabarLabMetronomeRoom_TextPointers:
	def_text_pointers
	dw_const CinnabarLabMetronomeRoomScientist1Text, TEXT_CINNABARLABMETRONOMEROOM_SCIENTIST1
	dw_const CinnabarLabMetronomeRoomScientist2Text, TEXT_CINNABARLABMETRONOMEROOM_SCIENTIST2
	dw_const CinnabarLabMetronomeRoomPCText,         TEXT_CINNABARLABMETRONOMEROOM_PC_KEYBOARD
	dw_const CinnabarLabMetronomeRoomPCText,         TEXT_CINNABARLABMETRONOMEROOM_PC_MONITOR
	dw_const CinnabarLabMetronomeRoomAmberPipeText,  TEXT_CINNABARLABMETRONOMEROOM_AMBER_PIPE

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
