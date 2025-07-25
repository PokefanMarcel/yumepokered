; calculates the difference |a-b|, setting carry flag if a<b
CalcDifference::
	sub b
	ret nc  ; return if a ≥ b, no carry
	cpl
	add $1  ; a - b < 0 so switch to b - a
	scf     ; and set carry
	ret

MoveSprite::
; move the sprite [hSpriteIndex] with the movement pointed to by de
; actually only copies the movement data to wNPCMovementDirections for later
	call SetSpriteMovementBytesToFF
MoveSprite_::
	push hl
	push bc
	call GetSpriteMovementByte1Pointer
	xor a
	ld [hl], a
	ld hl, wNPCMovementDirections
	ld c, 0

.loop
	ld a, [de]
	ld [hli], a
	inc de
	inc c
	cp -1 ; have we reached the end of the movement data?
	jr nz, .loop

	ld a, c
	ld [wNPCNumScriptedSteps], a ; number of steps taken

	pop bc
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_NPC_MOVEMENT, [hl]
	pop hl
	xor a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ld [wSimulatedJoypadStatesEnd], a
	dec a
	ld [wJoyIgnore], a
	;ld [wUnusedOverrideSimulatedJoypadStatesIndex], a
	ret
