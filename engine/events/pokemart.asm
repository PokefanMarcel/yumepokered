DisplayPokemartDialogue_::
	ld a, [wListScrollOffset]
	ld [wSavedListScrollOffset], a
	call UpdateSprites
	xor a
	ld [wBoughtOrSoldItemInMart], a
.loop
	xor a
	ld [wListScrollOffset], a
	ld [wCurrentMenuItem], a
	ld [wPlayerMonNumber], a
	ld [wListMenuID], a ; marcelnote - for TM printing
	inc a
	ld [wPrintItemPrices], a
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, BUY_SELL_QUIT_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID

	ld a, [wMenuExitMethod]
	cp CANCELLED_MENU
	jp z, .done
	ld a, [wChosenMenuItem]
	and a ; buying?
	jp z, .buyMenu
	dec a ; selling?
	jr z, .sellMenu
	dec a ; quitting?
	jp z, .done
	; fallthrough

.sellMenu
	ld a, [wNumBagItems]
	and a
	jp z, .bagEmpty ; marcelnote - not checking that Key Items pocket is not empty since cannot sell them
	ld hl, PokemonSellingGreetingText
	call PrintText
	call SaveTextBoxTilesToBuffer ; marcelnote - for TM printing
	call Delay3
	call SaveScreenTilesToBuffer1
.sellMenuLoop
;	call LoadScreenTilesFromBuffer1 ; marcelnote - not needed anymore with TM printing
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID ; draw money text box
	;;;;;;;;;; marcelnote - check which pocket we were last in, new for bag pockets
	ld a, [wBagPocketsFlags]
	bit BIT_KEY_ITEMS_POCKET, a
	ld hl, wNumBagItems
	jr z, .gotBagPocket
	ld hl, wNumBagKeyItems
.gotBagPocket
	;;;;;;;;;;
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld [wCurrentMenuItem], a
	ld a, ITEMLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	jp c, .returnToMainPokemartMenu ; player closed the menu
.confirmItemSale ; if the player is trying to sell a specific item
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	call IsKeyItem ; item already loaded in [wCurItem]?
	ld a, [wIsKeyItem]
	and a
	jr nz, .unsellableItem
;	ld a, [wCurItem] ; marcelnote - removed, IsKeyItem already recognizes HMs as Key items
;	call IsItemHM
;	jr c, .unsellableItem
	ld a, PRICEDITEMLISTMENU
	ld [wListMenuID], a
	ldh [hHalveItemPrices], a ; halve prices when selling (PRICEDITEMLISTMENU > 0) ; marcelnote - modified list constants
	ASSERT PRICEDITEMLISTMENU > 0
	call DisplayChooseQuantityMenu
	inc a
	jr z, .sellMenuLoop ; if the player closed the choose quantity menu with the B button
	ld hl, PokemartTellSellPriceText
	call PrintText
	hlcoord 14, 7
	lb bc, 8, 15
	xor a               ; NOLISTMENU
	ld [wListMenuID], a ; marcelnote - for TM printing
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID ; yes/no menu
	ld a, [wMenuExitMethod]
	cp CHOSE_SECOND_ITEM
	jr z, .sellMenuLoop ; if the player chose No or pressed the B button

; sell item
	ld a, [wBoughtOrSoldItemInMart]
	and a
	jr nz, .skipSettingFlag1
	inc a
	ld [wBoughtOrSoldItemInMart], a
.skipSettingFlag1
	call AddAmountSoldToMoney
	ld hl, wNumBagItems
	call RemoveItemFromInventory
	jr .sellMenuLoop
.unsellableItem
	ld hl, PokemartUnsellableItemText
	call PrintText
	jp .sellMenuLoop ; marcelnote - was returnToMainPokemartMenu
.bagEmpty
	ld hl, PokemartItemBagEmptyText
	call PrintText
	call SaveScreenTilesToBuffer1
	jp .returnToMainPokemartMenu

