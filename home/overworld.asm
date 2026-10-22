EnterMap::
; Load a new map.
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	call ReloadSGBBorder ; marcelnote - dynamic SGB border, reload while transition still hidden
	call LoadMapData
	callfar ClearVariablesOnEnterMap
	ld hl, wStatusFlags2
	bit BIT_WILD_ENCOUNTER_COOLDOWN, [hl]
	jr z, .skipGivingThreeStepsOfNoRandomBattles
	ld a, 3 ; minimum number of steps between battles
	ld [wNumberOfNoRandomBattleStepsLeft], a
.skipGivingThreeStepsOfNoRandomBattles
	ld hl, wStatusFlags4
	bit BIT_BATTLE_OVER_OR_BLACKOUT, [hl]
	res BIT_BATTLE_OVER_OR_BLACKOUT, [hl]
	jr nz, .skipStrengthReset
	ld hl, wStatusFlags1
	res BIT_STRENGTH_ACTIVE, [hl]
.skipStrengthReset
	call nz, MapEntryAfterBattle
	ld hl, wStatusFlags6
	ld a, [hl]
	and (1 << BIT_FLY_WARP) | (1 << BIT_DUNGEON_WARP)
	jr z, .didNotEnterUsingFlyWarpOrDungeonWarp
	res BIT_FLY_WARP, [hl]
	callfar EnterMapAnim
	call UpdateSprites
.didNotEnterUsingFlyWarpOrDungeonWarp
	callfar CheckForceBikeOrSurf ; handle currents in SF islands and forced bike riding in cycling road
	ld hl, wStatusFlags3
	res BIT_NO_NPC_FACE_PLAYER, [hl]
	call UpdateSprites
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	set BIT_CUR_MAP_LOADED_2, [hl]
	xor a
	ld [wJoyIgnore], a
	; fallthrough

OverworldLoop::
	call DelayFrame
	; fallthrough

OverworldLoopLessDelay::
	call DelayFrame
	call LoadGBPal
	ld a, [wMovementFlags]
	bit BIT_LEDGE_OR_FISHING, a
	jr z, .checkWalkAnimation
	callfar HandleMidJump
.checkWalkAnimation
	ld a, [wWalkCounter]
	and a
	jp nz, .moveAhead ; if the player sprite has not yet completed the walking animation
	call JoypadOverworld ; get joypad state (which is possibly simulated)
	CheckEvent EVENT_IN_SAFARI_ZONE
	jr z, .skipSafariZoneCheck
	callfar SafariZoneCheck
	ld a, [wSafariZoneGameOver]
	and a
	jp nz, WarpFound2
.skipSafariZoneCheck
	ld hl, wStatusFlags3
	bit BIT_WARP_FROM_CUR_SCRIPT, [hl]
	res BIT_WARP_FROM_CUR_SCRIPT, [hl]
	jp nz, WarpFound2
	ld a, [wStatusFlags6]
	and (1 << BIT_FLY_WARP) | (1 << BIT_DUNGEON_WARP)
	jp nz, HandleFlyWarpOrDungeonWarp
	;;;;;;;;;; marcelnote - new for PokéBeeper
	ld a, [wStatusFlags2]
	bit BIT_POKE_BEEPER_ALERT, a
	jr z, .noPokeBeeperAlert
	callfar GetPokeBeeperAlert
.noPokeBeeperAlert
	;;;;;;;;;;
	ld a, [wCurOpponent]
	and a
	jp nz, .newBattle
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	jr z, .notSimulating
	ldh a, [hJoyHeld]
	jr .checkIfStartIsPressed
.notSimulating
	ldh a, [hJoyPressed]
.checkIfStartIsPressed
	bit B_PAD_START, a
	jr z, .checkIfSelectIsPressed ; marcelnote - was .checkIfAIsPressed
; if START is pressed
	xor a ; TEXT_START_MENU
	ldh [hTextID], a
	jr .displayDialogue
;;;;;;;;;;;;;;;;;;;;;;;;;; marcelnote - use items with Select
.checkIfSelectIsPressed
	bit B_PAD_SELECT, a
	jr z, .checkIfAIsPressed
; if SELECT is pressed
	callfar UseSelectButtonItem
	jr OverworldLoop
;;;;;;;;;;;;;;;;;;;;;;;;;;
.checkIfAIsPressed
	bit B_PAD_A, a
	jp z, .checkIfDownButtonIsPressed
; if A is pressed
	ld a, [wStatusFlags5]
	bit BIT_UNKNOWN_5_2, a
	jr nz, .noDirectionButtonsPressed
	call IsPlayerCharacterBeingControlledByGame
	jr nz, .checkForOpponent
	callfar CheckForCut ; jp OverworldLoop if succeeds ; this causes to cut before finding potion in Viridian
	ldh a, [hOverworldHMUseFound]
	and a
	jp nz, OverworldLoop
;	call CheckForHiddenObjectOrBookshelfOrCardKeyDoor
;	ldh a, [hItemAlreadyFound] ; a = $ff if not found, = 0 if found
;	and a
;	jp z, OverworldLoop ; jump if a hidden event or bookshelf was found, but not if a card key door was found
	call IsSpriteOrSignInFrontOfPlayer
	ldh a, [hTextID]
	and a
	jr nz, .displayDialogue ; checks for Strength via BoulderText
	call CheckForHiddenEventOrBookshelfOrCardKeyDoor ; marcelnote - check Hidden objects after sprites
	ldh a, [hItemAlreadyFound] ; a = $ff if not found, = 0 if found
	and a
	jp z, OverworldLoop ; jump if a hidden object or bookshelf was found, but not if a card key door was found
	callfar CheckForSurf ; jp OverworldLoop if succeeds
	ldh a, [hOverworldHMUseFound]
	and a
	jp nz, OverworldLoop
	callfar CheckForFlash ; jp OverworldLoop if succeeds
	jp OverworldLoop
.displayDialogue
	predef GetTileAndCoordsInFrontOfPlayer
	call UpdateSprites
	ld a, [wMiscFlags]
	and (1 << BIT_TURNING) | (1 << BIT_SEEN_BY_TRAINER)
	jr nz, .checkForOpponent
	lda_coord 8, 9
	ld [wTilePlayerStandingOn], a ; checked when using Surf for forbidden tile pairs
	call DisplayTextID ; display either the start menu or the NPC/sign text
	ld a, [wEnteringCableClub] ; 0 or 1
	dec a
	jr nz, .checkForOpponent
	; marcelnote - removed below unreachable code
;	dec a ; 1?
;	ld a, 0 ; preserve Z flag
;	ld [wEnteringCableClub], a
;	jr z, .changeMap
;; XXX can this code be reached?
;	predef TryLoadSaveFile
;	ld a, [wCurMap]
;	ld [wDestinationMap], a
;	call PrepareForSpecialWarp
;	ld a, [wCurMap]
;	call SwitchToMapRomBank
;	ld hl, wCurMapTileset
;	set BIT_NO_PREVIOUS_MAP, [hl]
;.changeMap
	ld [wEnteringCableClub], a
	jp EnterMap
.checkForOpponent
	ld a, [wCurOpponent]
	and a
	jp nz, .newBattle
	jp OverworldLoop
.noDirectionButtonsPressed
	ld hl, wMiscFlags
	res BIT_TURNING, [hl]
	call SwitchRunningToWalkingSprites ; marcelnote - running sprites
	call UpdateSprites
	ld a, 1
	ld [wTurnInPlaceDelay], a
	ld a, [wPlayerMovingDirection] ; the direction that was pressed last time
	and a
	jp z, OverworldLoop
; if a direction was pressed last time
	ld [wPlayerLastStopDirection], a ; save the last direction
	xor a
	ld [wPlayerMovingDirection], a ; zero the direction
	jp OverworldLoop

.checkIfDownButtonIsPressed
	ldh a, [hJoyHeld] ; current joypad state
	bit B_PAD_DOWN, a
	jr z, .checkIfUpButtonIsPressed
	ld a, 1
	ld [wSpritePlayerStateData1YStepVector], a
	ld a, PLAYER_DIR_DOWN
	jr .handleDirectionButtonPress

.checkIfUpButtonIsPressed
	bit B_PAD_UP, a
	jr z, .checkIfLeftButtonIsPressed
	ld a, -1
	ld [wSpritePlayerStateData1YStepVector], a
	ld a, PLAYER_DIR_UP
	jr .handleDirectionButtonPress

.checkIfLeftButtonIsPressed
	bit B_PAD_LEFT, a
	jr z, .checkIfRightButtonIsPressed
	ld a, -1
	ld [wSpritePlayerStateData1XStepVector], a
	ld a, PLAYER_DIR_LEFT
	jr .handleDirectionButtonPress

.checkIfRightButtonIsPressed
	bit B_PAD_RIGHT, a
	jr z, .noDirectionButtonsPressed
	ld a, 1
	ld [wSpritePlayerStateData1XStepVector], a
	ASSERT PLAYER_DIR_RIGHT == 1
	; fallthrough

