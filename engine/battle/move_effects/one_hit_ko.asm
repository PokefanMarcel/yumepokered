OneHitKOEffect_: ; marcelnote - optimized
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonSpeed + 1
	ld de, wEnemyMonSpeed + 1
	jr z, .compareSpeed
	ld hl, wEnemyMonSpeed + 1
	ld de, wBattleMonSpeed + 1
.compareSpeed
; is the user slower than the target?
	ld a, [de]
	ld b, a     ; b = target's speed (low byte)
	dec de
	ld a, [hld] ; a = user's speed   (low byte)
	sub b
	ld a, [de]
	ld b, a     ; b = target's speed (high byte)
	ld a, [hl]  ; a = user's speed   (high byte)
	sbc b       ; sets carry if the user is slower

	ld hl, wDamage
	ld a, $ff
	jr c, .userIsSlower
; if user is not slower, set damage to 65535 and OHKO flag
	ld [hli], a
	ld [hl], a
	ld a, $2
	ld [wCriticalHitOrOHKO], a
	ret

.userIsSlower
; if user is slower, set damage to 0, failed OHKO flag, and move missed flag
	ld [wCriticalHitOrOHKO], a ; $ff = failed OHKO
	xor a
	ld [hli], a
	ld [hl], a                 ; set the damage output to zero
	inc a                      ; a = $1
	ld [wMoveMissed], a
	ret
