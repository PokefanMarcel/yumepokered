FindPathToPlayer:
	xor a
	ld hl, hFindPathNumSteps
	ld [hli], a ; hFindPathNumSteps
	ld [hli], a ; hFindPathFlags
	ld [hli], a ; hFindPathYProgress
	ld [hl], a  ; hFindPathXProgress
	ld hl, wNPCMovementDirections2
.loop
	ldh a, [hFindPathYProgress]
	ld b, a                      ; b = Y progress (initialized at 0)
	ldh a, [hNPCPlayerYDistance] ; a = Y distance in steps
	sub b                        ; b ≤ a by construction
	ld d, a                      ; d = Y distance - Y progress
	and a                        ; Y progress = Y distance?
	jr nz, .stillHasYProgress
	ldh a, [hFindPathFlags]
	set BIT_PATH_FOUND_Y, a
	ldh [hFindPathFlags], a
.stillHasYProgress
	ldh a, [hFindPathXProgress]
	ld b, a                      ; b = X progress (initialized at 0)
	ldh a, [hNPCPlayerXDistance] ; a = X distance in steps
	sub b                        ; b ≤ a by construction
	ld e, a                      ; e = X distance - X progress
	and a                        ; X progress = X distance?
	jr nz, .stillHasXProgress
	ldh a, [hFindPathFlags]
	set BIT_PATH_FOUND_X, a
	ldh [hFindPathFlags], a
.stillHasXProgress
	ldh a, [hFindPathFlags]
	cp (1 << BIT_PATH_FOUND_X) | (1 << BIT_PATH_FOUND_Y)
	jr z, .done
; Reduce greater distance between Y and X. If equal reduce X.
	ld a, e
	cp d
	jr c, .yDistanceGreater
; X distance is weakly greater
	ldh a, [hNPCPlayerRelativePosFlags]
	bit BIT_NPC_LOWER_X, a
	ld d, NPC_MOVEMENT_RIGHT
	jr nz, .NPCisLeftOfPlayer
	ld d, NPC_MOVEMENT_LEFT
.NPCisLeftOfPlayer
	ldh a, [hFindPathXProgress]
	inc a
	ldh [hFindPathXProgress], a
	jr .storeDirection

.yDistanceGreater
	ldh a, [hNPCPlayerRelativePosFlags]
	bit BIT_NPC_LOWER_Y, a
	ld d, NPC_MOVEMENT_DOWN
	jr nz, .NPCisAbovePlayer
	ld d, NPC_MOVEMENT_UP
.NPCisAbovePlayer
	ldh a, [hFindPathYProgress]
	inc a
	ldh [hFindPathYProgress], a

.storeDirection
	ld a, d
	ld [hli], a
	ldh a, [hFindPathNumSteps]
	inc a
	ldh [hFindPathNumSteps], a
	jr .loop

.done
	ld [hl], $ff ; path terminator
	ret


CalcPositionOfPlayerRelativeToNPC:
	xor a
	ldh [hNPCPlayerRelativePosFlags], a
	ld hl, wSpriteStateData1
	ldh a, [hNPCSpriteOffset]
	add l
	add SPRITESTATEDATA1_YPIXELS
	ld l, a
	jr nc, .noCarry
	inc h                        ; hl = x#SPRITESTATEDATA1_YPIXELS
.noCarry

	ld a, [wSpritePlayerStateData1YPixels]
	ld b, a                      ; b = player sprite screen Y position in pixels
	ld a, [hli]                  ; a = NPC sprite screen Y position in pixels
	call CalcDifference          ; a = |a-b|, sets carry if a < b
	push hl                      ; save hl = x#SPRITESTATEDATA1_XSTEPVECTOR
	ld hl, hNPCPlayerRelativePosFlags
	set BIT_NPC_LOWER_Y, [hl]    ; NPC north of player
	jr c, .divideYDistance       ; carry if a < b, i.e. NPC has lower Y, i.e. NPC north of player
	res BIT_NPC_LOWER_Y, [hl]    ; NPC south of or aligned with player
.divideYDistance
	ld hl, hDividend2
	ld [hli], a                  ; [hDividend2] = |player Y -  NPC Y|
	ld a, 16
	ld [hli], a                  ; [hDivisor2] = 16
	call DivideBytes ; divide Y absolute distance by 16
	ld a, [hl]                   ; a = [hQuotient2]
	ldh [hNPCPlayerYDistance], a
	pop hl                       ; restore hl = x#SPRITESTATEDATA1_XSTEPVECTOR
	inc hl                       ; hl = x#SPRITESTATEDATA1_XPIXELS

	ld a, [wSpritePlayerStateData1XPixels]
	ld b, a                      ; b = player sprite screen X position in pixels
	ld a, [hl]                   ; a = NPC sprite screen X position in pixels
	call CalcDifference          ; a = |a-b|, sets carry if a < b
	ld hl, hNPCPlayerRelativePosFlags
	set BIT_NPC_LOWER_X, [hl]    ; NPC west of player
	jr c, .divideXDistance       ; carry if a < b, i.e. NPC has lower X, i.e. NPC west of player
	res BIT_NPC_LOWER_X, [hl]    ; NPC east of or aligned with player
.divideXDistance
	ld hl, hDividend2
	ld [hli], a                  ; [hDividend2] = |player X -  NPC X|
	ld a, 16
	ld [hli], a                  ; [hDivisor2] = 16
	call DivideBytes ; divide X absolute distance by 16
	ld a, [hl]                   ; a = [hQuotient2]
	ldh [hNPCPlayerXDistance], a
	ret


ConvertNPCMovementDirectionsToJoypadMasks:
	ldh a, [hNPCMovementDirections2Index]
	ld [wNPCMovementDirections2Index], a
	dec a
	ld de, wSimulatedJoypadStatesEnd
	ld hl, wNPCMovementDirections2
	add l
	ld l, a
	jr nc, .loop
	inc h
.loop
	ld a, [hld]
	call ConvertNPCMovementDirectionToJoypadMask
	ld [de], a
	inc de
	ldh a, [hNPCMovementDirections2Index]
	dec a
	ldh [hNPCMovementDirections2Index], a
	jr nz, .loop
	ret

ConvertNPCMovementDirectionToJoypadMask:
	push hl
	ld b, a
	ld hl, NPCMovementDirectionsToJoypadMasksTable
.loop
	ld a, [hli]
	cp $ff
	jr z, .done
	cp b
	jr z, .loadJoypadMask
	inc hl
	jr .loop
.loadJoypadMask
	ld a, [hl]
.done
	pop hl
	ret

NPCMovementDirectionsToJoypadMasksTable:
	db NPC_MOVEMENT_UP, D_UP
	db NPC_MOVEMENT_DOWN, D_DOWN
	db NPC_MOVEMENT_LEFT, D_LEFT
	db NPC_MOVEMENT_RIGHT, D_RIGHT
	db $ff