.handleDirectionButtonPress
	ld [wPlayerDirection], a ; new direction
	ld b, a
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	jr nz, .noDirectionChange ; ignore direction changes during scripted movement
	ld a, [wTurnInPlaceDelay]
	and a
	jr z, .noDirectionChange
	ld a, [wPlayerLastStopDirection] ; old direction
	cp b
	jr z, .noDirectionChange
; Check whether the player did a 180-degree turn.
; It appears that this code was supposed to show the player rotate by having
; the player's sprite face an intermediate direction before facing the opposite
; direction (instead of doing an instantaneous about-face), but the intermediate
; direction is only set for a short period of time. It is unlikely for it to
; ever be visible because DelayFrame is called at the start of OverworldLoop and
; normally not enough cycles would be executed between then and the time the
; direction is set for V-blank to occur while the direction is still set.
; marcelnote - removed this intermediate direction code since it's not visible
;	swap a ; put old direction in upper half
;	or b ; put new direction in lower half
;	cp (PLAYER_DIR_DOWN << 4) | PLAYER_DIR_UP ; change dir from down to up
;	jr nz, .notDownToUp
;	ld a, PLAYER_DIR_LEFT
;	ld [wPlayerMovingDirection], a
;	jr .holdIntermediateDirectionLoop
;.notDownToUp
;	cp (PLAYER_DIR_UP << 4) | PLAYER_DIR_DOWN ; change dir from up to down
;	jr nz, .notUpToDown
;	ld a, PLAYER_DIR_RIGHT
;	ld [wPlayerMovingDirection], a
;	jr .holdIntermediateDirectionLoop
;.notUpToDown
;	cp (PLAYER_DIR_RIGHT << 4) | PLAYER_DIR_LEFT ; change dir from right to left
;	jr nz, .notRightToLeft
;	ld a, PLAYER_DIR_DOWN
;	ld [wPlayerMovingDirection], a
;	jr .holdIntermediateDirectionLoop
;.notRightToLeft
;	cp (PLAYER_DIR_LEFT << 4) | PLAYER_DIR_RIGHT ; change dir from left to right
;	jr nz, .holdIntermediateDirectionLoop
;	ld a, PLAYER_DIR_UP
;	ld [wPlayerMovingDirection], a
;.holdIntermediateDirectionLoop
	ld hl, wMiscFlags
	set BIT_TURNING, [hl]
	xor a
	ld [wTurnInPlaceDelay], a
;	ld hl, wCheckFor180DegreeTurn
;	dec [hl]
;	jr nz, .holdIntermediateDirectionLoop
	ld a, b
	ld [wPlayerMovingDirection], a
	call NewBattle
	jp c, .battleOccurred
	jp OverworldLoop

.noDirectionChange ; marcelnote - refactored warp engine
	ld a, b
	ld [wPlayerMovingDirection], a ; save direction
	call UpdateSprites
	call CheckWarpAtPlayerCoord
	jp c, WarpFound2
	ld a, [wWalkBikeSurfState]
	cp SURFING
	jr z, .surfing
; not surfing
	call CollisionCheckOnLand
	jr nc, .noCollision
; collision occurred
	jp OverworldLoop

.surfing
	call CollisionCheckOnWater
	jp c, OverworldLoop

.noCollision
	ld a, $08
	ld [wWalkCounter], a
	jr .moveAhead2

.moveAhead
	ld a, [wMovementFlags]
	bit BIT_SPINNING, a
	jr z, .noSpinning
	callfar LoadSpinnerArrowTiles
.noSpinning
	call UpdateSprites

.moveAhead2 ; marcelnote - changes to handle running, faster swimming, and faster spinning
	ld hl, wMiscFlags
	res BIT_TURNING, [hl]
	ld a, [wMovementFlags]
	bit BIT_LEDGE_OR_FISHING, a ; jumping a ledge?
	jr nz, .normalPlayerSpriteAdvancement
	bit BIT_SPINNING, a ; spinning?
	jr nz, .speedUp
	ld a, [wWalkBikeSurfState]
	dec a ; BIKING?
	jr z, .speedUp
	dec a ; SURFING?
	jr z, .checkSurfSpeed
; walking
	ld hl, wStatusFlags6
	ld a, [wWalkCounter]
	cp $08
	jr nz, .checkWalkingSpeed
; Only switch walking/running graphics at the start of a step. BIT_RUNNING means
; that running graphics are loaded and this whole step should be fast.
	ldh a, [hJoyHeld]
	and PAD_B
	jr nz, .startOrContinueRunning
	bit BIT_RUNNING, [hl]
	jr z, .normalPlayerSpriteAdvancement
	call LoadWalkingPlayerSpriteGraphics
	jr .normalPlayerSpriteAdvancement
.startOrContinueRunning
	bit BIT_RUNNING, [hl]
	jr nz, .speedUp
	call LoadRunningPlayerSpriteGraphics
	jr .speedUp
.checkWalkingSpeed
	bit BIT_RUNNING, [hl]
	jr nz, .speedUp
	jr .normalPlayerSpriteAdvancement
.checkSurfSpeed
	ldh a, [hJoyHeld]
	and PAD_B
	jr z, .normalPlayerSpriteAdvancement
.speedUp
	call DoBikeSpeedup
.normalPlayerSpriteAdvancement
	call AdvancePlayerSprite
	ld a, [wWalkCounter]
	and a
	jp nz, CheckMapConnections ; it seems like this check will never succeed (the other place where CheckMapConnections is run works)
; walking animation finished
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	jr nz, .doneStepCounting ; if button presses are being simulated, don't count steps
; step counting
	ld hl, wStepCounter
	dec [hl]
	inc hl ; wNumberOfNoRandomBattleStepsLeft
	ld a, [hl]
	and a
	jr z, .doneStepCounting
	dec [hl]
	jr nz, .doneStepCounting
	ld hl, wStatusFlags2
	res BIT_WILD_ENCOUNTER_COOLDOWN, [hl]
.doneStepCounting
	CheckEvent EVENT_IN_SAFARI_ZONE
	jr z, .notSafariZone
	callfar SafariZoneCheckSteps
	ld a, [wSafariZoneGameOver]
	and a
	jp nz, WarpFound2
.notSafariZone
	ld a, [wIsInBattle]
	and a
	jr nz, CheckWarpsNoCollision
	predef ApplyOutOfBattlePoisonDamage ; also increment daycare mon exp
	ld a, [wOutOfBattleBlackout]
	and a
	jp nz, HandleBlackOut ; if all pokemon fainted
.newBattle
	call NewBattle
	jr nc, CheckWarpsNoCollision ; check for warps if there was no battle
.battleOccurred
	ld hl, wStatusFlags3
	res BIT_TALKED_TO_TRAINER, [hl]
	ld hl, wStatusFlags7
	res BIT_TRAINER_BATTLE, [hl]
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	set BIT_CUR_MAP_LOADED_2, [hl]
	xor a
	ldh [hJoyHeld], a
	ld hl, wStatusFlags4
	set BIT_BATTLE_OVER_OR_BLACKOUT, [hl]
	ld a, [wCurMap]
	cp OAKS_LAB
	jr z, .noFaintCheck ; no blacking out if the player lost to the rival in Oak's lab
	cp BATTLE_HALL
	jr z, .noFaintCheck ; marcelnote - new for Battle Hall, no blacking out there
	callfar AnyPartyAlive
	ld a, d
	and a
	jr z, .allPokemonFainted
.noFaintCheck
	ld c, 10
	call DelayFrames
	jp EnterMap
.allPokemonFainted
	ld a, LOST_BATTLE
	ld [wIsInBattle], a
	call RunMapScript
	jp HandleBlackOut

; function to determine if there will be a battle and execute it (either a trainer battle or wild battle)
; sets carry if a battle occurred and unsets carry if not
NewBattle:: ; marcelnote - optimized
	ld a, [wStatusFlags6]
	and 1 << BIT_DUNGEON_WARP
	ret nz ; no battle during a dungeon warp
	call IsPlayerCharacterBeingControlledByGame ; returns carry clear
	ret nz ; no battle during scripted movement
	ld a, [wStatusFlags4]
	and 1 << BIT_NO_BATTLES
	ret nz
	jpfar InitBattle

; check if the player has stepped onto a warp after having not collided
CheckWarpsNoCollision:: ; marcelnote - refactored warp engine
	call TryWarpAtPlayerCoord
	jp nc, CheckMapConnections
	ld a, [wDestinationWarpID]
	and WARP_DIR_MASK ; ANY_DIR?
	jp nz, CheckMapConnections
	jr WarpFound2

; returns carry if the player's coordinates match a warp, and copies the
; destination warp/map for WarpFound2
TryWarpAtPlayerCoord: ; marcelnote - refactored warp engine
	ld a, [wNumberOfWarps]
	and a
	ret z
	ld c, a
	ld hl, wYCoord
	ld a, [hli]
	ld e, [hl] ; e = wXCoord
	ld d, a    ; d = wYCoord
	ld hl, wWarpEntries
