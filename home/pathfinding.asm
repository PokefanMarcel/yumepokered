; calculates the absolute difference |a-b|, setting carry flag if a<b
CalcDifference:: ; marcelnote - optimized
	sub b
	ret nc  ; return if a ≥ b, no carry
	cpl
	inc a   ; a - b < 0 so switch to b - a
	ret     ; carry set

MoveSprite::
; move the sprite [hSpriteIndex] with the movement pointed to by de
; actually only copies the movement data to wNPCMovementDirections for later
	call SetSpriteMovementBytesToFF
MoveSprite_:: ; marcelnote - small optim
	push hl
	call GetSpriteMovementByte1Pointer
	xor a
	ld [hl], a
	ld hl, wNPCMovementDirections

.loop
	ld a, [de]
	ld [hli], a
	inc de
	inc a ; $ff? have we reached the end of the movement data?
	jr nz, .loop

	ld a, l
	sub LOW(wNPCMovementDirections)
	ld [wNPCNumScriptedSteps], a ; number of steps taken

	ld hl, wStatusFlags5
	set BIT_SCRIPTED_NPC_MOVEMENT, [hl]
	pop hl
	xor a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ld [wSimulatedJoypadStatesEnd], a
	dec a
	ld [wJoyIgnore], a ; $ff
	ret
