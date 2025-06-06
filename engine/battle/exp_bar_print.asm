; shinpokerednote: ADDED: code for rendering EXP bar in battle.

AnimateEXPBarAgain:
	call LoadMonData
	call IsCurrentMonBattleMon
	ret nz
	xor a
	ld [wEXPBarPixelLength], a
	hlcoord 17, 11
	ld a, "<HUD_HORIZ_BAR>"   ; empty Exp bar tile
	ld c, $8
.loop
	ld [hld], a
	dec c
	jr nz, .loop
	; fallthrough
AnimateEXPBar:
	call LoadMonData
	call IsCurrentMonBattleMon
	ret nz
	ld a, [wBattleMonLevel]
	cp MAX_LEVEL
	ret nc
	call CalcEXPBarPixelLength
	ld hl, wEXPBarPixelLength
	ld a, [hl]
	ld c, a                ; c = previous pixel length
	and $7
	ld d, a                ; d = current partial exp tile
	ldh a, [hQuotient + 3] ; a = new pixel length
	ld [hl], a
	sub c
	jr z, .delay
	ld c, a  ; c = number of pixels to draw
	ld b, $8 ; b = max number of tiles to place

	ldh a, [hAutoBGTransferEnabled]
	push af
	ld a, $ff
	ldh [hAutoBGTransferEnabled], a

	hlcoord 17, 11
	ld e, "<EXP_BAR_FULL>"
.skipFullTiles
	ld a, [hl]
	sub e ; is it a full tile?
	jr nz, .animateTile
	dec hl
	dec b
	jr nz, .skipFullTiles
	jr .done

.animateTile
	ld a, TRANSFERMIDDLE
	ldh [hAutoBGTransferPortion], a
.loopAnimate
	inc d   ; we'll load the next tile
	ld a, d
	cp $8
	jr nz, .loadPartial
	ld [hl], e ; "<EXP_BAR_FULL>"
	ld d, 0
	call DelayFrame
	call DelayFrame
	jr .dontLoad
.loadPartial
	ld [hl], "<EXP_BAR_PARTIAL>"
	push hl ; save hl = current tile
	push bc ; save b = number of tiles left, c = pixels left
	push de ; save d = current tile, e = "<EXP_BAR_FULL>"
	ld a, d
	call LoadExpBarDynamicTile ; contains a DelayFrame via CopyVideoData
	call DelayFrame
	pop de  ; restore d = current tile, e = "<EXP_BAR_FULL>"
	pop bc  ; restore b = number of tiles left, c = pixels left
	pop hl  ; restore hl = current tile
.dontLoad
	dec c
	jr nz, .skipFullTiles
.done
	pop af
	ldh [hAutoBGTransferEnabled], a

	ld bc, $8
	hlcoord 10, 11
	ld de, wTileMapBackup + 10 + 11 * SCREEN_WIDTH
	call CopyData
.delay
	ld c, 5
	jp DelayFrames


KeepEXPBarFull:
	call IsCurrentMonBattleMon
	ret nz
	ld a, [wEXPBarKeepFullFlag]
	set 0, a
	ld [wEXPBarKeepFullFlag], a
	ret

IsCurrentMonBattleMon:
	ld a, [wPlayerMonNumber]
	ld b, a
	ld a, [wWhichPokemon]
	cp b
	ret


PrintEXPBar:
	call CalcEXPBarPixelLength
	ldh a, [hQuotient + 3]     ; pixel length
	call LoadExpBarDynamicTile ; load tile with a mod 8 pixels long

	ldh a, [hQuotient + 3] ; pixel length
	ld [wEXPBarPixelLength], a
	ld b, $8 ; number of tiles to place
	ld c, $8 ; constant for subtraction
	hlcoord 17, 11
.loopFullTiles
	sub c
	jr c, .partialTile ; length left < 8 pixels ?
	; place full Exp bar tile
	ld [hl], "<EXP_BAR_FULL>"
	dec hl
	dec b
	jr nz, .loopFullTiles
	ret

.partialTile
	ld a, "<EXP_BAR_PARTIAL>" ; partial Exp bar tile
	ld [hld], a
	dec b
	ret z
	ld a, "<HUD_HORIZ_BAR>"   ; empty Exp bar tile
.loopEmptyTiles
	ld [hld], a
	dec b
	jr nz, .loopEmptyTiles
	ret