.loop
	ld a, [hli] ; Y coordinate of warp
	cp d
	ld a, [hli] ; X coordinate of warp
	jr nz, .retry
	cp e
	jr nz, .retry
	ld a, [hli]
	ld [wDestinationWarpID], a
	ld a, [hl]
	ldh [hWarpDestinationMap], a
	scf
	ret
.retry
	inc hl
	inc hl
	dec c
	jr nz, .loop
	and a
	ret

WarpFound2:: ; marcelnote - refactored warp engine
	ld a, [wDestinationWarpID]
	cp $ff
	jr z, .gotDestinationWarpID
	and WARP_ID_MASK
	ld [wDestinationWarpID], a
.gotDestinationWarpID
	ld a, [wNumberOfWarps]
	sub c
	ld [wWarpedFromWhichWarp], a ; save ID of used warp
	ld a, [wCurMap]
	ld [wWarpedFromWhichMap], a
	call CheckIfInOutsideMap
	jr nz, .indoorMaps
; this is for handling "outside" maps that can't have the 0xFF destination map
	ld a, [wCurMap]
	ld [wLastMap], a
;	ld a, [wCurMapWidth]
;	ld [wUnusedLastMapWidth], a ; marcelnote - removed wUnusedLastMapWidth
	ldh a, [hWarpDestinationMap]
	ld [wCurMap], a
	cp ROCK_TUNNEL_1F
	jr nz, .notRockTunnel
	ld a, $06
	ld [wMapPalOffset], a
	call GBFadeOutToBlack
.notRockTunnel
	call PlayMapChangeSound
	jr .done

; for maps that can have the 0xFF destination map, which means to return to the outside map
; not all these maps are necessarily indoors, though
.indoorMaps
	ldh a, [hWarpDestinationMap]
	cp LAST_MAP
	jr z, .goBackOutside
; if not going back to the previous map
	ld [wCurMap], a
	callfar IsPlayerStandingOnWarpPadOrHole
	ld a, [wStandingOnWarpPadOrHole]
	dec a ; is the player on a warp pad?
	jr nz, .notWarpPad
; if the player is on a warp pad
	ld hl, wStatusFlags6
	set BIT_FLY_WARP, [hl]
	call LeaveMapAnim
	jr .skipMapChangeSound
.notWarpPad
	call PlayMapChangeSound
.skipMapChangeSound
	ld hl, wMovementFlags
	res BIT_EXITING_DOOR, [hl]
	jr .setStandingOnDoor
.goBackOutside
	ld a, [wLastMap]
	ld [wCurMap], a
	call PlayMapChangeSound
	xor a
	ld [wMapPalOffset], a
.done
	ld hl, wMovementFlags
.setStandingOnDoor
	set BIT_STANDING_ON_DOOR, [hl] ; have the player's sprite step out from the door (if there is one)
	call IgnoreInputForHalfSecond
	jp EnterMap

; if no matching warp was found
CheckMapConnections:: ; marcelnote - optimized
; check west map
	ld a, [wXCoord]
	ld b, a
	ld hl, wWestConnectedMap
	inc a ; $ff?
	jr z, .westEast
; check east map
	ld a, [wCurrentMapWidth2]
	cp b
	jr nz, .checkNorthMap
	ld hl, wEastConnectedMap
.westEast
	ld a, [hli] ; connected map ID
	ld [wCurMap], a
	ld bc, wWestConnectedMapYAlignment - wWestConnectedMapWidth
	ASSERT wWestConnectedMapYAlignment - wWestConnectedMapWidth == MAP_BORDER * 2
	ld a, [hl] ; connected map width
	add c      ; c = MAP_BORDER * 2
	ld e, a
	ld d, b    ; de = connected map stride
	add hl, bc ; skip strip fields
	ld a, [wYCoord]
	add [hl] ; Y alignment
	ld [wYCoord], a
	srl a ; rows to add; preserve Z through the remaining header reads
	ld c, a
	inc hl
	ld a, [hli] ; new X coordinate
	ld [wXCoord], a
	ld a, [hli] ; unadjusted view pointer
	ld h, [hl]
	ld l, a
	jr z, .savePointer
.pointerAdjustmentLoop
	add hl, de
	dec c
	jr nz, .pointerAdjustmentLoop
	jr .savePointer

.checkNorthMap
	ld a, [wYCoord]
	ld b, a
	ld hl, wNorthConnectedMap
	inc a ; $ff?
	jr z, .northSouth
; check south map
	ld a, [wCurrentMapHeight2]
	cp b
	jp nz, OverworldLoop ; did not enter connected map
	ld hl, wSouthConnectedMap
.northSouth
	ld a, [hl] ; connected map ID
	ld [wCurMap], a
	ld bc, wNorthConnectedMapYAlignment - wNorthConnectedMap ; b = 0
	add hl, bc ; skip to alignment fields
	ld a, [hli] ; new Y coordinate
	ld [wYCoord], a
	ld a, [wXCoord]
	add [hl] ; X alignment
	ld [wXCoord], a
	srl a
	ld c, a ; b = 0 still
	inc hl
	ld a, [hli] ; unadjusted view pointer
	ld h, [hl]
	ld l, a
	add hl, bc

.savePointer
	ld a, l
	ld [wCurrentTileBlockMapViewPointer], a ; pointer to upper left corner of current tile block map section
	ld a, h
	ld [wCurrentTileBlockMapViewPointer + 1], a
.loadNewMap ; load the connected map that was entered
	call LoadMapHeader
	call PlayDefaultMusicFadeOutCurrent
	ld b, SET_PAL_OVERWORLD
	call RunPaletteCommand
; Since the sprite set shouldn't change, this will just update VRAM slots at
; x#SPRITESTATEDATA2_IMAGEBASEOFFSET without loading any tile patterns.
	callfar InitMapSprites
	call LoadTileBlockMap
	jp OverworldLoopLessDelay

; function to play a sound when changing maps
PlayMapChangeSound::
	lda_coord 8, 8 ; upper left tile of the 4x4 square the player's sprite is standing on
	cp $0b ; door tile in OVERWORLD
	ld a, SFX_GO_OUTSIDE
	jr nz, .playSound
	ld a, SFX_GO_INSIDE
.playSound
	call PlaySound
	ld a, [wMapPalOffset]
	and a
	ret nz
	jp GBFadeOutToBlack

CheckIfInFlyMap:: ; marcelnote - added more FLY maps
	call CheckIfInOutsideMap ; a = [wCurMapTileset]
	ret z
	cp MOUNTAIN ; Cinnabar Volcano 2F, Mt Silver 3F
	ret z
;	cp FOREST   ; Viridian Forest, Celadon Grove
;	ret z
	ld a, [wCurMap]
	cp CELADON_MANSION_ROOF
	ret z
	cp CELADON_MART_ROOF
	ret

CheckIfInOutsideMap::
; If the player is in an outside map (a town or route), set the z flag
	ld a, [wCurMapTileset]
	and a ; most towns/routes have tileset 0 (OVERWORLD)
	ret z
	cp PLATEAU ; Route 23 / Indigo Plateau
	ret

CheckWarpAtPlayerCoord: ; marcelnote - refactored warp engine
	call TryWarpAtPlayerCoord
	ret nc
	; fallthrough

CheckWarpEventDirection: ; marcelnote - refactored warp engine
	ld a, [wDestinationWarpID]
	and WARP_DIR_MASK ; ANY_DIR?
	ret z
	cp WARP_DOWN << WARP_DIR_SHIFT
	jr z, .down
	cp WARP_UP << WARP_DIR_SHIFT
	jr z, .up
	cp WARP_LEFT << WARP_DIR_SHIFT
	jr z, .left
	cp WARP_RIGHT << WARP_DIR_SHIFT
	jr z, .right
	and a
	ret
.down
	ld a, [wPlayerMovingDirection]
	and PLAYER_DIR_DOWN
	jr .done
.up
	ld a, [wPlayerMovingDirection]
	and PLAYER_DIR_UP
	jr .done
.left
	ld a, [wPlayerMovingDirection]
	and PLAYER_DIR_LEFT
	jr .done
.right
	ld a, [wPlayerMovingDirection]
	and PLAYER_DIR_RIGHT
.done
	ret z
.setCarry
	scf
	ret

MapEntryAfterBattle:: ; marcelnote - refactored warp engine
	ld a, [wMapPalOffset]
	and a
	jp z, GBFadeInFromWhite
	jp LoadGBPal

HandleBlackOut::
; For when all the player's pokemon faint.
; Does not print the "blacked out" message.
	call GBFadeOutToBlack
	ld a, $08
	call StopMusic
	ld hl, wStatusFlags4
	res BIT_BATTLE_OVER_OR_BLACKOUT, [hl]
	ld a, BANK(ResetStatusAndHalveMoneyOnBlackout) ; also BANK(PrepareForSpecialWarp) and BANK(SpecialEnterMap)
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	call ResetStatusAndHalveMoneyOnBlackout
	call PrepareForSpecialWarp
	call PlayDefaultMusicFadeOutCurrent
	jp SpecialEnterMap

