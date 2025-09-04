AerodactylFossil:
	ld a, FOSSIL_AERODACTYL
	ld [wCurPartySpecies], a
	call DisplayMonFrontSpriteInBox
	call EnableAutoTextBoxDrawing
	tx_pre_jump AerodactylFossilText

AerodactylFossilText::
	text_far _AerodactylFossilText
	text_end

KabutopsFossil:
	ld a, FOSSIL_KABUTOPS
	ld [wCurPartySpecies], a
	call DisplayMonFrontSpriteInBox
	call EnableAutoTextBoxDrawing
	tx_pre_jump KabutopsFossilText

KabutopsFossilText::
	text_far _KabutopsFossilText
	text_end

DisplayMonFrontSpriteInBox:
; Displays a pokemon's front sprite in a pop-up window.
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	xor a
	ldh [hWY], a
	call SaveScreenTilesToBuffer1
	ld a, MON_SPRITE_POPUP
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call UpdateSprites
	call Delay3 ; allow box to finish rendering before setting palette
;	ld b, SET_PAL_MIDDLE_SCREEN_MON_BOX ; marcelnote - from PureRGB to display correct palette
;	call RunPaletteCommand
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetMonHeader
	ld de, vChars1 tile $31
	call LoadMonFrontSprite
	ld a, $80
	ldh [hStartTileID], a
	hlcoord 10, 11
	predef AnimateSendingOutMon
	ld a, [wCurPartySpecies]
	cp FOSSIL_KABUTOPS
	call c, PlayCry ; marcelnote - don't play cry after FOSSIL_KABUTOPS
	                ; this means that fossils should be at the end!
	call WaitForTextScrollButtonPress
	ld a, MON_SPRITE_POPUP
	ld [wTextBoxID], a
	call DisplayTextBoxID           ; redisplay the box to clear the pokemon sprite out
	call Delay3                     ; allow box to finish clearing
	call RunDefaultPaletteCommand   ; reset palette to what it was before displaying this box
	call LoadScreenTilesFromBuffer1 ; close the box
	call Delay3                     ; allow box to finish closing before resetting hWY
	ld a, $90
	ldh [hWY], a
	xor a
	ldh [hAutoBGTransferEnabled], a
	ret
