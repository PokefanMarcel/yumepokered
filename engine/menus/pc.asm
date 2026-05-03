ActivatePC::
	call SaveScreenTilesToBuffer2
	ld a, SFX_TURN_ON_PC
	call PlaySound
	ld hl, TurnedOnPC1Text
	call PrintText
	call WaitForSoundToFinish
	ld hl, wMiscFlags
	set BIT_USING_GENERIC_PC, [hl]
	call LoadScreenTilesFromBuffer2
	call Delay3
PCMainMenu:
	callfar DisplayPCMainMenu
PCMainMenuHandle: ; marcelnote - revamped Bill's PC, simplified branching below
	ld hl, wMiscFlags
	set BIT_NO_MENU_BUTTON_SOUND, [hl]
	call HandleMenuInput
	bit B_PAD_B, a
	jr nz, .LogOff
	ld a, [wMaxMenuItem]
	ld b, a
	ld a, [wCurrentMenuItem]
	cp b ; last menu item?
	jr z, .LogOff
	and a
	jr z, .BillsPC
	dec a
	jr z, .PlayersPC
	dec a
	jr z, .OaksPC
	; fallthrough

.PKMNLeague
	ld a, SFX_ENTER_PC
	call PlaySound
	call WaitForSoundToFinish
	callfar PKMNLeaguePC
	jr ReloadMainMenu

.LogOff
	ld a, SFX_TURN_OFF_PC
	call PlaySound
	call WaitForSoundToFinish
	ld hl, wMiscFlags
	res BIT_USING_GENERIC_PC, [hl]
	res BIT_NO_MENU_BUTTON_SOUND, [hl]
	ret

.PlayersPC
	ld hl, wMiscFlags
	res BIT_NO_MENU_BUTTON_SOUND, [hl]
	set BIT_USING_GENERIC_PC, [hl]
	ld a, SFX_ENTER_PC
	call PlaySound
	call WaitForSoundToFinish
	ld hl, AccessedMyPCText
	call PrintText
	callfar PlayerPC
	jr ReloadMainMenu

.OaksPC
	ld a, SFX_ENTER_PC
	call PlaySound
	call WaitForSoundToFinish
	callfar OpenOaksPC
	jr ReloadMainMenu

.BillsPC ; marcelnote - revamped Bill's PC
	ld a, SFX_ENTER_PC
	call PlaySound
	call WaitForSoundToFinish
	CheckEvent EVENT_MET_BILL
	ld hl, AccessedBillsPCText
	jr nz, .got_text ; if you've met bill, use "Bill's" instead of "Someone's"
	ld hl, AccessedSomeonesPCText
.got_text
	call PrintText
	callfar BillsPC
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call ReloadMapData
	call UpdateSprites
	callfar DisplayPCMainMenu
	call Delay3
	call GBPalNormal
	jp PCMainMenuHandle

ReloadMainMenu:
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call ReloadMapData
	call UpdateSprites
	jp PCMainMenu

TurnedOnPC1Text:
	text_far _TurnedOnPC1Text
	text_end

AccessedBillsPCText:
	text_far _AccessedBillsPCText
	text_end

AccessedSomeonesPCText:
	text_far _AccessedSomeonesPCText
	text_end

AccessedMyPCText:
	text_far _AccessedMyPCText
	text_end

; removes one of the specified item ID [hItemToRemoveID] from bag (if existent)
RemoveItemByID::
	ld hl, wBagItems
	ldh a, [hItemToRemoveID]
	ld b, a
	;;;;;;;;;; marcelnote - new for bag pockets
	ld [wCurItem], a ; should we save what's in wCurItem before?
	call IsKeyItem
	ld a, [wIsKeyItem]
	and a
	jr z, .notKeyItem
	ld hl, wBagKeyItems
.notKeyItem
	;;;;;;;;;;
	xor a
	ldh [hItemToRemoveIndex], a
.loop
	ld a, [hli]
	cp -1 ; reached terminator?
	ret z
	cp b
	jr z, .foundItem
	inc hl
	ldh a, [hItemToRemoveIndex]
	inc a
	ldh [hItemToRemoveIndex], a
	jr .loop
.foundItem
	ld a, $1
	ld [wItemQuantity], a
	ldh a, [hItemToRemoveIndex]
	ld [wWhichPokemon], a
	ld hl, wNumBagItems
	;;;;;;;;;; marcelnote - new for bag pockets
	ld a, [wIsKeyItem]
	and a
	jr z, .notKeyItem2
	ld hl, wNumBagKeyItems
.notKeyItem2
	;;;;;;;;;;
	jp RemoveItemFromInventory