HandleFlyWarpOrDungeonWarp::
	call UpdateSprites
	call Delay3
	xor a
	ld [wBattleResult], a
	ld [wWalkBikeSurfState], a ; WALKING
	ld [wIsInBattle], a
	ld [wMapPalOffset], a
	ld hl, wStatusFlags6
	set BIT_SPECIAL_WARP, [hl]
	res BIT_ALWAYS_ON_BIKE, [hl]
	call LeaveMapAnim
	ld a, BANK(PrepareForSpecialWarp)
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	call PrepareForSpecialWarp
	jp SpecialEnterMap

LeaveMapAnim::
	jpfar _LeaveMapAnim

IsBikingAllowed:: ; marcelnote - simplified
; The bike can be used on maps with tilesets in BikeRidingTilesets.
; Return carry if biking is allowed.
	ld a, [wCurMapTileset]
	ld hl, BikeRidingTilesets
	jp IsInList ; returns carry if found

INCLUDE "data/tilesets/bike_riding_tilesets.asm"

; load the tile pattern data of the current tileset into VRAM
LoadTilesetTilePatternData::
	ld hl, wTilesetGfxPtr
	ld a, [hli]
	ld h, [hl]
	ld l, a    ; hl = tileset graphics pointer
	ld de, vTileset
	ld bc, MAP_TILESET_SIZE tiles
	ld a, [wTilesetBank]
	jp FarCopyData

; this loads the current map's complete tile map (which references blocks, not individual tiles) to wOverworldMap
; it can also load partial tile maps of connected maps into a border of length 3 around the current map
LoadTileBlockMap:: ; marcelnote - optimized
; fill wOverworldMap-wOverworldMapEnd with the background tile
	ld hl, wOverworldMap
	ld bc, wOverworldMapEnd - wOverworldMap
	ld a, [wMapBackgroundTile]
	call FillMemory ; returns bc = 0
; load tile map of current map (made of tile block IDs)
	ld hl, wCurMapWidth
	ld a, [hli]
	push af ; save a = width
	add MAP_BORDER * 2  ; east and west
	ldh [hMapStride], a ; map width + border
	ld c, a
	ld a, [hli] ; wCurMapDataPtr
	ld d, [hl]  ; wCurMapDataPtr + 1
	ld e, a     ; de = tile map pointer
; a 3-block border at the edges of the map is kept so that there is space for map connections
	ld hl, wOverworldMap + MAP_BORDER ; offset puts us past the west border
	add hl, bc ; c = map stride
	add hl, bc
	add hl, bc ; make space for north border (3 lines)
	pop bc ; restore b = width
	ld a, [wCurMapHeight]
	ld c, a
.rowLoop ; copy one row each iteration
	push bc ; save b = width, c = rows remaining
.blockLoop
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .blockLoop
; get to the next row's address
	ld c, MAP_BORDER * 2 ; b = 0
	add hl, bc
	pop bc  ; restore b = width, c = rows remaining
	dec c
	jr nz, .rowLoop
; north connection
	ld hl, wNorthConnectedMap
	ld a, [hli]
	cp $ff
	call nz, LoadNorthSouthConnection
; south connection
	ld hl, wSouthConnectedMap
	ld a, [hli]
	cp $ff
	call nz, LoadNorthSouthConnection
; west connection
	ld hl, wWestConnectedMap
	ld a, [hli]
	cp $ff
	call nz, LoadEastWestConnection
; east connection
	ld hl, wEastConnectedMap
	ld a, [hli]
	cp $ff
	call nz, LoadEastWestConnection
	jpfar ApplyTemporaryTileBlockReplacements ; marcelnote - modified cut trees engine

; Inputs: a = connected map ID
;         hl = connection header's ConnectedMapWidth
LoadNorthSouthConnection:
	call SwitchToMapRomBank
	ld a, [hli] ; map width
	sub [hl]
	ldh [hNorthSouthConnectedMapSkip], a
	ld a, [hli] ; strip length
	ld b, a
	ld a, [hli] ; destination low byte
	ld e, a
	ld a, [hli] ; destination high byte
	ld d, a
	ld a, [hli] ; source low byte
	ld h, [hl]  ; source high byte
	ld l, a
	ld c, MAP_BORDER
.rowLoop
	push bc ; save b = strip length, c = rows remaining
.blockLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .blockLoop
	ldh a, [hNorthSouthConnectedMapSkip]
	ld c, a    ; b = 0
	add hl, bc ; advance source to next row
	pop bc ; restore b = strip length, c = rows remaining
	ldh a, [hMapStride]
	sub b
	add e
	ld e, a
	adc d
	sub e
	ld d, a ; de += [hMapStride] - strip length
	dec c
	jr nz, .rowLoop
	ret

; Inputs: a = connected map ID
;         hl = connection header's ConnectedMapWidth
LoadEastWestConnection:
	call SwitchToMapRomBank
	ld a, [hli] ; map width
	sub MAP_BORDER
	ldh [hEastWestConnectedMapSkip], a
	ld a, [hli] ; strip length
	ld b, a
	ld a, [hli] ; destination low byte
	ld e, a
	ld a, [hli] ; destination high byte
	ld d, a
	ld a, [hli] ; source low byte
	ld h, [hl]  ; source high byte
	ld l, a
.rowLoop
	ld c, MAP_BORDER
.blockLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .blockLoop
	ldh a, [hEastWestConnectedMapSkip]
	add l
	ld l, a
	adc h
	sub l
	ld h, a ; hl += [hEastWestConnectedMapSkip]
	ldh a, [hMapStride]
	sub MAP_BORDER
	add e
	ld e, a
	adc d
	sub e
	ld d, a ; de += [wCurMapWidth] + MAP_BORDER
	dec b
	jr nz, .rowLoop
	ret

; function to check if there is a sign or sprite in front of the player
; if so, it is stored in [hTextID]
; if not, [hTextID] is set to 0
IsSpriteOrSignInFrontOfPlayer:: ; marcelnote - optimized
	xor a
	ldh [hTextID], a
	predef GetTileAndCoordsInFrontOfPlayer ; get the tile in front of the player in c and coordinates in de
	ld a, [wNumSigns]
	and a
	jr z, .checkSprites
	ld hl, wSignCoords
	ld b, a
.signLoop
	ld a, [hli] ; sign Y
	cp d
	ld a, [hli] ; sign X
	jr nz, .retry ; Y does not match
	cp e
	jr nz, .retry ; X does not match
; found sign
	ld a, [wNumSigns]
	sub b
	ld hl, wSignTextIDs
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ldh [hTextID], a ; store sign text ID
	ret
.retry
	dec b
	jr nz, .signLoop
.checkSprites
; check if the player is front of a counter in a pokemon center, pokemart, etc.
	ld hl, wTilesetTalkingOverTiles ; list of tiles that extend talking range (counter tiles)
	lb de, $20, 3 ; d = talking range in pixels (long range), e = counter
.counterTilesLoop
	ld a, [hli]
	cp c ; is the tile in front of the player is a counter tile?
	jr z, IsSpriteInFrontOfPlayer.gotRange
	dec e
	jr nz, .counterTilesLoop
	; fallthrough

; part of the above function, but sometimes is called on its own, when signs are irrelevant
; the caller must zero [hTextID]
IsSpriteInFrontOfPlayer::
	ld d, $10 ; talking range in pixels (normal range)
.gotRange
	lb bc, $3c, $40 ; Y and X position of player sprite
	ld a, [wSpritePlayerStateData1FacingDirection]
; check if player facing down
	and a ; SPRITE_FACING_DOWN?
	jr nz, .checkIfPlayerFacingUp
	ld a, b
	add d
	ld b, a
	ld a, PLAYER_DIR_DOWN
	jr .doneCheckingDirection

.checkIfPlayerFacingUp
	cp SPRITE_FACING_UP
	jr nz, .checkIfPlayerFacingRight
	ld a, b
	sub d
	ld b, a
	ld a, PLAYER_DIR_UP
	jr .doneCheckingDirection

.checkIfPlayerFacingRight
	cp SPRITE_FACING_RIGHT
	jr nz, .playerFacingLeft
	ld a, c
	add d
	ld c, a
	ld a, PLAYER_DIR_RIGHT
	jr .doneCheckingDirection

.playerFacingLeft
	ld a, c
	sub d
	ld c, a
	ld a, PLAYER_DIR_LEFT
.doneCheckingDirection
	ld [wPlayerDirection], a
	ld a, [wNumSprites]
	and a
	ret z
; if there are sprites
	ld hl, wSprite01StateData1
	ld d, a
	ld e, 1 ; one-based NPC index/text ID
