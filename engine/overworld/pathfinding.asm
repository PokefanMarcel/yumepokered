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


CalcPositionOfPlayerRelativeToNPC: ; marcelnote - optimized
	ld h, HIGH(wSpriteStateData1)
	ldh a, [hNPCSpriteOffset]
	add SPRITESTATEDATA1_YPIXELS
	ld l, a
	ld c, 0

	ld a, [wSpritePlayerStateData1YPixels]
	ld b, a                      ; b = player sprite screen Y position in pixels
	ld a, [hli]                  ; a = NPC sprite screen Y position in pixels
	call CalcDifference          ; a = |a-b|, sets carry if a < b
	jr nc, .divideYDistance      ; carry if a < b, i.e. NPC has lower Y (NPC north of player)
	set BIT_NPC_LOWER_Y, c       ; NPC north of player
.divideYDistance
	swap a
	and $0f                      ; divide |player Y -  NPC Y| by 16
	ldh [hNPCPlayerYDistance], a
	inc l                        ; hl = x#SPRITESTATEDATA1_XPIXELS

	ld a, [wSpritePlayerStateData1XPixels]
	ld b, a                      ; b = player sprite screen X position in pixels
	ld a, [hl]                   ; a = NPC sprite screen X position in pixels
	call CalcDifference          ; a = |a-b|, sets carry if a < b
	jr nc, .divideXDistance      ; carry if a < b, i.e. NPC has lower X (NPC west of player)
	set BIT_NPC_LOWER_X, c       ; NPC west of player
.divideXDistance
	swap a
	and $0f                      ; divide |player X -  NPC X| by 16
	ldh [hNPCPlayerXDistance], a

	ld a, c
	ldh [hNPCPlayerRelativePosFlags], a
	ret


ConvertNPCMovementDirectionsToJoypadMasks: ; marcelnote - optimized
	ldh a, [hNPCMovementDirections2Index]
	ld [wNPCMovementDirections2Index], a
	dec a
	ld hl, wNPCMovementDirections2
	ld d, 0
	ld e, a
	add hl, de
	ld de, wSimulatedJoypadStatesEnd
.loop
	ld a, [hld]
	and a ; NPC_MOVEMENT_DOWN?
	ld b, PAD_DOWN
	jr z, .gotJoypadMask
	cp NPC_MOVEMENT_UP
	ld b, PAD_UP
	jr z, .gotJoypadMask
	cp NPC_MOVEMENT_LEFT
	ld b, PAD_LEFT
	jr z, .gotJoypadMask
	cp NPC_MOVEMENT_RIGHT
	ld b, PAD_RIGHT
	jr z, .gotJoypadMask
	ld b, $ff
.gotJoypadMask
	ld a, b
	ld [de], a
	inc de
	ldh a, [hNPCMovementDirections2Index]
	dec a
	ldh [hNPCMovementDirections2Index], a
	jr nz, .loop
	ret
