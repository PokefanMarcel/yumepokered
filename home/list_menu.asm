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
	;ld [wListCount], a ; marcelnote - deleted, this is overwitten just below
	ld a, [wListPointer]
	ld l, a
	ld a, [wListPointer + 1]
	ld h, a ; hl = address of the list
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
	ld a, PAD_A | PAD_B | PAD_SELECT | PAD_RIGHT | PAD_LEFT ; marcelnote - added PAD_RIGHT | PAD_LEFT for bag pockets
	ld [wMenuWatchedKeys], a
	ld c, 10
	call DelayFrames

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
.oldManBattle
	ld a, "▶"
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

; pointless because both values are overwritten before they are read ; marcelnote - removed
	;ld a, $01
	;ld [wMenuExitMethod], a
	;ld [wChosenMenuItem], a

	xor a
	ld [wMenuWatchMovingOutOfBounds], a
	ld a, [wCurrentMenuItem]
	ld c, a
	ld a, [wListScrollOffset]
	add c
	ld c, a
	ld a, [wListCount]
	and a ; is the list empty?
	jp z, ExitListMenu ; if so, exit the menu
	dec a
	cp c ; did the player select Cancel?
	jp c, ExitListMenu ; if so, exit the menu
	ld a, c
	ld [wWhichPokemon], a
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jr nz, .skipMultiplying
; if it's an item menu
	sla c ; item entries are 2 bytes long, so multiply by 2
.skipMultiplying
	ld a, [wListPointer]
	ld l, a
	ld a, [wListPointer + 1]
	ld h, a
	inc hl ; hl = beginning of list entries
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wCurListMenuItem], a
	ld a, [wListMenuID]
	cp PCPOKEMONLISTMENU
	jr z, .pokemonList
; if it's an item menu
	ASSERT wCurListMenuItem == wCurItem
	push hl
	call GetItemPrice
	pop hl
	ld a, [wListMenuID]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; marcelnote - pokered Move Deleter/Relearner tutorial
	cp MOVESLISTMENU
	jr z, .skipStoringItemName
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	cp ITEMLISTMENU
	jr nz, .skipGettingQuantity
	inc hl
	ld a, [hl] ; a = item quantity
	ld [wMaxItemQuantity], a
.skipGettingQuantity
	ld a, [wCurItem]
	ld [wNameListIndex], a
	ld a, ITEM_NAME ; marcelnote - added for robustness (needed for TM printing)
	ld [wNameListType], a
	ld a, BANK(ItemNames)
	ld [wPredefBank], a
	call GetName ; stores name in wNameBuffer
	jr .storeChosenEntry
.pokemonList
	ASSERT wCurListMenuItem == wCurPartySpecies
	ld hl, wPartyCount
	ld a, [wListPointer]
	cp l ; is it a list of party pokemon or box pokemon?
	ld hl, wPartyMonNicks
	jr z, .getPokemonName
	ld hl, wBoxMonNicks ; box pokemon names
.getPokemonName
	ld a, [wWhichPokemon]
	call GetPartyMonName ; stores name in wNameBuffer
.storeChosenEntry ; store the menu entry that the player chose and return
	ld de, wNameBuffer
	call CopyToStringBuffer
.skipStoringItemName	; marcelnote - pokered Move Deleter/Relearner tutorial
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
	bit B_PAD_SELECT, a
	jp nz, HandleItemListSwapping ; if so, allow the player to swap menu entries
	;;;;;;;;;; marcelnote - for bag pockets
	bit B_PAD_RIGHT, a
	jr nz, .switchBagPocket
	bit B_PAD_LEFT, a
	jr nz, .switchBagPocket
	;;;;;;;;;;
	;ld b, a
	bit B_PAD_DOWN, a ; marcelnote - changed from bit BIT_D_DOWN, b (no point in using b)
	ld hl, wListScrollOffset
	ld a, [hl] ; marcelnote - moved from below since unconditional
	jr z, .upPressed
.downPressed
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
	ld a, SFX_TINK
	call PlaySound
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jp nz, DisplayListMenuIDLoop
	ld hl, wBagPocketsFlags
	bit BIT_PC_WITHDRAWING, [hl] ; if withdrawing from PC then cannot switch pocket
	jp nz, DisplayListMenuIDLoop
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
	ld b, 1 ; height
	ld c, 3 ; width
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .drawTextBox
; text box dimensions/coordinates for quantity and price
	hlcoord 7, 9
	ld b, 1  ; height
	ld c, 11 ; width
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
	jp .incrementQuantity
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

PrintListMenuEntries::
	hlcoord 5, 3
	ld b, 9
	ld c, 14
	call ClearScreenArea
	ld a, [wListPointer]
	ld e, a
	ld a, [wListPointer + 1]
	ld d, a
	inc de ; de = beginning of list entries
	ld a, [wListScrollOffset]
	ld c, a
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	ld a, c
	jr nz, .skipMultiplying
; if it's an item menu
; item entries are 2 bytes long, so multiply by 2
	sla a
	sla c
.skipMultiplying
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry
	hlcoord 6, 4 ; coordinates of first list entry name
	ld b, 4 ; print 4 names
