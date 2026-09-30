; formats a string at wMovesString that lists the moves at wMoves
FormatMovesString:: ; marcelnote - optimized
	ld de, wMoves
	ld hl, wMovesString
	ld b, NUM_MOVES
.printMoveNameLoop
	ld a, [de]
	and a ; end of move list?
	jr z, .printDashLoop ; print dashes when no moves are left
	inc de
	push de ; save de = next move
	ld [wNamedObjectIndex], a
	call GetMoveName ; stores name in wNameBuffer and leaves de -> wNameBuffer
.copyNameLoop
	ld a, [de]
	cp '@'
	jr z, .doneCopyingName
	ld [hli], a
	inc de
	jr .copyNameLoop

.doneCopyingName
	ld a, NUM_MOVES
	sub b
	ld [wNumMovesMinusOne], a
	ld a, '<NEXT>'
	ld [hli], a
	pop de ; restore de = next move
	dec b
	jr nz, .printMoveNameLoop
.done
	ld a, '@'
	ld [hl], a
	ret

.printDashLoop
	ld a, '-'
	ld [hli], a
	dec b
	jr z, .done
	ld a, '<NEXT>'
	ld [hli], a
	jr .printDashLoop


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
