; Draw a definition selected by wTextBoxID. Choices also use HL as box origin.
DisplayTextBoxID_::
	ld a, [wTextBoxID]
	and ~(1 << BIT_SECOND_MENU_OPTION_DEFAULT)
	ret z ; NOLISTMENU
	cp NUM_MENU_IDS
	ret nc
	push hl ; caller-supplied origin, used only by choices
	call GetMenuDefinition
	ld a, [hli] ; definition kind
	cp MENU_KIND_CHOICE
	jr z, .choice
	pop de ; discard caller origin
	cp MENU_KIND_LIST
	jp z, DrawListMenuBox
	cp MENU_KIND_CUSTOM
	jr z, .custom
	cp MENU_KIND_TEXT
	jr z, .text
.box
	call GetTextBoxIDCoords
	call GetAddressOfScreenCoords
	jp TextBoxBorder
.text
	call GetTextBoxIDCoords
	push hl
	call GetAddressOfScreenCoords
	call TextBoxBorder
	pop hl
	call GetTextBoxIDText
	ld a, [wStatusFlags5]
	push af
	set BIT_NO_TEXT_DELAY, a
	ld [wStatusFlags5], a
	call PlaceString
	pop af
	ld [wStatusFlags5], a
	jp UpdateSprites
.custom
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
.choice
	ld d, h
	ld e, l ; DE = choice data
	pop hl  ; HL = caller's box origin
	jp DisplayTwoOptionMenu

; A = common box/menu ID. Returns HL = definition, preserves BC.
GetMenuDefinition:
	ld hl, MenuDefinitions
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

; Draw the list and derive its cursor, interior, and scroll-arrow positions.
; HL points to the list's coordinates, followed by its behavior flags.
DrawListMenuBox:
	call GetTextBoxIDCoords
	push hl ; flags pointer
	push bc ; inner height/width
	push de ; upper-left Y/X
	call GetAddressOfScreenCoords
	push hl
	call TextBoxBorder
	pop hl
	ld bc, SCREEN_WIDTH + 1
	add hl, bc ; first interior tile
	ld a, l
	ld [wListMenuOrigin], a
	ld a, h
	ld [wListMenuOrigin + 1], a
	pop de
	pop bc
	ld a, b
	ld [wListMenuHeight], a
	ld a, c
	ld [wListMenuWidth], a
	pop hl
	ld a, [hl]
	ld [wListMenuFlags], a
	ld a, d
	add 2
	ld [wTopMenuItemY], a
	ld a, e
	inc a
	ld [wTopMenuItemX], a
	ld a, d
	add b
	ld d, a ; last interior row
	ld a, e
	add c
	ld e, a ; last interior column
	call GetAddressOfScreenCoords
	ld a, l
	ld [wListMenuScrollArrow], a
	ld a, h
	ld [wListMenuScrollArrow + 1], a
	ret

; Load the four corner coordinates shared by box, text, and list definitions.
; INPUT:
; hl = address of coordinates
; OUTPUT:
; b = height
; c = width
; d = row of upper left corner
; e = column of upper left corner
GetTextBoxIDCoords:
	ld a, [hli] ; column of upper left corner
	ld e, a
	ld a, [hli] ; row of upper left corner
	ld d, a
	ld a, [hli] ; column of lower right corner
	sub e
	dec a
	ld c, a     ; c = width
	ld a, [hli] ; row of lower right corner
	sub d
	dec a
	ld b, a     ; b = height
	ret

; Load the text pointer and coordinates following a text definition's corners.
GetTextBoxIDText:
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a ; de = address of text
	push de ; save text address
	ld a, [hli]
	ld e, a    ; column of upper left corner of text
	ld d, [hl] ; row of upper left corner of text
	call GetAddressOfScreenCoords
	pop de ; restore text address
	ret

; function to point hl to the screen coordinates
; INPUT:
; d = row
; e = column
; OUTPUT:
; hl = address of upper left corner of text box
GetAddressOfScreenCoords:
	push bc
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH
	ld a, d
	and a
	jr z, .addedRows
.loop ; add d rows to the base address
	add hl, bc
	dec d
	jr nz, .loop
.addedRows
	pop bc
	add hl, de
	ret

IF DEF(_FRA)
	INCLUDE "translation/fra/data/text_boxes.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/data/text_boxes.esp.asm"
ELSE
	INCLUDE "data/text_boxes.asm"
ENDC

INCLUDE "data/menu_definitions.asm"

