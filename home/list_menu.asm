; INPUT:
; [wListMenuID] = list menu ID
; [wListPointer] = address of the list (2 bytes)
DisplayListMenuID::
	xor a
	ldh [hAutoBGTransferEnabled], a ; disable auto-transfer
	ld a, 1
	ldh [hJoy7], a ; joypad state update flag
	ld a, [wBattleType]
	and a ; is it the Old Man battle?
	jr nz, .specialBattleType
	call PrintBagInfoText ; marcelnote - new for bag pockets
	ld a, $01 ; hardcoded bank
	jr .bankswitch
.specialBattleType ; Old Man battle
	ld a, BANK(DisplayBattleMenu)
.bankswitch
	call BankswitchHome
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	ld hl, wListPointer ; marcelnote - small optim
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl = address of the list
	ld a, [hl] ; the first byte is the number of entries in the list
	ld [wListCount], a
	ld a, LIST_MENU_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID ; draw the menu text box
	call UpdateSprites ; disable sprites behind the text box
; the code up to .skipMovingSprites appears to be useless            ; marcelnote - removed it
;	hlcoord 4, 2 ; coordinates of upper left corner of menu text box
;	lb de, 9, 14 ; height and width of menu text box
;	ld a, [wListMenuID]
;	and a ; PCPOKEMONLISTMENU?
;	jr nz, .skipMovingSprites
;	call UpdateSprites
;.skipMovingSprites
	ld a, 1 ; max menu item ID is 1 if the list has less than 2 entries
	ld [wMenuWatchMovingOutOfBounds], a
	ld a, [wListCount]
	cp 2 ; does the list have less than 2 entries?
	jr c, .setMenuVariables
	ld a, 2 ; max menu item ID is 2 if the list has at least 2 entries
.setMenuVariables
	ld [wMaxMenuItem], a
	ld a, 4
	ld [wTopMenuItemY], a
	ld a, 5
	ld [wTopMenuItemX], a
	ld a, PAD_A | PAD_B | PAD_SELECT | PAD_START | PAD_RIGHT | PAD_LEFT ; marcelnote - added PAD_RIGHT | PAD_LEFT for bag pockets, PAD_START for autosort
	ld [wMenuWatchedKeys], a
	ld c, 10
	call DelayFrames
	; fallthrough

DisplayListMenuIDLoop::
	xor a
	ldh [hAutoBGTransferEnabled], a ; disable transfer
	call PrintListMenuEntries
	ld a, 1
	ldh [hAutoBGTransferEnabled], a ; enable transfer
	call Delay3
	ld a, [wBattleType]
	and a ; is it the Old Man battle?
	jr z, .notOldManBattle
; Old Man battle
	ld a, '▶'
	ldcoord_a 5, 4 ; place menu cursor in front of first menu entry
	ld c, 80
	call DelayFrames
	xor a
	ld [wCurrentMenuItem], a
	hlcoord 5, 4
	ld a, l
	ld [wMenuCursorLocation], a
	ld a, h
	ld [wMenuCursorLocation + 1], a
	jr .buttonAPressed
.notOldManBattle
	call LoadGBPal        ; reloads map after using Town map
	call PrintBagInfoText ; marcelnote - for bag pockets and TM printing
	call HandleMenuInput  ; updates wCurrentMenuItem
	push af
	call PlaceMenuCursor
	pop af
	bit B_PAD_A, a
	jp z, .checkOtherKeys
.buttonAPressed
	ld hl, wBagPocketsFlags ; marcelnote - for bag pockets and TM printing
	res BIT_PRINT_INFO_BOX, [hl]
	ld a, [wCurrentMenuItem]
	call PlaceUnfilledArrowMenuCursor
	xor a
	ld [wMenuWatchMovingOutOfBounds], a
	ld a, [wCurrentMenuItem]
	ld c, a
	ld a, [wListScrollOffset]
	add c ; a = entry index (0-based)
	ld hl, wListCount
	cp [hl]
	jp nc, ExitListMenu ; if player selected Cancel or, somehow, something larger
	ld [wWhichPokemon], a
	call GetListMenuEntryAddress
	ld a, [hli]
	ld [wCurListMenuItem], a
	ld a, [wListMenuID]
	cp SPECIALLISTMENU ; marcelnote - these lists don't need price or quantity
	jr z, .skipGettingQuantityAndPrice
	cp ITEMLISTMENU
	jr nz, .skipGettingQuantity
	ld a, [hl] ; a = item quantity
	ld [wMaxItemQuantity], a
.skipGettingQuantity
	ASSERT wCurListMenuItem == wCurItem
	call GetItemPrice