.buyMenu
	ld hl, PokemartBuyingGreetingText
	call PrintText
	call SaveTextBoxTilesToBuffer ; marcelnote - for TM printing
	call Delay3
	call SaveScreenTilesToBuffer1
.buyMenuLoop
;	call LoadScreenTilesFromBuffer1 ; marcelnote - not needed anymore with TM printing
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, wItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wCurrentMenuItem], a
	inc a
	ld [wPrintItemPrices], a
	ld a, PRICEDITEMLISTMENU ; marcelnote - modified list constants
	ld [wListMenuID], a
	call DisplayListMenuID
	jr c, .returnToMainPokemartMenu ; player closed the menu
.askQuantity
	ld hl, wStatusFlags5 ; marcelnote - for TM printing
	set BIT_NO_TEXT_DELAY, [hl]
	ld a, 99
	ld [wMaxItemQuantity], a
	xor a
	ldh [hHalveItemPrices], a ; don't halve item prices when buying
	call DisplayChooseQuantityMenu
	inc a
	jr z, .buyMenuLoop ; if the player closed the choose quantity menu with the B button
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	call CopyToStringBuffer
	ld hl, PokemartTellBuyPriceText
	call PrintText
	hlcoord 14, 7
	lb bc, 8, 15
	xor a               ; NOLISTMENU
	ld [wListMenuID], a ; marcelnote - for TM printing
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID ; yes/no menu
	ld a, [wMenuExitMethod]
	cp CHOSE_SECOND_ITEM
	jr z, .buyMenuLoop ; if the player chose No or pressed the B button

; buy item
	call .isThereEnoughMoney
	jr c, .notEnoughMoney
	ld hl, wNumBagItems
	call AddItemToInventory
	jr nc, .bagFull
	call SubtractAmountPaidFromMoney
	ld a, [wBoughtOrSoldItemInMart]
	and a
	jr nz, .skipSettingFlag2
	ld a, 1
	ld [wBoughtOrSoldItemInMart], a
.skipSettingFlag2
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld hl, PokemartBoughtItemText
	call PrintText
	jp .buyMenuLoop
.returnToMainPokemartMenu
	call LoadScreenTilesFromBuffer1
	xor a               ; NOLISTMENU
	ld [wListMenuID], a ; marcelnote - for TM printing
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, PokemartAnythingElseText
	call PrintText
	jp .loop
.isThereEnoughMoney
	ld de, wPlayerMoney
	ld hl, hMoney
	ld c, 3 ; length of money in bytes
	jp StringCmp
.notEnoughMoney
	ld hl, PokemartNotEnoughMoneyText
	call PrintText
	jr .returnToMainPokemartMenu
.bagFull
	ld hl, PokemartItemBagFullText
	call PrintText
	jr .returnToMainPokemartMenu
.done
	ld hl, PokemartThankYouText
	call PrintText
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	call UpdateSprites
	ld a, [wSavedListScrollOffset]
	ld [wListScrollOffset], a
	ret


PokemartBuyingGreetingText:
	text_far _PokemartBuyingGreetingText
	text_end

PokemartTellBuyPriceText:
	text_far _PokemartTellBuyPriceText
	text_end

PokemartBoughtItemText:
	text_far _PokemartBoughtItemText
	text_end

PokemartNotEnoughMoneyText:
	text_far _PokemartNotEnoughMoneyText
	text_end

PokemartItemBagFullText:
	text_far _PokemartItemBagFullText
	text_end

PokemonSellingGreetingText:
	text_far _PokemonSellingGreetingText
	text_end

PokemartTellSellPriceText:
	text_far _PokemartTellSellPriceText
	text_end

PokemartItemBagEmptyText:
	text_far _PokemartItemBagEmptyText
	text_end

PokemartUnsellableItemText:
	text_far _PokemartUnsellableItemText
	text_end

PokemartThankYouText:
	text_far _PokemartThankYouText
	text_end

PokemartAnythingElseText:
	text_far _PokemartAnythingElseText
	text_end
