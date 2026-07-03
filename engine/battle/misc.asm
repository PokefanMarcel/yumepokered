; formats a string at wMovesString that lists the moves at wMoves
FormatMovesString::
	ld hl, wMoves
	ld de, wMovesString
	ld b, NUM_MOVES
.printMoveNameLoop
	ld a, [hli]
	and a ; end of move list?
	jr z, .printDashLoop ; print dashes when no moves are left
	push hl
	ld [wNameListIndex], a
	ld a, BANK(MoveNames)
	ld [wPredefBank], a
	ld a, MOVE_NAME
	ld [wNameListType], a
	call GetName ; stores name in wNameBuffer
	ld hl, wNameBuffer
.copyNameLoop
	ld a, [hli]
	cp '@'
	jr z, .doneCopyingName
	ld [de], a
	inc de
	jr .copyNameLoop

.doneCopyingName
	ld a, NUM_MOVES
	sub b
	ld [wNumMovesMinusOne], a
	ld a, '<NEXT>'
	ld [de], a
	inc de
	pop hl
	dec b
	jr z, .done
	jr .printMoveNameLoop

.printDashLoop
	ld a, '-'
	ld [de], a
	inc de
	dec b
	jr z, .done
	ld a, '<NEXT>'
	ld [de], a
	inc de
	jr .printDashLoop

.done
	ld a, '@'
	ld [de], a
	ret

; get species of mon e in list [wMonDataLocation] for LoadMonData
GetMonSpecies:
	ld hl, wPartySpecies
	ld a, [wMonDataLocation]
	and a
	jr z, .getSpecies
	dec a
	jr z, .enemyParty
	ld hl, wBoxSpecies
	jr .getSpecies
.enemyParty
	ld hl, wEnemyPartySpecies
.getSpecies
	ld d, 0
	add hl, de
	ld a, [hl]
	ld [wCurPartySpecies], a
	ret
