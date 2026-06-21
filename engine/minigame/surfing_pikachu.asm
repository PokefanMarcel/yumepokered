; marcelnote - Pikachu Surfing minigame
SurfingPikachuMinigame::
	call SurfingPikachuMinigame_BlankPals
	call DelayFrame
	call DelayFrame
	call DelayFrame
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a
	ld a, [wUpdateSpritesEnabled]
	push af
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	ldh a, [rIE]
	push af
	xor a
	ldh [rIF], a
	ld a, IE_VBLANK | IE_STAT | IE_TIMER | IE_SERIAL
	ldh [rIE], a
	ld a, $8
	ldh [rSTAT], a
	ldh a, [hAutoBGTransferDest + 1]
	push af
	ld a, HIGH(vBGMap0)
	ldh [hAutoBGTransferDest + 1], a
	call SurfingPikachuMinigameIntro
	call SurfingPikachuLoop
	xor a
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
;	call SurfingMinigame_UpdatePalettes
	call ClearObjectAnimationBuffers
	call ClearSprites
	xor a
	ldh [hLCDCPointer], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $90
	ldh [hWY], a
	call DelayFrame
	pop af
	ldh [hAutoBGTransferDest + 1], a
	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	xor a
	ldh [rSTAT], a
	call RunDefaultPaletteCommand
	call ReloadMapAfterSurfingMinigame
	call PlayDefaultMusic
	call GBPalNormal
	pop af
	ld [wUpdateSpritesEnabled], a
	pop af
	ldh [hTileAnimations], a
	ret

SurfingPikachuLoop:
	call SurfingPikachuMinigame_LoadGFXAndLayout
	call DelayFrame
;	ld b, SET_PAL_SURFING_PIKACHU_MINIGAME
;	call RunPaletteCommand
.loop
	ld a, [wSurfingMinigameRoutineNumber]
	bit 7, a
	ret nz
	call SurfingPikachu_GetJoypad_3FrameBuffer
	ldh a, [hJoyPressed]
	and PAD_SELECT
	ret nz ; if pressed Select, exit the minigame
	call RunSurfingMinigameRoutine
	ld a, 15 * OBJ_SIZE
	ld [wCurrentAnimatedObjectOAMBufferOffset], a
	call RunObjectAnimations
	call SurfingMinigame_MoveClouds
	call DelayFrame
	call SurfingMinigame_UpdateMusicTempo
	jr .loop

;SurfingPikachu_ToggleStartFlag: ; unused
;	ldh a, [hJoyPressed]
;	and PAD_START
;	ret z
;	ld hl, wSurfingMinigameUnusedToggle
;	ld a, [hl]
;	xor $1
;	ld [hl], a
;	ret

; Adapted from pokeyellow for Crysaudio: update the active music channels'
; tempo only when they are about to start their next note.
SurfingMinigame_UpdateMusicTempo:
	ld a, [wSurfingMinigameMusicTempoEnabled]
	and a
	ret z

	; Check that channels 1-3 are on their last frame of note duration.
	ld a, [wChannel1NoteDuration]
	dec a
	ret nz
	ld a, [wChannel2NoteDuration]
	dec a
	ret nz
	ld a, [wChannel3NoteDuration]
	dec a
	ret nz

	; de = ([wSurfingMinigamePikachuSpeed] & 0x3ff) * 2
	ld a, [wSurfingMinigamePikachuSpeed]
	ld e, a
	ld a, [wSurfingMinigamePikachuSpeed + 1]
	and $3
	ld d, a
	sla e
	rl d
	ld e, d
	ld d, 0
	ld hl, .Tempos
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	jr SurfingMinigame_ApplyMusicTempo

.Tempos:
	dw 117
	dw 109
	dw 101
	dw  93
	dw  85

SurfingMinigame_ResetMusicTempo:
	ld a, [wChannel1NoteDuration]
	dec a
	ret nz
	ld a, [wChannel2NoteDuration]
	dec a
	ret nz
	ld a, [wChannel3NoteDuration]
	dec a
	ret nz
	ld de, 117
	; fallthrough

SurfingMinigame_ApplyMusicTempo:
	ld a, e
	ld [wChannel1Tempo], a
	ld [wChannel2Tempo], a
	ld [wChannel3Tempo], a
	ld a, d
	ld [wChannel1Tempo + 1], a
	ld [wChannel2Tempo + 1], a
	ld [wChannel3Tempo + 1], a
	xor a
	ld [wChannel1Field16], a
	ld [wChannel2Field16], a
	ld [wChannel3Field16], a
	ret

SurfingPikachuMinigame_LoadGFXAndLayout:
	di
	call SurfingPikachu_ClearTileMap
	call ClearSprites
	call DisableLCD
	ld hl, wSurfingMinigameData
	ld bc, wSurfingMinigameDataEnd - wSurfingMinigameData
	xor a
	call FillMemory
	ld hl, wLYOverrides
	ld bc, wLYOverridesBufferEnd - wLYOverrides
	xor a
	call FillMemory
	xor a
	ldh [hAutoBGTransferEnabled], a
	call ClearObjectAnimationBuffers

	ld hl, SurfingPikachuBGGraphics
	ld de, vChars2
	ld bc, 54 tiles
	call CopyData

	ld hl, SurfingPikachuGameplayGraphics
	ld de, vChars0
	ld bc, SurfingPikachuGameplayGraphicsEnd - SurfingPikachuGameplayGraphics
	call CopyData

	ld a, LOW(SurfingPikachuObjectSpawnData)
	ld [wAnimatedObjectSpawnStateDataPointer], a
	ld a, HIGH(SurfingPikachuObjectSpawnData)
	ld [wAnimatedObjectSpawnStateDataPointer + 1], a

	ld a, LOW(SurfingPikachuObjectCallbacks)
	ld [wAnimatedObjectJumptablePointer], a
	ld a, HIGH(SurfingPikachuObjectCallbacks)
	ld [wAnimatedObjectJumptablePointer + 1], a

	ld a, LOW(SurfingPikachuOAMData)
	ld [wAnimatedObjectOAMDataPointer], a
	ld a, HIGH(SurfingPikachuOAMData)
	ld [wAnimatedObjectOAMDataPointer + 1], a

	ld a, LOW(SurfingPikachuFrames)
	ld [wAnimatedObjectFramesDataPointer], a
	ld a, HIGH(SurfingPikachuFrames)
	ld [wAnimatedObjectFramesDataPointer + 1], a

	ld hl, vBGMap0
	ld bc, 2 * TILEMAP_AREA
	ld a, $7f ; blank tile
	call FillMemory

	bgcoord hl, 0, 6
	ld bc, 12 * TILEMAP_WIDTH
	ld a, $55 ; water tile
	call FillMemory

	ld a, $1 ; surfing Pikachu
	lb de, $74, $58
	call SpawnAnimatedObject

	ld a, $74
	ld [wSurfingMinigamePikachuObjectHeight], a

	call SurfingMinigame_InitScanlineOverrides

	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $7e
	ldh [hWY], a
	ld a, rSCY - $ff00
	ldh [hLCDCPointer], a
	ld a, $40
	ld [wSurfingMinigamePikachuSpeed], a
	xor a
	ld [wSurfingMinigamePikachuSpeed + 1], a
	xor a
	ld [wSurfingMinigamePikachuHP], a
	ld a, $60
	ld [wSurfingMinigamePikachuHP + 1], a
	ld hl, wSurfingMinigameWaveHeight
	ld bc, $14
	ld a, $74
	call FillMemory
	call SurfingPikachuMinigame_InitStaticSpriteLayout
	call SurfingPikachuMinigame_DrawStaticTilemapLayout
	ld a, $e3
	ldh [rLCDC], a
	call SurfingPikachuMinigame_SetBGPals
	ld a, $e4
	ldh [rOBP0], a
	ld a, $e0
	ldh [rOBP1], a
;	call SurfingMinigame_UpdatePalettes
	reti

SurfingPikachuMinigame_SetBGPals:
	ld a, [wOnSGB]
	and a
	ld a, $e4
	jr nz, .sgb
	ld a, $d0
.sgb
	ldh [rBGP], a
;	call SurfingMinigame_UpdatePalettes
	ret

SurfingPikachuMinigame_InitStaticSpriteLayout:
	ld hl, wSpriteDataEnd
	ld de, SurfingPikachuHPDigitTiles
	lb bc, $97, $80
	ld a, 4
	call SurfingPikachuMinigame_PlaceSpriteRowFromTiles
	ld de, SurfingPikachuMiniPikachuTile
	lb bc, $96, $50
	ld a, 1
	call SurfingPikachuMinigame_PlaceSpriteRowFromTiles
	ld de, SurfingPikachuWideCloudTiles
	lb bc, $14, $20
	ld a, 5
	call SurfingPikachuMinigame_PlaceSpriteRowFromTiles
	ld de, SurfingPikachuNarrowCloudTiles
	lb bc, $20, $80
	ld a, 4
	jp SurfingPikachuMinigame_PlaceSpriteRowFromTiles

SurfingPikachuMinigame_PlaceSpriteRowFromTiles:
.loop
	push af
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [de]
	ld [hli], a
	xor a
	ld [hli], a
	ld a, c
	add $8
	ld c, a
	inc de
	pop af
	dec a
	jr nz, .loop
	ret

SurfingPikachuMiniPikachuTile:
	db $d9

SurfingPikachuHPDigitTiles:
	REPT 4
		db $f0
	ENDR

SurfingPikachuWideCloudTiles:
	db $96
	db $97
	db $97
	db $98
	db $99

SurfingPikachuNarrowCloudTiles:
	db $96
	db $97
	db $98
	db $99

SurfingPikachuMinigame_DrawStaticTilemapLayout:
	bgcoord de, 1, 1, vBGMap1
	ld hl, .StatusBarTiles
	ld c, 9
.copyTileRow
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyTileRow
	bgcoord hl, 1, 0, vBGMap1
	ld [hl], $15
	bgcoord hl, 2, 0, vBGMap1
	ld [hl], $16
	bgcoord hl, 12, 1, vBGMap1
	ld [hl], $1b
	bgcoord hl, 13, 1, vBGMap1
	ld [hl], $1c
	ret

.StatusBarTiles:
	db $17, $18, $19, $19, $19, $19, $19, $19, $19