.spriteLoop
	ld a, [hli] ; image (0 if no sprite)
	and a
	jr z, .nextSprite
	inc l
	ld a, [hli] ; sprite visibility
	inc a
	jr z, .nextSprite
	inc l
	ld a, [hli] ; Y location
	cp b
	jr nz, .nextSprite
	inc l
	ld a, [hl] ; X location
	cp c
	jr z, .foundSpriteInFrontOfPlayer
.nextSprite
	ld a, l
	or $0f
	inc a
	ld l, a ; hl = (x+1)#SPRITESTATEDATA1_PICTUREID
	inc e
	dec d
	jr nz, .spriteLoop
	ret
.foundSpriteInFrontOfPlayer
	ld a, l
	sub SPRITESTATEDATA1_XPIXELS - SPRITESTATEDATA1_MOVEMENTSTATUS
	ld l, a ; hl = x#SPRITESTATEDATA1_MOVEMENTSTATUS
	set BIT_FACE_PLAYER, [hl]
	ld a, e
	ldh [hTextID], a
	ret

; function to check if the player will jump down a ledge and check if the tile ahead is passable (when not surfing)
; sets the carry flag if there is a collision, and unsets it if there isn't a collision
CollisionCheckOnLand::
	ld hl, wMovementFlags
	bit BIT_CLIMBING_LEDGE, [hl] ; marcelnote - free ledge tile
	res BIT_CLIMBING_LEDGE, [hl]
	jr nz, .collision
	bit BIT_LEDGE_OR_FISHING, [hl]
	jr nz, .noCollision
; if not jumping a ledge
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz ; carry clear, no collisions when the player's movements are being controlled by the game
	ld hl, wPlayerDirection ; the direction that the player is trying to go in
	ld a, [wSpritePlayerStateData1CollisionData]
	and [hl] ; check if a sprite is in the direction the player is trying to go
	jr nz, .collision
	xor a
	ldh [hTextID], a
	call IsSpriteInFrontOfPlayer ; check for sprite collisions again? when does the above check fail to detect a sprite collision?
	ldh a, [hTextID]
	and a ; was there a sprite collision?
	jr nz, .collision
; if no sprite collision
	ld hl, TilePairCollisionsLand
	call CheckForJumpingAndTilePairCollisions
	jr c, .collision
	call CheckTilePassable
	ret nc ; no collision
.collision
;	ld a, [wChannelSoundIDs + CHAN5]
;	cp SFX_COLLISION ; check if collision sound is already playing
;	jr z, .setCarry
	ld a, [wChannel5Flags1]
	rrca  ; channel 5 on?
	ret c ; return collision if already on
	ld a, SFX_COLLISION
	call PlaySound ; play collision sound if it's not already playing
	scf
	ret
.noCollision
	and a
	ret

; function to check the tile ahead to determine if the character should get on land or keep surfing
; sets carry if there is a collision and clears carry otherwise
CollisionCheckOnWater::
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	jr nz, CollisionCheckOnLand.noCollision ; return and clear carry if button presses are being simulated
	ld hl, wPlayerDirection ; the direction that the player is trying to go in
	ld a, [wSpritePlayerStateData1CollisionData]
	and [hl] ; check if a sprite is in the direction the player is trying to go
    jr nz, CollisionCheckOnLand.collision ; joenote - fixes collision bug
	ld hl, TilePairCollisionsWater
	call CheckForJumpingAndTilePairCollisions
	jr c, CollisionCheckOnLand.collision
	ld a, [wTileInFrontOfPlayer] ; fetched by CheckForJumpingAndTilePairCollisions
	cp $14 ; water tile
	ret z ; carry clear, keep surfing if it's a water tile
	cp $32 ; either the left tile of the S.S. Anne boarding platform or the tile on eastern coastlines (depending on the current tileset)
	jr z, .checkIfVermilionDockTileset
	cp $48 ; tile on right on coast lines in Safari Zone ; marcelnote - now also waterfall
	ret z ; carry clear, keep surfing
; check if the [land] tile in front of the player is passable
.checkIfNextTileIsPassable
	ld c, a
	ld hl, wTilesetCollisionPtr ; pointer to list of passable tiles
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop
	ld a, [hli]
	cp $ff
	jr z, CollisionCheckOnLand.collision
	sub c
	jr z, .stopSurfing ; stop surfing if the tile is passable
	jr .loop

.checkIfVermilionDockTileset
	ld a, [wCurMapTileset]
	sub SHIP_PORT ; Vermilion Dock tileset
	jr nz, CollisionCheckOnLand.noCollision ; keep surfing if it's not the boarding platform tile
.stopSurfing
	ld [wWalkBikeSurfState], a ; a = 0
	call LoadPlayerSpriteGraphics
	call PlayDefaultMusic
	jr CollisionCheckOnLand.noCollision

; function that checks if the tile in front of the player is passable
; clears carry if it is, sets carry if not
CheckTilePassable:: ; marcelnote - small optim
	ld a, [wTileInFrontOfPlayer] ; fetched by CheckForJumpingAndTilePairCollisions
	ld c, a
	ld hl, wTilesetCollisionPtr ; pointer to list of passable tiles
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl now points to passable tiles
.loop
	ld a, [hli]
	cp $ff
	jr z, .tileNotPassable
	cp c
	ret z
	jr .loop
.tileNotPassable
	scf
	ret

; check if the player is going to jump down a small ledge
; and check for collisions that only occur between certain pairs of tiles
; Input: hl - address of directional collision data
; sets carry if there is a collision and unsets carry if not
CheckForJumpingAndTilePairCollisions::
	push hl
	predef GetTileAndCoordsInFrontOfPlayer
;	push de
;	push bc
	callfar HandleLedges ; check if the player is trying to jump a ledge
;	pop bc
;	pop de
	ld hl, wMovementFlags
	ld a, [hl]
	bit BIT_CLIMBING_LEDGE, a
	res BIT_CLIMBING_LEDGE, [hl]
	pop hl
	jr nz, CheckForTilePairCollisions.foundMatch
	and 1 << BIT_LEDGE_OR_FISHING ; clears carry
	ret nz
	; if not jumping

CheckForTilePairCollisions2::
	lda_coord 8, 9 ; tile the player is on
	ld [wTilePlayerStandingOn], a

CheckForTilePairCollisions:: ; marcelnote - optimized
	ld a, [wTilePlayerStandingOn]
	ld b, a
	ld a, [wTileInFrontOfPlayer]
	ld c, a
	ld a, [wCurMapTileset]
	ld e, a
.tilePairCollisionLoop
	ld a, [hli]
	cp e
	jr z, .tilesetMatches
	inc a  ; $ff?
	ret z  ; no match, return with carry flag unset since $ff >= e
	inc hl ; skip two tile entries
	inc hl
	jr .tilePairCollisionLoop
.tilesetMatches
	ld a, [hli] ; first tile
	ld d, a
	cp b
	ld a, [hli] ; second tile
	jr z, .compareOtherTile
	cp b
	jr nz, .tilePairCollisionLoop
	ld a, d
.compareOtherTile
	cp c
	jr nz, .tilePairCollisionLoop
.foundMatch
	scf
	ret

INCLUDE "data/tilesets/pair_collision_tile_ids.asm"

; this builds a tile map from the tile block map based on the current X/Y coordinates of the player's character
LoadCurrentMapView:: ; marcelnote - optimized
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wTilesetBank]
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ld hl, wCurrentTileBlockMapViewPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl = address of upper-left block in the current map view
	ld de, wSurroundingTiles
	ld b, SCREEN_BLOCK_HEIGHT
.rowLoop ; each loop iteration fills in one row of tile blocks
	ld c, SCREEN_BLOCK_WIDTH
.rowInnerLoop ; loop to draw each tile block of the current row
	push bc
	ld a, [hli] ; tile block number
	push hl
	call DrawTileBlock
	pop hl
	pop bc
	dec c
	jr nz, .rowInnerLoop
; update tile block map pointer to next row's address
	; hl = [wCurrentTileBlockMapViewPointer] + SCREEN_BLOCK_WIDTH
	ASSERT SCREEN_BLOCK_WIDTH == MAP_BORDER * 2
	ld a, [wCurMapWidth]
	add l
	ld l, a
	adc h
	sub l
	ld h, a ; hl = address of left block in next row
; update tile map pointer to next row's address
	; de = wSurroundingTiles + SCREEN_BLOCK_WIDTH * BLOCK_WIDTH
	ld a, SURROUNDING_WIDTH * BLOCK_HEIGHT - SCREEN_BLOCK_WIDTH * BLOCK_WIDTH
	add e
	ld e, a
	adc d
	sub e
	ld d, a ; de = wSurroundingTiles + SURROUNDING_WIDTH * BLOCK_HEIGHT
	dec b
	jr nz, .rowLoop

; The block map view is larger than the screen so scrolling within a 2x2 block
; can copy from the right half or lower half of the already-expanded buffer.
; Point hl at the screen-sized tile area inside wSurroundingTiles, then copy it
; to wTileMap for V-blank transfer.
	ld hl, wSurroundingTiles
