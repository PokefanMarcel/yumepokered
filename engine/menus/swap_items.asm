HandleItemListSwapping:: ; marcelnote - optimized
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jr nz, .exit ; only rearrange item list menus

; Compute address of current selected item.
	ld hl, wListPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl  ; hl = beginning of list entries
	ld d, h
	ld e, l ; de = beginning of list entries
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wListScrollOffset]
	add b
	ld b, a
	inc b ; b = currently selected item index (counts from 1)
	add a  ; each item entry is two bytes
	add l
	ld l, a
	adc h
	sub l
	ld h, a ; hl = address of current selected item

; Guard against swapping the Cancel button.
	ld a, [hl]
	inc a
	jr z, .exit ; ignore attempts to swap the Cancel menu item

; Check if first or second selected item.
	ld a, [wMenuItemToSwap] ; ID of item chosen for swapping (counts from 1)
	and a ; has the first item to swap already been chosen?
	jr nz, .swapItems
	; if not, set the current selected item as the first item to swap
	ld a, b
	ld [wMenuItemToSwap], a
	ld c, 20
	call DelayFrames
.exit
	jp DisplayListMenuIDLoop

.swapItems
	cp b ; is the currently selected item the same as the first item to swap?
	jr z, .exit ; ignore attempts to swap an item with itself
	ld c, 20
	call DelayFrames

; Compute address of first selected item.
	ld a, [wMenuItemToSwap] ; ID of item chosen for swapping (counts from 1)
	dec a
	add a
	add e
	ld e, a
	adc d
	sub e
	ld d, a ; de = address of first item to swap

; Swap items.
	ld a, [de]
	ld b, a     ; b = first item ID
	ld a, [hli] ; a = second item ID
	cp b
	jr z, .swapSameItemType
; swap different items
	ld [de], a  ; replace first item ID
	inc de
	ld a, [de]  ; a = first item quantity
	ld c, [hl]  ; c = second item quantity
	ld [hld], a ; replace second item quantity
	ld [hl], b  ; replace second item ID
	ld a, c
	ld [de], a  ; replace first item quantity
	jr .done
.swapSameItemType
	inc de
	ld b, [hl] ; second item quantity
	ld a, [de] ; first item quantity
	add b ; a = sum of both item quantities
	cp 100 ; is the sum too big for one item slot?
	jr c, .combineItemSlots
; swap enough items from the first slot to max out the second slot if they can't be combined
	ld b, 99
	sub b
	ld [de], a
	ld [hl], b
	jr .done
.combineItemSlots
	ld [hl], a ; put the sum in the second item slot
	ld hl, wListPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	dec [hl] ; decrease the number of items
	ld a, [hl]
	ld [wListCount], a ; update number of items variable
	cp 1
	jr nz, .skipSettingMaxMenuItemID
	ld [wMaxMenuItem], a ; if the number of items is only one now, update the max menu item ID
.skipSettingMaxMenuItemID
	ld h, d
	ld l, e
	dec de ; de = address of first item
	inc hl ; hl = address of item after first item
.moveItemsUpLoop ; erase the first item slot and move up all the following item slots to fill the gap
	ld a, [hli]
	ld [de], a
	inc de
	inc a ; reached the $ff terminator?
	jr z, .afterMovingItemsUp
	ld a, [hli]
	ld [de], a
	inc de
	jr .moveItemsUpLoop
.afterMovingItemsUp
	xor a
	ld [wListScrollOffset], a
	ld [wCurrentMenuItem], a
.done
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	jr .exit


HandleItemListSorting:: ; marcelnote - new to autosort items
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jr nz, .exit ; only sort item list menus

; Sort only main bag items, key items, or the player's PC item box.
	ASSERT LOW(wNumBagItems) != LOW(wNumBagKeyItems)
	ASSERT LOW(wNumBagItems) != LOW(wNumBoxItems)
	ASSERT LOW(wNumBagKeyItems) != LOW(wNumBoxItems)
	ASSERT HIGH(wNumBagItems) == HIGH(wNumBagKeyItems)
	ASSERT HIGH(wNumBagItems) == HIGH(wNumBoxItems)
	ld hl, wListPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	cp LOW(wNumBagItems)
	jr z, .checkHighByte
	cp LOW(wNumBagKeyItems)
	jr z, .checkHighByte
	cp LOW(wNumBoxItems)
	jr nz, .exit
.checkHighByte
	ld a, h
	cp HIGH(wNumBagItems)
	jr nz, .exit

; Sort list.
.sortList
	ld a, [hli] ; number of items in bag
	cp 2
	jr c, .exit ; nothing to sort if there are fewer than 2 entries

; Gnome sort over adjacent item/quantity pairs:
; When the current item belongs after the previous item, step forward.
; When the current item belongs before the previous item, swap the pair and step back.
	ld d, h
	ld e, l ; de = pointer to previous item
	inc hl
	inc hl  ; hl = pointer to current item
.clampAndLoop
	ld b, 1 ; b = current item index, start at the second item, comparing it with the first
.loop
	ld a, [hl]
	cp $ff
	jr z, .done
	ld c, a    ; c = current item ID
	ld a, [de] ; a = previous item ID
	call ItemSortsBefore ; does the current item sort before the previous item?
	jr c, .swapItems
	; pair is already in order, so step forward
	inc b
	ld d, h
	ld e, l
	inc hl
	inc hl
	jr .loop

; Swap the two-byte item/quantity pair.
.swapItems ; c = ID of current item
	ld a, [de]
	ld [hli], a
	ld a, c
	ld [de], a
	inc de
	ld c, [hl] ; c = quantity of current item
	ld a, [de]
	ld [hld], a
	ld a, c
	ld [de], a
	dec de
	dec b
	jr z, .clampAndLoop ; if swap happened against the first item, stay at the second item
	; otherwise step back
	ld h, d
	ld l, e
	dec de
	dec de
	jr .loop

.done
	xor a
	ld [wMenuItemToSwap], a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	ld [wBagSavedMenuItem], a
.exit
	jp DisplayListMenuIDLoop


ItemSortsBefore:
; Return carry if item c has a lower autosort rank than item a.
	push hl
	push bc
	call .getItemSortRank
	ld b, a ; b = rank of previous item
	ld a, c
	call .getItemSortRank ; a = rank of current item
	cp b
	pop bc
	pop hl
	ret

.getItemSortRank
; Return an item's autosort rank in a.
	ld hl, ItemSortRanks
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	ret

INCLUDE "data/items/item_sort_order.asm"