RunSurfingMinigameRoutine:
	ld a, [wSurfingMinigameRoutineNumber]
	add a
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw SurfingMinigame_StartGame ; 0
	dw SurfingMinigame_RunGame ; 1
	dw SurfingMinigame_WaitToShowResults ; 2
	dw SurfingMinigame_ScrollToResultsScreen ; 3
	dw SurfingMinigame_DrawResultsScreenAndWait ; 4
	dw SurfingMinigame_WriteHPLeftAndWait ; 5
	dw SurfingMinigame_WriteRadnessAndWait ; 6
	dw SurfingMinigame_WriteTotalAndWait ; 7
	dw SurfingMinigame_AddRemainingHPToTotalAndWait ; 8
	dw SurfingMinigame_AddRadnessToTotalAndWait ; 9
	dw SurfingMinigame_WaitLast ; a
	dw SurfingMinigame_ExitOnPressA ; b
	dw SurfingMinigame_GameOver ; c

SurfingMinigame_StartGame:
	ld a, $2 ; START
	lb de, $48, $e0
	call SpawnAnimatedObject
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	ld a, 1
	ld [wSurfingMinigameMusicTempoEnabled], a
	ret

SurfingMinigame_RunGame:
	ld a, [wSurfingMinigameDistance]
	cp $18 ; end of the 24-section course
	jr nc, .finished
	ld hl, wSurfingMinigamePikachuHP
	ld a, [hli]
	or [hl]
	jr z, .dead
	call Random
	ld [wSurfingMinigameWaveRandomValue], a
	call SurfingMinigame_UpdateLYOverrides
	call SurfingMinigame_SetPikachuHeight
	call SurfingMinigame_ReadBGMapBuffer
	call SurfingMinigame_ScrollAndGenerateBGMap
	call SurfingMinigame_UpdatePikachuDistance
	call SurfingMinigame_Deduct1HP
	jp SurfingMinigame_DrawHP

.finished
	ld a, $3 ; GOAL ; marcelnote - restored GOAL anim
	lb de, $48, $e0
	call SpawnAnimatedObject
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	xor a
	ld [wSurfingMinigameMusicTempoEnabled], a
	ld a, 192
	ld [wSurfingMinigameRoutineDelay], a
	ret

.dead
	ld a, 1
	ld [wSurfingMinigameGameOver], a
	ld a, $c
	ld [wSurfingMinigameRoutineNumber], a
	ld a, $80
	ld [wSurfingMinigameGameOverDelay], a
	ld a, $b ; Oh no...
	lb de, $88, $58
	call SpawnAnimatedObject
	ld hl, ANIM_OBJ_Y_OFFSET
	add hl, bc
	ld [hl], $80
	ld hl, ANIM_OBJ_FIELD_B
	add hl, bc
	ld [hl], $80
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld [hl], $30
	xor a
	ld [wSurfingMinigameMusicTempoEnabled], a
	ret

SurfingMinigame_WaitToShowResults:
	call SurfingMinigame_RunDelayTimer
	jr c, .doneDelay
	xor a
	ld [wSurfingMinigameWaveRandomValue], a
	call SurfingMinigame_UpdateLYOverrides
	call SurfingMinigame_SetPikachuHeight
	call SurfingMinigame_ReadBGMapBuffer
	call SurfingMinigame_CoastAfterGoal
	jp SurfingMinigame_ResetMusicTempo

.doneDelay
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	ld a, $90
	ldh [hSCX], a
	ld a, $72
	ld [wSurfingMinigameWaveFunctionNumber], a
	ld a, $4
	ld [wSurfingMinigamePikachuState], a ; game over
	xor a
	ldh [hLCDCPointer], a
	ld hl, wSurfingMinigameSCX
	ld [hli], a ; wSurfingMinigameSCX
	ld [hli], a ; wSurfingMinigameSCX2
	ld [hl], a  ; wSurfingMinigameSCXHi
	ret

SurfingMinigame_ScrollToResultsScreen:
	ldh a, [hSCX]
	and a
	jr z, .finished
	call SurfingMinigame_UpdateLYOverrides
	call SurfingMinigame_SetPikachuHeight
	call SurfingMinigame_ReadBGMapBuffer
	ldh a, [hSCX]
	sub $4
	ldh [hSCX], a
	ld a, $e0
	ld [wSurfingMinigameXOffset], a
	jp SurfingMinigame_GenerateBGMap

.finished
	xor a
	ld hl, wSurfingMinigamePikachuSpeed
	ld [hli], a
	ld [hl], a
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	ld a, $5
	ld [wSurfingMinigamePikachuState], a ; initialize results pose
	ret

SurfingMinigame_DrawResultsScreenAndWait:
	call SurfingMinigame_DrawResultsScreen
	ld a, 32
	jr SurfingMinigame_SetDelayAndAdvanceRoutine

SurfingMinigame_WriteHPLeftAndWait:
	call SurfingMinigame_RunDelayTimer
	ret nc
	call SurfingMinigame_WriteHPLeft
	ld a, 64
	jr SurfingMinigame_SetDelayAndAdvanceRoutine

SurfingMinigame_WriteRadnessAndWait:
	call SurfingMinigame_RunDelayTimer
	ret nc
	call SurfingMinigame_WriteRadness
	ld a, 64
	jr SurfingMinigame_SetDelayAndAdvanceRoutine

SurfingMinigame_WriteTotalAndWait:
	call SurfingMinigame_RunDelayTimer
	ret nc
	call SurfingMinigame_WriteTotal
	ld a, 64
	jr SurfingMinigame_SetDelayAndAdvanceRoutine

SurfingMinigame_AddRemainingHPToTotalAndWait:
	call SurfingMinigame_RunDelayTimer
	ret nc
	call SurfingMinigame_AddRemainingHPToTotal
	push af
	call SurfingMinigame_BCDPrintTotalScore
	pop af
	ret nc
	ld a, 64
	jr SurfingMinigame_SetDelayAndAdvanceRoutine

SurfingMinigame_AddRadnessToTotalAndWait:
	call SurfingMinigame_RunDelayTimer
	ret nc
	call SurfingMinigame_AddRadnessToTotal
	push af
	call SurfingMinigame_BCDPrintTotalScore
	pop af
	ret nc
	ld a, 128
	call SurfingMinigame_SetDelayAndAdvanceRoutine
	call DidPlayerGetAHighScore
	ret nc
	call SurfingMinigame_PrintTextHiScore
	ld a, $6
	ld [wSurfingMinigamePikachuState], a ; animate results pose
	ret

SurfingMinigame_SetDelayAndAdvanceRoutine:
	ld [wSurfingMinigameRoutineDelay], a
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	ret

SurfingMinigame_WaitLast:
	call SurfingMinigame_RunDelayTimer
	ret nc
	ld hl, wSurfingMinigameRoutineNumber
	inc [hl]
	ret

SurfingMinigame_ExitOnPressA:
	call SurfingMinigame_UpdateLYOverrides
	ldh a, [hJoyPressed]
	and PAD_A
	ret z
	ld hl, wSurfingMinigameRoutineNumber
	set 7, [hl]
	ret

SurfingMinigame_GameOver:
	call SurfingMinigame_UpdateLYOverrides
	call SurfingMinigame_SetPikachuHeight
	call SurfingMinigame_ReadBGMapBuffer
	call SurfingMinigame_ScrollAndGenerateBGMap
	call SurfingMinigame_ResetMusicTempo
	ld hl, wSurfingMinigameGameOverDelay
	ld a, [hl]
	and a
	jr z, .waitPressA
	dec [hl]
	ret

.waitPressA
	ldh a, [hJoyPressed]
	and PAD_A
	ret z
	ld hl, wSurfingMinigameRoutineNumber
	set 7, [hl]
	ret

SurfingMinigame_RunDelayTimer:
	ld hl, wSurfingMinigameRoutineDelay
	ld a, [hl]
	and a
	jr z, .setCarry
	dec [hl]
	ret

.setCarry
	scf
	ret

SurfingMinigame_UpdatePikachuDistance:
	ld a, [wSurfingMinigameDistance + 1]
	ld h, a
	ld a, [wSurfingMinigameDistance + 2]
	ld l, a
	ld a, [wSurfingMinigamePikachuSpeed]
	ld e, a
	ld a, [wSurfingMinigamePikachuSpeed + 1]
	ld d, a
	add hl, de
	ld a, h
	ld [wSurfingMinigameDistance + 1], a
	ld a, l
	ld [wSurfingMinigameDistance + 2], a
	ret nc
	ld hl, wSurfingMinigameDistance
	inc [hl]
	ld hl, wShadowOAMSprite04XCoord
	dec [hl]
	dec [hl]
	ret

SurfingMinigameAnimatedObjectFn_Pikachu:
	ld a, [wSurfingMinigamePikachuState]
	ld e, a
	ld d, 0
	ld hl, .StateFunctions
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.StateFunctions:
	dw SurfingMinigame_UpdateRidingPikachu
	dw SurfingMinigame_UpdateJumpingPikachu
	dw SurfingMinigame_UpdateLandingPikachu
	dw SurfingMinigame_UpdateCrashedPikachu
	dw SurfingMinigame_UpdateGameOverPikachu
	dw SurfingMinigame_InitResultsPikachu
	dw SurfingMinigame_UpdateResultsPikachu

SurfingMinigame_UpdateRidingPikachu:
	ld a, [wSurfingMinigameGameOver]
	and a
	jr nz, .gameOver
	call SurfingMinigame_SpawnWaterSpray
	ld a, [wSurfingMinigamePikachuObjectHeight]
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld [hl], a
	call SurfingMinigame_TryStartJump
	jr c, .startedJump
	call SurfingMinigame_UpdateSurfingFrame
	jp SurfingMinigame_SpeedUpPikachu

.startedJump
	call SurfingMinigame_UpdateSurfingFrame
	ld a, $1 ; jumping
	ld [wSurfingMinigamePikachuState], a
	xor a
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld [hl], a
	ld hl, ANIM_OBJ_FIELD_D
	add hl, bc
	ld [hl], a
	ld hl, ANIM_OBJ_FIELD_E
	add hl, bc
	ld [hl], a
	ld [wSurfingMinigameRadnessMeter], a
	ld [wSurfingMinigameTrickFlags], a
	ld a, SFX_SURFING_JUMP
	jp PlaySound

.gameOver
	xor a
	ld hl, wSurfingMinigamePikachuSpeed
	ld [hli], a
	ld [hl], a
	ld a, $4
	ld [wSurfingMinigamePikachuState], a
	jp SurfingMinigame_UpdateSurfingFrame

