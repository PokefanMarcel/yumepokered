RecoilEffect_: ; marcelnote - optimized
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	ld hl, wBattleMonMaxHP
	jr z, .gotPointers ; jump on player's turn
	ld a, [wEnemyMoveNum]
	ld hl, wEnemyMonMaxHP
.gotPointers
	cp STRUGGLE
	ld a, [wDamage]
	ld b, a             ; b = damage high byte
	ld a, [wDamage + 1] ; a = damage low byte
	jr z, .halveOnce ; struggle deals 50% recoil damage
	; other moves deal 25% recoil damage
	srl b
	rra
.halveOnce
	srl b
	rra
	ld c, a ; bc = recoil damage
	or b    ; a = low byte, b = high byte
	jr nz, .updateHP
	inc c ; minimum recoil damage is 1
.updateHP
; subtract HP from user due to the recoil damage
	ld a, [hli]             ; a = [w<User>MonMaxHP]
	ld [wHPBarMaxHP + 1], a ; [wHPBarMaxHP + 1] <- [w<User>MonMaxHP]
	ld a, [hl]              ; a = [w<User>MonMaxHP + 1]
	ld [wHPBarMaxHP], a     ; [wHPBarMaxHP]     <- [w<User>MonMaxHP + 1]
	ld de, wBattleMonHP - wBattleMonMaxHP
	add hl, de              ; hl = w<User>MonHP + 1

	ld a, [hld]             ; a = [w<User>MonHP + 1]
	ld [wHPBarOldHP], a
	sub c
	ld c, a                 ; c = updated HP (low byte)
	ld a, [hl]              ; a = [w<User>MonHP]
	ld [wHPBarOldHP + 1], a
	sbc b                   ; ac = updated HP
	jr nc, .saveNewHP
; if recoil damage is higher than the current HP, set HP to 0
	xor a   ; a = 0
	ld c, a ; c = 0
.saveNewHP
	ld [hli], a             ; [w<User>MonHP] = a
	ld [hl], c              ; [w<User>MonHP + 1] = c
	ld hl, wHPBarNewHP + 1
	ld [hld], a             ; [wHPBarNewHP + 1] = a
	ld [hl], c              ; [wHPBarNewHP] = c

	ldh a, [hWhoseTurn]
	dec a
	hlcoord 2, 2
	jr z, .updateHPBar ; jump on enemy's turn
	ld a, $1           ; HP bar with right tip for player
	hlcoord 10, 9
.updateHPBar
	ld [wHPBarType], a
	predef UpdateHPBar2
	ld hl, HitWithRecoilText
	jp PrintText


HitWithRecoilText:
	text_far _HitWithRecoilText
	text_end