DisplayMoneyBox:
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	ld a, MONEY_BOX_TEMPLATE
	ld [wTextBoxID], a
	call DisplayTextBoxID
	hlcoord 13, 1
	lb bc, 1, 6
	call ClearScreenArea
	hlcoord 12, 1
	ld de, wPlayerMoney
	ld c, 3 | LEADING_ZEROES | MONEY_SIGN
	call PrintBCDNumber
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ret

CurrencyString:
	db "      ¥@"

DoBuySellQuitMenu: ; marcelnote - small optim
	ld a, BUY_SELL_QUIT_MENU_TEMPLATE
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, PAD_A | PAD_B
	ld [wMenuWatchedKeys], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wMenuWatchMovingOutOfBounds], a
	inc a ; a = 1
	ld [wTopMenuItemY], a
	ld [wTopMenuItemX], a
	inc a ; a = 2
	ld [wMaxMenuItem], a
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call HandleMenuInput
	call PlaceUnfilledArrowMenuCursor
	bit B_PAD_A, b ; marcelnote - button state returned in b
	ld a, [wCurrentMenuItem]
	ld [wChosenMenuItem], a
	jr z, .quit
	; pressed A
	ld b, a
	ld a, [wMaxMenuItem]
	cp b
	ld a, CHOSE_MENU_ITEM
	jr nz, .storeExitMethod
.quit
	ld a, CANCELLED_MENU
	scf
.storeExitMethod
	ld [wMenuExitMethod], a
	ret

; Previous caller contract:
; displays a menu with two options to choose from
; b = Y of upper left corner of text region
; c = X of upper left corner of text region
; hl = address where the text box border should be drawn
; HL = caller-supplied box origin, DE = choice definition after its kind.
; Carry is clear for the first choice, set for the second choice or B.
DisplayTwoOptionMenu:
	push hl ; save origin until the covered tiles are restored
	push hl
	push de
	call GetMenuOriginCoords
	pop hl ; definition
	ld a, [hli] ; inner width
	add 2
	ld [wChoiceMenuWidth], a
	ld a, [hli] ; inner height
	add 2
	ld [wChoiceMenuHeight], a
	ld a, [hli] ; first choice's row relative to box origin
	add b
	ld [wTopMenuItemY], a
	ld a, c
	inc a ; cursor column is one tile inside the box
	ld [wTopMenuItemX], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a ; text pointer
	ld a, [hl]
	ld [wChoiceMenuFlags], a
	pop hl ; box origin
	push de ; text pointer
	push hl
	bit BIT_CHOICE_BACKUP_TILES, a ; a still holds the definition's flags
	call nz, TwoOptionMenu_SaveScreenTiles
	pop hl
	ld a, [wChoiceMenuWidth]
	sub 2
	ld c, a
	ld a, [wChoiceMenuHeight]
	sub 2
	ld b, a
	ld a, [wChoiceMenuFlags]
	bit BIT_CHOICE_CABLE_BORDER, a
	jr z, .ordinaryBorder
	call CableClub_TextBoxBorder
	jr .borderDrawn
.ordinaryBorder
	call TextBoxBorder
.borderDrawn
	call UpdateSprites
	ld a, [wTopMenuItemY]
	ld d, a
	ld a, [wTopMenuItemX]
	inc a ; text is one tile to the right of the cursor
	ld e, a
	call GetAddressOfScreenCoords
	pop de ; text pointer
	ld a, [wStatusFlags5]
	set BIT_NO_TEXT_DELAY, a
	ld [wStatusFlags5], a
	call PlaceString
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ld a, PAD_A | PAD_B
	ld [wMenuWatchedKeys], a
	ld a, 1
	ld [wMaxMenuItem], a
	xor a
	ld [wLastMenuItem], a
	ld [wMenuWatchMovingOutOfBounds], a
	ld hl, wTextBoxID
	bit BIT_SECOND_MENU_OPTION_DEFAULT, [hl]
	jr z, .storeInitialChoice
	res BIT_SECOND_MENU_OPTION_DEFAULT, [hl]
	inc a
.storeInitialChoice
	ld [wCurrentMenuItem], a
	ld a, [wChoiceMenuFlags]
	bit BIT_CHOICE_IGNORE_B, a
	jr z, .allowB
	ld a, [wMiscFlags]
	push af
	ld hl, wMiscFlags
	set BIT_NO_MENU_BUTTON_SOUND, [hl]
.ignoreBLoop
	call HandleMenuInput
	bit B_PAD_B, a
	jr nz, .ignoreBLoop
	pop af
	ld [wMiscFlags], a
	ld a, SFX_PRESS_AB
	call PlaySound
	jr .pressedA
