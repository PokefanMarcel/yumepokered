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
	ld c, a                      ; dividend = |player Y -  NPC Y|
	ldh a, [hNPCPlayerRelativePosFlags]
	set BIT_NPC_LOWER_Y, a       ; NPC north of player
	jr c, .divideYDistance       ; carry if a < b, i.e. NPC has lower Y (NPC north of player)
	res BIT_NPC_LOWER_Y, a       ; NPC south of or aligned with player
.divideYDistance
	ldh [hNPCPlayerRelativePosFlags], a
	ld d, 16                     ; divisor = 16
	call DivideBytes ; divide c = Y absolute distance, by d = 16
	ld a, c                      ; c = quotient
	ldh [hNPCPlayerYDistance], a
	inc hl                       ; hl = x#SPRITESTATEDATA1_XPIXELS

	ld a, [wSpritePlayerStateData1XPixels]
	ld b, a                      ; b = player sprite screen X position in pixels
	ld a, [hl]                   ; a = NPC sprite screen X position in pixels
	call CalcDifference          ; a = |a-b|, sets carry if a < b
	ld c, a                      ; dividend = |player X -  NPC X|
	ldh a, [hNPCPlayerRelativePosFlags]
	set BIT_NPC_LOWER_X, a       ; NPC west of player
	jr c, .divideXDistance       ; carry if a < b, i.e. NPC has lower X (NPC west of player)
	res BIT_NPC_LOWER_X, a       ; NPC east of or aligned with player
.divideXDistance
	ldh [hNPCPlayerRelativePosFlags], a
	call DivideBytes ; divide c = X absolute distance, by d = 16
	ld a, c                      ; c = quotient
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
