.isGhost
	ld hl, wMonHSpriteDim
	ld a, $66
	ld [hli], a   ; write sprite dimensions
	ld bc, GhostPic
	ld a, c
	ld [hli], a   ; write front sprite pointer
	ld [hl], b
	ld hl, wEnemyMonNick  ; set name to "GHOST"
	ld a, "S"
	ld [hli], a
	ld a, "P"
	ld [hli], a
	ld a, "E"
	ld [hli], a
	ld a, "C"
	ld [hli], a
	ld a, "T"
	ld [hli], a
	ld a, "R"
	ld [hli], a
	ld a, "E"
	ld [hli], a
	ld [hl], "@"
	ld a, [wCurPartySpecies]
	push af
	ld a, MON_GHOST
	ld [wCurPartySpecies], a
	ld de, vFrontPic
	call LoadMonFrontSprite ; load ghost sprite
	pop af
	ld [wCurPartySpecies], a
	jr .spriteLoaded