; adjust for Y coord within tile block
	ld a, [wYBlockCoord]
	and a
	jr z, .adjustForXCoordWithinTileBlock
	ld c, SURROUNDING_WIDTH * 2 ; b = 0
	add hl, bc
.adjustForXCoordWithinTileBlock
	ld a, [wXBlockCoord] ; always 0 or 1 here
	ASSERT BLOCK_WIDTH / 2 == 2
	add a
	ld c, a
	add hl, bc ; b = 0
; copy to visible area buffer
	decoord 0, 0 ; base address for the tiles that are directly transferred to VRAM during V-blank
	ld c, SCREEN_HEIGHT
.rowLoop2
	ld b, SCREEN_WIDTH
.rowInnerLoop2
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .rowInnerLoop2
	ld a, c ; save c = remaining rows
	ld c, SURROUNDING_WIDTH - SCREEN_WIDTH ; b = 0
	add hl, bc
	ld c, a ; restore c = remaining rows
	dec c
	jr nz, .rowLoop2
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret

; function to make bikes twice as fast as walking
DoBikeSpeedup:: ; marcelnote - optimized and added new checks for waterfalls
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a, [wCurMap]
	cp ROUTE_17 ; Cycling Road
	jr z, .checkDirection
	cp MT_SILVER_2F
	jr nz, AdvancePlayerSprite
	ld a, [wTileInFrontOfPlayer]
	cp $48 ; waterfall tile
	jr nz, AdvancePlayerSprite
.checkDirection
	ldh a, [hJoyHeld]
	and PAD_UP | PAD_LEFT | PAD_RIGHT
	ret nz
	; fallthrough

AdvancePlayerSprite:: ; marcelnote - optim by Engezerstorung
; Cache the player's step vector in b/c for the coordinate, map view, and scroll
; updates below.
	ld hl, wSpritePlayerStateData1YStepVector
	ld a, [hli]
	ld b, a
	inc l
	ld c, [hl] ; wSpritePlayerStateData1XStepVector

; Advance the walk animation. On the last animation frame, commit the movement
; to the player's map coordinates.
	ld hl, wWalkCounter
	dec [hl]
	jr nz, .afterUpdateMapCoords
	ld de, wYCoord
	ld a, [de]
	add b
	ld [de], a
	inc de
	ld a, [de] ; wXCoord
	add c
	ld [de], a
.afterUpdateMapCoords
	ld a, [hl]
	cp $07
	jp nz, .scrollBackgroundAndSprites
	push bc ; save step vectors

; On the first animation frame, move the visible BG tilemap origin in VRAM.
; Horizontal movement wraps within the 32-tile row by updating only the low
; 5 bits of wMapViewVRAMPointer.
	ld hl, wMapViewVRAMPointer
	ld e, [hl]
	ld a, c
	add a
	jr z, .checkIfMovingVertically
; moving horizontally
	add e
	xor e
	and $1f
	xor e
	ld [hl], a
	jr .adjustXCoordWithinBlock
.checkIfMovingVertically
; Add the signed 16-bit offset b * $40 to the BG pointer.
; Build its high byte in d and low byte in a, then add with carry.
; Wrap the resulting address within $9800-$9bff.
	ld d, b ; b = 1 for south, -1 for north, 0 for stationary
	sra d ; d = offset high byte: $00 south/stationary, $ff north
	ld a, b
	rrca
	rrca
	and $c0 ; a = offset low byte: $40 south, $c0 north, $00 stationary
	add e   ; e = original pointer's low byte
	ld [hli], a
	ld a, [hl]
	adc d
	and $03 ; keep the high byte in the $98-$9b BG map range
	or $98
	ld [hl], a
.adjustXCoordWithinBlock
; Update the player's position within the 4×4-tile block. On crossing a block boundary,
; update the special-warp offset and the tile block map view pointer.
	ld de, wXBlockCoord
	ld hl, wXOffsetSinceLastSpecialWarp
	ld a, c ; c = X step vector: -1 west, +1 east, 0 vertical movement
	and a
	jr nz, .horizontalBlockMovement
; vertical block movement
	dec de ; wYBlockCoord
	dec hl ; wYOffsetSinceLastSpecialWarp
	ld a, [wCurMapWidth]
	add MAP_BORDER * 2
	ld c, a ; vertical pointer stride
	jr .adjustBlockCoord
.horizontalBlockMovement
	ld b, c ; selected axis's step vector
	ld c, 1 ; horizontal pointer stride
.adjustBlockCoord
	ld a, [de]
	add b
	ld [de], a
	inc a ; $ff?
	jr z, .decTileBlockMapPointer ; crossed north/west
	sub $03 ; 2?
	jr nz, .updateMapView ; still within the current tile block
	; fallthrough if crossed south/east

; Move the pointer to the upper-left corner of the visible tile block map in
; the direction of motion.

.incTileBlockMapPointer
	ld [de], a ; a = 0
	inc [hl]
	ld hl, wCurrentTileBlockMapViewPointer
	ld a, [hl]
	add c
	ld [hli], a
	jr nc, .updateMapView
	inc [hl]
	jr .updateMapView

.decTileBlockMapPointer
	inc a
	ld [de], a ; a = 1
	dec [hl]
	ld hl, wCurrentTileBlockMapViewPointer
	ld a, [hl]
	sub c
	ld [hli], a
	jr nc, .updateMapView
	dec [hl]
.updateMapView
; Reload the cached visible map view and schedule the row or column that V-blank
; needs to redraw for the newly exposed edge.
	call LoadCurrentMapView
	call SchedulePlayerMovementRedraw
	pop bc ; restore steps vectors
.scrollBackgroundAndSprites
; Scroll the background and shift all sprites in the opposite
; direction so the player appears to move through the world.
	sla b
	sla c
	ldh a, [hSCY]
	add b
	ldh [hSCY], a ; update background scroll Y
	ldh a, [hSCX]
	add c
	ldh [hSCX], a ; update background scroll X
; Shift all sprites in the direction opposite of the player's motion
; so that the player appears to move relative to them.
	ld hl, wSprite01StateData1YPixels
	ld a, [wNumSprites]
	and a ; are there any sprites?
	ret z
	ld e, a
.spriteShiftLoop
	ld a, [hl] ; wSprite<n>StateData1YPixels
	sub b
	ld [hli], a
	inc l
	ld a, [hl] ; wSprite<n>StateData1XPixels
	sub c
	ld [hl], a
	ld a, SPRITESTATEDATA1_LENGTH - (SPRITESTATEDATA1_XPIXELS - SPRITESTATEDATA1_YPIXELS)
	add l
	ld l, a
	dec e
	jr nz, .spriteShiftLoop
	ret

; the following routines are used to tell the V-blank handler to redraw
; the portion of the map that was newly exposed due to the player's movement

SchedulePlayerMovementRedraw: ; marcelnote - new
	ld a, [wSpritePlayerStateData1YStepVector]
	cp 1 ; moving south?
	jr z, ScheduleSouthRowRedraw
	inc a ; $ff, moving north?
	jr z, ScheduleNorthRowRedraw
	ld a, [wSpritePlayerStateData1XStepVector]
	cp 1 ; moving east?
	jr z, ScheduleEastColumnRedraw
	inc a ; $ff, moving west?
	jr z, ScheduleWestColumnRedraw
	ret

ScheduleNorthRowRedraw::
	hlcoord 0, 0
	call CopyToRedrawRowOrColumnSrcTiles
	ld hl, wMapViewVRAMPointer + 1
	ld a, [hld]
	jr ScheduleSouthRowRedraw.common

ScheduleSouthRowRedraw:: ; marcelnote - small optim
	hlcoord 0, 16
	call CopyToRedrawRowOrColumnSrcTiles
; The BG map has 32 bytes per row, so row 16 starts 32 * 16 = $200 bytes
; past the view origin. The map occupies $400 bytes at $9800-$9bff.
; Adding $200 modulo $400 toggles address bit 9: bit 1 of the high byte.
; The low byte stays unchanged; the high byte maps $98 <-> $9a and $99 <-> $9b.
	ld hl, wMapViewVRAMPointer + 1
	ld a, [hld]
	xor $02 ; toggle bit 1 of high byte
.common
	ldh [hRedrawRowOrColumnDest + 1], a
	ld a, [hl]
	ldh [hRedrawRowOrColumnDest], a
	ld a, REDRAW_ROW
	ldh [hRedrawRowOrColumnMode], a
	ret

CopyToRedrawRowOrColumnSrcTiles::
	ld de, wRedrawRowOrColumnSrcTiles
	ld c, 2 * SCREEN_WIDTH
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

ScheduleWestColumnRedraw::
	hlcoord 0, 0
	call ScheduleColumnRedrawHelper
	ld hl, wMapViewVRAMPointer
	ld a, [hli]
	jr ScheduleEastColumnRedraw.common

