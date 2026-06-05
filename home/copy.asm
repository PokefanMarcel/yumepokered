FarCopyData::
; Copy bc bytes from a:hl to de.
	ld [wBuffer], a
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wBuffer]
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	call CopyData
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret

CopyData:: ; marcelnote - Engezerstorung optim
; Copy bc bytes from hl to de.
; No bc = 0 guard.
	dec bc
	inc c
	inc b
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	ret

CopyDataDEtoHL:: ; marcelnote - new
; Copy bc bytes from de to hl.
; No bc = 0 guard.
	dec bc
	inc c
	inc b
.loop
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	ret

CopyVideoDataAlternate:: ; marcelnote - optimized from pokeyellow but currently unused
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a ; LCD enabled?
	jp nz, CopyVideoData ; if yes, copy c tiles from b:de to hl
	push hl
	ld h, d
	ld l, e
	ld d, b ; save bank
	; multiply c by 16
	swap c
	ld a, c
	and $0f
	ld b, a
	xor c
	ld c, a ; bc = c * 16 (TILE_SIZE)
	ld a, d
	pop de
	jr FarCopyData ; copy bc bytes from a:hl to de
