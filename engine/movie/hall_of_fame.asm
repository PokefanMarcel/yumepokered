AnimateHallOfFame:
	call HoFFadeOutScreenAndMusic
	call ClearScreen
	ld c, 100
	call DelayFrames
	call LoadFontTilePatterns
	call LoadTextBoxTilePatterns
	call DisableLCD
	ld hl, vBGMap0
	ld bc, 2 * TILEMAP_AREA
	ld a, ' '
	call FillMemory
	call EnableLCD
	ld hl, rLCDC
	set B_LCDC_BG_MAP, [hl]
	xor a
	ld hl, wHallOfFame
	ld bc, HOF_TEAM
	call FillMemory
	xor a
	ld [wUpdateSpritesEnabled], a
	ldh [hTileAnimations], a
	ld [wSpriteFlipped], a
	ld [wLetterPrintingDelayFlags], a ; no delay
	ld [wHoFMonOrPlayer], a ; mon
	inc a
	ldh [hAutoBGTransferEnabled], a
	ld hl, wNumHoFTeams
	ld a, [hl]
	inc a
	jr z, .skipInc ; don't wrap around to 0
	inc [hl]
.skipInc
	ld a, $90
	ldh [hWY], a
	ld c, 0 ; BANK(Music_HallOfFame)
	ld a, MUSIC_HALL_OF_FAME
	call PlayMusic
	ld hl, wPartySpecies
	ld c, $ff
.partyMonLoop
	ld a, [hli]
	cp $ff
	jr z, .doneShowingParty
	inc c
	push hl
	push bc
	ld [wHoFMonSpecies], a
	ld a, c
	ld [wHoFPartyMonIndex], a
	ld hl, wPartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	ld [wHoFMonLevel], a
	call HoFShowMonOrPlayer
	call HoFDisplayAndRecordMonInfo
	ld c, 80
	call DelayFrames
	hlcoord 2, 13
	lb bc, 3, 14
	call TextBoxBorder
	hlcoord 4, 15
	ld de, HallOfFameText
	call PlaceString
	ld c, 180
	call DelayFrames
	call GBFadeOutToWhite
	pop bc
	pop hl
	jr .partyMonLoop
.doneShowingParty
	ld a, c
	inc a
	ld hl, wHallOfFame
	ld bc, HOF_MON
	call AddNTimes
	ld [hl], $ff
	call SaveHallOfFameTeams
	xor a
	ld [wHoFMonSpecies], a
	inc a
	ld [wHoFMonOrPlayer], a ; player
	call HoFShowMonOrPlayer
	call HoFDisplayPlayerStats
	call HoFFadeOutScreenAndMusic
	xor a
	ldh [hWY], a
	ld hl, rLCDC
	res B_LCDC_BG_MAP, [hl]
	ret


HoFShowMonOrPlayer:
	call ClearScreen
	ld a, $d0
	ldh [hSCY], a
	ld a, $c0
	ldh [hSCX], a
	ld a, [wHoFMonSpecies]
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	ld [wBattleMonSpecies2], a
	ld [wWholeScreenPaletteMonSpecies], a
	ld a, [wHoFMonOrPlayer]
	and a
	jr z, .showMon
; show player
	call HoFLoadPlayerPics
	jr .next1
.showMon
	hlcoord 12, 5
	call GetMonHeader
	call LoadFrontSpriteByMonIndex
	predef LoadMonBackPic
.next1
	lb bc, SET_PAL_POKEMON_WHOLE_SCREEN, 0
	call RunPaletteCommand
	ld a, %11100100
	ldh [rBGP], a
	ld a, $31 ; back pic
	ldh [hStartTileID], a
	hlcoord 12, 5
	predef CopySpriteToTilemap ; marcelnote - modified to remove sprite compression
	ld d, $a0
	ld e, 4
	ld a, [wOnSGB]
	and a
	jr z, .next2
	sla e ; scroll more slowly on SGB
.next2
	call .ScrollPic ; scroll back pic left
	xor a
	ldh [hSCY], a
	ldh [hStartTileID], a ; front pic
	hlcoord 12, 5
	predef CopySpriteToTilemap ; marcelnote - modified to remove sprite compression
	ld d, 0
	ld e, -4
; scroll front pic right

.ScrollPic
	call DelayFrame
	ldh a, [hSCX]
	add e
	ldh [hSCX], a
	cp d
	jr nz, .ScrollPic
	ret

HoFDisplayAndRecordMonInfo:
	ld a, [wHoFPartyMonIndex]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	call HoFDisplayMonInfo
	jp HoFRecordMonInfo