SurfingMinigame_UpdateJumpingPikachu:
	call SurfingMinigame_DPadAction
	call SurfingMinigame_UpdatePikachuHeight
	ret nc
	call SurfingMinigame_TileInteraction
	jr c, .crash
	call SurfingMinigame_CalculateAndAddRadnessFromStunt
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld [hl], $0
	ld a, $2
	ld [wSurfingMinigamePikachuState], a
	ret

.crash
	ld a, $3
	ld [wSurfingMinigamePikachuState], a
	ld a, $60
	ld [wSurfingMinigameCrashTimer], a
	ld a, $10
	call SetCurrentAnimatedObjectCallbackAndResetFrameStateRegisters
	ld a, SFX_SURFING_CRASH
	jp PlaySound

SurfingMinigame_UpdateLandingPikachu:
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, .done
	ld d, $4
	add d
	ld [hl], a
	call SurfingPikachu_Sine
	ld hl, ANIM_OBJ_Y_OFFSET
	add hl, bc
	ld [hl], a
	call SurfingMinigame_SpawnWaterSpray
	ld a, [wSurfingMinigamePikachuObjectHeight]
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld [hl], a
	ret

.done
	ld hl, ANIM_OBJ_Y_OFFSET
	add hl, bc
	ld [hl], 0
	xor a
	ld [wSurfingMinigamePikachuState], a
	ret

SurfingMinigame_UpdateCrashedPikachu:
	ld hl, wSurfingMinigameCrashTimer
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ld a, [wSurfingMinigamePikachuObjectHeight]
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld [hl], a
	ret

.done
	xor a
	ld [wSurfingMinigamePikachuState], a
	ld a, $4
	jp SetCurrentAnimatedObjectCallbackAndResetFrameStateRegisters

SurfingMinigame_UpdateGameOverPikachu:
	ld a, [wSurfingMinigamePikachuObjectHeight]
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld [hl], a
	jp SurfingMinigame_UpdateSurfingFrame

SurfingMinigame_InitResultsPikachu:
	ld a, $f
	call SetCurrentAnimatedObjectCallbackAndResetFrameStateRegisters
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld [hl], 0
	ret

SurfingMinigame_UpdateResultsPikachu:
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	and $3f
	cp $20
	jr c, .resetOffset
	ld d, $10
	call SurfingPikachu_Sine
	ld hl, ANIM_OBJ_Y_OFFSET
	add hl, bc
	ld [hl], a
	ret

.resetOffset
	ld hl, ANIM_OBJ_Y_OFFSET
	add hl, bc
	ld [hl], 0
	ret

SurfingMinigame_DPadAction:
	ld de, hJoy5
	ld a, [de]
	and PAD_LEFT
	jr nz, .dLeft
	ld a, [de]
	and PAD_RIGHT
	jr nz, .dRight
	ret

.dLeft
	ld hl, ANIM_OBJ_FIELD_E
	add hl, bc
	ld [hl], $0
	ld hl, ANIM_OBJ_FIELD_D
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $b
	jr c, .dLeftSkip
	call .StartTrick
	ld hl, wSurfingMinigameTrickFlags
	set 0, [hl]
.dLeftSkip
	ld hl, ANIM_OBJ_FRAME_SET
	add hl, bc
	ld a, [hl]
	cp $e
	jr nc, .dLeftReset
	inc [hl]
	ret

.dLeftReset
	ld [hl], 1
	ret

.dRight
	ld hl, ANIM_OBJ_FIELD_D
	add hl, bc
	ld [hl], 0
	ld hl, ANIM_OBJ_FIELD_E
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $d
	jr c, .dRightSkip
	call .StartTrick
	ld hl, wSurfingMinigameTrickFlags
	set 1, [hl]
.dRightSkip
	ld hl, ANIM_OBJ_FRAME_SET
	add hl, bc
	ld a, [hl]
	dec a
	jr z, .dRightReset
	ld [hl], a
	ret

.dRightReset
	ld [hl], $e
	ret

.StartTrick:
	call SurfingMinigame_IncreaseRadnessMeter
	xor a
	ld hl, ANIM_OBJ_FIELD_D
	add hl, bc
	ld [hl], a
	ld hl, ANIM_OBJ_FIELD_E
	add hl, bc
	ld [hl], a
	ld a, SFX_SURFING_FLIP
	jp PlaySound

SurfingMinigame_TileInteraction:
	ld hl, ANIM_OBJ_FRAME_SET
	add hl, bc
	ld d, [hl]
	ld a, [wSurfingMinigameBGMapReadBuffer]
	cp $6
	jr z, .risingSlope
	cp $14
	jr z, .tile14
	cp $12
	jr z, .tile12
	cp $7
	jr z, .fallingSlope
	dec d ; 1?
	jr z, .wipeout
	dec d ; 2?
	jr z, .hardLanding
	dec d ; 3?
	jr z, .roughLanding
	dec d ; 4?
	jr z, .cleanLanding
	dec d ; 5?
	jr z, .roughLanding
	dec d ; 6?
	jr z, .hardLanding
	dec d ; 7?
	jr z, .wipeout
	jr .wipeout

.risingSlope
	dec d ; 1?
	jr z, .wipeout
	dec d ; 2?
	jr z, .wipeout
	dec d ; 3?
	jr z, .wipeout
	dec d ; 4?
	jr z, .hardLanding
	dec d ; 5?
	jr z, .roughLanding
	dec d ; 6?
	jr z, .cleanLanding
	dec d ; 7?
	jr z, .roughLanding
	jr .wipeout

.fallingSlope
	dec d ; 1?
	jr z, .roughLanding
	dec d ; 2?
	jr z, .cleanLanding
	dec d ; 3?
	jr z, .roughLanding
	dec d ; 4?
	jr z, .hardLanding
	dec d ; 5?
	jr z, .wipeout
	dec d ; 6?
	jr z, .wipeout
	dec d ; 7?
	jr z, .wipeout
	jr .wipeout

.tile12
.tile14
	dec d ; 1?
	jr z, .wipeout
	dec d ; 2?
	jr z, .hardLanding
	dec d ; 3?
	jr z, .roughLanding
	dec d ; 4?
	jr z, .cleanLanding
	dec d ; 5?
	jr z, .cleanLanding
	dec d ; 6?
	jr z, .roughLanding
	dec d ; 7?
	jr z, .hardLanding
	jr .wipeout

.hardLanding
	ld de, -128
	jr .reduceSpeed

.roughLanding
	ld de, -64
.reduceSpeed
	ld hl, wSurfingMinigamePikachuSpeed
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld de, wSurfingMinigamePikachuSpeed
	jr nc, .stop
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	jr .cleanLanding

.stop
	xor a
	ld [de], a
	inc de
	ld [de], a
.cleanLanding
	ld a, SFX_SURFING_LAND
	call PlaySound
	and a
	ret

.wipeout
	ld de, wSurfingMinigamePikachuSpeed
	ld a, $40
	ld [de], a
	inc de
	xor a
	ld [de], a
	scf
	ret

SurfingMinigame_SpeedUpPikachu:
	ld a, [wSurfingMinigamePikachuSpeed + 1]
	cp $2
	ret nc
	ld h, a
	ld a, [wSurfingMinigamePikachuSpeed]
	ld l, a
	ld de, $2
	add hl, de
	ld a, h
	ld [wSurfingMinigamePikachuSpeed + 1], a
	ld a, l
	ld [wSurfingMinigamePikachuSpeed], a
	ret

SurfingMinigame_TryStartJump:
	ldh a, [hSCX]
	and $7
	cp $3
	jr c, .noJump
	cp $5
	jr nc, .noJump
	ld a, [wSurfingMinigameBGMapReadBuffer]
	cp $14
	jr nz, .noJump
	call SurfingMinigame_GetSpeedDividedBy32
	cp $a
	jr c, .noJump
	ld [wSurfingMinigameJumpArcMagnitude], a
	call SurfingMinigame_ResetJumpArc
	scf
	ret

.noJump
	and a
	ret

SurfingMinigame_UpdateSurfingFrame:
	ldh a, [hSCX]
	and $7
	cp $3
	ret c
	cp $5
	ret nc
	ld a, [wSurfingMinigameBGMapReadBuffer]
	cp $6
	jr z, .risingSlope
	cp $14
	jr z, .risingSlope
	cp $7
	jr z, .fallingSlope
	call SurfingMinigame_UpdateBoardAngle
	ld a, $4
	ld hl, ANIM_OBJ_FRAME_SET
	add hl, bc
	ld [hl], a
	ret

.risingSlope
	ld a, $6
	jr .selectFrame

.fallingSlope
	ld a, $2
.selectFrame
	ld e, a
	ld a, [wSurfingMinigameBoardAngleOffset]
	dec a
	add e
	ld hl, ANIM_OBJ_FRAME_SET
	add hl, bc
	ld [hl], a
	ret

SurfingMinigame_UpdateBoardAngle:
	ld hl, wSurfingMinigameBoardAngleTimer
	ld a, [hl]
	inc [hl]
	and $7
	ret nz
	ld a, [wSurfingMinigameBoardAngleDecreasing]
	and a
	jr z, .increase
	ld a, [wSurfingMinigameBoardAngleOffset]
	and a
	jr z, .startIncreasing
	dec a
	ld [wSurfingMinigameBoardAngleOffset], a
	ret

.startIncreasing
	xor a
	ld [wSurfingMinigameBoardAngleDecreasing], a
	ret

.increase
	ld a, [wSurfingMinigameBoardAngleOffset]
	cp $2
	jr z, .startDecreasing
	inc a
	ld [wSurfingMinigameBoardAngleOffset], a
	ret

.startDecreasing
	ld a, 1
	ld [wSurfingMinigameBoardAngleDecreasing], a
	ret

SurfingMinigame_GetSpeedDividedBy32:
	ld a, [wSurfingMinigamePikachuSpeed]
	ld l, a
	ld a, [wSurfingMinigamePikachuSpeed + 1]
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, h
	ret

SurfingMinigame_SpawnWaterSpray:
	ld hl, wSurfingMinigameWaterSprayCounter
	ld a, [hl]
	inc [hl]
	and $3
	ret nz
	call .GetYCoord
	ld d, a
	ld hl, ANIM_OBJ_X_COORD
	add hl, bc
	ld e, [hl]
	ld a, $a ; water spray
	push bc
	call SpawnAnimatedObject
	pop bc
	ret

