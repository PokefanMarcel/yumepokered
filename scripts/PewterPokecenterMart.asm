; marcelnote - merged Pewter Pokecenter and Mart
PewterPokecenterMart_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

PewterPokecenterMart_TextPointers:
	def_text_pointers
	; Pokecenter
	dw_const PewterPokecenterNurseText,            TEXT_PEWTERPOKECENTER_NURSE
	dw_const PewterPokecenterGentlemanText,        TEXT_PEWTERPOKECENTER_GENTLEMAN
	dw_const PewterPokecenterJigglypuffText,       TEXT_PEWTERPOKECENTER_JIGGLYPUFF
	dw_const PewterPokecenterLinkReceptionistText, TEXT_PEWTERPOKECENTER_LINK_RECEPTIONIST
	dw_const PewterPokecenterBenchGuyText,         TEXT_PEWTERPOKECENTER_BENCH_GUY ; marcelnote - BenchGuy has a sprite
	; Mart
	dw_const PewterMartClerkText,     TEXT_PEWTERMART_CLERK
	dw_const PewterMartYoungsterText, TEXT_PEWTERMART_YOUNGSTER
	dw_const PewterMartSuperNerdText, TEXT_PEWTERMART_SUPER_NERD

PewterPokecenterNurseText:
	script_pokecenter_nurse

PewterPokecenterGentlemanText:
	text_far _PewterPokecenterGentlemanText
	text_end

PewterPokecenterJigglypuffText:
	text_asm
	ld a, TRUE
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .Text
	call PrintText

	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	ld c, 32
	call DelayFrames

	ld hl, .FacingDirections
	ld de, wJigglypuffFacingDirections
	ld bc, .FacingDirectionsEnd - .FacingDirections
	call CopyData

	ld a, [wSprite03StateData1ImageIndex]
	ld hl, wJigglypuffFacingDirections
.findMatchingFacingDirectionLoop
	cp [hl]
	inc hl
	jr nz, .findMatchingFacingDirectionLoop
	dec hl

	push hl
	ld c, 0 ; BANK(Music_JigglypuffSong)
	ld a, MUSIC_JIGGLYPUFF_SONG
	call PlayMusic
	pop hl

.spinMovementLoop
	ld a, [hl]
	ld [wSprite03StateData1ImageIndex], a
; rotate the array
	push hl
	ld hl, wJigglypuffFacingDirections
	ld de, wJigglypuffFacingDirections - 1
	ld bc, .FacingDirectionsEnd - .FacingDirections
	call CopyData
	ld a, [wJigglypuffFacingDirections - 1]
	ld [wJigglypuffFacingDirections + 3], a
	pop hl
	ld c, 24
	call DelayFrames

	push hl
	call IsSongPlaying
	pop hl
	jr c, .spinMovementLoop
;	ld a, [wChannelSoundIDs]
;	ld b, a
;	ld a, [wChannelSoundIDs + CHAN2]
;	or b
;	jr nz, .spinMovementLoop

	ld c, 48
	call DelayFrames
	call PlayDefaultMusic
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _PewterPokecenterJigglypuffText
	text_end

.FacingDirections:
	db $30 | SPRITE_FACING_DOWN
	db $30 | SPRITE_FACING_LEFT
	db $30 | SPRITE_FACING_UP
	db $30 | SPRITE_FACING_RIGHT
.FacingDirectionsEnd:

PewterPokecenterLinkReceptionistText:
	script_cable_club_receptionist

PewterPokecenterBenchGuyText: ; marcelnote - BenchGuy has a sprite
	text_far _PewterPokecenterBenchGuyText
	text_end


PewterMartYoungsterText: ; marcelnote - simplified code
	text_far _PewterMartYoungsterText
	text_end

PewterMartSuperNerdText: ; marcelnote - simplified code
	text_far _PewterMartSuperNerdText
	text_end

PewterMartClerkText: ; marcelnote - moved Mart inventories, added REPEL
	script_mart POKE_BALL, POTION, REPEL, ESCAPE_ROPE, ANTIDOTE, BURN_HEAL, AWAKENING, PARLYZ_HEAL

