_RemovePokemon::
	call ClearTempFieldMove	; marcelnote - for temporary field moves

	ld hl, wPartyCount
	ld a, [wRemoveMonFromBox]
	and a
	jr z, .gotCount
	ld hl, wBoxCount
.gotCount
	ld a, [hl]
	dec a
	ld [hli], a

	ld a, [wWhichPokemon]
	ld c, a
	ld b, 0
	add hl, bc
	ld e, l
	ld d, h
	inc de
.shiftMonSpeciesLoop
	ld a, [de]
	inc de
	ld [hli], a
	inc a ; reached terminator?
	jr nz, .shiftMonSpeciesLoop ; if not, continue shifting species

	ld hl, wPartyMonOT
	ld d, PARTY_LENGTH - 1 ; max number of pokemon to shift
	ld a, [wRemoveMonFromBox]
	and a
	jr z, .gotOTsPointer
	ld hl, wBoxMonOT
	ld d, MONS_PER_BOX - 1
.gotOTsPointer
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld a, [wWhichPokemon]
	cp d ; are we removing the last pokemon?
	jr nz, .notRemovingLastMon ; if not, shift the pokemon below

	; bug: to erase a string, this should be ld [hl], '@'
	; This is not needed, as wBoxSpecies/wPartySpecies determine if a slot is used.
	; Besides, existing mon nick is left untouched
	ld [hl], $ff
	ret

.notRemovingLastMon
	ld d, h
	ld e, l
	ld bc, NAME_LENGTH
	add hl, bc
	ld bc, wPartyMonNicks
	ld a, [wRemoveMonFromBox]
	and a
	jr z, .gotNicksPointer
	ld bc, wBoxMonNicks
.gotNicksPointer
	call CopyDataUntil

	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wRemoveMonFromBox]
	and a
	jr z, .gotMonStructs
	ld hl, wBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
.gotMonStructs
	ld a, [wWhichPokemon]
	call AddNTimes ; get address of the pokemon removed

	ld d, h ; de = start address for CopyDataUntil
	ld e, l
	ld a, [wRemoveMonFromBox]
	and a
	jr z, .copyUntilPartyMonOT
; copy until wBoxMonOT
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc ; get address of next slot
	ld bc, wBoxMonOT
	jr .shiftOTs
.copyUntilPartyMonOT
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc ; get address of next slot
	ld bc, wPartyMonOT
.shiftOTs
	call CopyDataUntil ; shift all pokemon data up one slot

	ld hl, wPartyMonNicks
	ld a, [wRemoveMonFromBox]
	and a
	jr z, .gotNicksPointer2
	ld hl, wBoxMonNicks
.gotNicksPointer2
	ld bc, NAME_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes

	ld d, h
	ld e, l
	ld bc, NAME_LENGTH
	add hl, bc
	ld bc, wPartyMonNicksEnd
	ld a, [wRemoveMonFromBox]
	and a
	jr z, .shiftMonNicks
	ld bc, wBoxMonNicksEnd
.shiftMonNicks
	jp CopyDataUntil ; shift all pokemon nicknames up one slot

; marcelnote - for temporary field moves, adapted from shinpokered
ClearTempFieldMove: ; handles removing Mon from party
	ld a, [wRemoveMonFromBox]
	and a
	ret nz

	ld a, [wWhichPokemon] ; between 0-5
	ld hl, wTempFieldMoves
	ld c, a
	ld b, 0
	add hl, bc ; hl now points to field move of removed Mon

.loop
	cp PARTY_LENGTH - 1 ; are we at the last Mon?
	jr z, .finish

	inc hl
	ld a, [hld]
	ld [hli], a
	inc c
	ld a, c
	jr .loop

.finish
	ld [hl], 0
	ret