CalcEXPBarPixelLength:
	ld hl, wEXPBarKeepFullFlag
	bit 0, [hl]
	jr z, .start
	res 0, [hl]
	ld a, $40
	ldh [hQuotient + 3], a
	ret

.start
	; get the base exp needed for the current level
	ld a, [wPlayerBattleStatus3]
	ld hl, wBattleMonSpecies
	bit 3, a
	jr z, .skip
	ld hl, wPartyMon1
	call BattleMonPartyAttr
.skip
	ld a, [hl]
	ld [wNameListIndex], a
	call GetMonHeader
	ld a, [wBattleMonLevel]
	ld d, a
	ld hl, CalcExperience
	ld b, BANK(CalcExperience)
	rst _Bankswitch
	ld hl, hMultiplicand
	ld de, wEXPBarBaseEXP
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

	; get the exp needed to gain a level
	ld a, [wBattleMonLevel]
	ld d, a
	inc d
	ld hl, CalcExperience
	ld b, BANK(CalcExperience)
	rst _Bankswitch

	; get the address of the active Pokemon's current experience
	ld hl, wPartyMon1Exp
	call BattleMonPartyAttr

	; current exp - base exp
	ld b, h
	ld c, l
	ld hl, wEXPBarBaseEXP
	ld de, wEXPBarCurEXP
	call SubThreeByteNum

	; exp needed - base exp
	ld bc, hMultiplicand
	ld hl, wEXPBarBaseEXP
	ld de, wEXPBarNeededEXP
	call SubThreeByteNum

	; make the divisor an 8-bit number
	ld hl, wEXPBarNeededEXP
	ld de, wEXPBarCurEXP + 1
	ld a, [hli]
	and a
	jr z, .twoBytes
	ld a, [hli]
	ld [hld], a
	dec hl
	ld a, [hli]
	ld [hld], a
	ld a, [de]
	inc de
	ld [de], a
	dec de
	dec de
	ld a, [de]
	inc de
	ld [de], a
	dec de
	xor a
	ld [hli], a
	ld [de], a
	inc de
.twoBytes
	ld a, [hl]
	and a
	jr z, .oneByte
	srl a
	ld [hli], a
	ld a, [hl]
	rra
	ld [hld], a
	ld a, [de]
	srl a
	ld [de], a
	inc de
	ld a, [de]
	rra
	ld [de], a
	dec de
	jr .twoBytes
.oneByte

	; current exp * (8 tiles * 8 pixels)
	ld hl, hMultiplicand
	ld de, wEXPBarCurEXP
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ld a, $40
	ldh [hMultiplier], a
	call Multiply

	; product / needed exp = pixel length
	ld a, [wEXPBarNeededEXP + 2]
	ldh [hDivisor], a
	call .noDivZero	;joenote - do not allow a divisor of 0
	jp Divide

.noDivZero
	ld a, [wEXPBarNeededEXP + 2]
	ld b, a
	ld a, [wEXPBarNeededEXP + 1]
	or b
	ld b, a
	ld a, [wEXPBarNeededEXP]
	or b
	ret nz
	inc a
	ldh [hDivisor], a
	ret

; calculates the three byte number starting at [bc]
; minus the three byte number starting at [hl]
; and stores it into the three bytes starting at [de]
; assumes that [hl] is smaller than [bc]
SubThreeByteNum:
	call .subByte
	call .subByte
.subByte
	ld a, [bc]
	inc bc
	sub [hl]
	inc hl
	ld [de], a
	jr nc, .noCarry
	dec de
	ld a, [de]
	dec a
	ld [de], a
	inc de
.noCarry
	inc de
	ret

; return the address of the BattleMon's party struct attribute in hl
BattleMonPartyAttr:
	ld a, [wPlayerMonNumber]
	ld bc, wPartyMon2 - wPartyMon1
	jp AddNTimes


LoadExpBarDynamicTile:
	and $7 ; a mod 8
	swap a ; a * 16
	ld b, 0
	ld c, a
	ld hl, EXPBarGraphics
	add hl, bc
	ld d, h
	ld e, l
	ld hl, vChars2 tile $75 ; "<EXP_BAR_PARTIAL>"
	lb bc, BANK(EXPBarGraphics), 1 ; 1 tile
	jp CopyVideoData


EXPBarGraphics::  INCBIN "gfx/battle/exp_bar.2bpp"
EXPBarGraphicsEnd::
