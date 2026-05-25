PrintWaitingText::
	hlcoord 3, 10
	lb bc, 1, 11
	ld a, [wIsInBattle]
	and a
	jr z, .trade
; battle
	call TextBoxBorder
	jr .borderDone
.trade
	call CableClub_TextBoxBorder
.borderDone
	hlcoord 4, 11
	ld de, WaitingText
	call PlaceString
	ld c, 50
	jp DelayFrames

WaitingText:
	db "Waiting...!@"
