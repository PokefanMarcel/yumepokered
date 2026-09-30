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

GetItemName::
; given an item ID at [wNamedObjectIndex], store the item's name in wNameBuffer
; and make de point to wNameBuffer
; marcelnote - now handles TM/HM directly
	ld a, [wNamedObjectIndex]
	cp HM01 ; TM/HM?
	jp nc, GetMachineName
	ld [wNameListIndex], a
	ld a, ITEM_NAME
	ld [wNameListType], a
	ld a, BANK(ItemNames)
	ld [wPredefBank], a
	jp GetName

; sets carry if item is HM, clears carry if item is not HM
; Input: a = item ID
IsItemHM::
	cp HM01
	jr c, .notHM
	cp TM01
	ret
.notHM
	and a
	ret

GetMoveName::
	ld a, [wNamedObjectIndex]
	ld [wNameListIndex], a
	ld a, MOVE_NAME
	ld [wNameListType], a
	ld a, BANK(MoveNames)
	ld [wPredefBank], a
	jp GetName
