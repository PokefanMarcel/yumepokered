GetItemPrice:: ; marcelnote - optimized
; Stores item's price as BCD at hItemPrice (3 bytes)
; Input: [wCurItem] = item id
; For regular items, reads the 3-byte BCD entry from the item price table.
; For TMs/HMs, calls GetMachinePrice, since their prices are stored separately.
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(ItemPrices)
	; wItemPrices is a RAM pointer to the active 3-byte price table,
	; normally ItemPrices. Switch to its bank before dereferencing it.
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ld hl, wItemPrices
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCurItem]
	cp HM01
	jr nc, .getTMPrice
	; Item IDs are 1-based and each price entry is 3 bytes, so the last
	; byte of the entry is at ItemPrices + item_id * 3 - 1.
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc
	add hl, bc
	dec hl
	ld a, [hld]
	ldh [hItemPrice + 2], a
	ld a, [hld]
	ldh [hItemPrice + 1], a
	ld a, [hl]
	ldh [hItemPrice], a
	jr .done
.getTMPrice
	; GetMachinePrice writes the 3-byte BCD price to hItemPrice.
	ld a, BANK(GetMachinePrice)
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	call GetMachinePrice
.done
	; Return de pointing to the BCD price for PrintBCDNumber/AddBCD callers.
	ld de, hItemPrice
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret
