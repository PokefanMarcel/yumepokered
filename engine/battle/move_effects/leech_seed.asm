LeechSeedEffect_:
	callfar MoveHitTest ; why is this here? main effect
	ld a, [wMoveMissed]
	and a
	jr nz, .evadedAttack
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus2
	ld de, wEnemyMonType1
	jr z, .gotPointers ; jump on player's turn
	ld hl, wPlayerBattleStatus2
	ld de, wBattleMonType1
.gotPointers
; miss if the target is grass-type or already seeded
	ld a, [de]
	cp GRASS
	jr z, .didntAffect
	inc de
	ld a, [de]
	cp GRASS
	jr z, .didntAffect
	bit SEEDED, [hl]
	jr nz, .didntAffect
	set SEEDED, [hl]
	callfar PlayCurrentMoveAnimation
	ld hl, WasSeededText
	jp PrintText

.evadedAttack
	ld c, 50
	call DelayFrames
	ld hl, EvadedAttackText
	jp PrintText

.didntAffect ; marcelnote - new for immunity
	ld c, 50
	call DelayFrames
	jpfar PrintDidntAffectText


WasSeededText:
	text_far _WasSeededText
	text_end

EvadedAttackText:
	text_far _EvadedAttackText
	text_end
