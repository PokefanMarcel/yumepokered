StartMenu_Pokedex::
	predef ShowPokedexMenu
	call LoadScreenTilesFromBuffer2 ; restore saved screen
	call Delay3
	call LoadGBPal
	call UpdateSprites
	jp RedisplayStartMenu

StartMenu_Pokemon::
	ld a, [wPartyCount]
	and a
	jp z, RedisplayStartMenu
	xor a
	ld [wMenuItemToSwap], a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wUpdateSpritesEnabled], a
	call DisplayPartyMenu
	jr .checkIfPokemonChosen
.loop
	xor a
	ld [wMenuItemToSwap], a
	ld [wPartyMenuTypeOrMessageID], a
	call GoBackToPartyMenu
.checkIfPokemonChosen
	jr nc, .chosePokemon
.exitMenu
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	jp RedisplayStartMenu
.chosePokemon
	call SaveScreenTilesToBuffer1
	ld a, FIELD_MOVE_MON_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID ; display pokemon menu options - this fills wFieldMoves
	ld hl, wFieldMoves
	lb bc, 2, 12 ; max menu item ID, top menu item Y
	ld e, 6 ; marcelnote - was 5, modified for temporary field moves
.adjustMenuVariablesLoop
	dec e
	jr z, .storeMenuVariables
	ld a, [hli]
	and a ; end of field moves?
	jr z, .storeMenuVariables
	inc b
	dec c
	dec c
	jr .adjustMenuVariablesLoop
.storeMenuVariables
	ld hl, wTopMenuItemY
	ld a, c
	ld [hli], a ; top menu item Y
	ldh a, [hFieldMoveMonMenuTopMenuItemX]
	ld [hli], a ; top menu item X
	xor a
	ld [hli], a ; current menu item ID
	inc hl
	ld a, b
	ld [hli], a ; max menu item ID
	ld a, PAD_A | PAD_B
	ld [hli], a ; menu watched keys
	xor a
	ld [hl], a
	call HandleMenuInput
	push af
	call LoadScreenTilesFromBuffer1 ; restore saved screen
	pop af
	bit B_PAD_B, a
	jp nz, .loop
; if the B button wasn't pressed
	ld a, [wMaxMenuItem]
	ld b, a
	ld a, [wCurrentMenuItem] ; menu selection
	cp b
	jp z, .exitMenu ; if the player chose Cancel
	dec b
	cp b
	jr z, .choseSwitch
	dec b
	cp b
	jp z, .choseStats
	ld c, a
	ld b, 0
	ld hl, wFieldMoves
	add hl, bc
	jp .choseOutOfBattleMove
.choseSwitch
	ld a, [wPartyCount]
	cp 2 ; is there more than one pokemon in the party?
	jp c, StartMenu_Pokemon ; if not, no switching
	call SwitchPartyMon_InitVarOrSwapData ; init [wMenuItemToSwap]
	ld a, SWAP_MONS_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	call GoBackToPartyMenu
	jp .checkIfPokemonChosen
.choseStats
	call ClearSprites
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	predef StatusScreen
	call ReloadMapData
	jp StartMenu_Pokemon
.choseOutOfBattleMove
	push hl
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	pop hl
	ld a, [hl]
	dec a
	add a
	ld b, 0
	ld c, a
	ld hl, .outOfBattleMovePointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wObtainedBadges] ; badges obtained
	jp hl
.outOfBattleMovePointers
	dw .cut
	dw .fly
	dw .surf
	dw .surf
	dw .strength
	dw .flash
	dw .dig
	dw .teleport
	dw .softboiled
.fly
	bit BIT_THUNDERBADGE, a
	jp z, .newBadgeRequired
	call CheckIfInFlyMap ; marcelnote - added more FLY maps
	jr z, .canFly
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, .cannotFlyHereText
	call PrintText
	jp .loop
.canFly
	call ChooseFlyDestination
	ld a, [wStatusFlags6]
	bit BIT_FLY_WARP, a
	jp nz, .goBackToMap
	call LoadFontTilePatterns
	ld hl, wStatusFlags4
	set BIT_UNKNOWN_4_1, [hl]
	jp StartMenu_Pokemon
