; marcelnote - moved tileset in VRAM and added labels
DEF DIPLOMA_TEXTBOX_BASE         EQU $60
DEF DIPLOMA_TEXTBOX_BULLET       EQU DIPLOMA_TEXTBOX_BASE + 0
DEF DIPLOMA_TEXTBOX_BOTTOM_EDGE  EQU DIPLOMA_TEXTBOX_BASE + 1
DEF DIPLOMA_TEXTBOX_RIGHT_EDGE   EQU DIPLOMA_TEXTBOX_BASE + 2
DEF DIPLOMA_TEXTBOX_UPPER_LEFT   EQU DIPLOMA_TEXTBOX_BASE + 3
DEF DIPLOMA_TEXTBOX_TOP_EDGE     EQU DIPLOMA_TEXTBOX_BASE + 4
DEF DIPLOMA_TEXTBOX_UPPER_RIGHT  EQU DIPLOMA_TEXTBOX_BASE + 5
DEF DIPLOMA_TEXTBOX_LEFT_EDGE    EQU DIPLOMA_TEXTBOX_BASE + 6
DEF DIPLOMA_TEXTBOX_LOWER_LEFT   EQU DIPLOMA_TEXTBOX_BASE + 7
DEF DIPLOMA_TEXTBOX_LOWER_RIGHT  EQU DIPLOMA_TEXTBOX_BASE + 8
DEF DIPLOMA_TEXTBOX_BG           EQU DIPLOMA_TEXTBOX_BASE + 9

DisplayDiploma:: ; marcelnote - modified for new VRAM layout
	call SaveScreenTilesToBuffer2
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	ld a, $ff ; marcelnote - preserve manually drawn diploma OAM
	ld [wUpdateSpritesEnabled], a
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	call DisableLCD
	hlcoord 0, 0
	lb bc, 16, 18

	; Draw frame.
	ld a, DIPLOMA_TEXTBOX_UPPER_LEFT
	ld [hli], a
	ld a, DIPLOMA_TEXTBOX_TOP_EDGE
	call Diploma_DrawHorizontalLine
	ld a, DIPLOMA_TEXTBOX_UPPER_RIGHT
	ld [hli], a
.loop
	ld a, DIPLOMA_TEXTBOX_LEFT_EDGE
	ld [hli], a
	ld a, ' '
	call Diploma_DrawHorizontalLine
	ld a, DIPLOMA_TEXTBOX_RIGHT_EDGE
	ld [hli], a
	dec b
	jr nz, .loop
	ld a, DIPLOMA_TEXTBOX_LOWER_LEFT
	ld [hli], a
	ld a, DIPLOMA_TEXTBOX_BOTTOM_EDGE
	call Diploma_DrawHorizontalLine
	ld [hl], DIPLOMA_TEXTBOX_LOWER_RIGHT

	ld hl, DiplomaTextPointersAndCoords
	ld c, $5
.placeTextLoop
	push bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	call PlaceString
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, .placeTextLoop
	hlcoord 10, 4
	ld de, wPlayerName
	call PlaceString
	callfar DrawPlayerCharacter

; Move the player 33 pixels right and set the priority bit so he appears
; behind the background layer.
	ld hl, wShadowOAMSprite00XCoord
	lb bc, $80, $28
.adjustPlayerGfxLoop
	ld a, [hl] ; X
	add 33
	ld [hli], a
	inc hl
	ld a, b
	ld [hli], a ; attributes
	inc hl
	dec c
	jr nz, .adjustPlayerGfxLoop

	call EnableLCD
	ld de, TrainerInfoTextBoxTileGraphics
	ld hl, vChars2 tile DIPLOMA_TEXTBOX_BASE ; marcelnote - moved tileset in VRAM from $75
	lb bc, BANK(TrainerInfoTextBoxTileGraphics), (TrainerInfoTextBoxTileGraphicsEnd - TrainerInfoTextBoxTileGraphics) / TILE_SIZE
	call CopyVideoData

	ld b, SET_PAL_GENERIC
	call RunPaletteCommand
	call Delay3
	call GBPalNormal
	ld a, $90
	ldh [rOBP0], a
	call WaitForTextScrollButtonPress
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call Delay3
	jp GBPalNormal

; c = width
Diploma_DrawHorizontalLine:
	ld d, c
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret

UnusedPlayerNameLengthFunc:
; Unused function that performs bc = -(player name's length)
; leftover from the JPN versions
	ld hl, wPlayerName
	lb bc, $ff, $00
.loop
	ld a, [hli]
	cp '@'
	ret z
	dec c
	jr .loop

MACRO diploma_text
	dw \3
	dwcoord \1, \2
ENDM

DiplomaTextPointersAndCoords:
	; x, y, text
	diploma_text  5,  2, DiplomaText
	diploma_text  3,  4, DiplomaPlayer
	diploma_text 15,  4, DiplomaEmptyText
	diploma_text  2,  6, DiplomaCongrats
	diploma_text  9, 16, DiplomaGameFreak


IF DEF(_FRA)
	INCLUDE "translation/fra/data/text/diploma.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/data/text/diploma.esp.asm"
ELSE
	INCLUDE "data/text/diploma.asm"
ENDC

DiplomaGameFreak:
	db "GAME FREAK@"
