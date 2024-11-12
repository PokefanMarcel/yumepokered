DisplayPokemonCenterDialogue_::
	call SaveScreenTilesToBuffer1 ; save screen
	ld hl, PokemonCenterWelcomeText
	call PrintText
	ld hl, wStatusFlags4
	bit BIT_USED_POKECENTER, [hl]
	set BIT_UNKNOWN_4_1, [hl] ; marcelnote - never checked?
	jr nz, .skipPerfectHealthText ; marcelnote - used to skip ShallWeHealYourPokemonText
	ld hl, PokemonCenterPerfectHealthText
	call PrintText
.skipPerfectHealthText
	ld hl, ShallWeHealYourPokemonText
	call PrintText
	call YesNoChoicePokeCenter ; yes/no menu
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .declinedHealing ; if the player chose No
	call SetLastBlackoutMap
	call LoadScreenTilesFromBuffer1 ; restore screen
	ld hl, NeedYourPokemonText
	call PrintText
	ld a, $18
	ld [wSprite01StateData1ImageIndex], a ; make the nurse turn to face the machine
	call Delay3
	predef HealParty
	farcall AnimateHealingMachine ; do the healing machine animation
	xor a
	ld [wAudioFadeOutControl], a
	ld a, [wAudioSavedROMBank]
	ld [wAudioROMBank], a
	ld a, [wMapMusicSoundID]
	ld [wLastMusicSoundID], a
	ld [wNewSoundID], a
	call PlaySound
	ld hl, wStatusFlags4 ; marcelnote - now also skip PokemonFightingFitText
	bit BIT_USED_POKECENTER, [hl]
	jr nz, .skipFightingFitText
	set BIT_USED_POKECENTER, [hl]
	ld hl, PokemonFightingFitText
	call PrintText
.skipFightingFitText
	ld a, $14
	ld [wSprite01StateData1ImageIndex], a ; make the nurse bow
	ld c, a
	call DelayFrames
	jr .checkReset
.declinedHealing
	call LoadScreenTilesFromBuffer1 ; restore screen
.checkReset ; marcelnote - now we reset the bit once in a while to have the long text pop up sometimes
	call Random
	cp 31       ; 32/256 = 1/8 chance to reset text
	jp nc, .dontReset
	ld hl, wStatusFlags4
	res BIT_USED_POKECENTER, [hl]
.dontReset
	ld hl, PokemonCenterFarewellText
	call PrintText
	jp UpdateSprites

PokemonCenterWelcomeText:
	text_far _PokemonCenterWelcomeText
	text_end

PokemonCenterPerfectHealthText: ; marcelnote - broke down PokemonCenterWelcomeText
	text_far _PokemonCenterPerfectHealthText
	text_end

ShallWeHealYourPokemonText:
	text_pause
	text_far _ShallWeHealYourPokemonText
	text_end

NeedYourPokemonText:
	text_far _NeedYourPokemonText
	text_end

PokemonFightingFitText:
	text_far _PokemonFightingFitText
	text_end

PokemonCenterFarewellText:
	text_pause
	text_far _PokemonCenterFarewellText
	text_end
