GetName:: ; marcelnote - optimized, moved TM/HM handling to GetItemName, and Mon handling to GetMonName
; arguments:
; [wNamedObjectIndex] = which name
; [wNameListType] = which list
; [wPredefBank] = bank of list
; stores name in wNameBuffer and returns de pointing to wNameBuffer
	ldh a, [hLoadedROMBank]
	push af
	push hl
	push bc
	ld a, [wNameListType]
	add a
	ld e, a
	ld d, 0
	ld hl, NamePointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPredefBank]
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ld a, [wNamedObjectIndex]
	ld b, a ; wanted entry, one-based
	dec b
	jr z, .copyName
.skipName
	ld a, [hli]
	cp '@'
	jr nz, .skipName
	dec b
	jr nz, .skipName
.copyName
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

GetMoveName::
	ld a, MOVE_NAME
	ld [wNameListType], a
	ld a, BANK(MoveNames)
	ld [wPredefBank], a
	jr GetName

GetItemName:: ; marcelnote - now handles TM/HM directly
; given an item ID at [wNamedObjectIndex], store the item's name in wNameBuffer
; and make de point to wNameBuffer
	ld a, [wNamedObjectIndex]
	cp HM01 ; TM/HM?
	jr nc, .getMachineName
	ld a, ITEM_NAME
	ld [wNameListType], a
	ld a, BANK(ItemNames)
	ld [wPredefBank], a
	jr GetName

.getMachineName
; Copy the name of the TM/HM to wNameBuffer.
	push hl
	push bc
	sub TM01 ; is this a TM? [not HM]
	ld hl, TechnicalPrefix ; points to "TM"
	jr nc, .writeMachinePrefix
; if HM, then write "HM" and add NUM_HMS to the item ID,
; so we can reuse the TM printing code
	add NUM_HMS
	ld hl, HiddenPrefix ; points to "HM"
.writeMachinePrefix
	inc a   ; convert item ID to machine number
	ld b, a ; save machine number
	ld de, wNameBuffer
REPT 2      ; copy "TM" or "HM"
	ld a, [hli]
	ld [de], a
	inc de
ENDR
	ld a, b ; restore machine number

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

GetMonName::
	push hl
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(MonsterNames)
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ld a, [wNamedObjectIndex]
	dec a
	ld hl, MonsterNames
	ld bc, NAME_LENGTH - 1
	call AddNTimes ; preserves bc
	ld de, wNameBuffer
	push de
	call CopyData
	ld a, '@'
	ld [de], a
	pop de
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	pop hl
	ret

NamePointers::
; entries correspond to *_NAME constants
	dw MoveNames
	dw ItemNames
	dw TrainerNames
;	dw MonsterNames ; marcelnote - now handled directly by GetMonName
;	dw wPartyMonOT ; player's OT names list ; unused
;	dw wEnemyMonOT ; enemy's OT names list  ; unused

IF DEF(_FRA)
	INCLUDE "translation/fra/data/text/tm_hm_prefix.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/data/text/tm_hm_prefix.esp.asm"
ELSE
	INCLUDE "data/text/tm_hm_prefix.asm"
ENDC
