NamePointers::
; entries correspond to *_NAME constants
	dw MonsterNames
	dw MoveNames
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
; stores name in wNameBuffer and returns de pointing to wNameBuffer
; marcelnote - moved TM/HM handling to GetItemName, and Mon handling to GetMonName
	ld a, [wNameListIndex]
	ld [wNamedObjectIndex], a

	ldh a, [hLoadedROMBank]
	push af
	push hl
	push bc
	ld a, [wNameListType]
	dec a ; one-based name type
	add a
	ld e, a
	ld d, 0
	ld hl, NamePointers
	add hl, de
	ld a, [hli]
	ld h, [hl] ; marcelnote - optimized
	ld l, a
	ld a, [wPredefBank]
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ld a, [wNameListIndex]
	ld b, a ; wanted entry
	ld c, 0 ; entry counter
.nextName
	ld d, h
	ld e, l
.nextChar
	ld a, [hli]
	cp '@'
	jr nz, .nextChar
	inc c
	ld a, b
	cp c
	jr nz, .nextName
	ld h, d
	ld l, e
	ld de, wNameBuffer
	push de
	ld bc, NAME_BUFFER_LENGTH
	call CopyData
	pop de
	pop bc
	pop hl
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret


GetMachineName:: ; marcelnote - small optim
; copies the name of the TM/HM in [wNamedObjectIndex] to wNameBuffer
	push hl
	push bc
	ld a, [wNamedObjectIndex]
	cp TM01 ; is this a TM? [not HM]
	ld hl, TechnicalPrefix ; points to "TM"
	jr nc, .writeMachinePrefix
; if HM, then write "HM" and add NUM_HMS to the item ID,
; so we can reuse the TM printing code
	add NUM_HMS
	ld hl, HiddenPrefix ; points to "HM"
.writeMachinePrefix
	sub TM01 - 1 ; convert item ID to machine number
	push af ; marcelnote - keep on the stack instead of changing wNamedObjectIndex
	ld bc, 2
	ld de, wNameBuffer
	call CopyData
	pop af

; Convert the machine number to text.
	ld b, '0'
.firstDigit
	sub 10
	jr c, .secondDigit
	inc b
	jr .firstDigit
.secondDigit
	ASSERT '9' == $ff ; because digits are $f6-$ff, we landed on the right second digit directly
	ld c, a    ; save second digit
	ld a, b    ; first digit
	ld [de], a ; write first digit in wNameBuffer after "TM" or "HM"
	inc de
	ld a, c
	ld [de], a ; write second digit
	inc de
	ld a, '@'
	ld [de], a
	pop bc
	pop hl
	ld de, wNameBuffer
	ret


IF DEF(_FRA)
	INCLUDE "translation/fra/data/text/tm_hm_prefix.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/data/text/tm_hm_prefix.esp.asm"
ELSE
	INCLUDE "data/text/tm_hm_prefix.asm"
ENDC