.GetYCoord:
	ldh a, [hSCX]
	and $8
	jr nz, .getHeightPlus9
	ld hl, wSurfingMinigameWaveHeight + 8
	jr .gotHL

.getHeightPlus9
	ld hl, wSurfingMinigameWaveHeight + 9
.gotHL
	ld a, [wSurfingMinigameBGMapReadBuffer + 1]
	cp $6
	jr z, .sixOrTwenty
	cp $14
	jr z, .sixOrTwenty
	cp $7
	jr z, .seven
	ld a, [hl]
	ret

.sixOrTwenty
	ldh a, [hSCX]
	and $7
	ld e, a
	ld a, [hl]
	sub e
	ret

.seven
	ldh a, [hSCX]
	and $7
	add [hl]
	ret

SurfingMinigame_MoveBannerToCenter:
	ld hl, ANIM_OBJ_X_COORD
	add hl, bc
	ld a, [hl]
	cp $58
	ret z
	add $4
	ld [hl], a
	ret

;Func_f8807: ; unreferenced
;	jp MaskCurrentAnimatedObjectStruct

SurfingMinigameAnimatedObjectFn_FlippingPika:
	ld hl, ANIM_OBJ_FIELD_B
	add hl, bc
	ld a, [hl]
	and a
	ret z
	dec [hl]
	dec [hl]
	ld d, a
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld a, [hl]
	inc [hl]
	call SurfingPikachu_Sine
	cp $80
	jr nc, .positive
	xor $ff
	inc a
.positive
	ld hl, ANIM_OBJ_Y_OFFSET
	add hl, bc
	ld [hl], a
	ret

SurfingMinigameAnimatedObjectFn_IntroAnimationPikachu:
	ld hl, ANIM_OBJ_FIELD_B
	add hl, bc
	ld a, [hl]
	inc [hl]
	and $1
	ret z
	ld hl, ANIM_OBJ_X_COORD
	add hl, bc
	ld a, [hl]
	cp $c0
	jr z, .done
	inc [hl]
	ret

.done
	ld a, 1
	ld [wSurfingMinigameIntroAnimationFinished], a
	jp MaskCurrentAnimatedObjectStruct

SurfingMinigame_MoveClouds:
	ld a, [wSurfingMinigameCloudScrollFraction]
	ld e, a
	ld d, 0
	ld a, [wSurfingMinigamePikachuSpeed]
	ld l, a
	ld a, [wSurfingMinigamePikachuSpeed + 1]
	ld h, a
	add hl, de
	ld a, l
	ld [wSurfingMinigameCloudScrollFraction], a
	ld d, h
	ld hl, wShadowOAMSprite05XCoord
	ld e, $9
.loop
	ld a, [hl]
	add d
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec e
	jr nz, .loop
	ret

SurfingMinigame_ReadBGMapBuffer:
	ldh a, [hSCX]
	add $48
	ld e, a
	srl e
	srl e
	srl e
	ld d, $0
	ld hl, vBGMap0
	add hl, de
	ld a, [wSurfingMinigamePikachuObjectHeight]
	srl a
	srl a
	srl a
	ld c, a
.loop
	ld a, c
	and a
	jr z, .copy
	dec c
	ld de, TILEMAP_WIDTH
	add hl, de
	ld a, h
	and $3
	or $98
	ld h, a
	jr .loop

.copy
	ld de, wSurfingMinigameBGMapReadBuffer
	ld a, e
	ldh [hVBlankCopyDest], a
	ld a, d
	ldh [hVBlankCopyDest + 1], a
	ld a, l
	ldh [hVBlankCopySource], a
	ld a, h
	ldh [hVBlankCopySource + 1], a
	ld a, 1
	ldh [hVBlankCopySize], a
	ret

SurfingMinigame_SetPikachuHeight:
	ldh a, [hSCX]
	and $8
	jr nz, .rightHalf
	ld hl, wSurfingMinigameWaveHeight + 7
	jr .gotWaveHeight

.rightHalf
	ld hl, wSurfingMinigameWaveHeight + 8
.gotWaveHeight
	ld a, [wSurfingMinigameBGMapReadBuffer]
	cp $6
	jr z, .risingSlope
	cp $14
	jr z, .risingSlope
	cp $7
	jr z, .fallingSlope
	ld a, [hl]
	ld [wSurfingMinigamePikachuObjectHeight], a
	ret

.risingSlope
	ldh a, [hSCX]
	and $7
	ld e, a
	ld a, [hl]
	sub e
	ld [wSurfingMinigamePikachuObjectHeight], a
	ret

.fallingSlope
	ldh a, [hSCX]
	and $7
	add [hl]
	ld [wSurfingMinigamePikachuObjectHeight], a
	ret

SurfingMinigame_Deduct1HP:
	ld hl, wSurfingMinigamePikachuHP
	ld e, $99
	call .BCD_Deduct
	ret nc
	inc hl
.BCD_Deduct:
	ld a, [hl]
	and a
	jr z, .rollOver
	sub $1
	daa
	ld [hl], a
	and a
	ret

.rollOver
	ld [hl], e
	scf
	ret

SurfingMinigame_DrawHP:
	ld de, wSurfingMinigamePikachuHP + 1
	ld hl, wShadowOAMSprite00TileID
	ld a, [de]
	call .PlaceBCDNumber
	ld hl, wShadowOAMSprite02TileID
	ld a, [de]
	; fallthrough
.PlaceBCDNumber:
	ld c, a
	swap a
	or $f0
	ld [hli], a
	inc hl
	inc hl
	inc hl
	ld a, c
	or $f0
	ld [hl], a
	dec de
	ret

SurfingMinigame_DrawResultsScreen:
	ld hl, wTileMap
	ld bc, 6 * SCREEN_WIDTH
	ld a, $7f
	call FillMemory
	ld hl, SurfingMinigame_BeachOutroTilemap
	decoord 0, 6
	ld bc, 10 * SCREEN_WIDTH
	call CopyData
	hlcoord 1, 1
	call .PlaceTextbox
	ld hl, wShadowOAMSprite05XCoord
	ld bc, 9 * OBJ_SIZE
	xor a
	call FillMemory
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret

.PlaceTextbox:
	ld de, SCREEN_WIDTH - 17
; top row
	ld a, $56 ; northwest corner
	ld [hli], a
	ld c, 16
	ld a, $5b ; horizontal bar
.placeTopRow
	ld [hli], a
	dec c
	jr nz, .placeTopRow
	ld a, $57 ; northeast corner
	ld [hl], a
; intermediate rows
	add hl, de
	ld a, $5a ; vertical bar
	ld b, 7   ; 7 rows
.placeRows
	ld [hli], a
	ld a, $7f
	ld c, 16  ; 16 tiles
.fillBlanks
	ld [hli], a
	dec c
	jr nz, .fillBlanks
	ld a, $5a ; vertical bar
	ld [hl], a
	add hl, de
	dec b
	jr nz, .placeRows
; bottom row
	ld a, $58 ; southwest corner
	ld [hli], a
	ld c, 16
	ld a, $5b ; horizontal bar
.placeBottomRow
	ld [hli], a
	dec c
	jr nz, .placeBottomRow
	ld a, $59 ; southeast corner
	ld [hl], a
	ret

SurfingMinigame_PrintTextHiScore:
	ld hl, .Hi_Score
	decoord 6, 8
	ld bc, $9
	jp CopyData

.Hi_Score:
	db $20,$2e,$2f,$30,$31,$32,$34,$35,$33 ; HI-SCORE!!

SurfingMinigame_WriteHPLeft:
	ld hl, .HP_Left
	decoord 2, 2
	ld bc, $7
	call CopyData
	jp SurfingMinigame_BCDPrintHPLeft

.HP_Left:
	db $20,$21,$ff,$22,$23,$24,$25 ; HP Left

SurfingMinigame_AddRemainingHPToTotal:
	ld c, 99
.loop
	push bc
	ld hl, wSurfingMinigamePikachuHP
	ld a, [hli]
	or [hl]
	jr z, .dead
	call SurfingMinigame_Deduct1HP
	ld e, $1
	call SurfingMinigame_AddPointsToTotal
	pop bc
	dec c
	jr nz, .loop
	ld a, SFX_PRESS_AB
	call PlaySound
	and a
	ret

.dead
	pop bc
	scf
	ret

SurfingMinigame_BCDPrintHPLeft:
	hlcoord 10, 2
	ld de, wSurfingMinigamePikachuHP + 1
	ld a, [de]
	call SurfingPikachu_PlaceBCDNumber
	inc hl
	ld a, [de]
	call SurfingPikachu_PlaceBCDNumber
	inc hl
	inc hl
	ld [hl], $1d ; P
	inc hl
	ld [hl], $25 ; t
	inc hl
	ld [hl], $26 ; s
	ret

SurfingMinigame_WriteRadness:
	ld hl, .Radness
	decoord 2, 4
	ld bc, $7
	call CopyData
	jp SurfingMinigame_BCDPrintRadness

.Radness:
	db $27,$28,$29,$2a,$23,$26,$26 ; Radness

SurfingMinigame_AddRadnessToTotal:
	ld c, 99
.loop
	push bc
	ld hl, wSurfingMinigameRadnessScore
	ld a, [hli]
	ld e, a
	or [hl]
	jr z, .done
	ld d, [hl]
	ld a, e
	sub $1
	daa
	ld e, a
	ld a, d
	sbc $0
	daa
	ld [hld], a
	ld [hl], e
	ld e, $1
	call SurfingMinigame_AddPointsToTotal
	pop bc
	dec c
	jr nz, .loop
	ld a, SFX_PRESS_AB
	call PlaySound
	and a
	ret

.done
	pop bc
	scf
	ret

SurfingMinigame_BCDPrintRadness:
	ld a, [wSurfingMinigameRadnessScore + 1]
	hlcoord 10, 4
	call SurfingPikachu_PlaceBCDNumber
	ld a, [wSurfingMinigameRadnessScore]
	hlcoord 12, 4
	call SurfingPikachu_PlaceBCDNumber
	inc hl
	inc hl
	ld [hl], $1d ; P
	inc hl
	ld [hl], $25 ; t
	inc hl
	ld [hl], $26 ; s
	ret

