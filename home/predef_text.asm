PrintPredefTextID::
	ldh [hTextID], a
	ld de, TextPredefs
	call SetMapTextPointer
	ld hl, wTextPredefFlag
	set BIT_TEXT_PREDEF, [hl]
	call DisplayTextID
	; fallthrough

RestoreMapTextPointer::
	ld hl, wCurMapTextPtr
	ldh a, [hSavedMapTextPtr]
	ld [hli], a
	ldh a, [hSavedMapTextPtr + 1]
	ld [hl], a
	ret

SetMapTextPointer:: ; marcelnote - optimized
	ld hl, wCurMapTextPtr
	ld a, [hli]
	ldh [hSavedMapTextPtr], a     ; [wCurMapTextPtr]
	ld a, [hl]
	ldh [hSavedMapTextPtr + 1], a ; [wCurMapTextPtr + 1]
	ld a, d
	ld [hld], a ; [wCurMapTextPtr + 1]
	ld [hl], e  ; [wCurMapTextPtr]
	ret

INCLUDE "data/text_predef_pointers.asm"