HoFDisplayMonInfo:
	hlcoord 0, 2
	lb bc, 9, 10
	call TextBoxBorder
	hlcoord 2, 6
	ld de, HoFMonInfoText
	call PlaceString
	hlcoord 1, 4
	ld de, wNameBuffer
	call PlaceString
	ld a, [wHoFMonLevel]
	hlcoord 8, 7
	ld c, 3 ; number of digits
	call PrintLevelCommon
	ld a, [wHoFMonSpecies]
	ld [wCurSpecies], a
	hlcoord 3, 9
	predef PrintMonType
	ld a, [wHoFMonSpecies]
	jp PlayCry

HoFLoadPlayerPics: ; marcelnote - refactored to remove sprite compression
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a ; marcelnote - add female player
	ld de, RedPicFront
	ld bc, RedPicBack
	jr z, .gotPics
	ld de, GreenPicFront
	ld bc, GreenPicBack
.gotPics
	ASSERT BANK(RedPicFront) == BANK(GreenPicFront)
	push bc ; save bc = back pic address
	ld b, BANK(RedPicFront)
	ld hl, vFrontPic
	ld c, PIC_SIZE ; number of tiles to be copied
	call CopyVideoData ; copy front sprite
	pop de ; restore de = back pic address
	ld b, BANK(RedPicBack)
	xor a
	ld [rRAMB], a
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
;;;;;;;;;;;;;;;;;;;;;; marcelnote - new to handle hi-res backsprites
	ld a, [wOptions]
	and SPRITE_STYLE_MASK
	cp SPRITE_STYLE_CRYSTAL
	jr z, .highResPic
	call ScaleSpriteByTwo  ; writes scaled sprite at sSpriteBuffer0
	jr .continue
.highResPic
	ld hl, RedPicBackCrystal - RedPicBack
	add hl, de
	ld d, h
	ld e, l
	call CenterHiResSprite ; writes centered sprite at sSpriteBuffer0
.continue
;;;;;;;;;;;;;;;;;;;;;;
	ld hl, vBackPic
	ld de, sSpriteBuffer0
	ld c, PIC_SIZE ; number of tiles to be copied
	ldh a, [hLoadedROMBank]
	ld b, a
	call CopyVideoData ; copy back sprite
	xor a
	ld [rRAMG], a
	ld a, $31
	ldh [hStartTileID], a
	hlcoord 12, 5
	predef_jump CopySpriteToTilemap

HoFDisplayPlayerStats:
	SetEvent EVENT_HALL_OF_FAME_DEX_RATING
	predef DisplayDexRating
	hlcoord 0, 4
	lb bc, 6, 10
	call TextBoxBorder
	hlcoord 5, 0
	lb bc, 2, 9
	call TextBoxBorder
	hlcoord 7, 2
	ld de, wPlayerName
	call PlaceString
	hlcoord 1, 6
	ld de, HoFPlayTimeText
	call PlaceString
	hlcoord 5, 7
	ld de, wPlayTimeHours ; marcelnote - code from here to 'call PrintNumber' is PrintPlayTime
	lb bc, 1, 3
	call PrintNumber
	ld [hl], '<COLON>' ; colon with tinier dots than ":"
	inc hl
	ld de, wPlayTimeMinutes
	lb bc, LEADING_ZEROES | 1, 2
	call PrintNumber
	hlcoord 1, 9
	ld de, HoFMoneyText
	call PlaceString
	hlcoord 4, 10
	ld de, wPlayerMoney
	ld c, 3 | LEADING_ZEROES | MONEY_SIGN
	call PrintBCDNumber
	ld hl, DexSeenOwnedText
	call HoFPrintTextAndDelay
	ld hl, DexRatingText
	call HoFPrintTextAndDelay
	ld hl, wDexRatingText

HoFPrintTextAndDelay:
	call PrintText
	ld c, 120
	jp DelayFrames

DexSeenOwnedText:
	text_far _DexSeenOwnedText
	text_end

DexRatingText:
	text_far _DexRatingText
	text_end

HoFRecordMonInfo:
	ld hl, wHallOfFame
	ld bc, HOF_MON
	ld a, [wHoFPartyMonIndex]
	call AddNTimes
	ld a, [wHoFMonSpecies]
	ld [hli], a
	ld a, [wHoFMonLevel]
	ld [hli], a
	ld e, l
	ld d, h
	ld hl, wNameBuffer
	ld bc, NAME_LENGTH
	jp CopyData

HoFFadeOutScreenAndMusic:
	ld a, 10
	ld [wMusicFade], a
	xor a
	ld [wMusicFadeID], a
	jp GBFadeOutToWhite


IF DEF(_FRA)
	INCLUDE "translation/fra/data/text/hall_of_fame.fra.asm"
ELSE
	INCLUDE "data/text/hall_of_fame.asm"
ENDC
