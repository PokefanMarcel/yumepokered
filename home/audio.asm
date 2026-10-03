PlayDefaultMusic::
	call WaitForSoundToFinish
	xor a
	ld c, a
	ld d, a
	ld [wLastMusicSoundID], a
	jr PlayDefaultMusicCommon

PlayDefaultMusicFadeOutCurrent::
; Fade out the current music and then play the default music.
	ld c, 10
	ld d, 0
	ld a, [wStatusFlags4]
	bit BIT_BATTLE_OVER_OR_BLACKOUT, a
	jr z, PlayDefaultMusicCommon
	xor a
	ld [wLastMusicSoundID], a
	ld c, 8
	ld d, c

PlayDefaultMusicCommon::
	ld a, [wWalkBikeSurfState]
	and a ; WALKING?
	jr z, .walking
	cp SURFING
	jr z, .surfing
	ld a, MUSIC_BIKE_RIDING
	jr .next

.surfing
	ld a, MUSIC_SURFING

.next
	ld b, a
;	ld a, d
;	and a ; should current music be faded out first?
;	ld a, 0 ; BANK(Music_BikeRiding)
;	jr nz, .next2

; Only change the audio ROM bank if the current music isn't going to be faded
; out before the default music begins.
;	ld [wAudioROMBank], a

;.next2
; [wAudioSavedROMBank] will be copied to [wAudioROMBank] after fading out the
; current music (if the current music is faded out).
;	ld [wAudioSavedROMBank], a
	jr .next3

.walking
	ld a, [wMapMusicSoundID]
	ld b, a
;	call CompareMapMusicBankWithCurrentBank
;	jr c, .next4

.next3
	ld a, [wLastMusicSoundID]
	cp b ; is the default music already playing?
	ret z ; if so, do nothing

.next4
	ld a, c
	ld [wMusicFade], a
	and a ; fade?
	ld a, b
	ld [wLastMusicSoundID], a
	ld [wMusicFadeID], a
	ret nz ; return if fade
	jp PlayMusic

;UpdateMusic6Times::
;CompareMapMusicBankWithCurrentBank:
;	ret

; plays music or SFX specified by a. If value is $ff, music is stopped
PlaySound::
	push de
	cp $ff
	jr nz, .notff
	xor a
	call PlayMusic
	pop de
	ret
.notff
	ld e, a
	xor a
	ld d, a
	call PlaySFX
	pop de
	ret

;InitSound::
;	push hl
;	push de
;	push bc
;	push af
;
;	ldh a, [hLoadedROMBank]
;	push af
;	ld a, BANK(_InitSound)
;	ldh [hLoadedROMBank], a
;	ld [rROMB], a
;
;	call _InitSound
;
;	pop af
;	ldh [hLoadedROMBank], a
;	ld [rROMB], a
;
;	pop af
;	pop bc
;	pop de
;	pop hl
;	ret

UpdateSound::
;	push hl
;	push de
;	push bc
;	push af

	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(_UpdateSound)
	ldh [hLoadedROMBank], a
	ld [rROMB], a

	call _UpdateSound

	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a

;	pop af
;	pop bc
;	pop de
;	pop hl
	ret

_LoadMusicByte::
; [wCurMusicByte] = [a:de]
	ldh [hLoadedROMBank], a
	ld [rROMB], a

	ld a, [de]
	ld [wCurMusicByte], a
	ld a, BANK(LoadMusicByte)

	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret

PlayMusic::
	ld e, a
	xor a
	ld d, a
; Play music de.

	push hl
	push de
	push bc
	push af

	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(_PlayMusic) ; aka BANK(_InitSound)
	ldh [hLoadedROMBank], a
	ld [rROMB], a

	ld a, e
	and a
	jr z, .nomusic

	call _PlayMusic
	jr .end

.nomusic
	call _InitSound

.end
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	pop af
	pop bc
	pop de
	pop hl
	ret