ScheduleEastColumnRedraw:: ; marcelnote - small optim
	hlcoord 18, 0
	call ScheduleColumnRedrawHelper
	ld hl, wMapViewVRAMPointer
	ld a, [hli]
; The BG map has 32 bytes per row, so bits 0-4 select the column.
; The view origin is on an even BG row: bit 5 of its low byte is clear.
; Adding 18 gives a column offset in 18-49, which can overflow into bit 5
; but no higher. Clearing bit 5 wraps the column modulo 32 without changing
; the row bits or the high byte.
	add 18
	and ~(1 << 5)
.common
	ldh [hRedrawRowOrColumnDest], a
	ld a, [hl]
	ldh [hRedrawRowOrColumnDest + 1], a
	ld a, REDRAW_COL
	ldh [hRedrawRowOrColumnMode], a
	ret

ScheduleColumnRedrawHelper::
	ld de, wRedrawRowOrColumnSrcTiles
	lb bc, SCREEN_WIDTH - 1, SCREEN_HEIGHT
.loop
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, b
	add l
	ld l, a
	adc h
	sub l
	ld h, a ; hl to next row
	dec c
	jr nz, .loop
	ret

; Write the 4x4 tiles that make up a tile block to memory.
; Input: a = tile block ID, de = destination address in wSurroundingTiles.
; Output: de = destination address for the next horizontal tile block.
DrawTileBlock:: ; marcelnote - optimized
	swap a ; each block is 16 bytes, so the table offset is a * $10
	ld b, a
	and $f0
	ld c, a
	xor b
	ld b, a ; bc = a * $10
	ld hl, wTilesetBlocksPtr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc ; hl += a * $10
	lb bc, BLOCK_HEIGHT, SURROUNDING_WIDTH - BLOCK_WIDTH
.loop ; each loop iteration, write 4 tile numbers
REPT BLOCK_WIDTH
	ld a, [hli]
	ld [de], a
	inc de
ENDR
	ld a, c ; a = SURROUNDING_WIDTH - BLOCK_WIDTH
	add e
	ld e, a
	adc d
	sub e
	ld d, a ; de += SURROUNDING_WIDTH - BLOCK_WIDTH
	dec b
	jr nz, .loop
	; de = original destination + SURROUNDING_WIDTH * BLOCK_HEIGHT
	; but we want to return: de = original destination + BLOCK_WIDTH
	ld a, e
	sub SURROUNDING_WIDTH * BLOCK_HEIGHT - BLOCK_WIDTH
	ld e, a
	ret nc
	dec d
	ret

; function to update joypad state and simulate button presses
JoypadOverworld::
	xor a
	ld [wSpritePlayerStateData1YStepVector], a
	ld [wSpritePlayerStateData1XStepVector], a
	call RunMapScript
	call Joypad
	ld a, [wStatusFlags7]
	bit BIT_TRAINER_BATTLE, a
	jr nz, .notForcedDownwards
	; marcelnote - added new checks to force downwards on waterfalls
	ld a, [wCurMap]
	cp ROUTE_17 ; Cycling Road
	jr z, .checkButtonPress
	cp MT_SILVER_2F ; for now only map with waterfall
	jr nz, .notForcedDownwards
	lda_coord 8, 9 ; tile under player
	cp $48 ; waterfall tile
	jr nz, .notForcedDownwards
.checkButtonPress
	ldh a, [hJoyHeld]
	and PAD_CTRL_PAD | PAD_B | PAD_A
	jr nz, .notForcedDownwards
	ld a, PAD_DOWN
	ldh [hJoyHeld], a ; on the cycling road, if there isn't a trainer and the player isn't pressing buttons, simulate a down press
.notForcedDownwards
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret z
; if simulating button presses
	ld hl, wOverrideSimulatedJoypadStatesMask ; bit mask for button presses that override simulated ones
	ldh a, [hJoyHeld]
	and [hl]
	ret nz ; return if the simulated button presses are overridden
	ld hl, wSimulatedJoypadStatesIndex
	ld a, [hl]
	and a
	jr z, .doneSimulating ; if the end of the simulated button presses has been reached
	dec [hl]
	ld hl, wSimulatedJoypadStatesEnd - 1 ; index is 1-based
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ldh [hJoyHeld], a ; store simulated button press in joypad state
	and a
	ret nz
	ldh [hJoyPressed], a
	ldh [hJoyReleased], a
	ret

; if done simulating button presses
.doneSimulating ; a = 0
;	ld [wUnusedOverrideSimulatedJoypadStatesIndex], a
	ld [wSimulatedJoypadStatesEnd], a
	ld [wJoyIgnore], a
	ldh [hJoyHeld], a
	ld hl, wMovementFlags
	ld a, [hl]
	and (1 << BIT_SPINNING) | (1 << BIT_LEDGE_OR_FISHING) | (1 << BIT_CLIMBING_LEDGE) | (1 << 4) | (1 << 3) ; bits 3 and 4 are unused
	ld [hl], a
	ld hl, wStatusFlags5
	res BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ret

RunMapScript::
	push de
	push bc
	callfar TryPushingBoulder
	ld a, [wMiscFlags]
	bit BIT_BOULDER_DUST, a
	jr z, .afterBoulderEffect
	callfar DoBoulderDustAnimation
.afterBoulderEffect
	pop bc
	pop de
	call RunNPCMovementScript
	ld a, [wCurMap]
	call SwitchToMapRomBank
	ld hl, wCurrentMapScriptFlags ; marcelnote - smarter block replacing
	set BIT_REPLACE_TILE_BLOCK_BATCHING, [hl]
	ld hl, wCurMapScriptPtr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call _hl_
	; marcelnote - smarter block replacing
	ld hl, wCurrentMapScriptFlags
	res BIT_REPLACE_TILE_BLOCK_BATCHING, [hl]
	bit BIT_REDRAW_MAP_VIEW_PENDING, [hl]
	ret z
	res BIT_REDRAW_MAP_VIEW_PENDING, [hl]
	jpfar RedrawMapView

; function to load data from the map header
LoadMapHeader:: ; marcelnote - optimized
	callfar MarkTownVisitedAndLoadToggleableObjects
	ld a, [wCurMap]
	call SwitchToMapRomBank
	ld a, [wCurMapTileset]
	bit BIT_NO_PREVIOUS_MAP, a
	res BIT_NO_PREVIOUS_MAP, a
	ld [wCurMapTileset], a
	ldh [hPreviousTileset], a
	ret nz
	ld hl, MapHeaderPointers
	ld a, [wCurMap]
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl = base of map header
	ld de, wCurMapHeader
	ld c, wCurMapHeaderEnd - wCurMapHeader
.copyFixedHeaderLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyFixedHeaderLoop
; initialize all the connected maps to disabled at first, before loading the actual values
	ld a, $ff
	ld [wNorthConnectedMap], a
	ld [wSouthConnectedMap], a
	ld [wWestConnectedMap], a
	ld [wEastConnectedMap], a
; copy connection data (if any) to WRAM
	ld a, [wCurMapConnections]
	ld b, a
; check north
	bit NORTH_F, b
	ld de, wNorthConnectionHeader
	call nz, CopyMapConnectionHeader
; check south
	bit SOUTH_F, b
	ld de, wSouthConnectionHeader
	call nz, CopyMapConnectionHeader
; check west
	bit WEST_F, b
	ld de, wWestConnectionHeader
	call nz, CopyMapConnectionHeader
; check east
	bit EAST_F, b
	ld de, wEastConnectionHeader
	call nz, CopyMapConnectionHeader

	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl = base of object data
	ld a, [hli]
	ld [wMapBackgroundTile], a

; Load warp data.
	ld a, [hli]
	ld [wNumberOfWarps], a
	and a
	jr z, .loadSignData
	add a
	add a ; 4 bytes per warp
	ASSERT MAX_WARP_EVENTS * 4 < $100
	ld c, a
	ld de, wWarpEntries
.warpLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .warpLoop

.loadSignData
	ld a, [hli] ; number of signs
	ld [wNumSigns], a
	and a
	jr z, .loadSpriteData
	ld bc, wSignCoords
	ld de, wSignTextIDs
.signLoop
	push af
	ld a, [hli] ; sign Y coord
	ld [bc], a
	inc bc
	ld a, [hli] ; sign X coord
	ld [bc], a
	inc bc
	ld a, [hli] ; sign text ID
	ld [de], a
	inc de
	pop af
	dec a
	jr nz, .signLoop

.loadSpriteData
	ld a, [wStatusFlags4]
	bit BIT_BATTLE_OVER_OR_BLACKOUT, a
	jr nz, .finishUp ; if so, skip this because battles don't destroy this data
	ld a, [hli]
	ld [wNumSprites], a ; save the number of sprites
	push hl ; save hl = object data cursor at first sprite entry
; zero out sprite state data for sprites 01-15
	ld hl, wSprite01StateData1
	ld de, wSprite01StateData2
	xor a
	ld b, (NUM_SPRITESTATEDATA_STRUCTS - 1) * SPRITESTATEDATA1_LENGTH
