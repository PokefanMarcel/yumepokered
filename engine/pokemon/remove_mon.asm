; marcelnote - revamped Bill's PC
; Remove the mon at wWhichPokemon from the party.
; Box removals now handled separately by ClearBillsPCBoxSlot.
_RemovePokemon::

	; update party count
	ld hl, wPartyCount
	ld a, [hl]
	dec a
	ld [hli], a ; hl = wPartySpecies

	; shift species upwards
	ld a, [wWhichPokemon]
	ld c, a
	ld b, 0
	add hl, bc ; hl = species at removed slot
.shiftMonSpeciesLoop
	inc hl
	ld a, [hld]
	ld [hli], a
	inc a ; reached terminator?
	jr nz, .shiftMonSpeciesLoop

	; shift field moves upwards, but does not use terminator
	ld hl, wTempFieldMoves
	add hl, bc ; hl = field move at removed slot
	ld a, c ; a = [wWhichPokemon]
.shiftFieldMoveLoop
	cp PARTY_LENGTH - 1
	jr z, .lastFieldMove
	inc hl
	ld a, [hld]
	ld [hli], a
	inc c
	ld a, c
	jr .shiftFieldMoveLoop
.lastFieldMove
	ld [hl], 0

	ld a, [wWhichPokemon]
	cp PARTY_LENGTH - 1 ; are we removing the last pokemon?
	ret z ; if yes, shifting species is enough (leftover data is deindexed)

	; shift OT upwards
	ld hl, wPartyMonOT ; a = [wWhichPokemon] still
	call SkipFixedLengthTextEntries ; sets bc = NAME_LENGTH
	ld d, h
	ld e, l    ; de = wPartyMon<n>OT
	add hl, bc ; hl = wPartyMon<n+1>OT
	ld bc, wPartyMonNicks
	call CopyDataUntil

	; shift nicknames upwards
	ld hl, wPartyMonNicks
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries ; sets bc = NAME_LENGTH
	ld d, h
	ld e, l    ; de = wPartyMon<n>Nick
	add hl, bc ; hl = wPartyMon<n+1>Nick
	ld bc, wPartyMonNicksEnd
	call CopyDataUntil

	; shift pokemon data upwards
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld d, h
	ld e, l    ; de = wPartyMon<n>
	add hl, bc ; hl = wPartyMon<n+1>
	ld bc, wPartyMonOT
	jp CopyDataUntil