.cut
	bit BIT_CASCADEBADGE, a
	jp z, .newBadgeRequired
	predef UsedCut
	ld a, [wActionResultOrTookBattleTurn]
	and a
	jp z, .loop
	jp CloseTextDisplay
.surf
	bit BIT_SOULBADGE, a
	jp z, .newBadgeRequired
	callfar IsSurfingAllowed
	ld hl, wStatusFlags1
	bit BIT_SURF_ALLOWED, [hl]
	res BIT_SURF_ALLOWED, [hl]
	jp z, .loop
	ld a, SURFBOARD
	ld [wCurItem], a
	ld [wPseudoItemID], a
	call UseItem
	ld a, [wActionResultOrTookBattleTurn]
	and a
	jp z, .loop
	call GBPalWhiteOutWithDelay3
	jp .goBackToMap
.strength
	bit BIT_RAINBOWBADGE, a
	jp z, .newBadgeRequired
	predef PrintStrengthText
	call GBPalWhiteOutWithDelay3
	jp .goBackToMap
.flash
	bit BIT_BOULDERBADGE, a
	jp z, .newBadgeRequired
	xor a
	ld [wMapPalOffset], a
	ld hl, .flashLightsAreaText
	call PrintText
	call GBPalWhiteOutWithDelay3
	jp .goBackToMap
.flashLightsAreaText
	text_far _FlashLightsAreaText
	text_end
.dig
	ld a, ESCAPE_ROPE
	ld [wCurItem], a
	ld [wPseudoItemID], a
	call UseItem
	ld a, [wActionResultOrTookBattleTurn]
	and a
	jp z, .loop
	call GBPalWhiteOutWithDelay3
	jp .goBackToMap
.teleport
	call CheckIfInFlyMap ; marcelnote - added more FLY maps
	jr z, .canTeleport
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, .cannotUseTeleportNowText
	call PrintText
	jp .loop
.canTeleport
	ld hl, .warpToLastPokemonCenterText
	call PrintText
	ld hl, wStatusFlags6
	set BIT_FLY_WARP, [hl]
	set BIT_ESCAPE_WARP, [hl]
	ld hl, wStatusFlags4
	set BIT_UNKNOWN_4_1, [hl]
	res BIT_NO_BATTLES, [hl]
	ld c, 60
	call DelayFrames
	call GBPalWhiteOutWithDelay3
	jp .goBackToMap
.warpToLastPokemonCenterText
	text_far _WarpToLastPokemonCenterText
	text_end
.cannotUseTeleportNowText
	text_far _CannotUseTeleportNowText
	text_end
.cannotFlyHereText
	text_far _CannotFlyHereText
	text_end
.softboiled
	ld hl, wPartyMon1MaxHP
	ld a, [wWhichPokemon]
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes         ; returns a = 0
	ldh [hDividend], a
	ldh [hDividend + 1], a
	ld a, [hli]
	ldh [hDividend + 2], a
	ld a, [hl]
	ldh [hDividend + 3], a
	ld a, 5
	ldh [hDivisor], a
	call Divide
	ld bc, wPartyMon1HP - wPartyMon1MaxHP
	add hl, bc
	ld a, [hld]
	ld b, a
	ldh a, [hQuotient + 3]
	sub b
	ld b, [hl]
	ldh a, [hQuotient + 2]
	sbc b
	jr nc, .notHealthyEnough
	ld a, [wPartyAndBillsPCSavedMenuItem]
	push af
	ld a, POTION
	ld [wCurItem], a
	ld [wPseudoItemID], a
	call UseItem
	pop af
	ld [wPartyAndBillsPCSavedMenuItem], a
	jp .loop
.notHealthyEnough ; if current HP is less than 1/5 of max HP
	ld hl, NotHealthyEnoughText
	call PrintText
	jp .loop
.goBackToMap
	call RestoreScreenTilesAndReloadTilePatterns
	jp CloseTextDisplay
.newBadgeRequired
	ld hl, NewBadgeRequiredText
	call PrintText
	jp .loop

NotHealthyEnoughText:
	text_far _NotHealthyEnoughText
	text_end

NewBadgeRequiredText:
	text_far _NewBadgeRequiredText
	text_end

