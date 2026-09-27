; marcelnote - adapted code from shinpokered for rendering EXP bar in battle.
; EXP bar is 8 tiles (64 pixels) filled from right to left.

; Start the next level with an empty bar, including the saved screen copy.
ResetEXPBar:
	call IsCurrentMonBattleMon
	ret nz
	xor a
	ld [wEXPBarKeepFullFlag], a
	ld [wEXPBarPixelLength], a
	hlcoord 10, 11
	ld bc, 8
	ld a, '<HUD_HORIZ_BAR>'
	call FillMemory
	jp SaveEXPBarToBuffer


; Animate the active mon toward its EXP total at its current battle level.
; CalcEXPBarPixelLength caps crossed thresholds at 64 pixels.
; EXP only increases here; ResetEXPBar resets the length between levels.
AnimateEXPBar:
	call IsCurrentMonBattleMon
	ret nz
	call CalcEXPBarPixelLength
	ld hl, wEXPBarPixelLength
	ld a, [hl]
	ld d, a                ; d = previous pixel length
	and 7
	ld b, a                ; b = pixels in the current partial tile
	ldh a, [hQuotient + 3] ; a = target pixel length (0..64)
	ld [hl], a
	sub d                  ; a = target length - previous length
	jr z, .done
	ld c, a                ; c = number of pixels to draw

	ldh a, [hAutoBGTransferEnabled]
	push af
	ld a, $ff
	ldh [hAutoBGTransferEnabled], a

	hlcoord 17, 11
	srl d
	srl d
	srl d                  ; d = number of tiles already filled
	jr z, .animatePixel
.skipFullTiles
	dec hl
	dec d
	jr nz, .skipFullTiles
.animatePixel
	ld a, TRANSFERMIDDLE
	ldh [hAutoBGTransferPortion], a
	inc b                  ; draw the next pixel
	ld a, b
	and 7                  ; wrap the partial pixel count to 0 when the tile fills
	jr nz, .loadPartial
	ld b, a                ; a = 0 so next tile starts empty
	ld a, '<EXP_BAR_FULL>'
	ld [hld], a            ; fill this tile and continue in the next one
	call DelayFrame
	jr .nextPixel
.loadPartial
	ld [hl], '<EXP_BAR_PARTIAL>'
	push hl ; save hl = current tile address
	push bc ; save b = partial pixel count, c = pixels left
	call LoadExpBarDynamicTile ; a = 1..7; waits one frame via CopyVideoData
	pop bc  ; restore b = partial pixel count, c = pixels left
	pop hl  ; restore hl = current tile address
.nextPixel
	call DelayFrame        ; second frame for both full and partial pixels
	dec c
	jr nz, .animatePixel
	pop af
	ldh [hAutoBGTransferEnabled], a
.done
	call SaveEXPBarToBuffer ; also save zero progress and level-100 bars
	ld c, 5
	jp DelayFrames


SaveEXPBarToBuffer:
	hlcoord 10, 11
	ld de, wTileMapBackup + 10 + 11 * SCREEN_WIDTH
	ld bc, 8
	jp CopyData


IsCurrentMonBattleMon:
	ld a, [wPlayerMonNumber]
	ld b, a
	ld a, [wWhichPokemon]
	cp b
	ret


PrintEXPBar:
	call CalcAndLoadExpBarDynamicTile

	ldh a, [hQuotient + 3] ; pixel length
	ld [wEXPBarPixelLength], a
	lb bc, $8, $8 ; b = number of tiles, c = subtraction constant
	hlcoord 17, 11
.loopFullTiles
	sub c
	jr c, .partialTile ; length left < 8 pixels ?
	; place full Exp bar tile
	ld [hl], '<EXP_BAR_FULL>'
	dec hl
	dec b
	jr nz, .loopFullTiles
	ret

.partialTile
	ld a, '<EXP_BAR_PARTIAL>' ; partial Exp bar tile
	ld [hld], a
	dec b
	ret z
	ld a, '<HUD_HORIZ_BAR>'   ; empty Exp bar tile
.loopEmptyTiles
	ld [hld], a
	dec b
	jr nz, .loopEmptyTiles
	ret


