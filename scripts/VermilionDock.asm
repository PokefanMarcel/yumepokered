; marcelnote - this was modified for new Ferry
VermilionDock_Script:
	call EnableAutoTextBoxDrawing
	ld hl, VermilionDock_ScriptPointers
	ld a, [wVermilionDockCurScript]
	jp CallFunctionInTable

VermilionDock_ScriptPointers:
	def_script_pointers
	dw_const VermilionDockSSAnneDefaultScript,    SCRIPT_VERMILIONDOCK_DEFAULT
	dw_const VermilionDockAllAboardScript,        SCRIPT_VERMILIONDOCK_ALL_ABOARD
	dw_const VermilionDockPlayerMovingDownScript, SCRIPT_VERMILIONDOCK_PLAYER_MOVING_DOWN

VermilionDockSSAnneDefaultScript:
	CheckEvent EVENT_WALKED_OUT_OF_DOCK
	ret nz
	CheckEventHL EVENT_STARTED_WALKING_OUT_OF_DOCK
	jr nz, .walkingOutOfDock
	CheckEventReuseHL EVENT_GOT_HM01
	ret z
	ld a, [wDestinationWarpID]
	cp 3 ; marcelnote - changed from cp 1 since new warps for Ferry
	ret nz
	CheckEventReuseHL EVENT_SS_ANNE_LEFT
	jr z, VermilionDockSSAnneLeavesScript
	SetEventReuseHL EVENT_STARTED_WALKING_OUT_OF_DOCK
	call Delay3
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld hl, wSimulatedJoypadStatesEnd
	ld a, PAD_UP
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $3
	ld [wSimulatedJoypadStatesIndex], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	dec a
	ld [wJoyIgnore], a
	ret
.walkingOutOfDock
	CheckEventAfterBranchReuseHL EVENT_WALKED_OUT_OF_DOCK, EVENT_STARTED_WALKING_OUT_OF_DOCK
	ret nz
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld [wJoyIgnore], a
	SetEventReuseHL EVENT_WALKED_OUT_OF_DOCK
	ret

VermilionDockSSAnneLeavesScript:
	SetEventForceReuseHL EVENT_SS_ANNE_LEFT
	ld a, SFX_STOP_ALL_MUSIC
	ld [wJoyIgnore], a
;	ld [wNewSoundID], a
	call PlaySound
	ld c, 0 ; BANK(Music_Surfing)
	ld a, MUSIC_SURFING
	call PlayMusic
	callfar LoadSmokeTile ; marcelnote - modified cut/boulder dust animation
	xor a
	ld [wSpritePlayerStateData1ImageIndex], a
	ld c, 120
	call DelayFrames
	ld b, HIGH(vBGMap1)
	call CopyScreenTileBufferToVRAM
	hlcoord 0, 10
	ld bc, SCREEN_WIDTH * 6
	ld a, $14 ; water tile
	call FillMemory
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld [wSSAnneSmokeDriftAmount], a
	ldh [rOBP1], a
	ld a, 88
	ld [wSSAnneSmokeX], a
	ld hl, wMapViewVRAMPointer
	ld a, [hli]
	ld b, [hl]
	ld c, a
	push bc
	push hl
	ld a, SFX_SS_ANNE_HORN
	call PlaySoundWaitForCurrent
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	lb de, $0, $8
.shiftColumnsUp
	inc bc
	inc bc
	ld hl, wMapViewVRAMPointer ; marcelnote - optimized load into wMapViewVRAMPointer
	ld a, c
	ld [hli], a
	ld [hl], b
	push bc
	push de
	call ScheduleEastColumnRedraw
	call VermilionDock_EmitSmokePuff
	pop de
	ld b, $10
.smokePuffDriftLoop
	call VermilionDock_AnimSmokePuffDriftRight
	ld c, $8
.delayBetweenDrifts
	call VermilionDock_SyncScrollWithLY
	dec c
	jr nz, .delayBetweenDrifts
	inc d
	dec b
	jr nz, .smokePuffDriftLoop
	pop bc
	dec e
	jr nz, .shiftColumnsUp
	xor a
	ldh [rWY], a
	ldh [hWY], a
	call VermilionDock_EraseSSAnne
	ld a, $90
	ldh [hWY], a
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	pop hl
	pop bc
	ld a, b
	ld [hld], a
	ld [hl], c
	call LoadPlayerSpriteGraphics
	ld hl, wNumberOfWarps
	dec [hl]
	ret

VermilionDock_AnimSmokePuffDriftRight:
	push bc
	push de
	ld hl, wShadowOAMSprite04XCoord
	ld a, [wSSAnneSmokeDriftAmount]
	swap a
	ld c, a
	ld de, OBJ_SIZE
.driftLoop
	inc [hl]
	inc [hl]
	add hl, de
	dec c
	jr nz, .driftLoop
	pop de
	pop bc
	ret

VermilionDock_EmitSmokePuff:
; new smoke puff above the S.S. Anne's front smokestack
	ld a, [wSSAnneSmokeX]
	sub 16
	ld [wSSAnneSmokeX], a
	ld c, a
	ld b, 100 ; Y
	ld a, [wSSAnneSmokeDriftAmount]
	inc a
	ld [wSSAnneSmokeDriftAmount], a
	ld a, $1
	ld de, VermilionDockOAMBlock
	jp WriteOAMBlock

VermilionDockOAMBlock: ; marcelnote - modified cut/boulder dust animation
	db $fc, OAM_PAL1
	db $fc, OAM_PAL1
	db $fc, OAM_PAL1
	db $fc, OAM_PAL1

VermilionDock_SyncScrollWithLY:
	ld h, d
	ld l, $50
	call .syncScrollLY
	lb hl, $0, $80
.syncScrollLY
	ldh a, [rLY]
	cp l
	jr nz, .syncScrollLY
	ld a, h
	ldh [rSCX], a
.waitForLYMatch
	ldh a, [rLY]
	cp h
	jr z, .waitForLYMatch
	ret

VermilionDock_EraseSSAnne:
; Fill the area the S.S. Anne occupies in BG map 0 with water tiles.
	ld hl, wVermilionDockTileMapBuffer
	ld bc, wVermilionDockTileMapBufferEnd - wVermilionDockTileMapBuffer
	ld a, $14 ; water tile
	call FillMemory
	hlbgcoord 0, 10
	ld de, wVermilionDockTileMapBuffer
	lb bc, BANK(wVermilionDockTileMapBuffer), 12
	call CopyVideoData

; Replace the blocks of the lower half of the ship with water blocks. This
; leaves the upper half alone, but that doesn't matter because replacing any of
; the blocks is unnecessary because the blocks the ship occupies are south of
; the player and won't be redrawn when the player automatically walks north and
; exits the map. This code could be removed without affecting anything.
	hlowcoord 5, 2, VERMILION_DOCK_WIDTH
	ld a, $d ; water block
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld a, SFX_SS_ANNE_HORN
	call PlaySound
	ld c, 120
	jp DelayFrames

VermilionDockAllAboardScript:
	xor a
	ldh [hJoyHeld], a
	ld a, VERMILIONDOCK_SAILOR
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	call UpdateSprites
	ld c, 30
	call DelayFrames
	ld a, TOGGLE_VERMILION_DOCK_SAILOR
	ld [wToggleableObjectIndex], a
	predef HideObjectCont
	ld a, TOGGLE_MANDARIN_DOCK_SAILOR
	ld [wToggleableObjectIndex], a
	predef HideObjectCont
	ld a, PAD_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesEnd+1], a
	ld a, 2
	ld [wSimulatedJoypadStatesIndex], a
	ld a, SCRIPT_VERMILIONDOCK_PLAYER_MOVING_DOWN
	ld [wVermilionDockCurScript], a
	jp StartSimulatingJoypadStates

VermilionDockPlayerMovingDownScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld c, 10
	call DelayFrames
	ld a, SCRIPT_VERMILIONDOCK_DEFAULT
	ld [wVermilionDockCurScript], a
	ret

VermilionDock_TextPointers:
	def_text_pointers
	dw_const VermilionDockSailorText, TEXT_VERMILIONDOCK_SAILOR

VermilionDockSailorText:
	text_asm
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_DOWN
	ld hl, .CantSurfHereText
	ret nz
	ld hl, .AreYouReadyText
	call PrintText
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .saidNo
	ld a, MANDARIN_DOCK
	ld [wLastMap], a
	ld a, SCRIPT_VERMILIONDOCK_ALL_ABOARD
	ld [wVermilionDockCurScript], a
	ld hl, .AllAboardText
	call PrintText
.saidNo
	rst TextScriptEnd

.CantSurfHereText:
	text_far _VermilionDockSailorCantSurfHereText
	text_end

.AreYouReadyText:
	text_far _VermilionDockSailorAreYouReadyText
	text_end

.AllAboardText:
	text_far _VermilionDockSailorAllAboardText
	text_end