.skipGettingQuantityAndPrice
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName ; stores name in wNameBuffer and returns de pointing to it
	call CopyToStringBuffer
	ld a, CHOSE_MENU_ITEM
	ld [wMenuExitMethod], a
	ld a, [wCurrentMenuItem]
	ld [wChosenMenuItem], a
	xor a
	ldh [hJoy7], a ; joypad state update flag
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	jp BankswitchBack
.checkOtherKeys ; check B, SELECT, Up, and Down keys
	bit B_PAD_B, a
	jp nz, ExitListMenu ; if so, exit the menu
	bit B_PAD_START, a
	jp nz, HandleItemListSorting ; if so, sort item list menus ; marcelnote - added bag autosort
	bit B_PAD_SELECT, a
	jp nz, HandleItemListSwapping ; if so, allow the player to swap menu entries
	;;;;;;;;;; marcelnote - for bag pockets
	bit B_PAD_RIGHT, a
	jr nz, .switchBagPocket
	bit B_PAD_LEFT, a
	jr nz, .switchBagPocket
	;;;;;;;;;;
	bit B_PAD_DOWN, a
	ld hl, wListScrollOffset
	ld a, [hl]
	jr z, .upPressed
; down pressed
	add 3
	ld b, a
	ld a, [wListCount]
	cp b ; will going down scroll past the Cancel button?
	jp c, DisplayListMenuIDLoop
	inc [hl] ; if not, go down
	jp DisplayListMenuIDLoop
.upPressed
	and a
	jp z, DisplayListMenuIDLoop
	dec [hl]
	jp DisplayListMenuIDLoop
.switchBagPocket ; marcelnote - new for bag pockets
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jp nz, DisplayListMenuIDLoop
; Switch pockets in bag only, not PC storage and other lists.
	ld hl, wListPointer
	ld a, [hli]
	cp LOW(wNumBagItems)
	jr z, .checkBagPointerHighByte
	cp LOW(wNumBagKeyItems)
	jp nz, DisplayListMenuIDLoop
.checkBagPointerHighByte
	ASSERT HIGH(wNumBagItems) == HIGH(wNumBagKeyItems)
	ld a, [hl]
	cp HIGH(wNumBagItems)
	jp nz, DisplayListMenuIDLoop
	ld a, SFX_TINK
	call PlaySound
	ld bc, wNumBagItems
	ld a, [wBagPocketsFlags]
	bit BIT_KEY_ITEMS_POCKET, a
	jr nz, .switchToMainPocket
	ld bc, wNumBagKeyItems
.switchToMainPocket
	xor (1 << BIT_KEY_ITEMS_POCKET) ; this switches bit BIT_KEY_ITEMS_POCKET of a
	ld [wBagPocketsFlags], a
	ld a, c
	ld hl, wListPointer
	ld [hli], a
	ld [hl], b ; store item bag pointer in wListPointer (for DisplayListMenuID)
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	call ExitListMenu ; this is to prevent an issue with BankswitchHome in DisplayListMenuID
	jp DisplayListMenuID

DisplayChooseQuantityMenu::
; text box dimensions/coordinates for just quantity
	hlcoord 15, 9
	lb bc, 1, 3 ; height, width
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .drawTextBox
; text box dimensions/coordinates for quantity and price
	hlcoord 7, 9
	lb bc, 1, 11 ; height, width
.drawTextBox
	call TextBoxBorder
	hlcoord 16, 10
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .printInitialQuantity
	hlcoord 8, 10
.printInitialQuantity
	ld de, InitialQuantityText
	call PlaceString
	xor a
	ld [wItemQuantity], a ; initialize current quantity to 0
	jr .incrementQuantity
.waitForKeyPressLoop
	call JoypadLowSensitivity
	ldh a, [hJoyPressed] ; newly pressed buttons
	bit B_PAD_A, a
	jp nz, .buttonAPressed
	bit B_PAD_B, a
	jp nz, .buttonBPressed
	bit B_PAD_UP, a
	jr nz, .incrementQuantity
	bit B_PAD_DOWN, a
	jr nz, .decrementQuantity
	bit B_PAD_RIGHT, a
	jr nz, .incrementQuantityBy10
	bit B_PAD_LEFT, a
	jr nz, .decrementQuantityBy10
	jr .waitForKeyPressLoop
.incrementQuantity
	ld a, [wMaxItemQuantity]
	inc a
	ld b, a
	ld hl, wItemQuantity ; current quantity
	inc [hl]
	ld a, [hl]
	cp b
	jr nz, .handleNewQuantity
; wrap to 1 if the player goes above the max quantity
	ld a, 1
	ld [hl], a
	jr .handleNewQuantity