; writes a blank tile to all possible menu cursor positions on the party menu
ErasePartyMenuCursors::
	hlcoord 0, 1
	ld bc, 2 * 20 ; menu cursor positions are 2 rows apart
	ld a, 6 ; 6 menu cursor positions
.loop
	ld [hl], " "
	add hl, bc
	dec a
	jr nz, .loop
	ret

ItemMenuLoop:
	call LoadScreenTilesFromBuffer2DisableBGTransfer ; restore saved screen
	call RunDefaultPaletteCommand

StartMenu_Item:: ; marcelnote - BICYCLE does not have special handling anymore
	ld a, [wLinkState]
	dec a ; is the player in the Colosseum or Trade Centre?
	jr nz, .notInCableClubRoom
	ld hl, CannotUseItemsHereText
	call PrintText
	jr .exitMenu
.notInCableClubRoom
	ld bc, wNumBagItems
	;;;;;;;;;; marcelnote - check which pocket we were last in, new for bag pockets
	ld a, [wBagPocketsFlags]
	bit BIT_KEY_ITEMS_POCKET, a
	jr z, .gotBagPocket
	ld bc, wNumBagKeyItems
.gotBagPocket
	;;;;;;;;;;
	ld hl, wListPointer
	ld a, c
	ld [hli], a
	ld [hl], b ; store item bag pointer in wListPointer (for DisplayListMenuID)
	xor a
	ld [wPrintItemPrices], a
	;;;;;;;;;; marcelnote - display bag info box, new for bag pockets
	ld hl, wBagPocketsFlags ; marcelnote - don't display the Info box in the PC, new for bag pockets
	set BIT_PRINT_INFO_BOX, [hl]
	ld a, BAG_INFO_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	;;;;;;;;;;
	ld a, ITEMLISTMENU
	ld [wListMenuID], a
	ld a, [wBagSavedMenuItem]
	ld [wCurrentMenuItem], a
	call DisplayListMenuID
	ld a, [wCurrentMenuItem]
	ld [wBagSavedMenuItem], a
	jr nc, .choseItem
.exitMenu
	;;;;;;;;;; marcelnote - display bag info box, new for bag pockets
	ld hl, wBagPocketsFlags ; marcelnote - stop showing the Info box, new for bag pockets
	res BIT_PRINT_INFO_BOX, [hl]
	;;;;;;;;;;
	call LoadScreenTilesFromBuffer2 ; restore saved screen
	call LoadTextBoxTilePatterns
	call UpdateSprites
	jp RedisplayStartMenu
.choseItem
; erase menu cursor (blank each tile in front of an item name)
	ld a, " "
	ldcoord_a 5, 4
	ldcoord_a 5, 6
	ldcoord_a 5, 8
	ldcoord_a 5, 10
	call PlaceUnfilledArrowMenuCursor
	xor a
	ld [wMenuItemToSwap], a
;;;;;;;;;;;;;;;;;;;;; marcelnote - use items with Select
	callfar CheckIfSelectItem ; sets carry if item can be assigned to Select
	ld a, USE_TOSS_MENU_TEMPLATE
	jr nc, .cannotAssignToSelect
	ld a, USE_SLCT_MENU_TEMPLATE
.cannotAssignToSelect
;;;;;;;;;;;;;;;;;;;;;
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, wTopMenuItemY
	ld a, 11
	ld [hli], a ; top menu item Y
	ld a, 14
	ld [hli], a ; top menu item X
	xor a
	ld [hli], a ; current menu item ID
	inc hl
	inc a ; a = 1
	ld [hli], a ; max menu item ID
	ld a, PAD_A | PAD_B
	ld [hli], a ; menu watched keys
	xor a
	ld [hl], a ; old menu item id
	call HandleMenuInput
	call PlaceUnfilledArrowMenuCursor
	bit B_PAD_B, a
	jp nz, ItemMenuLoop