SurfingMinigame_AddPointsToTotal:
	ld a, [wSurfingMinigameTotalScore]
	add e
	daa
	ld [wSurfingMinigameTotalScore], a
	ld a, [wSurfingMinigameTotalScore + 1]
	adc $0
	daa
	ld [wSurfingMinigameTotalScore + 1], a
	ret nc
	ld a, $99
	ld hl, wSurfingMinigameTotalScore
	ld [hli], a
	ld [hl], a
	ret

SurfingMinigame_BCDPrintTotalScore:
	ld a, [wSurfingMinigameTotalScore + 1]
	hlcoord 10, 6
	call SurfingPikachu_PlaceBCDNumber
	ld a, [wSurfingMinigameTotalScore]
	hlcoord 12, 6
	call SurfingPikachu_PlaceBCDNumber
	inc hl
	inc hl
	ld [hl], $1d ; P
	inc hl
	ld [hl], $25 ; t
	inc hl
	ld [hl], $26 ; s
	ret

SurfingMinigame_WriteTotal:
	ld hl, .Total
	decoord 2, 6
	ld bc, $5
	call CopyData
	call SurfingMinigame_BCDPrintRadness
	jp SurfingMinigame_BCDPrintTotalScore

.Total:
	db $2b,$2c,$25,$28,$2d ; Total

DidPlayerGetAHighScore:
	ld hl, wSurfingMinigameHiScore + 1
	ld a, [wSurfingMinigameTotalScore + 1]
	cp [hl]
	jr c, .notHighScore
	jr nz, .highScore
	dec hl
	ld a, [wSurfingMinigameTotalScore]
	cp [hl]
	jr c, .notHighScore
	jr nz, .highScore
.notHighScore
	call WaitForSoundToFinish
	and a
	ret

.highScore
	ld a, [wSurfingMinigameTotalScore]
	ld [wSurfingMinigameHiScore], a
	ld a, [wSurfingMinigameTotalScore + 1]
	ld [wSurfingMinigameHiScore + 1], a
	call WaitForSoundToFinish
	ld a, SFX_GET_ITEM_2
	call PlaySound
	scf
	ret

SurfingMinigame_IncreaseRadnessMeter:
	ld a, [wSurfingMinigameRadnessMeter]
	inc a
	cp $4
	jr c, .cap
	ld a, $3
.cap
	ld [wSurfingMinigameRadnessMeter], a
	ret

SurfingMinigame_CalculateAndAddRadnessFromStunt:
	; Compute the amount of radness points from the
	; current trick based on the number of
	; consecutive flips
	; Single flip:                +0050
	; 2 of the same flip:         +0150
	; 3 or more of the same flip: +0350
	; 2 different flips:          +0180
	; 3 or more different flips:  +0500
	ld a, [wSurfingMinigameRadnessMeter]
	and a
	ret z
	ld a, [wSurfingMinigameTrickFlags]
	and $3
	cp $3 ; did a combination of front and back flips
	jr z, .mixedChain
	ld a, [wSurfingMinigameRadnessMeter]
	ld d, a
	ld e, $1
	ld a, $0
.getAmountOfRadness
	add e
	sla e
	dec d
	jr nz, .getAmountOfRadness
.addRadness50AtATime
	push af
	ld e, $50
	call SurfingMinigame_AddRadness
	pop af
	dec a
	jr nz, .addRadness50AtATime
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld a, [hl]
	sub $10
	ld d, a
	ld hl, ANIM_OBJ_X_COORD
	add hl, bc
	ld e, [hl]
	ld a, [wSurfingMinigameRadnessMeter]
	add $3
	push bc
	call SpawnAnimatedObject
	pop bc
	ret

.mixedChain
	ld a, [wSurfingMinigameRadnessMeter]
	cp $3
	jr c, .add180RadnessPoints
	ld a, 10
.add500Radness50AtATime
	push af
	ld e, $50
	call SurfingMinigame_AddRadness
	pop af
	dec a
	jr nz, .add500Radness50AtATime
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld a, [hl]
	sub $10
	ld d, a
	ld hl, ANIM_OBJ_X_COORD
	add hl, bc
	ld e, [hl]
	ld a, $9
	push bc
	call SpawnAnimatedObject
	pop bc
	ret

.add180RadnessPoints
	ld e, $50
	call SurfingMinigame_AddRadness
	ld e, $50
	call SurfingMinigame_AddRadness
	ld e, $50
	call SurfingMinigame_AddRadness
	ld e, $30
	call SurfingMinigame_AddRadness
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld a, [hl]
	sub $10
	ld d, a
	ld hl, ANIM_OBJ_X_COORD
	add hl, bc
	ld e, [hl]
	ld a, $8
	push bc
	call SpawnAnimatedObject
	pop bc
	ret

SurfingMinigame_AddRadness:
	ld a, [wSurfingMinigameRadnessScore]
	add e
	daa
	ld [wSurfingMinigameRadnessScore], a
	ld a, [wSurfingMinigameRadnessScore + 1]
	adc 0
	daa
	ld [wSurfingMinigameRadnessScore + 1], a
	ret nc
	ld a, $99
	ld hl, wSurfingMinigameRadnessScore
	ld [hli], a
	ld [hl], a
	ret

SurfingMinigame_CoastAfterGoal:
	ld a, $a0 ; generate tiles ahead of the viewport
	ld [wSurfingMinigameXOffset], a
	ldh a, [hSCX]
	ld h, a
	ld a, [wSurfingMinigameSCX]
	ld l, a
	ld de, $900 ; 9 pixels per frame in 8.8 fixed point
	add hl, de
	ld a, l
	ld [wSurfingMinigameSCX], a
	ld a, h
	ldh [hSCX], a
	jr SurfingMinigame_GenerateBGMap

SurfingMinigame_ScrollAndGenerateBGMap:
	ld a, $a0 ; generate tiles ahead of the viewport
	ld [wSurfingMinigameXOffset], a
	ldh a, [hSCX]
	ld h, a
	ld a, [wSurfingMinigameSCX]
	ld l, a
	ld de, $180 ; 1.5 pixels per frame in 8.8 fixed point
	add hl, de
	ld a, l
	ld [wSurfingMinigameSCX], a
	ld a, h
	ldh [hSCX], a
SurfingMinigame_GenerateBGMap:
	ld hl, wSurfingMinigameSCX2
	ldh a, [hSCX]
	cp [hl]
	ret z
	ld [hl], a
	and $f0
	ld hl, wSurfingMinigameSCXHi
	cp [hl]
	ret z
	ld [hl], a
	call SurfingMinigame_GetWaveDataPointers
	; b and c contain the height of the next wave to appear
	; on screen, in number of pixels from the top of the screen
	ld a, b
	ld [wSurfingMinigameWaveHeightBuffer], a
	ld a, c
	ld [wSurfingMinigameWaveHeightBuffer + 1], a
	push de
	ld hl, wSurfingMinigameWaveHeight
	ld de, wSurfingMinigameWaveHeight + 2
	ld c, SCREEN_WIDTH - 2
.copyLoop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .copyLoop
	ld a, [wSurfingMinigameWaveHeightBuffer]
	ld [hli], a
	ld a, [wSurfingMinigameWaveHeightBuffer + 1]
	ld [hl], a
	pop de
	ld hl, wRedrawRowOrColumnSrcTiles
	ld c, $8
.loop
	ld a, [de]
	call .CopyRedrawSrcTiles
	inc de
	dec c
	jr nz, .loop
	ld a, [wSurfingMinigameXOffset]
	ld e, a
	ldh a, [hSCX]
	add e
	and $f0
	srl a
	srl a
	srl a
	ld e, a
	ld d, 0
	ld hl, vBGMap0
	add hl, de
	ld a, l
	ldh [hRedrawRowOrColumnDest], a
	ld a, h
	ldh [hRedrawRowOrColumnDest + 1], a
	ld a, 1
	ldh [hRedrawRowOrColumnMode], a
	ret

.CopyRedrawSrcTiles:
	push de
	push hl
	ld l, a
	ld h, 0
	ld de, SurfingMinigame_BGMetatileTable
	add hl, hl
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	pop de
	ret