.incrementQuantityBy10
	ld a, [wMaxItemQuantity]
	inc a
	ld b, a
	ld hl, wItemQuantity ; current quantity
	ld a, [hl]
	add 10
	ld [hl], a
	cp b ; a < max + 1?
	jr c, .handleNewQuantity
	ld a, b
	dec a
	ld [hl], a
	jr .handleNewQuantity
.decrementQuantityBy10
	ld hl, wItemQuantity ; current quantity
	ld a, [hl]
	sub 10
	ld [hl], a
	jr z, .clampTo1
	jr nc, .handleNewQuantity
.clampTo1
	ld [hl], 1
	jr .handleNewQuantity
.decrementQuantity
	ld hl, wItemQuantity ; current quantity
	dec [hl]
	jr nz, .handleNewQuantity
; wrap to the max quantity if the player goes below 1
	ld a, [wMaxItemQuantity]
	ld [hl], a
.handleNewQuantity
	hlcoord 17, 10
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .printQuantity
.printPrice
	ld c, $03
	ld a, [wItemQuantity]
	ld b, a
	ld hl, hMoney ; total price
; initialize total price to 0
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
.addLoop ; loop to multiply the individual price by the quantity to get the total price
	ld de, hMoney + 2
	ld hl, hItemPrice + 2
	push bc
	predef AddBCDPredef ; add the individual price to the current sum
	pop bc
	dec b
	jr nz, .addLoop
	ldh a, [hHalveItemPrices]
	and a ; should the price be halved (for selling items)?
	jr z, .skipHalvingPrice
	xor a
	ldh [hDivideBCDDivisor], a
	ldh [hDivideBCDDivisor + 1], a
	ld a, $02
	ldh [hDivideBCDDivisor + 2], a
	predef DivideBCDPredef ; halves the price
; store the halved price
	ldh a, [hDivideBCDQuotient]
	ldh [hMoney], a
	ldh a, [hDivideBCDQuotient + 1]
	ldh [hMoney + 1], a
	ldh a, [hDivideBCDQuotient + 2]
	ldh [hMoney + 2], a
.skipHalvingPrice
	hlcoord 12, 10
	ld de, SpacesBetweenQuantityAndPriceText
	call PlaceString
	ld de, hMoney ; total price
	ld c, 3 | LEADING_ZEROES | MONEY_SIGN
	call PrintBCDNumber
	hlcoord 9, 10
.printQuantity
	ld de, wItemQuantity ; current quantity
	lb bc, LEADING_ZEROES | 1, 2 ; 1 byte, 2 digits
	call PrintNumber
	jp .waitForKeyPressLoop
.buttonAPressed ; the player chose to make the transaction
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	ret
.buttonBPressed ; the player chose to cancel the transaction
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	ld a, $ff
	ret

InitialQuantityText::
	db "×01@"

SpacesBetweenQuantityAndPriceText::
	db "      @"

ExitListMenu::
	ld a, [wCurrentMenuItem]
	ld [wChosenMenuItem], a
	ld a, CANCELLED_MENU
	ld [wMenuExitMethod], a
	ld [wMenuWatchMovingOutOfBounds], a
	xor a
	ldh [hJoy7], a
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call BankswitchBack
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	scf
	ret

PrintListMenuEntries:: ; marcelnote - optimized
	hlcoord 5, 3
	lb bc, 9, 14
	call ClearScreenArea
	ld a, [wListScrollOffset]
	call GetListMenuEntryAddress
	ld d, h
	ld e, l ; de = first visible entry, c = its byte offset for the swap marker
	hlcoord 6, 4 ; coordinates of first list entry name
	ld b, 4 ; print 4 names
.loop
	ld a, [de]
	ld [wNamedObjectIndex], a
	ld [wCurItem], a
	inc a ; $ff?
	jr z, .printCancelMenuItem
	push bc ; save b = remaining rows, c = swap-marker byte offset
	push de ; save de = list entry pointer
; item menu
	call GetItemName ; reads from wNamedObjectIndex
	call PlaceString
	ld a, [wPrintItemPrices]
	and a
	jr z, .skipPrintingItemPrice
; print item price
	push hl ; save hl = coordinates of current entry's name
	call GetItemPrice ; reads from wCurItem
	pop hl  ; restore hl = coordinates of current entry's name
	push hl ; save hl = coordinates of current entry's name
	ld bc, SCREEN_WIDTH + 5 ; 1 row down and 5 columns right
	add hl, bc
	ld c, 3 | LEADING_ZEROES | MONEY_SIGN
	call PrintBCDNumber
	pop hl  ; restore hl = coordinates of current entry's name