; if the player made the choice to use / toss / select the item
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	call CopyToStringBuffer
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .tossOrSelectItem ; marcelnote - added SLCT option
; use item
	ld [wPseudoItemID], a ; a must be 0 due to above conditional jump
	ld a, [wCurItem]
	cp HM01
	jr nc, .useItem_partyMenu
	ld hl, UsableItems_CloseMenu
	;ld de, 1
	call IsInList
	jr c, .useItem_closeMenu
	ld a, [wCurItem]
	ld hl, UsableItems_PartyMenu
	;ld de, 1
	call IsInList
	jr c, .useItem_partyMenu
	call UseItem
	jp ItemMenuLoop
.useItem_closeMenu
	xor a
	ld [wPseudoItemID], a
	call UseItem
	ld a, [wActionResultOrTookBattleTurn]
	and a
	jp z, ItemMenuLoop
	;;;;;;;;;; marcelnote - display bag info box, new for bag pockets
	ld hl, wBagPocketsFlags ; marcelnote - don't display the Info box in the PC, new for bag pockets
	res BIT_PRINT_INFO_BOX, [hl]
	;;;;;;;;;;
	jp CloseStartMenu
.useItem_partyMenu
	ld a, [wUpdateSpritesEnabled]
	push af
	call UseItem
	ld a, [wActionResultOrTookBattleTurn]
	cp $02
	jp z, .partyMenuNotDisplayed
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	pop af
	ld [wUpdateSpritesEnabled], a
	jp StartMenu_Item
.partyMenuNotDisplayed
	pop af
	ld [wUpdateSpritesEnabled], a
	jp ItemMenuLoop
.tossOrSelectItem ; marcelnote - added SLCT option
;;;;;;;;;;;;;;;;;;;;; marcelnote - use items with Select
	callfar CheckIfSelectItem ; uses [wCurItem], sets carry if item can be assigned to Select
	jr c, .assignItemToSelect
;;;;;;;;;;;;;;;;;;;;;
	; toss item
	call IsKeyItem
	ld a, [wIsKeyItem]
	and a
	jr nz, .skipAskingQuantity
	call DisplayChooseQuantityMenu
	inc a
	jr z, .tossZeroItems
.skipAskingQuantity
	ld hl, wNumBagItems
	call TossItem
.tossZeroItems
	jp ItemMenuLoop
.assignItemToSelect ; marcelnote - use items with Select
	ld a, [wCurItem]
	ld [wSelectButtonItem], a ; assign item to Select button
	ld hl, ItemWasAssignedToSelectText
	call PrintText
	jp ItemMenuLoop

CannotUseItemsHereText:
	text_far _CannotUseItemsHereText
	text_end

ItemWasAssignedToSelectText: ; marcelnote - use items with Select
	text_far _ItemWasAssignedToSelectText
	text_end

INCLUDE "data/items/use_party.asm"

INCLUDE "data/items/use_overworld.asm"

StartMenu_SaveReset::
	ld a, [wStatusFlags4]
	bit BIT_LINK_CONNECTED, a
	jp nz, Init
	predef SaveSAV ; save the game
	call LoadScreenTilesFromBuffer2 ; restore saved screen
	jp HoldTextDisplayOpen

StartMenu_Option::
	xor a
	ldh [hAutoBGTransferEnabled], a
	call ClearScreen
	call UpdateSprites
	callfar DisplayOptionMenu
	call LoadScreenTilesFromBuffer2 ; restore saved screen
	call LoadTextBoxTilePatterns
	call UpdateSprites
	jp RedisplayStartMenu

SwitchPartyMon::
	call SwitchPartyMon_InitVarOrSwapData ; swap data
	ld a, [wSwappedMenuItem]
	call SwitchPartyMon_ClearGfx
	ld a, [wCurrentMenuItem]
	call SwitchPartyMon_ClearGfx
	jp RedrawPartyMenu_

SwitchPartyMon_ClearGfx:
	push af
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * 2
	call AddNTimes
	ld c, SCREEN_WIDTH * 2
	ld a, " "
.clearMonBGLoop ; clear the mon's row in the party menu
	ld [hli], a
	dec c
	jr nz, .clearMonBGLoop
	pop af
	ld hl, wShadowOAM
	ld bc, $10
	call AddNTimes
	ld de, $4
	ld c, e
.clearMonOAMLoop
	ld [hl], $a0
	add hl, de
	dec c
	jr nz, .clearMonOAMLoop
	call WaitForSoundToFinish
	ld a, SFX_SWAP
	jp PlaySound