;PlayMusic2::
;	ld e, a
;	xor a
;	ld d, a
; Stop playing music, then play music de.
;
;	push hl
;	push de
;	push bc
;	push af
;
;	ldh a, [hLoadedROMBank]
;	push af
;	ld a, BANK(_PlayMusic)
;	ldh [hLoadedROMBank], a
;	ld [rROMB], a
;
;	push de
;	ld de, MUSIC_NONE
;	call _PlayMusic
;	call DelayFrame
;	pop de
;	call _PlayMusic
;
;	pop af
;	ldh [hLoadedROMBank], a
;	ld [rROMB], a
;
;	pop af
;	pop bc
;	pop de
;	pop hl
;	ret

PlayCry::
; Play monster a's cry.

	push hl
	push de
	push bc
	push af

	ld [wPokedexNum], a
	predef IndexToPokedex
	ld a, [wPokedexNum]
	dec a
	ld e, a
	ld d, 0

	ldh a, [hLoadedROMBank]
	push af

	; Cries are stuck in one bank.
	ld a, BANK(PokemonCries)
	ldh [hLoadedROMBank], a
	ld [rROMB], a

	ld hl, PokemonCries
REPT 6 ; MON_CRY_LENGTH
	add hl, de
ENDR

	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a

	ld a, [hli]
	ld [wCryPitch], a
	ld a, [hli]
	ld [wCryPitch + 1], a
	ld a, [hli]
	ld [wCryLength], a
	ld a, [hl]
	ld [wCryLength + 1], a

	ld a, BANK(_PlayCry)
	ldh [hLoadedROMBank], a
	ld [rROMB], a

	call _PlayCry

	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a

	call WaitForSoundToFinish

	pop af
	pop bc
	pop de
	pop hl
	ret

PlayBattleSound::
	push hl
	push de
	push bc
	push af

	push af
	ld hl, wCryPitch
	ld a, c
	ld [hli], a ; wCryPitch
	ld a, b
	ld [hli], a ; wCryPitch + 1
	ld a, e
	ld [hli], a ; wCryLength
	ld [hl], d  ; wCryLength + 1
	pop af

	ld e, a
	xor a
	ld d, a

	ldh a, [hLoadedROMBank]
	push af

	ld a, BANK(_PlayBattleSound)
	ldh [hLoadedROMBank], a
	ld [rROMB], a

	ld a, e
	ld [wCurSFX], a
	call _PlayBattleSound

	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a

	pop af
	pop bc
	pop de
	pop hl
	ret

PlaySFX::
; Play sound effect de.
; Sound effects are ordered by priority (highest to lowest)

	push hl
	push de
	push bc
	push af

	; Is something already playing?
;	call CheckSFX
;	jr nc, .play

	; Does it have priority?
;	ld a, [wCurSFX]
;	cp e
;	jr c, .done

.play
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(_PlaySFX)
	ldh [hLoadedROMBank], a
	ld [rROMB], a

	ld a, e
	ld [wCurSFX], a
	call _PlaySFX

	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a

.done
	pop af
	pop bc
	pop de
	pop hl
	ret

PlaySoundWaitForCurrent::
	push af
	call WaitForSoundToFinish
	pop af
	jp PlaySound

; Wait for sound to finish playing
WaitForSoundToFinish::
	ld a, [wLowHealthAlarm]
	and a
	ret nz
	ld a, [wSFXDontWait]
	and a
	ret nz

; infinite loop until sfx is done playing
.wait
	ld a, [wChannel5Flags1]
	rra
	jr c, .wait
	ld a, [wChannel6Flags1]
	rra
	jr c, .wait
	ld a, [wChannel7Flags1]
	rra
	jr c, .wait
	ld a, [wChannel8Flags1]
	rra
	jr c, .wait
	ret

WaitForSongToFinish::
	call IsSongPlaying
	jr c, WaitForSongToFinish
	ret

IsSongPlaying::
; Return carry if any song channels are active.
	ld a, [wChannel1Flags1]
	rra
	ret c
	ld a, [wChannel2Flags1]
	rra
	ret c
	ld a, [wChannel3Flags1]
	rra
	ret c
	ld a, [wChannel4Flags1]
	rra
	ret