.zeroSpriteDataLoop
	ld [hli], a
	ld [de], a
	inc e
	dec b
	jr nz, .zeroSpriteDataLoop
; disable SPRITESTATEDATA1_IMAGEINDEX (set to $ff) for sprites 01-15
	ld hl, wSprite01StateData1ImageIndex
	ld c, SPRITESTATEDATA1_LENGTH ; b = 0 here
	lb de, $ff, NUM_SPRITESTATEDATA_STRUCTS - 1
.disableSpriteEntriesLoop
	ld [hl], d
	add hl, bc
	dec e
	jr nz, .disableSpriteEntriesLoop
	pop hl ; restore hl = object data cursor at first sprite entry
	ld de, wSprite01StateData1
	ld a, [wNumSprites] ; number of sprites
	and a ; are there any sprites?
	jr z, .finishUp ; if there are no sprites, skip the rest
	ld c, b ; c = 0 = sprite data offset
	ld b, a ; b = number of sprites
.loadSpriteLoop
	ld a, [hli]
	ld [de], a ; x#SPRITESTATEDATA1_PICTUREID
	inc d
	ld a, SPRITESTATEDATA2_MAPY - SPRITESTATEDATA1_PICTUREID
	add e
	ld e, a
	ld a, [hli]
	ld [de], a ; x#SPRITESTATEDATA2_MAPY
	inc e
	ld a, [hli]
	ld [de], a ; x#SPRITESTATEDATA2_MAPX
	inc e
	ld a, [hli]
	ld [de], a ; x#SPRITESTATEDATA2_MOVEMENTBYTE1
	push bc ; save b = remaining sprites, c = sprite extra data offset
	push de ; save de = current sprite's SPRITESTATEDATA2_MOVEMENTBYTE1 pointer
	ld a, [hli] ; movement byte 2
	ld e, [hl]  ; text ID and flags byte
	inc hl
	push hl ; save hl = object data cursor after text ID and flags byte
	ld b, 0
	ld hl, wMapSpriteData
	add hl, bc
	ld [hli], a ; store movement byte 2 in byte 0 of sprite entry
	ld a, e
	and $3f
	ld [hl], a ; store text ID in byte 1 of sprite entry
	pop hl  ; restore hl = object data cursor after text ID and flags byte
	xor e   ; a = trainer/item flags
	ld e, b ; default second extra-data byte = 0
	jr z, .storeSpriteExtraData ; regular NPC: a = e = 0
	bit BIT_TRAINER, a
	ld a, [hli] ; item ID or trainer class
	jr z, .storeSpriteExtraData ; item: e = 0
	ld e, [hl] ; trainer number
	inc hl
.storeSpriteExtraData
	push hl ; save hl = object data cursor for next sprite
	ld hl, wMapSpriteExtraData
	add hl, bc
	ld [hli], a
	ld [hl], e
.nextSprite
	pop hl ; restore hl = object data cursor for next sprite
	pop de ; restore de = current sprite's SPRITESTATEDATA2_MOVEMENTBYTE1 pointer
	pop bc ; restore b = remaining sprites, c = sprite extra data offset
	dec d
	ld a, SPRITESTATEDATA1_LENGTH - SPRITESTATEDATA2_MOVEMENTBYTE1
	add e
	ld e, a
	inc c
	inc c
	dec b
	jr nz, .loadSpriteLoop

.finishUp
	predef LoadTilesetHeader
	callfar LoadWildData
	ld hl, wCurMapHeight
	ld a, [hli]                ; map height in 4x4 tile blocks
	add a                      ; double it
	ld [wCurrentMapHeight2], a ; store map height in 2x2 tile blocks
	ld a, [hl]                 ; map width in 4x4 tile blocks
	add a                      ; double it
	ld [wCurrentMapWidth2], a  ; map width in 2x2 tile blocks
	ld a, [wCurMap]
	ld c, a
	ld b, 0
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(MapSongBanks)
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ld hl, MapSongBanks
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wMapMusicSoundID], a ; music 1

; give vanilla red a fair shot at running our savs
	ld a, BANK("Audio Engine 1")

	ld [wMapMusicROMBank], a ; music 2
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret

; function to copy map connection data from ROM to WRAM
; Input: hl = source, de = destination
CopyMapConnectionHeader::
	ld c, $0b
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

; function to load map data
LoadMapData::
	ldh a, [hLoadedROMBank]
	push af
	call DisableLCD
	ld hl, wMapViewVRAMPointer
	xor a
	ld [hli], a            ; wMapViewVRAMPointer
	ld [hl], HIGH(vBGMap0) ; wMapViewVRAMPointer + 1
	ld [wTemporaryTileBlockReplacementsCount], a ; marcelnote - modified cut trees engine
	ldh [hSCY], a
	ldh [hSCX], a
	ld [wWalkCounter], a
;	ld [wUnusedCurMapTilesetCopy], a
;	ld [wWalkBikeSurfStateCopy], a ; unused?
	ld [wSpriteSetID], a
	call LoadTextBoxTilePatterns
	call LoadMapHeader
	callfar InitMapSprites ; load tile pattern data for sprites
	call LoadTileBlockMap
	call LoadTilesetTilePatternData
	call LoadCurrentMapView
; copy current map view to VRAM
	hlcoord 0, 0
	ld de, vBGMap0
	ld b, SCREEN_HEIGHT
.vramCopyLoop
	ld c, SCREEN_WIDTH
.vramCopyInnerLoop
	ld a, [hli]
	ld [de], a
	inc e
	dec c
	jr nz, .vramCopyInnerLoop
	ld a, e
	or TILEMAP_WIDTH - 1
	ld e, a
	inc de ; column 31 -> column 0 of next row, carrying into d
	dec b
	jr nz, .vramCopyLoop
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld a, SCREEN_HEIGHT_PX ; marcelnote - moved from ClearVariablesOnEnterMap to hide the window before EnableLCD
	ldh [hWY], a
	ldh [rWY], a
	call EnableLCD
	ld b, SET_PAL_OVERWORLD
	call RunPaletteCommand
	call LoadPlayerSpriteGraphics
	ld a, [wStatusFlags6]
	and (1 << BIT_FLY_WARP) | (1 << BIT_DUNGEON_WARP)
	jr nz, .restoreRomBank
	ld a, [wStatusFlags7]
	bit BIT_NO_MAP_MUSIC, a
	jr nz, .restoreRomBank
;	call UpdateMusic6Times
	call PlayDefaultMusicFadeOutCurrent
.restoreRomBank
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret

; function to switch to the ROM bank that a map is stored in
; Input: a = map number
SwitchToMapRomBank:: ; marcelnote - optimized
	ld bc, MapHeaderBanks
	add c
	ld c, a
	adc b
	sub c
	ld b, a ; bc += map number
	ld a, BANK(MapHeaderBanks)
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ld a, [bc]
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret

IgnoreInputForHalfSecond:
	ld a, 30
	ld [wIgnoreInputCounter], a
	ld hl, wStatusFlags5
	ld a, [hl]
	or (1 << BIT_DISABLE_JOYPAD) | (1 << BIT_UNKNOWN_5_2) | (1 << BIT_UNKNOWN_5_1)
	ld [hl], a ; set ignore input bit
	ret

ForceBikeOrSurf::
	call LoadPlayerSpriteGraphics
	jp PlayDefaultMusic ; update map/player state?

CheckForUserInterruption::
; Return carry if Up+Select+B, Start or A are pressed in c frames.
; Used only in the intro and title screen.
	call DelayFrame

	push bc
	call JoypadLowSensitivity
	pop bc

	ldh a, [hJoyHeld]
	cp PAD_UP + PAD_SELECT + PAD_B
	jr z, .input

	ldh a, [hJoy5]
IF DEF(_DEBUG)
	and PAD_START | PAD_SELECT | PAD_A
ELSE
	and PAD_START | PAD_A
ENDC
	jr nz, .input

	dec c
	jr nz, CheckForUserInterruption
	ret ; carry clear

.input
	scf
	ret

; function to load position data for destination warp when switching maps
; INPUT:
; a = ID of destination warp within destination map
LoadDestinationWarpPosition::
	and WARP_ID_MASK ; marcelnote - refactored warp engine
	add a
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld c, 4 ; b = 0
	ld de, wCurrentTileBlockMapViewPointer
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wPredefParentBank]
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	call CopyData
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret

; marcelnote - dynamic SGB border
; If a script requested an SGB border reload, do it at the start of EnterMap.
; This is before LoadMapData rebuilds GB VRAM, so the SGB transfer staging
; screen can freely overwrite and clear VRAM without leaving visible damage.
ReloadSGBBorder:
	ld a, [wReloadSGBBorder]
	dec a
	ret nz
	ld [wReloadSGBBorder], a
	; The reload preserves the current GB palette, keeping the transition hidden.
	jpfar ReloadSGBBorderWithStickers
