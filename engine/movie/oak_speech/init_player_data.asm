InitPlayerData:
InitPlayerData2:

	call Random
	ldh a, [hRandomSub]
	ld [wPlayerID], a

	call Random
	ldh a, [hRandomAdd]
	ld [wPlayerID + 1], a

	;ld a, $ff
	;ld [wUnusedPlayerDataByte], a ; marcelnote - removed wUnusedPlayerDataByte

	ld hl, wPartyCount
	call InitializeEmptyList
	ld hl, wBoxCount
	call InitializeEmptyBox
	ld hl, wNumBagItems
	call InitializeEmptyList
	ld hl, wNumBagKeyItems    ; marcelnote - new for Key Items pocket
	call InitializeEmptyList
	ld hl, wNumBoxItems
	call InitializeEmptyList

DEF START_MONEY EQU $3000
	ld hl, wPlayerMoney + 1
	ld a, HIGH(START_MONEY)
	ld [hld], a
	xor a ; LOW(START_MONEY)
	ld [hli], a
	inc hl
	ld [hl], a

	ld [wMonDataLocation], a
	ld [wObtainedBadges], a
	ld [wMtMoonSquareClefairyCounter], a ; marcelnote - Mt Moon Square Clefairy spawn

	ld hl, wPlayerCoins
	ld [hli], a
	ld [hl], a

	ld hl, wGameProgressFlags
	ld bc, wGameProgressFlagsEnd - wGameProgressFlags
	call FillMemory ; clear all game progress flags

	jp InitializeToggleableObjectsFlags

InitializeEmptyList:
	xor a ; count
	ld [hli], a
	dec a ; terminator
	ld [hl], a
	ret

InitializeEmptyBox: ; marcelnote - revamped Bill's PC
	xor a ; count, and empty species slot value
	ld [hli], a
	ld b, MONS_PER_BOX
.clearSpecies
	ld [hli], a
	dec b
	jr nz, .clearSpecies
	dec a ; terminator
	ld [hl], a
	ret
