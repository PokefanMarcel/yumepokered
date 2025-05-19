DrainHPEffect_: ; marcelnote - optimized
	ld hl, wDamage ; wDamage takes two bytes: wDamage is high byte and wDamage + 1 is low byte
	srl [hl]       ; divide high byte by 2
	ld a, [hli]    ; store high byte and move hl to low byte
	rr [hl]        ; divide low byte by 2 (accounting for srl carry)
	or [hl]        ; is total damage 0?
	jr nz, .getAttackerHP
; if damage is 0, increase to 1 so that the attacker gains at least 1 HP
	inc [hl]
.getAttackerHP
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonHP
	ld de, wBattleMonMaxHP
	ld a, [wPlayerMoveEffect]
	jr z, .addDamageToAttackerHP
	ld hl, wEnemyMonHP
	ld de, wEnemyMonMaxHP
	ld a, [wEnemyMoveEffect]
.addDamageToAttackerHP
	push af ; save a = move effect and z flag for turn
	ld bc, wHPBarOldHP + 1
; copy current HP to wHPBarOldHP
	ld a, [hli]
	ld [bc], a  ; [wHPBarOldHP + 1] <- current HP (high byte)
	dec bc
	ld a, [hl]
	ld [bc], a  ; [wHPBarOldHP] <- current HP (low byte)
; copy max HP to wHPBarMaxHP
	dec bc
	ld a, [de]
	ld [bc], a  ; [wHPBarMaxHP + 1] <- max HP (high byte)
	inc de
	dec bc
	ld a, [de]
	ld [bc], a  ; [wHPBarMaxHP] <- max HP (low byte)
; add damage to attacker's HP and copy new HP to wHPBarNewHP
	ld a, [wDamage + 1]
	add [hl] ; hl: current HP (low byte)
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [wDamage]
	adc [hl] ; hl: current HP (high byte)
	ld [hli], a
	ld [wHPBarNewHP + 1], a
	jr c, .capToMaxHP ; if HP > 65,535 = $FFFF, cap to max HP
; compare HP with max HP
	ld a, [de]  ; max HP (high byte)
	cp [hl]     ; current HP (high byte)
	dec de
	dec hl
	ld a, [de]  ; max HP (low byte)
	sbc [hl]    ; current HP (low byte)
	jr nc, .next ; current HP ≤ max HP ?
.capToMaxHP
	ld a, [de]
	ld [hli], a
	ld [wHPBarNewHP + 1], a
	inc de
	ld a, [de]
	ld [hl], a
	ld [wHPBarNewHP], a
.next
	ldh a, [hWhoseTurn]
	and a
	hlcoord 10, 9
	ld a, $1 ; HP Bar with vertical right tip
	jr z, .next2
	hlcoord 2, 2
	xor a
.next2
	ld [wHPBarType], a
	predef UpdateHPBar2
	predef DrawPlayerHUDAndHPBar
	predef DrawEnemyHUDAndHPBar
	callfar ReadPlayerMonCurHPAndStatus
	pop af ; restore a = move effect and z flag for turn
	cp DREAM_EATER_EFFECT
	ld hl, SuckedHealthText
	jp nz, PrintText
	ld hl, DreamWasEatenText
	jp PrintText


SuckedHealthText:
	text_far _SuckedHealthText
	text_end

DreamWasEatenText:
	text_far _DreamWasEatenText
	text_end
