; marcelnote - this function was bugged as it loaded from [hCurrentSpriteOffset], which was always sprite 15 ($f0)
;              modified it to affect correct sprite
UpdateSpriteFacingOffsetAndDelayMovement::
	ld h, HIGH(wSpriteStateData2)
	ldh a, [hSpriteIndex]
	swap a
	add SPRITESTATEDATA2_MOVEMENTDELAY
	ld l, a
	ld a, $7f ; maximum movement delay
	ld [hli], a ; x#SPRITESTATEDATA2_MOVEMENTDELAY
    ASSERT SPRITESTATEDATA1_FACINGDIRECTION == SPRITESTATEDATA2_MOVEMENTDELAY + 1

	dec h ; HIGH(wSpriteStateData1)
	ld a, [hld] ; x#SPRITESTATEDATA1_FACINGDIRECTION
	ld b, a
	xor a
	ld [hld], a ; x#SPRITESTATEDATA1_ANIMFRAMECOUNTER
	ld [hl], a  ; x#SPRITESTATEDATA1_INTRAANIMFRAMECOUNTER
	ld a, l
	sub SPRITESTATEDATA1_INTRAANIMFRAMECOUNTER - SPRITESTATEDATA1_IMAGEINDEX
	ASSERT SPRITESTATEDATA1_INTRAANIMFRAMECOUNTER > SPRITESTATEDATA1_IMAGEINDEX
	ld l, a
	ld a, [hl] ; x#SPRITESTATEDATA1_IMAGEINDEX
	or b ; or in the facing direction
	ld [hld], a ; x#SPRITESTATEDATA1_IMAGEINDEX
	ld [hl], $2 ; x#SPRITESTATEDATA1_MOVEMENTSTATUS, $2 = delayed movement status
	ret