SurfingMinigame_GetWaveDataPointers:
	ld a, [wSurfingMinigameWaveFunctionNumber]
	ld e, a
	ld d, 0
	ld hl, .WaveFunctions
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.WaveFunctions:
	dw SurfingMinigame_ChooseNextWaveSequence      ; 00

	dw SurfingMinigame_LoadWavePattern13AndAdvance ; 01
	dw SurfingMinigame_LoadWavePattern14AndAdvance ; 02
	dw SurfingMinigame_LoadWavePattern15AndAdvance ; 03
	dw SurfingMinigame_LoadWavePattern16AndAdvance ; 04
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 05
	dw SurfingMinigame_LoadWavePattern17AndAdvance ; 06
	dw SurfingMinigame_LoadWavePattern18AndAdvance ; 07
	dw SurfingMinigame_LoadWavePattern19AndAdvance ; 08
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 09
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 0a
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 0b
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 0c
	dw SurfingMinigame_LoadFlatWaveAndReset        ; 0d

	dw SurfingMinigame_LoadWavePattern08AndAdvance ; 0e
	dw SurfingMinigame_LoadWavePattern09AndAdvance ; 0f
	dw SurfingMinigame_LoadWavePattern0AAndAdvance ; 10
	dw SurfingMinigame_LoadWavePattern0BAndAdvance ; 11
	dw SurfingMinigame_LoadWavePattern0CAndAdvance ; 12
	dw SurfingMinigame_LoadWavePattern0DAndAdvance ; 13
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 14
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 15
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 16
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 17
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 18
	dw SurfingMinigame_LoadFlatWaveAndReset        ; 19

	dw SurfingMinigame_LoadWavePattern0EAndAdvance ; 1a
	dw SurfingMinigame_LoadWavePattern0FAndAdvance ; 1b
	dw SurfingMinigame_LoadWavePattern10AndAdvance ; 1c
	dw SurfingMinigame_LoadWavePattern11AndAdvance ; 1d
	dw SurfingMinigame_LoadWavePattern12AndAdvance ; 1e
	dw SurfingMinigame_LoadWavePattern0EAndAdvance ; 1f
	dw SurfingMinigame_LoadWavePattern0FAndAdvance ; 20
	dw SurfingMinigame_LoadWavePattern10AndAdvance ; 21
	dw SurfingMinigame_LoadWavePattern11AndAdvance ; 22
	dw SurfingMinigame_LoadWavePattern12AndAdvance ; 23
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 24
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 25
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 26
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 27
	dw SurfingMinigame_LoadFlatWaveAndReset        ; 28

	dw SurfingMinigame_LoadWavePattern13AndAdvance ; 29
	dw SurfingMinigame_LoadWavePattern14AndAdvance ; 2a
	dw SurfingMinigame_LoadWavePattern15AndAdvance ; 2b
	dw SurfingMinigame_LoadWavePattern16AndAdvance ; 2c
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 2d
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 2e
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 2f
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 30
	dw SurfingMinigame_LoadFlatWaveAndReset        ; 31

	dw SurfingMinigame_LoadWavePattern17AndAdvance ; 32
	dw SurfingMinigame_LoadWavePattern18AndAdvance ; 33
	dw SurfingMinigame_LoadWavePattern19AndAdvance ; 34
	dw SurfingMinigame_LoadWavePattern17AndAdvance ; 35
	dw SurfingMinigame_LoadWavePattern18AndAdvance ; 36
	dw SurfingMinigame_LoadWavePattern19AndAdvance ; 37
	dw SurfingMinigame_LoadWavePattern17AndAdvance ; 38
	dw SurfingMinigame_LoadWavePattern18AndAdvance ; 39
	dw SurfingMinigame_LoadWavePattern19AndAdvance ; 3a
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 3b
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 3c
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 3d
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 3e
	dw SurfingMinigame_LoadFlatWaveAndReset        ; 3f

	dw SurfingMinigame_LoadWavePattern1AAndAdvance ; 40
	dw SurfingMinigame_LoadWavePattern1BAndAdvance ; 41
	dw SurfingMinigame_LoadWavePattern0EAndAdvance ; 42
	dw SurfingMinigame_LoadWavePattern0FAndAdvance ; 43
	dw SurfingMinigame_LoadWavePattern10AndAdvance ; 44
	dw SurfingMinigame_LoadWavePattern11AndAdvance ; 45
	dw SurfingMinigame_LoadWavePattern12AndAdvance ; 46
	dw SurfingMinigame_LoadWavePattern1AAndAdvance ; 47
	dw SurfingMinigame_LoadWavePattern1BAndAdvance ; 48
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 49
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 4a
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 4b
	dw SurfingMinigame_LoadFlatWaveAndReset        ; 4c

	dw SurfingMinigame_LoadWavePattern08AndAdvance ; 4d
	dw SurfingMinigame_LoadWavePattern09AndAdvance ; 4e
	dw SurfingMinigame_LoadWavePattern0AAndAdvance ; 4f
	dw SurfingMinigame_LoadWavePattern0BAndAdvance ; 50
	dw SurfingMinigame_LoadWavePattern0CAndAdvance ; 51
	dw SurfingMinigame_LoadWavePattern0DAndAdvance ; 52
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 53
	dw SurfingMinigame_LoadWavePattern1AAndAdvance ; 54
	dw SurfingMinigame_LoadWavePattern1BAndAdvance ; 55
	dw SurfingMinigame_LoadWavePattern1AAndAdvance ; 56
	dw SurfingMinigame_LoadWavePattern1BAndAdvance ; 57
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 58
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 59
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 5a
	dw SurfingMinigame_LoadFlatWaveAndReset        ; 5b

	dw SurfingMinigame_LoadWavePattern0EAndAdvance ; 5c
	dw SurfingMinigame_LoadWavePattern0FAndAdvance ; 5d
	dw SurfingMinigame_LoadWavePattern10AndAdvance ; 5e
	dw SurfingMinigame_LoadWavePattern11AndAdvance ; 5f
	dw SurfingMinigame_LoadWavePattern12AndAdvance ; 60
	dw SurfingMinigame_LoadWavePattern13AndAdvance ; 61
	dw SurfingMinigame_LoadWavePattern14AndAdvance ; 62
	dw SurfingMinigame_LoadWavePattern15AndAdvance ; 63
	dw SurfingMinigame_LoadWavePattern16AndAdvance ; 64
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 65
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 66
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 67
	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 68
	dw SurfingMinigame_LoadFlatWaveAndReset        ; 69

	dw SurfingMinigame_LoadWavePattern01AndAdvance ; 6a
	dw SurfingMinigame_LoadWavePattern02AndAdvance ; 6b
	dw SurfingMinigame_LoadWavePattern03AndAdvance ; 6c
	dw SurfingMinigame_LoadWavePattern04AndAdvance ; 6d
	dw SurfingMinigame_LoadWavePattern05AndAdvance ; 6e
	dw SurfingMinigame_LoadWavePattern06AndAdvance ; 6f
	dw SurfingMinigame_LoadWavePattern07AndAdvance ; 70
	dw SurfingMinigame_LoadFlatWave                ; 71

	dw SurfingMinigame_LoadWavePattern00AndAdvance ; 72
	dw SurfingMinigame_LoadWavePattern1CAndAdvance ; 73
	dw SurfingMinigame_LoadBeachPatternAndAdvance  ; 74
	dw SurfingMinigame_LoadBeachPatternAndAdvance  ; 75
	dw SurfingMinigame_LoadBeachPatternAndAdvance  ; 76
	dw SurfingMinigame_LoadBeachPatternAndAdvance  ; 77
	dw SurfingMinigame_LoadBeachPatternAndAdvance  ; 78
	dw SurfingMinigame_LoadBeachPatternAndAdvance  ; 79
	dw SurfingMinigame_LoadBeachPatternAndAdvance  ; 7a
	dw SurfingMinigame_LoadBeachPatternAndReset    ; 7b

SurfingMinigame_ChooseNextWaveSequence:
	ld a, [wSurfingMinigameDistance]
	cp $16
	jr c, .checkParam
	jr z, .bigKahuna
	jr nc, .gotWave
.bigKahuna
	ld a, $6a
	jr .gotNextFn

.checkParam
	ld a, [wSurfingMinigameWaveRandomValue]
	and a
	jr z, .gotWave
	dec a
	and $7
	ld e, a
	ld d, 0
	ld hl, SurfingMinigame_WaveSequenceStarts
	add hl, de
	ld a, [hl]
.gotNextFn
	ld [wSurfingMinigameWaveFunctionNumber], a
.gotWave
	lb bc, $74, $74
	ld de, SurfingMinigameWavePattern00
	ret

SurfingMinigame_WaveSequenceStarts:
	db $01,$0e,$1a,$29,$32,$40,$4d,$5c

SurfingMinigame_LoadWavePattern00AndAdvance:
	lb bc, $74, $74
	ld de, SurfingMinigameWavePattern00
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern01AndAdvance:
	lb bc, $74, $6c
	ld de, SurfingMinigameWavePattern01
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern02AndAdvance:
	lb bc, $64, $5c
	ld de, SurfingMinigameWavePattern02
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern03AndAdvance:
	lb bc, $54, $4c
	ld de, SurfingMinigameWavePattern03
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern04AndAdvance:
	lb bc, $44, $44
	ld de, SurfingMinigameWavePattern04
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern05AndAdvance:
	lb bc, $44, $4c
	ld de, SurfingMinigameWavePattern05
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern06AndAdvance:
	lb bc, $54, $5c
	ld de, SurfingMinigameWavePattern06
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern07AndAdvance:
	lb bc, $64, $6c
	ld de, SurfingMinigameWavePattern07
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern08AndAdvance:
	lb bc, $74, $6c
	ld de, SurfingMinigameWavePattern08
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern09AndAdvance:
	lb bc, $64, $5c
	ld de, SurfingMinigameWavePattern09
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern0AAndAdvance:
	lb bc, $54, $4c
	ld de, SurfingMinigameWavePattern0A
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern0BAndAdvance:
	lb bc, $4c, $4c
	ld de, SurfingMinigameWavePattern0B
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern0CAndAdvance:
	lb bc, $54, $5c
	ld de, SurfingMinigameWavePattern0C
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern0DAndAdvance:
	lb bc, $64, $6c
	ld de, SurfingMinigameWavePattern0D
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern0EAndAdvance:
	lb bc, $74, $6c
	ld de, SurfingMinigameWavePattern0E
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern0FAndAdvance:
	lb bc, $64, $5c
	ld de, SurfingMinigameWavePattern0F
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern10AndAdvance:
	lb bc, $54, $54
	ld de, SurfingMinigameWavePattern10
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern11AndAdvance:
	lb bc, $54, $5c
	ld de, SurfingMinigameWavePattern11
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern12AndAdvance:
	lb bc, $64, $6c
	ld de, SurfingMinigameWavePattern12
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern13AndAdvance:
	lb bc, $74, $6c
	ld de, SurfingMinigameWavePattern13
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern14AndAdvance:
	lb bc, $64, $5c
	ld de, SurfingMinigameWavePattern14
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern15AndAdvance:
	lb bc, $5c, $5c
	ld de, SurfingMinigameWavePattern15
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern16AndAdvance:
	lb bc, $64, $6c
	ld de, SurfingMinigameWavePattern16
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern17AndAdvance:
	lb bc, $74, $6c
	ld de, SurfingMinigameWavePattern17
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern18AndAdvance:
	lb bc, $64, $64
	ld de, SurfingMinigameWavePattern18
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern19AndAdvance:
	lb bc, $64, $6c
	ld de, SurfingMinigameWavePattern19
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern1AAndAdvance:
	lb bc, $74, $6c
	ld de, SurfingMinigameWavePattern1A
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern1BAndAdvance:
	lb bc, $6c, $6c
	ld de, SurfingMinigameWavePattern1B
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadWavePattern1CAndAdvance:
	lb bc, $74, $74
	ld de, SurfingMinigameWavePattern1C
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadBeachPatternAndAdvance:
	lb bc, $74, $74
	ld de, SurfingMinigameBeachPattern
	jp SurfingMinigame_AdvanceWaveFunction

SurfingMinigame_LoadBeachPatternAndReset:
	lb bc, $74, $74
	ld de, SurfingMinigameBeachPattern
	jp SurfingMinigame_ResetWaveSequence

SurfingMinigame_LoadFlatWaveAndReset:
	lb bc, $74, $74
	ld de, SurfingMinigameWavePattern00
	jp SurfingMinigame_ResetWaveSequence

SurfingMinigame_LoadFlatWave:
	lb bc, $74, $74
	ld de, SurfingMinigameWavePattern00
	ret

SurfingMinigame_AdvanceWaveFunctionFromA: ; unused
	inc a
	ld [wSurfingMinigameWaveFunctionNumber], a
	ret