.allowB
	call HandleMenuInput
	bit B_PAD_B, a
	jr nz, .secondChoice
.pressedA
	ld a, [wCurrentMenuItem]
	ld [wChosenMenuItem], a ; choosing with A updates the chosen-item result
	and a
	jr nz, .secondChoice
	inc a ; CHOSE_FIRST_ITEM
	ld [wMenuExitMethod], a
	ld c, 15
	call DelayFrames
	pop hl ; saved box origin
	ld a, [wChoiceMenuFlags]
	bit BIT_CHOICE_BACKUP_TILES, a
	call nz, TwoOptionMenu_RestoreScreenTiles
	and a
	ret
.secondChoice
	ld a, 1
	ld [wCurrentMenuItem], a
	ld [wChosenMenuItem], a ; B also returns the second choice, as before
	inc a ; CHOSE_SECOND_ITEM
	ld [wMenuExitMethod], a
	ld c, 15
	call DelayFrames
	pop hl ; saved box origin
	ld a, [wChoiceMenuFlags]
	bit BIT_CHOICE_BACKUP_TILES, a
	call nz, TwoOptionMenu_RestoreScreenTiles
	scf
	ret

; HL = tilemap address. Returns B/C = its Y/X coordinates.
; Called once when a choice opens, so callers only specify the box origin.
GetMenuOriginCoords:
	ld de, -wTileMap
	add hl, de
	ld de, -SCREEN_WIDTH
	ld b, -1
.loop
	inc b
	add hl, de ; subtract one row; carry means a whole row remained
	jr c, .loop
	ld de, SCREEN_WIDTH
	add hl, de
	ld c, l
	ret

; Only choices marked BIT_CHOICE_BACKUP_TILES use this fixed 6x5 backup.
; Yes/No fits exactly in wBuffer's 30 bytes. Wider choices restore externally.
ASSERT 6 * 5 <= wBufferEnd - wBuffer
TwoOptionMenu_SaveScreenTiles:
	ld de, wBuffer
	ld b, 5
.rowsLoop
	ld c, 6
.colsLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .colsLoop
	ld a, SCREEN_WIDTH - 6
	add l
	ld l, a
	adc h
	sub l
	ld h, a ; hl += SCREEN_WIDTH - 6
	dec b
	jr nz, .rowsLoop
	ret ; returns bc = 0

TwoOptionMenu_RestoreScreenTiles:
	ld de, wBuffer
	ld b, 5
.rowsLoop
	ld c, 6
.colsLoop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .colsLoop
	ld a, SCREEN_WIDTH - 6
	add l
	ld l, a
	adc h
	sub l
	ld h, a ; hl += SCREEN_WIDTH - 6
	dec b
	jr nz, .rowsLoop
	jp UpdateSprites


DisplayFieldMoveMonMenu:
	xor a
	ld hl, wFieldMoves
	ld [hli], a ; wFieldMoves
	ld [hli], a ; wFieldMoves + 1
	ld [hli], a ; wFieldMoves + 2
	ld [hli], a ; wFieldMoves + 3
	ld [hli], a ; wFieldMoves + 4 ; marcelnote - for temporary field moves
	ld [hli], a ; wNumFieldMoves
	ld [hl], 12 ; wFieldMovesLeftmostXCoord
	call GetMonFieldMoves
	ld a, [wNumFieldMoves]
	and a
	jr nz, .fieldMovesExist

; no field moves
	hlcoord 11, 11
	lb bc, 5, 7
	call TextBoxBorder
	call UpdateSprites
	ld a, 12
	ldh [hFieldMoveMonMenuTopMenuItemX], a
	hlcoord 13, 12
	ld de, PokemonMenuEntries
	jp PlaceString

.fieldMovesExist
	push af

; Calculate the text box position and dimensions based on the leftmost X coord
; of the field move names before adjusting for the number of field moves.
	hlcoord 0, 11
	ld a, [wFieldMovesLeftmostXCoord]
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld b, 5
	ld a, 18
	sub e
	ld c, a
	pop af

; For each field move, move the top of the text box up 2 rows while leaving
; the bottom of the text box at the bottom of the screen.
	ld de, -SCREEN_WIDTH * 2
.textBoxHeightLoop
	add hl, de
	inc b
	inc b
	dec a
	jr nz, .textBoxHeightLoop

; Make space for an extra blank row above the top field move.
	ld de, -SCREEN_WIDTH
	add hl, de
	inc b

	call TextBoxBorder
	call UpdateSprites

