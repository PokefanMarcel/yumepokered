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

; marcelnote - new from pokeyellow
CopyVideoDataAlternate::
	ldh a, [rLCDC]
	bit 7, a ; LCD enabled?
	jp nz, CopyVideoData ; if yes, then copy video data
	push hl
	ld h, d
	ld l, e
	pop de
	ld a, b ; save bank
	push af
	swap c
	ld a, $f
	and c
	ld b, a
	ld a, $f0
	and c
	ld c, a
	pop af
	jp FarCopyData
