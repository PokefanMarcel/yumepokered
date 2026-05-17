PrepareForSpecialWarp::
	call LoadSpecialWarpData
	predef LoadTilesetHeader
	ld hl, wStatusFlags6
	bit BIT_SPECIAL_WARP, [hl]
	jr z, .debugNewGameWarp
	res BIT_SPECIAL_WARP, [hl]
	ld a, [wDestinationMap]
	jr .next
.debugNewGameWarp
	bit BIT_DEBUG_MODE, [hl]
	jr z, .setNewGameMatWarp ; apply to StartNewGameDebug only
	call PrepareNewGameDebug
.setNewGameMatWarp
	; This is called by OakSpeech during StartNewGame and
	; loads the first warp event for the specified map index.
	ld a, PALLET_TOWN
.next
;	ld b, a ; marcelnote - this wrote wStatusFlags3 to wLastMap when any bit was set
;	ld a, [wStatusFlags3]
;	and a
;	jr nz, .next2
;	ld a, b
;.next2
	ld hl, wStatusFlags6
	bit BIT_DUNGEON_WARP, [hl]
	ret nz
	ld [wLastMap], a
	ret

LoadSpecialWarpData: ; marcelnote - modified for new special warp engine
	ld a, [wCableClubDestinationMap]
	cp TRADE_CENTER
	jr nz, .notTradeCenter
	ld hl, TradeCenterPlayerWarp
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr z, .copyWarpData
	ld hl, TradeCenterFriendWarp
	jr .copyWarpData
.notTradeCenter
	cp COLOSSEUM
	jr nz, .notColosseum
	ld hl, ColosseumPlayerWarp
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr z, .copyWarpData
	ld hl, ColosseumFriendWarp
	jr .copyWarpData
.notColosseum
	ld a, [wStatusFlags6]
	bit BIT_DEBUG_MODE, a
	; warp to wLastMap (PALLET_TOWN) for StartNewGameDebug
	jr nz, .notNewGameWarp
	bit BIT_SPECIAL_WARP, a
	jr nz, .notNewGameWarp
	ld hl, NewGameWarp
.copyWarpData
	ld de, wCurMap
	ld c, $7
.copyWarpDataLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyWarpDataLoop
	ld a, [hli]
	ld [wCurMapTileset], a
	xor a
	jr .done
.notNewGameWarp
	ld hl, wStatusFlags6
	bit BIT_DUNGEON_WARP, [hl]
	jr nz, .usedDungeonWarp
	bit BIT_ESCAPE_WARP, [hl]
	res BIT_ESCAPE_WARP, [hl]
	jr z, .otherDestination
	ld a, [wLastBlackoutMap]
	jr .usedFlyWarp
.usedDungeonWarp
	ld hl, DungeonWarpData
	ld bc, 7
	ld a, [wDungeonWarpID]
	call AddNTimes
	jr .copyWarpData2
.otherDestination
	ld a, [wDestinationMap]
.usedFlyWarp
	ld b, a
	ld hl, TravelWarpData
	ld de, 7
.travelWarpDataLoop
	ld a, [hl]
	cp b
	jr z, .copyWarpData2
	add hl, de
	jr .travelWarpDataLoop
.copyWarpData2
	ld de, wCurMap
	ld c, $7
.copyWarpDataLoop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyWarpDataLoop2
	xor a ; OVERWORLD
	ld [wCurMapTileset], a
.done
	ld [wYOffsetSinceLastSpecialWarp], a
	ld [wXOffsetSinceLastSpecialWarp], a
	ld a, -1 ; exclude normal warps
	ld [wDestinationWarpID], a
	ret

INCLUDE "data/maps/special_warps.asm"
