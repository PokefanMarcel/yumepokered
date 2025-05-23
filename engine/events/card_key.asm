PrintCardKeyText:
	ld hl, SilphCoMapList
	ld a, [wCurMap]
	ld b, a
.silphCoMapListLoop
	ld a, [hli]
	cp -1
	;ret z
	jp z, PrintLiveWaterText ; marcelnote - new for Power Plant
	cp b
	jr nz, .silphCoMapListLoop
	predef GetTileAndCoordsInFrontOfPlayer
	ld a, [wTileInFrontOfPlayer]
	cp $18
	jr z, .cardKeyDoorInFrontOfPlayer
	cp $24
	jr z, .cardKeyDoorInFrontOfPlayer
	ld b, a
	ld a, [wCurMap]
	cp SILPH_CO_11F
	ret nz
	ld a, b
	cp $5e
	ret nz
.cardKeyDoorInFrontOfPlayer
	ld b, CARD_KEY
	call IsItemInBag
	jr z, .noCardKey
	;;;;;;;; marcelnote - added for SilphFactory2F
	ld a, [wCurMap]
	cp SILPH_FACTORY_2F
	jr nz, .notSilphFactory
	CheckEvent EVENT_SILPH_FACTORY_2F_CARD_KEY_UPDATED
	jr z, .cardKeyNeedsUpdate
.notSilphFactory
	;;;;;;;;
	call GetCoordsInFrontOfPlayer
	push de
	tx_pre_id CardKeySuccessText
	ldh [hTextID], a
	call PrintPredefTextID
	pop de
	srl d
	ld a, d
	ld b, a
	ld [wCardKeyDoorY], a
	srl e
	ld a, e
	ld c, a
	ld [wCardKeyDoorX], a
	ld a, [wCurMap]
	cp SILPH_CO_11F
	ld a, $e
	jr nz, .replaceCardKeyDoorTileBlock
	ld a, $3 ; Silph Co 11F uses different tileset
.replaceCardKeyDoorTileBlock
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	ld a, SFX_GO_INSIDE
	jp PlaySound
.noCardKey
	tx_pre_id CardKeyFailText
	ldh [hTextID], a
	jp PrintPredefTextID
.cardKeyNeedsUpdate ; marcelnote - added for SilphFactory2F
	tx_pre_id CardKeyNeedsUpdateText
	ldh [hTextID], a
	jp PrintPredefTextID

INCLUDE "data/events/card_key_maps.asm"

CardKeySuccessText::
	text_far _CardKeySuccessText1
	sound_get_item_1
	text_far _CardKeySuccessText2
	text_end

CardKeyFailText::
	text_far _CardKeyFailText
	text_end

CardKeyNeedsUpdateText::
	text_far _CardKeyNeedsUpdateText
	text_end


PrintLiveWaterText: ; marcelnote - new for Power Plant
	ld a, [wCurMapTileset]
	cp PLANT
	ret nz
	predef GetTileAndCoordsInFrontOfPlayer
	ld a, [wTileInFrontOfPlayer]
	cp $04
	ret nz
	tx_pre_id LiveWaterText
	ldh [hTextID], a
	jp PrintPredefTextID

LiveWaterText:: ; marcelnote - for new Power Plant
	text_far _PowerPlantLiveWaterText
	text_end


; d = Y
; e = X
GetCoordsInFrontOfPlayer:
	ld a, [wYCoord]
	ld d, a
	ld a, [wXCoord]
	ld e, a
	ld a, [wSpritePlayerStateData1FacingDirection]
	and a
	jr nz, .notFacingDown
; facing down
	inc d
	ret
.notFacingDown
	cp SPRITE_FACING_UP
	jr nz, .notFacingUp
; facing up
	dec d
	ret
.notFacingUp
	cp SPRITE_FACING_LEFT
	jr nz, .notFacingLeft
; facing left
	dec e
	ret
.notFacingLeft
; facing right
	inc e
	ret
