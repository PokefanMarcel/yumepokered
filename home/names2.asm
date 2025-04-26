NamePointers::
; entries correspond to *_NAME constants
	dw MonsterNames
	dw MoveNames
	dw 0 ; marcelnote - replaced UnusedBadgeNames
	dw ItemNames
	dw wPartyMonOT ; player's OT names list
	dw wEnemyMonOT ; enemy's OT names list
	dw TrainerNames

GetName::
; arguments:
; [wNameListIndex] = which name
; [wNameListType] = which list
; [wPredefBank] = bank of list
;
; stores name in wNameBuffer
	ld a, [wNameListIndex]
	ld [wNamedObjectIndex], a

	; TM names are separate from item names.
	; BUG: This applies to all names instead of just items.
	ASSERT NUM_POKEMON_INDEXES < HM01, \
		"A bug in GetName will get TM/HM names for Pokémon above ${x:HM01}."
	ASSERT NUM_ATTACKS < HM01, \
		"A bug in GetName will get TM/HM names for moves above ${x:HM01}."
	ASSERT NUM_TRAINERS < HM01, \
		"A bug in GetName will get TM/HM names for trainers above ${x:HM01}."
	cp HM01
	jp nc, GetMachineName

	ldh a, [hLoadedROMBank]
	push af
	push hl
	push bc
	push de
	ld a, [wNameListType]
	dec a
	jr nz, .notMonsterName
	; 1 = MONSTER_NAME
	call GetMonName
	;ld hl, NAME_LENGTH
	;add hl, de
	;ld e, l
	;ld d, h
	jr .finish
.notMonsterName
	; 2-7 = other names
	ld a, [wPredefBank]
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld a, [wNameListType]
	dec a
	add a
	ld d, 0
	ld e, a
	jr nc, .skip
	inc d
.skip
	ld hl, NamePointers
	add hl, de
	ld a, [hli]
	ldh [hSwapTemp + 1], a
	ld a, [hl]
	ldh [hSwapTemp], a
	ldh a, [hSwapTemp]
	ld h, a
	ldh a, [hSwapTemp + 1]
	ld l, a
	ld a, [wNameListIndex]
	ld b, a ; wanted entry
	ld c, 0 ; entry counter
.nextName
	ld d, h
	ld e, l
.nextChar
	ld a, [hli]
	cp "@"
	jr nz, .nextChar
	inc c
	ld a, b
	cp c
	jr nz, .nextName
	ld h, d
	ld l, e
	ld de, wNameBuffer
	ld bc, NAME_BUFFER_LENGTH
	call CopyData
.finish
	;ld a, e
	;ld [wUnusedNamePointer], a
	;ld a, d
	;ld [wUnusedNamePointer + 1], a
	pop de
	pop bc
	pop hl
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret


GetMachineName::
; copies the name of the TM/HM in [wNamedObjectIndex] to wNameBuffer
	push hl
	push de
	push bc
	ld a, [wNamedObjectIndex]
	push af
	cp TM01 ; is this a TM? [not HM]
	ld hl, TechnicalPrefix ; points to "TM"
	jr nc, .WriteMachinePrefix
; if HM, then write "HM" and add NUM_HMS to the item ID,
; so we can reuse the TM printing code
	add NUM_HMS
	ld [wNamedObjectIndex], a
	ld hl, HiddenPrefix ; points to "HM"
.WriteMachinePrefix
	ld bc, 2
	ld de, wNameBuffer
	call CopyData

; now get the machine number and convert it to text
	ld a, [wNamedObjectIndex]
	sub TM01 - 1
	ld b, "0"
.FirstDigit
	sub 10
	jr c, .SecondDigit
	inc b
	jr .FirstDigit
.SecondDigit
	add 10 ; a is equal to second digit of TM name
	push af ; save a
	ld a, b ; first digit
	ld [de], a ; write first digit in wNameBuffer after "TM" or "HM"
	inc de
	pop af
	ld b, "0"
	add b
	ld [de], a
	inc de
	ld a, "@"
	ld [de], a
	pop af
	ld [wNamedObjectIndex], a
	pop bc
	pop de
	pop hl
	ret

TechnicalPrefix::
	db "TM"
HiddenPrefix::
	db "HM"