.skipPrintingItemPrice
	pop de  ; restore de = list entry pointer
	inc de
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jr nz, .nextListEntry
; print item quantity
	call IsKeyItem ; reads from wCurItem
	jr nz, .skipPrintingItemQuantity ; don't print the quantity for Key items
	push hl ; save hl = coordinates of current entry's name
	ld bc, SCREEN_WIDTH + 8 ; 1 row down and 8 columns right
	add hl, bc
	ld a, '×'
	ld [hli], a
	lb bc, 1, 2
	call PrintNumber ; preserves de since b=1
	pop hl  ; restore hl = coordinates of current entry's name
.skipPrintingItemQuantity
	inc de
	pop bc  ; restore b = remaining rows, c = swap-marker byte offset
	inc c
	inc c   ; c = next item ID offset
	push bc ; save b = remaining rows, c = next item ID offset
	ld a, [wMenuItemToSwap] ; ID of item chosen for swapping (counts from 1)
	add a
	cp c ; is it this item? also rejects if no item to swap (a=0)
	jr nz, .nextListEntry
	dec hl
	ld a, '▷'
	ld [hli], a
.nextListEntry
	ld bc, 2 * SCREEN_WIDTH ; 2 rows
	add hl, bc
	pop bc  ; restore b = remaining rows, c = swap-marker byte offset
	dec b
	jr nz, .loop
	ld bc, -8
	add hl, bc
	ld [hl], '▼'
	ret
.printCancelMenuItem
	ld de, ListMenuCancelText
	jp PlaceString


PrintBagInfoText: ; marcelnote - new for bag pockets and TM printing
	ld hl, wBagPocketsFlags
	bit BIT_PRINT_INFO_BOX, [hl]
	jr z, .notBag
	ld de, BagItemsText
	ld a, [wBagPocketsFlags]
	bit BIT_KEY_ITEMS_POCKET, a
	jr z, .mainPocket
	ld de, BagKeyItemsText
.mainPocket
	call GetCurrentMenuItem ; returns a = current menu item
	hlcoord 5, 14
	cp $ff ; CANCEL?
	jr z, .notTM
	cp HM_CUT
	jr c, .notTM
	call GetTMHMContent
	hlcoord 5, 14
	ld a, ' '
	ld b, 14 ; clear whole line
.clearLine
	ld [hli], a
	dec b
	jr nz, .clearLine
	ld de, wStringBuffer
	hlcoord 6, 14
.notTM
	jp PlaceString

.notBag
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jr z, .continue
	cp PRICEDITEMLISTMENU
	ret nz
.continue
	call GetCurrentMenuItem
	cp $ff
	jr z, .restoreDefaultText
	cp HM_CUT
	jr c, .restoreDefaultText
	call GetTMHMContent
	hlcoord 1, 14
	lb bc, 3, 18
	call ClearScreenArea
	ld hl, TMItContainsText
	jp PrintText_NoCreatingTextBox
.restoreDefaultText
	; restore the saved text from wTextBoxBuffer (2 rows × 18 tiles at x=1,y=14)
	ld de, wTextBoxBuffer
	hlcoord 1, 14
	ld b, 18
.placeTiles
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .placeTiles
	hlcoord 1, 16
	ld b, 18
.placeTiles2
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .placeTiles2
	ret


GetCurrentMenuItem:: ; marcelnote - new for bag pockets and TM printing
	; hovered index = wListScrollOffset + wCurrentMenuItem
	ld a, [wListScrollOffset]
	ld c, a
	ld a, [wCurrentMenuItem]
	add c
	call GetListMenuEntryAddress
	ld a, [hl] ; item id under cursor
	ret

GetListMenuEntryAddress:: ; marcelnote - optimized getting list entry
; Input: a = zero-based entry index, wListPointer points to the list count.
; Output: hl = entry address, c = byte offset within entries.
; Preserves de; clobbers a, b, and flags.
	ld c, a
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jr nz, .singleByteEntry
	sla c ; item/quantity pairs are two bytes; other list entries are one byte
.singleByteEntry
	ld hl, wListPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl ; hl = beginning of list entries
	ld b, 0
	add hl, bc
	ret


GetTMHMContent: ; marcelnote - new for bag pockets and TM printing
	sub TM01 ; underflows below 0 for HM items (before TM items)
	jr nc, .skipAdding
	add NUM_TMS + NUM_HMS ; adjust HM IDs to come after TM IDs
.skipAdding
	inc a
	ld [wTempTMHM], a
	predef TMToMove ; get move ID from TM/HM ID
	ld a, [wTempTMHM]
	ld [wMoveNum], a
	call GetMoveName
	jp CopyToStringBuffer


IF DEF(_FRA) ; marcelnote - added for translation
	INCLUDE "translation/fra/data/text/list_menu.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/data/text/list_menu.esp.asm"
ELSE
	INCLUDE "data/text/list_menu.asm"
ENDC