SwitchPartyMon_InitVarOrSwapData:
; This is used to initialise [wMenuItemToSwap] and to actually swap the data.
	ld a, [wMenuItemToSwap]
	and a ; has [wMenuItemToSwap] been initialised yet?
	jr nz, .pickedMonsToSwap
; If not, initialise [wMenuItemToSwap] so that it matches the current mon.
	ld a, [wWhichPokemon]
	inc a ; [wMenuItemToSwap] counts from 1
	ld [wMenuItemToSwap], a
	ret
.pickedMonsToSwap
	xor a
	ld [wPartyMenuTypeOrMessageID], a
	ld a, [wMenuItemToSwap]
	dec a
	ld b, a
	ld a, [wCurrentMenuItem]
	ld [wSwappedMenuItem], a
	cp b ; swapping a mon with itself?
	jr nz, .swappingDifferentMons
; can't swap a mon with itself
	xor a
	ld [wMenuItemToSwap], a
	ld [wPartyMenuTypeOrMessageID], a
	ret
.swappingDifferentMons
	ld a, b
	ld [wMenuItemToSwap], a
	call SwapTempFieldMoves ; marcelnote - for temporary field moves
	push hl
	push de
	ld hl, wPartySpecies
	ld d, h
	ld e, l
	ld a, [wCurrentMenuItem]
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	ld a, [wMenuItemToSwap]
	add e
	ld e, a
	jr nc, .noCarry2
	inc d
.noCarry2
	ld a, [hl]
	ldh [hSwapTemp], a
	ld a, [de]
	ld [hl], a
	ldh a, [hSwapTemp]
	ld [de], a
	ld hl, wPartyMons
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wCurrentMenuItem]
	call AddNTimes
	push hl
	ld de, wSwitchPartyMonTempBuffer
	ld bc, wPartyMon2 - wPartyMon1
	call CopyData
	ld hl, wPartyMons
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wMenuItemToSwap]
	call AddNTimes
	pop de
	push hl
	ld bc, wPartyMon2 - wPartyMon1
	call CopyData
	pop de
	ld hl, wSwitchPartyMonTempBuffer
	ld bc, wPartyMon2 - wPartyMon1
	call CopyData
	ld hl, wPartyMonOT
	ld a, [wCurrentMenuItem]
	call SkipFixedLengthTextEntries
	push hl
	ld de, wSwitchPartyMonTempBuffer
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, wPartyMonOT
	ld a, [wMenuItemToSwap]
	call SkipFixedLengthTextEntries
	pop de
	push hl
	ld bc, NAME_LENGTH
	call CopyData
	pop de
	ld hl, wSwitchPartyMonTempBuffer
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, wPartyMonNicks
	ld a, [wCurrentMenuItem]
	call SkipFixedLengthTextEntries
	push hl
	ld de, wSwitchPartyMonTempBuffer
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, wPartyMonNicks
	ld a, [wMenuItemToSwap]
	call SkipFixedLengthTextEntries
	pop de
	push hl
	ld bc, NAME_LENGTH
	call CopyData
	pop de
	ld hl, wSwitchPartyMonTempBuffer
	ld bc, NAME_LENGTH
	call CopyData
	ld a, [wMenuItemToSwap]
	ld [wSwappedMenuItem], a
	xor a
	ld [wMenuItemToSwap], a
	ld [wPartyMenuTypeOrMessageID], a
	pop de
	pop hl
	ret

; marcelnote - for temporary field moves, adapted from shinpokered
SwapTempFieldMoves:	; handles swapping Mons in party
	push hl
	push bc
	push de

	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, 0
	ld hl, wTempFieldMoves
	add hl, bc
	ld d, h
	ld e, l ; de points to field move of first Mon

	ld a, [wMenuItemToSwap]
	ld c, a
	;ld b, 0 ; b = 0 already
	ld hl, wTempFieldMoves
	add hl, bc ; hl points to field move of second Mon

	ld a, [de]
	ld b, a
	ld a, [hl]
	ld [de], a
	ld [hl], b

	pop de
	pop bc
	pop hl
	ret
