GetQuantityOfItemInBag:
; In: b = item ID
; Out: b = how many of that item are in the bag
	call GetPredefRegisters
	ld hl, wNumBagItems
	;;;;;;;;;; marcelnote - new for bag pockets
	ld a, [wCurItem]
	ld c, a ; store current content of [wCurItem] in c
	ld a, b
	ld [wCurItem], a
	call IsKeyItem
	ld a, c
	ld [wCurItem], a ; restore [wCurItem], else issues with wild Silph Scope encounters
	ld a, [wIsKeyItem]
	and a
	jr z, .loop
	ld hl, wNumBagKeyItems
	;;;;;;;;;;
.loop
	inc hl
	ld a, [hli]
	cp $ff
	jr z, .notInBag
	cp b
	jr nz, .loop
	ld a, [hl]
	ld b, a
	ret
.notInBag
	ld b, 0
	ret

; marcelnote - copied from PureRGB, for Repel reuse prompt
; PureRGBnote: ADDED: function for determining what index an item is in the player's bag.
GetIndexOfItemInBag:
; In: b = item ID
; Out: b = index of item in bag (FF if not)
	call GetPredefRegisters
	ld hl, wBagItems - 1
	;;;;;;;;;; marcelnote - new for bag pockets
	ld a, b
	ld [wCurItem], a
	call IsKeyItem
	ld a, [wIsKeyItem]
	and a
	jr z, .loop
	ld hl, wBagKeyItems - 1
	;;;;;;;;;;
	ld c, -1
.loop
	inc c
	inc hl
	ld a, [hli]
	cp $ff
	jr z, .notInBag
	cp b
	jr nz, .loop
	ld b, c
	ret
.notInBag
	ld b, a
	ret
