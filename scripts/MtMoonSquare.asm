; marcelnote - new location
MtMoonSquare_Script:
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	call Random
	cp 26 ; carry when a is 0-25 so prob_spawning = 26/256 = 10.1%
	ret nc
	ld a, HS_MT_MOON_SQUARE_CLEFAIRY
	ld [wMissableObjectIndex], a
	predef_jump ShowObject

MtMoonSquare_TextPointers:
	def_text_pointers
	dw_const MtMoonSquareEvolutionRockText, TEXT_MTMOONSQUARE_EVOLUTION_ROCK
	dw_const MtMoonSquareCooltrainerFText,  TEXT_MTMOONSQUARE_COOLTRAINER_F
	dw_const MtMoonSquareHikerText,         TEXT_MTMOONSQUARE_HIKER
	dw_const MtMoonSquareGolemText,         TEXT_MTMOONSQUARE_GOLEM
	dw_const MtMoonSquareClefairyText,      TEXT_MTMOONSQUARE_CLEFAIRY
	dw_const PickUpItemText,                TEXT_MTMOONSQUARE_MOON_STONE
	dw_const PickUpItemText,                TEXT_MTMOONSQUARE_SUPER_POTION
	dw_const MtMoonSquareSignText,          TEXT_MTMOONSQUARE_SIGN

MtMoonSquareCooltrainerFText:
	text_far _MtMoonSquareCooltrainerFText
	text_end

MtMoonSquareClefairyText:
	text_far _MtMoonSquareClefairyText
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, CLEFAIRY
	call PlayCry
	call GBFadeOutToWhite
	ld a, SFX_TELEPORT_EXIT_1
	ld [wNewSoundID], a
	call PlaySound
	ld a, HS_MT_MOON_SQUARE_CLEFAIRY
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_MT_MOON_SQUARE_ITEM_1 ; show Moon Stone
	ld [wMissableObjectIndex], a
	predef ShowObject
	call UpdateSprites
	ld c, 20
	call DelayFrames
	call GBFadeInFromWhite
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

MtMoonSquareHikerText:
	text_far _MtMoonSquareHikerText
	text_end

MtMoonSquareGolemText:
	text_far _MtMoonSquareGolemText
	text_asm
	ld a, GOLEM
	call PlayCry
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

MtMoonSquareSignText:
	text_far _MtMoonSquareSignText
	text_end

MtMoonSquareEvolutionRockText:
	text_asm
	call SaveScreenTilesToBuffer2
	ld hl, .ThisRockVibratesText
	call PrintText
	ld d, GRAVELER
	callfar IsMonInParty ; outputs [wWhichPokemon] = index of Graveler in party (0 to 5)
	jr z, .done
	ld hl, TextScriptPromptButton
	call TextCommandProcessor
	ld hl, .ShouldGravelerStrikeText
	call PrintText
	ld a, $01
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	ld hl, .GravelerGivesPunchText
	call PrintText
	;ld a, GRAVELER
	;call PlayCry
	;call WaitForSoundToFinish
	ld a, SFX_PUSH_BOULDER
	call PlaySound
	call WaitForSoundToFinish
	ld hl, .DotsText
	call PrintText
	callfar EvolveMonInteraction    ; actual evolution and map reloading
.done
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.ThisRockVibratesText
	text_far _MtMoonSquareThisRockVibratesText
	text_end

.ShouldGravelerStrikeText:
	text_far _MtMoonSquareShouldGravelerStrikeText
	text_end

.GravelerGivesPunchText:
	text_far _MtMoonSquareGravelerGivesPunchText
	text_end

.DotsText:
	text_far _MtMoonSquareGravelerDotsText
	text_end