; Return the pixel length in hQuotient + 3.
; EXP may already include several levels; compare the full 24-bit values before calculating a partial fill.
CalcEXPBarPixelLength:
	ld a, [wEXPBarKeepFullFlag]
	and a
	jp nz, .full ; held until ResetEXPBar finishes the current level-up sequence
	ld a, [wBattleMonLevel]
	cp MAX_LEVEL
	jp nc, .empty ; there is no next-level interval at level 100

	; Always use the actual party species, including when transformed.
	ld hl, wPartyMon1Species
	call BattleMonPartyAttr
	ld a, [hl]
	ld [wCurSpecies], a
	call GetMonHeader
	ld a, [wBattleMonLevel]
	ld d, a
	callfar CalcExperience ; EXP at current level
	ld hl, wEXPBarBaseEXP
	ldh a, [hExperience]
	ld [hli], a
	ldh a, [hExperience + 1]
	ld [hli], a
	ldh a, [hExperience + 2]
	ld [hl], a             ; preserve d = current level

	inc d
	callfar CalcExperience ; EXP for next level

	; Progress = current EXP - current level's base EXP.
	ld hl, wPartyMon1Exp + 2
	call BattleMonPartyAttr
	ld b, h
	ld c, l
	ld hl, wEXPBarBaseEXP + 2
	ld de, wEXPBarCurEXP + 2
	call SubThreeByteNum

	; Interval = next level's base EXP - current level's base EXP.
	ld bc, hExperience + 2
	ld hl, wEXPBarBaseEXP + 2
	ld de, wEXPBarNeededEXP + 2
	call SubThreeByteNum
	call .subtractInterval
	jr nc, .full

	; Convert progress through this level into pixels of the 64-pixel bar.
	; Six steps of binary division give the exact pixel count, rounded down.
	lb bc, 6, 0
.pixelBitLoop
	ld hl, wEXPBarCurEXP + 2
	sla [hl]
	dec hl
	rl [hl]
	dec hl
	rl [hl]
	call .subtractInterval
	jr c, .nextBit
	ld hl, wEXPBarCurEXP
	ld [hli], a
	ld a, d
	ld [hli], a
	ld [hl], e
.nextBit
	ccf                    ; quotient bit = 1 if the subtraction succeeded
	rl c
	dec b
	jr nz, .pixelBitLoop
	ld a, c
	jr .storeLength
.full
	ld a, 64
	jr .storeLength
.empty
	xor a
.storeLength
	ldh [hQuotient + 3], a
	ret

; Return progress - interval in ade, with carry set if progress < interval.
; Preserve bc for the fraction loop; commit the remainder only on success.
.subtractInterval
	ld hl, wEXPBarNeededEXP + 2
	ld a, [wEXPBarCurEXP + 2]
	sub [hl]
	ld e, a
	dec hl
	ld a, [wEXPBarCurEXP + 1]
	sbc [hl]
	ld d, a
	dec hl
	ld a, [wEXPBarCurEXP]
	sbc [hl]
	ret

; subtracts three-byte big-endian numbers: [bc] - [hl] -> [de]
; bc, hl, and de point to the low bytes
; assumes [bc] >= [hl]; equality gives zero
SubThreeByteNum:
	and a ; start at the low bytes with no borrow
	call .subByte
	call .subByte
.subByte
	ld a, [bc]
	sbc [hl]
	ld [de], a
	dec bc ; preserves carry
	dec hl
	dec de
	ret

; return the address of the BattleMon's party struct attribute in hl
BattleMonPartyAttr:
	ld a, [wPlayerMonNumber]
	ld bc, wPartyMon2 - wPartyMon1
	jp AddNTimes


CalcAndLoadExpBarDynamicTile: ; needed for jpfar
	call CalcEXPBarPixelLength
	ldh a, [hQuotient + 3]    ; pixel length
	; fallthrough

LoadExpBarDynamicTile:
	and $7 ; a mod 8
	swap a ; a * 16
	ld b, 0
	ld c, a
	ld hl, EXPBarGraphics
	add hl, bc
	ld d, h
	ld e, l
	ld hl, vChars2 tile '<EXP_BAR_PARTIAL>'
	lb bc, BANK(EXPBarGraphics), 1 ; 1 tile
	jp CopyVideoData


EXPBarGraphics::  INCBIN "gfx/battle/exp_bar.2bpp"
EXPBarGraphicsEnd::