; Calculate the position of the first field move name to print.
	hlcoord 0, 12
	ld a, [wFieldMovesLeftmostXCoord]
	inc a
	ld e, a
	ld d, 0
	add hl, de
	ld de, -SCREEN_WIDTH * 2
	ld a, [wNumFieldMoves]
.calcFirstFieldMoveYLoop
	add hl, de
	dec a
	jr nz, .calcFirstFieldMoveYLoop

	xor a
	ld [wNumFieldMoves], a
	ld de, wFieldMoves
.printNamesLoop
	push hl ; save hl = current field-move row position
	ld hl, FieldMoveNames
	ld a, [de]
	and a
	jr z, .donePrintingNames
	inc de
	ld b, a ; index of name
.skipNamesLoop ; skip past names before the name we want
	dec b
	jr z, .reachedName
.skipNameLoop ; skip past current name
	ld a, [hli]
	cp '@'
	jr nz, .skipNameLoop
	jr .skipNamesLoop
.reachedName
	ld b, h
	ld c, l
	pop hl  ; restore hl = current field-move row position
	push de
	ld d, b
	ld e, c
	call PlaceString
	ld bc, SCREEN_WIDTH * 2
	add hl, bc ; hl = next row position
	pop de
	jr .printNamesLoop

.donePrintingNames
	pop hl ; restore hl = back to first ordinary menu entry position (STATS)
	ld a, [wFieldMovesLeftmostXCoord]
	ldh [hFieldMoveMonMenuTopMenuItemX], a
	ld de, PokemonMenuEntries
	jp PlaceString


GetMonFieldMoves: ; marcelnote - modified for temporary field moves, from shinpokered
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld c, NUM_MOVES + 1
	ld hl, wFieldMoves
.loop
	push hl
.nextMove
	dec c ; did we check 4 moves already?
	jr z, .tempFieldMove ; marcelnote - for temporary field moves
	ld a, [de] ; move ID
	and a ; is the move slot empty (NO_MOVE)?
	jr z, .tempFieldMove ; marcelnote - for temporary field moves
	ld b, a ; b = move ID
	inc de
	ld hl, FieldMoveDisplayData
.fieldMoveLoop
	ld a, [hli]
	cp $ff
	jr z, .nextMove ; move b was not found in the field moves list
	cp b
	jr z, .foundFieldMove
	inc hl
	inc hl
	jr .fieldMoveLoop
.foundFieldMove
	ld a, [hli] ; field move name index (in FieldMoveDisplayData: 1,2,..)
	ld b, [hl] ; field move leftmost X coordinate
	pop hl
	ld [hli], a ; store name index in wFieldMoves
	ld a, [wNumFieldMoves]
	inc a
	ld [wNumFieldMoves], a
	ld a, [wFieldMovesLeftmostXCoord]
	cp b
	jr c, .loop
	ld a, b
	ld [wFieldMovesLeftmostXCoord], a
	jr .loop
.done
	pop hl
	ret

.tempFieldMove	; marcelnote - for temporary field moves, adapted from shinpokered
	ld a, d ; de points to wPartyMon<n>Moves
	cp $ff
	jr z, .done

	;ld a, [wNumFieldMoves] ; this prevents to display more than 4 field moves
	;cp NUM_MOVES
	;jr nc, .done

	ld a, [wWhichPokemon]
	ld c, a
	ld b, 0
	ld hl, wTempFieldMoves
	add hl, bc

	push hl
	ld a, [hl]
	ld [wMoveNum], a
	callfar CheckIfMoveIsKnown ; maybe move has already been counted if Mon knows it as a battle move
	pop hl
	jr c, .done

	ld a, [hl]
	ld b, a ; a = temporary field move
	ld c, 1
	ld d, $ff
	ld hl, FieldMoveDisplayData
	jr .fieldMoveLoop


IF DEF(_FRA)
	INCLUDE "translation/fra/data/moves/field_moves.fra.asm"
	INCLUDE "translation/fra/data/moves/field_move_names.fra.asm"
	INCLUDE "translation/fra/data/two_option_menus.fra.asm"
	INCLUDE "translation/fra/data/text/pokemon_menu_entries.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/data/moves/field_moves.esp.asm"
	INCLUDE "translation/esp/data/moves/field_move_names.esp.asm"
	INCLUDE "translation/esp/data/two_option_menus.esp.asm"
	INCLUDE "translation/esp/data/text/pokemon_menu_entries.esp.asm"
ELSE
	INCLUDE "data/moves/field_moves.asm"
	INCLUDE "data/moves/field_move_names.asm"
	INCLUDE "data/two_option_menus.asm"
	INCLUDE "data/text/pokemon_menu_entries.asm"
ENDC