SurfingMinigame_AdvanceWaveFunction:
	ld hl, wSurfingMinigameWaveFunctionNumber
	inc [hl]
	ret

SurfingMinigame_ResetWaveSequence:
	xor a
	ld [wSurfingMinigameWaveFunctionNumber], a
	ret

SurfingPikachuMinigameIntro:
	call SurfingPikachu_ClearTileMap
	call ClearSprites
	call DisableLCD
	xor a
	ldh [hAutoBGTransferEnabled], a
	call ClearObjectAnimationBuffers
	ld hl, SurfingPikachuIntroPikachuGFX
	ld de, vSprites
	ld bc, 48 tiles
	call CopyData
	ld hl, SurfingPikachuTitleGFX
	ld de, vTileset
	ld bc, 78 tiles
	call CopyData
	ld hl, SurfingPikachuBeachGFX
	ld de, vTileset + $50 tiles
	ld bc, 6 tiles + 6 tiles ; also SurfingPikachuFrameGFX
	call CopyData
	ld a, LOW(SurfingPikachuObjectSpawnData)
	ld [wAnimatedObjectSpawnStateDataPointer], a
	ld a, HIGH(SurfingPikachuObjectSpawnData)
	ld [wAnimatedObjectSpawnStateDataPointer + 1], a
	ld a, LOW(SurfingPikachuObjectCallbacks)
	ld [wAnimatedObjectJumptablePointer], a
	ld a, HIGH(SurfingPikachuObjectCallbacks)
	ld [wAnimatedObjectJumptablePointer + 1], a
	ld a, LOW(SurfingPikachuOAMData)
	ld [wAnimatedObjectOAMDataPointer], a
	ld a, HIGH(SurfingPikachuOAMData)
	ld [wAnimatedObjectOAMDataPointer + 1], a
	ld a, LOW(SurfingPikachuFrames)
	ld [wAnimatedObjectFramesDataPointer], a
	ld a, HIGH(SurfingPikachuFrames)
	ld [wAnimatedObjectFramesDataPointer + 1], a
	ld a, $c ; intro Pikachu
	lb de, $74, $58
	call SpawnAnimatedObject
	call DrawSurfingPikachuMinigameIntroBackground
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $90
	ldh [hWY], a
	ld b, SET_PAL_SURFING_PIKACHU_MINIGAME ; was SET_PAL_SURFING_PIKACHU_TITLE
	call RunPaletteCommand
	ld a, $e3
	ldh [rLCDC], a
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
;	call DelayFrame
;	call DelayFrame
	call SurfingPikachuMinigame_SetBGPals
	ld a, $e4
	ldh [rOBP0], a
	ld a, $e0
	ldh [rOBP1], a
;	call SurfingMinigame_UpdatePalettes
	call DelayFrame
	ld a, MUSIC_SURFING_PIKACHU
	ld c, BANK(Music_SurfingPikachu)
	call PlayMusic
	xor a
	ld [wSurfingMinigameIntroAnimationFinished], a
.loop
	ld a, [wSurfingMinigameIntroAnimationFinished]
	and a
	ret nz
	ld a, $0
	ld [wCurrentAnimatedObjectOAMBufferOffset], a
	call RunObjectAnimations
	call DelayFrame
	jr .loop

PrepareSurfingMinigameHighScoreScreen::
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	ld de, SurfingPikachuPrinterGraphics
	ld hl, vChars2
	lb bc, BANK(SurfingPikachuPrinterGraphics), (SurfingPikachuPrinterGraphicsEnd - SurfingPikachuPrinterGraphics) / TILE_SIZE
	call CopyVideoData
	hlcoord 0, 0
	call .PlaceRowAlternatingTiles
	hlcoord 0, 17
	call .PlaceRowAlternatingTiles
	hlcoord 0, 0
	call .PlaceColumnAlternatingTiles
	hlcoord 19, 0
	call .PlaceColumnAlternatingTiles
	ld a, $4
	hlcoord 0, 0
	ld [hl], a
	hlcoord 0, 17
	ld [hl], a
	hlcoord 19, 0
	ld [hl], a
	hlcoord 19, 17
	ld [hl], a
	ld de, .Tilemap1
	hlcoord 10, 8
	lb bc, 3, 8
	call .CopyBox
	ld de, .Tilemap2
	hlcoord 2, 11
	lb bc, 6, 16
	call .CopyBox
	ld de, .PikachusBeachString
	hlcoord 3, 2
	call PlaceString
	ld de, .HiScoreString
	hlcoord 9, 4
	call PlaceString
	ld de, .PointsString
	hlcoord 12, 6
	call PlaceString
	ld de, wPlayerName
	ld hl, wPlayerName
	ld bc, 0
.findEndOfName
	ld a, [hli]
	inc c
	cp '@'
	jr nz, .findEndOfName
	ld a, 8
	sub c
	jr nc, .gotNameLength
	xor a
.gotNameLength
	ld c, a
	hlcoord 2, 4
	add hl, bc
	call PlaceString
	call .CopyHighScore
	ld b, SET_PAL_SURFING_PIKACHU_HISCORE
	call RunPaletteCommand
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	jp GBPalNormal

.PlaceRowAlternatingTiles
	ld c, SCREEN_WIDTH / 2
.rowLoop
	ld [hl], 0
	inc hl
	ld [hl], 1
	inc hl
	dec c
	jr nz, .rowLoop
	ret

.PlaceColumnAlternatingTiles
	ld c, SCREEN_HEIGHT / 2
	ld de, SCREEN_WIDTH
.columnLoop
	ld [hl], $2
	add hl, de
	ld [hl], $3
	add hl, de
	dec c
	jr nz, .columnLoop
	ret

.CopyBox
.copyBoxY
	push bc
	push hl
.copyBoxX
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .copyBoxX
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .copyBoxY
	ret

.CopyHighScore
	ld de, wSurfingMinigameHiScore + 1
	hlcoord 7, 6
	ld a, [de]
	call .BCDConvertScore
	ld a, [de]
.BCDConvertScore
	ld c, a
	swap a
	and $f
	add -10
	ld [hli], a
	ld a, c
	and $f
	add -10
	ld [hli], a
	dec de
	ret

.Tilemap1:
INCBIN "gfx/surfing_pikachu/high_score_1.tilemap"

.Tilemap2:
INCBIN "gfx/surfing_pikachu/high_score_2.tilemap"

.PikachusBeachString:
	db "Pikachu's Beach@"
.HiScoreString:
	db "'s Hi-Score@"
.PointsString:
	db "Points@"

DisplaySurfingMinigameHighScoreScreen::
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	call PrepareSurfingMinigameHighScoreScreen
	ld a, MUSIC_GB_PRINTER
	call PlayMusic
.waitRelease
	call Joypad
	ldh a, [hJoyHeld]
	and PAD_A | PAD_B
	jr nz, .waitRelease
.waitPress
	call Joypad
	ldh a, [hJoyPressed]
	and PAD_A | PAD_B
	jr z, .waitPress
.waitReleaseAfterPress
	call Joypad
	ldh a, [hJoyHeld]
	and PAD_A | PAD_B
	jr nz, .waitReleaseAfterPress
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call GBPalWhiteOutWithDelay3
	call PlayDefaultMusic
	call RunDefaultPaletteCommand
	call ReloadMapSpriteTilePatterns
	call ReloadTilesetTilePatterns
	xor a
	ldh [hJoyLast], a
	ldh [hJoyReleased], a
	ldh [hJoyPressed], a
	ldh [hJoyHeld], a
	ldh [hJoy5], a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret

DrawSurfingPikachuMinigameIntroBackground:
	ld hl, wTileMap
	ld bc, 16 * SCREEN_WIDTH
	ld a, $7f ; blank tile
	call FillMemory
	ld hl, SurfingMinigame_BeachIntroTilemap
	decoord 0, 6
	ld bc, 12 * SCREEN_WIDTH
	call CopyData
	hlcoord 4, 0
	lb bc, 6, 13
	xor a ; intro splash starts at tile $00
	call .PlaceIntroTitle
	ld hl, SurfingMinigame_UseControlPadTilemap
	decoord 3, 7
	ld bc, 15
	call CopyData
	ld hl, SurfingMinigame_ToSurfRadTilemap
	decoord 4, 9
	ld bc, 12
	jp CopyData

.PlaceIntroTitle
	ld de, SCREEN_WIDTH - 13
.rowLoop
	push bc
.tileLoop
	ld [hli], a
	inc a
	dec c
	jr nz, .tileLoop
	add hl, de
	pop bc
	dec b
	jr nz, .rowLoop
	ret

SurfingMinigame_UpdateLYOverrides:
	ld hl, wLYOverrides + $10
	ld de, wLYOverrides + $11
	ld c, $80
	ld a, [hl]
	push af
.loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .loop
	pop af
	ld [hl], a
	ret

SurfingMinigame_InitScanlineOverrides:
	ld hl, wLYOverrides
	ld bc, wLYOverridesEnd - wLYOverrides
	ld de, $0
.loop
	ld a, e
	and $1f
	ld e, a
	push hl
	ld hl, SurfingMinigame_LYOverridesInitialSineWave
	add hl, de
	ld a, [hl]
	pop hl
	ld [hli], a
	inc e
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

SurfingPikachu_GetJoypad_3FrameBuffer:
	call Joypad
	ldh a, [hFrameCounter]
	and a
	jr nz, .delayed
	ldh a, [hJoyHeld]
	ldh [hJoy5], a
	ld a, $2
	ldh [hFrameCounter], a
	ret

.delayed
	xor a
	ldh [hJoy5], a
	ret

SurfingPikachuMinigame_BlankPals:
	xor a
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
;	call SurfingMinigame_UpdatePalettes
	ret

SurfingPikachuMinigame_NormalPals:
	ld a, $e4
	ldh [rBGP], a
	ldh [rOBP0], a
	ld a, $e0
	ldh [rOBP1], a
;	call SurfingMinigame_UpdatePalettes
	ret

; Surfing Pikachu in pokeyellow updates CGB palette data.
; Yumepokered runs the minigame in a DMG/SGB-style path here, so there is no
; additional per-frame palette work to do.
;SurfingMinigame_UpdatePalettes:
;	ret

SurfingPikachu_ClearTileMap:
	ld hl, wTileMap
	ld bc, SCREEN_AREA
	xor a
	jp FillMemory

