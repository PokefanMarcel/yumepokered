SoftReset::
	call StopAllSounds
	call GBPalWhiteOut
	ld c, 32
	call DelayFrames
	; fallthrough

Init::
;  Program init.
	di

	xor a
	ldh [rIF], a
	ldh [rIE], a
	ldh [rSCX], a
	ldh [rSCY], a
	ldh [rSB], a
	ldh [rSC], a
	ldh [rWX], a
	ldh [rWY], a
	ldh [rTMA], a
	ldh [rTAC], a
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a

	ld a, LCDC_ON
	ldh [rLCDC], a
	call DisableLCD ; returns a = 0 because rIE was cleared

	ld sp, wStack

	ASSERT STARTOF(WRAM0) == $c000 && SIZEOF(WRAM0) == $2000
	ld hl, STARTOF(WRAM0)
.clearWRAM
	ld [hli], a ; 0
	bit 5, h ; first set when hl = $e000
	jr z, .clearWRAM

	; marcelnote - xorshift RNG adapted from shinpokered
	; Obtain the xorshift seed before clearing HRAM.
	ld hl, .seedSources
	ld de, wRandomSeed
	ld b, 4 ; number of seeds
.sampleSeed
	ld a, [hli]
	ld c, a
	ldh a, [c]
	ld [de], a
	inc de
	dec b
	jr nz, .sampleSeed

	call ClearVram ; returns a = 0 for the HRAM clear

	ld hl, STARTOF(HRAM)
	ld bc, SIZEOF(HRAM)
	call FillMemory

	; Initialize the live RNG state from the saved seed.
	ld hl, wRandomSeed
	set 0, [hl] ; ensure the 32-bit seed is nonzero
	ld a, [hli]
	ldh [hRandomAdd], a
	ld a, [hli]
	ldh [hRandomSub], a
	ld a, [hli]
	ldh [hRandomLast], a
	ld a, [hli]
	ldh [hRandomLast + 1], a

	ld a, BANK(WriteDMACodeToHRAM)
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	call WriteDMACodeToHRAM

	xor a
	ldh [hTileAnimations], a
	ldh [rSTAT], a
	ldh [hSCX], a
	ldh [hSCY], a
	ldh [rIF], a
	ld a, IE_VBLANK | IE_TIMER | IE_SERIAL
	ldh [rIE], a

	ld a, 144 ; move the window off-screen
	ldh [hWY], a
	ldh [rWY], a
	ld a, 7
	ldh [rWX], a

	ld a, CONNECTION_NOT_ESTABLISHED
	ldh [hSerialConnectionStatus], a

	ld h, HIGH(vBGMap0)
	call ClearBgMap
	ld h, HIGH(vBGMap1)
	call ClearBgMap

	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld a, 16
	ld [wSoftReset], a
	call StopAllSounds

	ei

	predef LoadSGB

;	ld a, 0 ; BANK(SFX_Shooting_Star)
;	ld [wAudioROMBank], a
;	ld [wAudioSavedROMBank], a
	ld a, HIGH(vBGMap1)
	ldh [hAutoBGTransferDest + 1], a
	xor a
	ldh [hAutoBGTransferDest], a
	dec a
	ld [wUpdateSpritesEnabled], a

	predef PlayIntro

	call DisableLCD
	call ClearVram
	call GBPalNormal
	call ClearSprites
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a

	jp PrepareTitleScreen

.seedSources
	db LOW(hSpriteAnimFrameCounter)
	db LOW(hDividend)
	db LOW(hFrameCounter)
	db LOW(hJoyLast)

ClearVram::
	ld hl, STARTOF(VRAM)
	ld bc, SIZEOF(VRAM)
	xor a
	jp FillMemory

StopMusic::
	ld hl, wMusicFade
	ld [hl], a
	xor a
	ld [wMusicFadeID], a
.wait
	ld a, [hl]
	and a
	jr nz, .wait
	; fallthrough

StopAllSounds::
;	ld a, 0 ; BANK("Audio Engine 1")
;	ld [wAudioROMBank], a
;	ld [wAudioSavedROMBank], a
	xor a
	ld [wMusicFade], a
	ld [wMusicFadeID], a
	ld [wLastMusicSoundID], a
	dec a
	jp PlaySound
