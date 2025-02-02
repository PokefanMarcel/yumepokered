; This function checks whether the stack has overflowed.
; Two control byte values are loaded at wStackOverflowCheck in Init.
; The function is called in PrintText to overwrite the intended text with an error message.

DEF CONTROL_VALUE1 EQU %01010101
DEF CONTROL_VALUE2 EQU %10110110

CheckStackOverflow::
	push af
	ld a, [wStackOverflowCheck]
	cp CONTROL_VALUE1
	jr nz, .stackOverflow
	ld a, [wStackOverflowCheck + 1]
	cp CONTROL_VALUE2
	jr nz, .stackOverflow
	pop af
	ret

.stackOverflow
	pop af
	ld hl, StackOverflowErrorText
	ret

StackOverflowErrorText:
	text_far _StackOverflowErrorText
	text_end

_StackOverflowErrorText::
	text "STACK OVERFLOW"
	line "OCCURRED."
	done