SurfingMinigame_ResetJumpArc:
	xor a
	ld hl, wSurfingMinigameJumpDescending
	ld [hli], a
	ld [hl], a
	ret

SurfingMinigame_UpdatePikachuHeight:
	ld a, [wSurfingMinigameJumpDescending]
	and a
	jr nz, .descending
	ld a, [wSurfingMinigameJumpArcMagnitude]
	ld d, a
	ld a, [wSurfingMinigameJumpArcFraction]
	or d
	jr z, .done
	ld a, [wSurfingMinigameJumpArcFraction]
	ld e, a
	ld hl, -$80
	add hl, de
	ld a, l
	ld [wSurfingMinigameJumpArcFraction], a
	ld a, h
	ld [wSurfingMinigameJumpArcMagnitude], a

	; -(4 * a ** 2)
	ld e, a
	ld d, 0
	call SurfingMinigame_NTimesDE
	ld e, l
	ld d, h
	ld a, $4
	call SurfingMinigame_NTimesDE
	ld a, l
	xor $ff
	inc a
	ld l, a
	ld a, h
	xor $ff
	ld h, a

	push hl
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld d, [hl]
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld e, [hl]
	pop hl

	add hl, de
	ld e, l
	ld d, h

	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld [hl], d
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld [hl], e
	and a
	ret

.done
	ld a, 1
	ld [wSurfingMinigameJumpDescending], a
	and a
	ret

.descending
	ld a, [wSurfingMinigamePikachuObjectHeight]
	ld e, a
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld a, [hl]
	cp $90
	jr nc, .okay
	cp e
	jr nc, .reset
.okay
	ld a, [wSurfingMinigameJumpArcMagnitude]
	ld d, a
	ld a, [wSurfingMinigameJumpArcFraction]
	ld e, a
	ld hl, $80
	add hl, de
	ld a, l
	ld [wSurfingMinigameJumpArcFraction], a
	ld a, h
	ld [wSurfingMinigameJumpArcMagnitude], a

	; 4 * a ** 2
	ld e, a
	ld d, 0
	call SurfingMinigame_NTimesDE
	ld e, l
	ld d, h
	ld a, $4
	call SurfingMinigame_NTimesDE

	push hl
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld d, [hl]
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld e, [hl]
	pop hl

	add hl, de
	ld e, l
	ld d, h

	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld [hl], d
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld [hl], e
	and a
	ret

.reset
	ld hl, ANIM_OBJ_Y_COORD
	add hl, bc
	ld a, [wSurfingMinigamePikachuObjectHeight]
	ld [hl], a
	ld hl, ANIM_OBJ_FIELD_C
	add hl, bc
	ld [hl], 0
	scf
	ret

SurfingMinigame_NTimesDE:
	ld hl, $0
.loop
	srl a
	jr nc, .noAdd
	add hl, de
.noAdd
	sla e
	rl d
	and a
	jr nz, .loop
	ret

SurfingPikachu_PlaceBCDNumber:
	ld c, a
	swap a
	or $f0
	ld [hli], a
	ld a, c
	or $f0
	ld [hl], a
	dec de
	ret

SurfingPikachu_Cosine: ; cosine
	add $10
SurfingPikachu_Sine: ; sine
	and $3f
	cp $20
	jr nc, .positive
	call .GetSine
	ld a, h
	ret

.positive
	and $1f
	call .GetSine
	ld a, h
	xor $ff
	inc a
	ret

.GetSine:
	ld e, a
	ld a, d
	ld d, 0
	ld hl, .SineWave
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	jp SurfingMinigame_NTimesDE

.SineWave:
	sine_table 32

SurfingPikachuObjectSpawnData:
	; frameset, callback, tile offset
	db $00, $00, $00 ; 0: unused
	db $04, $01, $00 ; 1: surfing Pikachu
	db $11, $02, $00 ; 2: START
	db $12, $02, $00 ; 3: GOAL
	db $15, $00, $00 ; 4: +50
	db $16, $00, $00 ; 5: +150
	db $17, $00, $00 ; 6: +350
	db $18, $00, $00 ; 7: +750
	db $19, $00, $00 ; 8: +180
	db $1a, $00, $00 ; 9: +500
	db $14, $00, $00 ; a: water spray
	db $13, $03, $00 ; b: Oh no...
	db $1b, $04, $00 ; c: intro Pikachu

SurfingPikachuObjectCallbacks:
	dw SurfingMinigameAnimatedObjectFn_nop ; 0
	dw SurfingMinigameAnimatedObjectFn_Pikachu ; 1
	dw SurfingMinigame_MoveBannerToCenter ; 2
	dw SurfingMinigameAnimatedObjectFn_FlippingPika ; 3
	dw SurfingMinigameAnimatedObjectFn_IntroAnimationPikachu ; 4

SurfingMinigameAnimatedObjectFn_nop:
	ret

INCLUDE "data/sprite_anims/surfing_pikachu_frames.asm"
INCLUDE "data/sprite_anims/surfing_pikachu_oam.asm"

SurfingMinigame_LYOverridesInitialSineWave:
; a sine wave with amplitude 2
	db  0,  0,  0,  1,  1,  1,  1,  2
	db  2,  2,  1,  1,  1,  1,  0,  0
	db  0,  0,  0, -1, -1, -1, -1, -2
	db -2, -2, -1, -1, -1, -1,  0,  0

SurfingMinigame_BGMetatileTable: ; metatiles of 2x2 tiles
	db $7f, $7f, $7f, $7f ; 00 ; sky block (blank)
	db $55, $55, $55, $55 ; 01 ; water block
	db $55, $02, $02, $06 ; 02
	db $03, $55, $07, $03 ; 03
	db $06, $06, $06, $06 ; 04
	db $07, $07, $07, $07 ; 05
	db $06, $02, $02, $08 ; 06
	db $03, $07, $08, $03 ; 07
	db $55, $55, $11, $12 ; 08
	db $55, $55, $13, $03 ; 09
	db $14, $12, $02, $08 ; 0a
	db $13, $07, $08, $03 ; 0b
	db $06, $14, $06, $14 ; 0c
	db $13, $07, $13, $07 ; 0d
	db $08, $08, $08, $08 ; 0e
	db $14, $12, $14, $12 ; 0f
	db $55, $11, $02, $14 ; 10
	db $06, $14, $06, $14 ; 11
	db $50, $50, $53, $53 ; 12 ; beach top block
	db $53, $53, $53, $53 ; 13 ; beach sand block
	db $51, $52, $54, $55 ; 14 ; beach shore block
	db $12, $13, $12, $13 ; 15

SurfingMinigameWavePattern00:
	db $00, $00, $00, $01, $01, $01, $01, $01
SurfingMinigameWavePattern01:
	db $00, $00, $00, $01, $01, $02, $04, $06
SurfingMinigameWavePattern02:
	db $00, $00, $00, $01, $02, $04, $06, $0e
SurfingMinigameWavePattern03:
	db $00, $00, $00, $10, $11, $06, $0e, $0e
SurfingMinigameWavePattern04:
	db $00, $00, $00, $15, $15, $0e, $0e, $0e
SurfingMinigameWavePattern05:
	db $00, $00, $00, $03, $05, $07, $0e, $0e
SurfingMinigameWavePattern06:
	db $00, $00, $00, $01, $03, $05, $07, $0e
SurfingMinigameWavePattern07:
	db $00, $00, $00, $01, $01, $03, $05, $07
SurfingMinigameWavePattern08:
	db $00, $00, $00, $01, $01, $02, $04, $06
SurfingMinigameWavePattern09:
	db $00, $00, $00, $01, $02, $04, $06, $0e
SurfingMinigameWavePattern0A:
	db $00, $00, $00, $08, $0f, $0a, $0e, $0e
SurfingMinigameWavePattern0B:
	db $00, $00, $00, $09, $0d, $0b, $0e, $0e
SurfingMinigameWavePattern0C:
	db $00, $00, $00, $01, $03, $05, $07, $0e
SurfingMinigameWavePattern0D:
	db $00, $00, $00, $01, $01, $03, $05, $07
SurfingMinigameWavePattern0E:
	db $00, $00, $00, $01, $01, $02, $04, $06
SurfingMinigameWavePattern0F:
	db $00, $00, $00, $01, $10, $11, $06, $0e
SurfingMinigameWavePattern10:
	db $00, $00, $00, $01, $15, $15, $0e, $0e
SurfingMinigameWavePattern11:
	db $00, $00, $00, $01, $03, $05, $07, $0e
SurfingMinigameWavePattern12:
	db $00, $00, $00, $01, $01, $03, $05, $07
SurfingMinigameWavePattern13:
	db $00, $00, $00, $01, $01, $02, $04, $06
SurfingMinigameWavePattern14:
	db $00, $00, $00, $01, $08, $0f, $0a, $0e
SurfingMinigameWavePattern15:
	db $00, $00, $00, $01, $09, $0d, $0b, $0e
SurfingMinigameWavePattern16:
	db $00, $00, $00, $01, $01, $03, $05, $07
SurfingMinigameWavePattern17:
	db $00, $00, $00, $01, $01, $10, $11, $06
SurfingMinigameWavePattern18:
	db $00, $00, $00, $01, $01, $15, $15, $0e
SurfingMinigameWavePattern19:
	db $00, $00, $00, $01, $01, $03, $05, $07
SurfingMinigameWavePattern1A:
	db $00, $00, $00, $01, $01, $08, $0f, $0a
SurfingMinigameWavePattern1B:
	db $00, $00, $00, $01, $01, $09, $0d, $0b
SurfingMinigameWavePattern1C:
	db $00, $00, $00, $14, $14, $14, $14, $14
SurfingMinigameBeachPattern:
	db $00, $00, $00, $12, $13, $13, $13, $13


;SurfingMinigame_TitleTilemap:         INCBIN "gfx/surfing_pikachu/title.tilemap"
SurfingMinigame_BeachIntroTilemap:    INCBIN "gfx/surfing_pikachu/beach_intro.tilemap"
SurfingMinigame_UseControlPadTilemap: INCBIN "gfx/surfing_pikachu/use_control_pad.tilemap"
SurfingMinigame_ToSurfRadTilemap:     INCBIN "gfx/surfing_pikachu/to_surf_rad.tilemap"
SurfingMinigame_BeachOutroTilemap:    INCBIN "gfx/surfing_pikachu/beach_outro.tilemap"
