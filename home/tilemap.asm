FillMemory:: ; marcelnote - optimized by Engezerstorung
; Fill bc bytes at hl with a.
; No bc = 0 guard.
	dec bc
	inc c
	inc b
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	ret   ; returns b = c = 0

UncompressSpriteFromDE::
; Decompress pic at a:de.
	ld hl, wSpriteInputPtr
	ld [hl], e
	inc hl
	ld [hl], d
	jp UncompressSpriteData

SaveScreenTilesToBuffer2::
	hlcoord 0, 0
	ld de, wTileMapBackup2
	ld bc, SCREEN_AREA
	jp CopyData

LoadScreenTilesFromBuffer2::
	call LoadScreenTilesFromBuffer2DisableBGTransfer
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret

; loads screen tiles stored in wTileMapBackup2 but leaves hAutoBGTransferEnabled disabled
LoadScreenTilesFromBuffer2DisableBGTransfer::
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld hl, wTileMapBackup2
	decoord 0, 0
	ld bc, SCREEN_AREA
	jp CopyData

SaveScreenTilesToBuffer1::
	hlcoord 0, 0
	ld de, wTileMapBackup
	ld bc, SCREEN_AREA
	jp CopyData

LoadScreenTilesFromBuffer1::
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld hl, wTileMapBackup
	decoord 0, 0
	ld bc, SCREEN_AREA
	call CopyData
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret

SaveTextBoxTilesToBuffer::
	hlcoord 1, 14
	ld de, wTextBoxBuffer
	ld bc, 18
	call CopyData
	hlcoord 1, 16
	ld bc, 18
	jp CopyData
