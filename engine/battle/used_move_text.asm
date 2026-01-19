DisplayUsedMoveText:
	ld hl, UsedMoveText
	jp PrintText

; this function wastes time calling DetermineExclamationPointTextNum
; and choosing between Used1Text and Used2Text, even though
; those text strings are identical and both continue at PrintInsteadText
; this likely had to do with Japanese grammar that got translated,
; but the functionality didn't get removed ; marcelnote - removed
UsedMoveText:
	text_far _ActorNameText
	text_asm
	ld hl, UsedMoveText
	ret

UsedText:
	text_far _UsedMoveText
	text_asm
	; fallthrough

UsedMoveText_CheckObedience:
	ld a, [wMonIsDisobedient]
	and a
	jr z, PrintMoveName
	ld hl, UsedInsteadText
	ret

UsedInsteadText:
	text_far _UsedInsteadText
	text_asm
	; fallthrough

PrintMoveName:
	ld hl, MoveNameText
	ret

MoveNameText: ; marcelnote - removed redundant exclamation points leftover from Japanese
	text_far _MoveNameText
	text_asm
	ld hl, EndUsedMoveText
	ret

EndUsedMoveText:
	text_far _EndUsedMoveText
	text_end