.loop
	ld a, b
	ld [wWhichPokemon], a
	ld a, [de]
	ld [wNamedObjectIndex], a
	cp $ff
	jp z, .printCancelMenuItem
	push bc
	push de
	push hl
	push hl
	push de ; de = list entries
	ld a, [wListMenuID]
	cp PCPOKEMONLISTMENU
	jr z, .pokemonPCMenu
	cp MOVESLISTMENU
	jr z, .movesMenu
.itemMenu
	call GetItemName
	jr .placeNameString
.pokemonPCMenu
	push hl ; hl coordinates
	ld hl, wPartyCount
	ld a, [wListPointer]
	cp l ; is it a list of party pokemon or box pokemon?
	ld hl, wPartyMonNicks
	jr z, .getPokemonName
	ld hl, wBoxMonNicks ; box pokemon names
.getPokemonName
	ld a, [wWhichPokemon]
	ld b, a
	ld a, 4
	sub b
	ld b, a
	ld a, [wListScrollOffset]
	add b
	call GetPartyMonName
	pop hl ; hl coordinates
	jr .placeNameString
.movesMenu
	call GetMoveName
.placeNameString
	call PlaceString
	pop de
	pop hl
	ld a, [wPrintItemPrices]
	and a ; should prices be printed?
	jr z, .skipPrintingItemPrice
.printItemPrice
	push hl
	ld a, [de]
	ld de, ItemPrices
	ld [wCurItem], a
	call GetItemPrice
	pop hl
	ld bc, SCREEN_WIDTH + 5 ; 1 row down and 5 columns right
	add hl, bc
	ld c, 3 | LEADING_ZEROES | MONEY_SIGN
	call PrintBCDNumber
.skipPrintingItemPrice
	ld a, [wListMenuID]
	cp PCPOKEMONLISTMENU
	jr nz, .skipPrintingPokemonLevel
.printPokemonLevel
	ld a, [wNamedObjectIndex]
	push af
	push hl
	ld hl, wPartyCount
	ld a, [wListPointer]
	cp l ; is it a list of party pokemon or box pokemon?
	ld a, PLAYER_PARTY_DATA
	jr z, .next
	ld a, BOX_DATA
.next
	ld [wMonDataLocation], a
	ld hl, wWhichPokemon
	ld a, [hl]
	ld b, a
	ld a, $04
	sub b
	ld b, a
	ld a, [wListScrollOffset]
	add b
	ld [hl], a
	call LoadMonData
	ld a, [wMonDataLocation]
	and a ; is it a list of party pokemon or box pokemon?
	jr z, .skipCopyingLevel
.copyLevel
	ld a, [wLoadedMonBoxLevel]
	ld [wLoadedMonLevel], a
.skipCopyingLevel
	pop hl
	ld bc, $1c
	add hl, bc
	call PrintLevel
	pop af
	ld [wNamedObjectIndex], a
.skipPrintingPokemonLevel
	pop hl
	pop de
	inc de
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jr nz, .nextListEntry
.printItemQuantity
	ld a, [wNamedObjectIndex]
	ld [wCurItem], a
	call IsKeyItem ; check if item is unsellable
	ld a, [wIsKeyItem]
	and a ; is the item unsellable?
	jr nz, .skipPrintingItemQuantity ; if so, don't print the quantity
	push hl
	ld bc, SCREEN_WIDTH + 8 ; 1 row down and 8 columns right
	add hl, bc
	ld a, "×"
	ld [hli], a
	ld a, [wNamedObjectIndex]
	push af
	ld a, [de]
	ld [wMaxItemQuantity], a
	push de
	ld de, wTempByteValue
	ld [de], a
	lb bc, 1, 2
	call PrintNumber
	pop de
	pop af
	ld [wNamedObjectIndex], a
	pop hl
.skipPrintingItemQuantity
	inc de
	pop bc
	inc c
	push bc
	inc c
	ld a, [wMenuItemToSwap] ; ID of item chosen for swapping (counts from 1)
	and a ; is an item being swapped?
	jr z, .nextListEntry
	sla a
	cp c ; is it this item?
	jr nz, .nextListEntry
	dec hl
	ld a, "▷"
	ld [hli], a
.nextListEntry
	ld bc, 2 * SCREEN_WIDTH ; 2 rows
	add hl, bc
	pop bc
	inc c
	dec b
	jp nz, .loop
	ld bc, -8
	add hl, bc
	ld a, "▼"
	ld [hl], a
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
	ld a, " "
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


GetCurrentMenuItem: ; marcelnote - new for bag pockets and TM printing
	; hovered index = wListScrollOffset + wCurrentMenuItem
	ld a, [wListScrollOffset]
	ld c, a
	ld a, [wCurrentMenuItem]
	add c
	ld c, a
	; hl = list start + 2*index
	ld hl, wListPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl ; hl = beginning of list entries
	ld b, 0
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr z, .continue
	sla c
.continue
	add hl, bc
	ld a, [hl] ; item id under cursor
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
ELSE
	INCLUDE "data/text/list_menu.asm"
ENDC
