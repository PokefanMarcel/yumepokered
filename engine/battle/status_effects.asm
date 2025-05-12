SleepEffect:
	ld de, wEnemyMonStatus
	ld hl, wEnemyBattleStatus2
	ldh a, [hWhoseTurn]
	and a
	jr z, .gotPointers
	ld de, wBattleMonStatus
	ld hl, wPlayerBattleStatus2
.gotPointers
	bit HAS_SUBSTITUTE_UP, [hl] ; marcelnote - added check for substitute
	jr nz, .didntAffect

	; marcelnote - removed this interaction with hyper beam
;	bit NEEDS_TO_RECHARGE, [hl] ; does the target need to recharge? (hyper beam)
;	res NEEDS_TO_RECHARGE, [hl] ; target no longer needs to recharge
;	jr nz, .setSleepCounter ; if the target had to recharge, all hit tests will be skipped
	                        ; including the event where the target already has another status
	ld a, [de]
	and SLP_MASK
	jr nz, .alreadyAsleep ; can't affect a mon that is already asleep
	ld a, [de]
	and a
	jr nz, .didntAffect ; can't affect a mon that is already statused
	push hl
	push de
	call MoveHitTest ; apply accuracy tests
	pop de
	pop hl
	ld a, [wMoveMissed]
	and a
	jp nz, PrintButItFailedText_ ; marcelnote - changed from PrintDidntAffectText
	; success
	res NEEDS_TO_RECHARGE, [hl] ; target no longer needs to recharge
.setSleepCounter
; set target's sleep counter to a random number between 1 and 7
	call BattleRandom
	and SLP_MASK
	jr z, .setSleepCounter
	ld [de], a
	call PlayCurrentMoveAnimation2
	ld hl, FellAsleepText
	jp PrintText

.didntAffect
	jp PrintDidntAffectText

.alreadyAsleep
	ld hl, AlreadyAsleepText
	jp PrintText


PoisonEffect: ; marcelnote - optimized
	ld hl, wEnemyMonStatus
	ld de, wPlayerMoveEffect
	ldh a, [hWhoseTurn]
	and a
	jr z, .gotPointers
	ld hl, wBattleMonStatus
	ld de, wEnemyMoveEffect
.gotPointers
	call CheckTargetSubstitute
	jr nz, .noEffect ; can't poison a substitute target
	ld a, [hli] ; a = [w<>MonStatus]
	and a
	jr nz, .noEffect ; can't affect a mon that is already statused
	ld a, [hli] ; a = [w<>MonType1]
	cp POISON ; can't poison a poison-type target
	jr z, .noEffect
	ld a, [hld] ; a = [w<>MonType2]
	cp POISON ; can't poison a poison-type target
	jr z, .noEffect
	ld a, [de] ; a = [w<>MoveEffect]
	cp POISON_SIDE_EFFECT1
	ld b, 20 percent + 1 ; chance of poisoning
	jr z, .sideEffectTest
	cp POISON_SIDE_EFFECT2
	ld b, 40 percent + 1 ; chance of poisoning
	jr z, .sideEffectTest
	; main effect
	push hl
	push de
	call MoveHitTest ; apply accuracy tests
	pop de
	pop hl
	ld a, [wMoveMissed]
	and a
	jr z, .inflictPoison ; marcelnote - was nz, .didntAffect
	ld hl, ButItFailedText
	jp Delay50AndPrintText

.sideEffectTest
	call BattleRandom
	cp b ; was side effect successful?
	ret nc
.inflictPoison
	dec hl ; hl = w<>MonStatus
	set PSN, [hl]
	ld a, [de]
	ld c, a ; c = [w<>MoveEffect]
	dec de ; de = w<>MoveNum
	ldh a, [hWhoseTurn]
	and a
	ld a, [de] ; a = [w<>MoveNum]
	ld b, SHAKE_SCREEN_ANIM
	ld hl, wPlayerBattleStatus3
	ld de, wPlayerToxicCounter
	jr nz, .enemyTurn
	ld b, ENEMY_HUD_SHAKE_ANIM
	ld hl, wEnemyBattleStatus3
	ld de, wEnemyToxicCounter
.enemyTurn
	cp TOXIC
	jr nz, .normalPoison ; if move is not Toxic
	set BADLY_POISONED, [hl] ; else set Toxic battle status
	xor a
	ld [de], a ; initialize Toxic counter
	ld hl, BadlyPoisonedText
	jr .chooseAnimation
.normalPoison
	ld hl, PoisonedText
.chooseAnimation
	ld a, c ; a = [w<>MoveEffect]
	cp POISON_EFFECT
	jr z, .regularPoisonEffect
	; side effect
	ld a, b ; a = SHAKE_SCREEN_ANIM or ENEMY_HUD_SHAKE_ANIM
	call PlayBattleAnimation2 ; just play shake animation
	jp PrintText

.regularPoisonEffect
	call PlayCurrentMoveAnimation2
	jp PrintText

.noEffect
	ld a, [de]
	cp POISON_EFFECT
	ret nz ; don't print if Poison is only side effect
	ld hl, DidntAffectText
	jp Delay50AndPrintText


ParalyzeEffect: ; for Thunder Wave, Glare, Stun Spore ; marcelnote - optimized
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonStatus
	ld de, wPlayerMoveType
	jr z, .playerTurn
	ld hl, wBattleMonStatus
	ld de, wEnemyMoveType
.playerTurn
	call CheckTargetSubstitute ; marcelnote - added substitute check
	jr nz, .didntAffect  ; can't paralyze a substitute target
	ld a, [hli]          ; hl = w<>MonType1
	and a                ; does the target already have a status ailment?
	jr nz, .didntAffect
	; check if the target is immune due to types
	ld a, [de]
	cp ELECTRIC          ; is the move Electric-type?
	jr nz, .hitTest      ; if not, proceed
	; else check if the target is Ground-type
	ld a, [hli]          ; a = [w<>MonType1]
	cp GROUND
	jr z, .doesntAffect
	ld a, [hld]          ; a = [w<>MonType2],  hl = w<>MonType1
	cp GROUND
	jr z, .doesntAffect
.hitTest
	push hl ; save hl = w<>MonType1
	call MoveHitTest
	pop hl
	ld a, [wMoveMissed]
	and a
	jr nz, .failed
	dec hl ; hl = w<>MonStatus
	set PAR, [hl]
	call QuarterSpeedDueToParalysis
	;ld c, 30
	;call DelayFrames   ; marcelnote - removed pause before attack animation
	call PlayCurrentMoveAnimation
	ld hl, ParalyzedMayNotAttackText
	jp PrintText

.didntAffect
	ld hl, DidntAffectText
	jp Delay50AndPrintText

.doesntAffect
	ld hl, DoesntAffectMonText
	jp Delay50AndPrintText

.failed
	ld hl, ButItFailedText
	jp Delay50AndPrintText


BurnEffect: ; marcelnote - for WILL-O-WISP, similar to ParalyzeEffect
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonStatus
	jr z, .playerTurn
	ld hl, wBattleMonStatus
.playerTurn
	call CheckTargetSubstitute
	jr nz, .didntAffect  ; can't burn a substitute target
	ld a, [hli]          ; hl = w<>MonType1
	and a                ; does the target already have a status ailment?
	jr nz, .didntAffect
	; check if the target is immune due to types
	ld a, [hli]          ; a = [w<>MonType1]
	cp FIRE
	jr z, .doesntAffect
	inc bc
	ld a, [hld]          ; a = [w<>MonType2],  hl = w<>MonType1
	cp FIRE
	jr z, .doesntAffect
.hitTest
	push hl
	call MoveHitTest
	pop hl
	ld a, [wMoveMissed]
	and a
	jr nz, .failed
	dec hl ; hl = w<>MonStatus
	set BRN, [hl]
	call HalveAttackDueToBurn
	call PlayCurrentMoveAnimation
	ld hl, BurnedText
	jp PrintText

.didntAffect
	ld hl, DidntAffectText
	jp Delay50AndPrintText

.doesntAffect
	ld hl, DoesntAffectMonText
	jp Delay50AndPrintText

.failed
	ld hl, ButItFailedText
	jp Delay50AndPrintText


FreezeBurnParalyzeEffect: ; only side effects ; marcelnote - optimized
	xor a
	ld [wAnimationType], a
	call CheckTargetSubstitute
	ret nz ; can't affect a substitute
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonStatus
	ld de, wEnemyMoveType
	jr nz, .opponentTurn
	ld hl, wEnemyMonStatus
	ld de, wPlayerMoveType
.opponentTurn
	ld a, [hli] ; a = [w<>MonStatus]
	and a
	jp nz, CheckDefrost ; can't inflict status if opponent is already statused
	ld a, [de]
	ld b, a     ; b = [w<>MoveType]
	ld a, [hli] ; a = [w<>MonType1]
	cp b        ; do target type 1 and move type match?
	ret z       ; if yes, return (ice beam can't freeze an ice-type, body slam can't paralyze a normal-type, etc.)
	ld a, [hld] ; a = [w<>MonType2]
	cp b        ; do target type 2 and move type match?
	ret z       ; if yes, return
	dec de
	dec de      ; de = w<>MoveEffect
	ASSERT wPlayerMoveType - 2 == wPlayerMoveEffect
	ASSERT wEnemyMoveType - 2 == wEnemyMoveEffect
	ld a, [de]  ; a = [w<>MoveEffect]
	cp PARALYZE_SIDE_EFFECT1 + 1
	ld b, 10 percent + 1
	jr c, .regular_effectiveness
; extra effectiveness
	ld b, 30 percent + 1
	ASSERT PARALYZE_SIDE_EFFECT2 - PARALYZE_SIDE_EFFECT1 == BURN_SIDE_EFFECT2 - BURN_SIDE_EFFECT1
	ASSERT PARALYZE_SIDE_EFFECT2 - PARALYZE_SIDE_EFFECT1 == FREEZE_SIDE_EFFECT2 - FREEZE_SIDE_EFFECT1
	sub PARALYZE_SIDE_EFFECT2 - PARALYZE_SIDE_EFFECT1
	ld [de], a ; treat extra effective as regular from now on
.regular_effectiveness
	call BattleRandom ; preserves all 16-bit registers
	cp b
	ret nc     ; do nothing if random value is >= 1A or 4D [no status applied]
	dec hl     ; hl = w<>MonStatus
	ldh a, [hWhoseTurn]
	and a
	jr nz, .skipAnimation ; no animation if opponent's turn
	ld a, ENEMY_HUD_SHAKE_ANIM
	call PlayBattleAnimation ; preserves all 16-bit registers
.skipAnimation
	ld a, [de] ; a = [w<>MoveEffect]
	cp BURN_SIDE_EFFECT1
	jr z, .burn
	cp FREEZE_SIDE_EFFECT1
	jr z, .freeze
; paralyze
	ld [hl], 1 << PAR
	call QuarterSpeedDueToParalysis ; quarter speed of affected mon
	ld hl, ParalyzedMayNotAttackText
	jp PrintText

.burn
	ld [hl], 1 << BRN
	call HalveAttackDueToBurn ; halve attack of affected mon
	ld hl, BurnedText
	jp PrintText

.freeze
	ld [hl], 1 << FRZ
	call ClearHyperBeam ; resets hyper beam recharge from target
	ld hl, FrozenText
	jp PrintText


CheckDefrost:
; any fire-type move that has a chance inflict burn (all but Fire Spin) will defrost a frozen target
	and 1 << FRZ ; are they frozen?
	ret z ; return if not
	ldh a, [hWhoseTurn]
	and a
	jr nz, .opponentTurn
	; player turn
	ld a, [wPlayerMoveType]
	sub FIRE
	ret nz ; return if type of move used isn't fire
	ld [wEnemyMonStatus], a ; set opponent status to 00 ["defrost" a frozen monster]
	ld hl, wEnemyMon1Status
	ld a, [wEnemyMonPartyPos]
	ld bc, wEnemyMon2 - wEnemyMon1
	jr .common
.opponentTurn
	ld a, [wEnemyMoveType] ; same as above with addresses swapped
	sub FIRE
	ret nz
	ld [wBattleMonStatus], a
	ld hl, wPartyMon1Status
	ld a, [wPlayerMonNumber]
	ld bc, wPartyMon2 - wPartyMon1
.common
	call AddNTimes
	xor a
	ld [hl], a ; clear status in roster
	ld hl, FireDefrostedText
	jp PrintText


TriAttackEffect:  ; marcelnote - new effect for TRI_ATTACK: 20% chance of PAR/BRN/FRZ (6.6% each)
	xor a
	ld [wAnimationType], a
	call CheckTargetSubstitute
	ret nz ; can't cause a status on a substitute
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonStatus
	jr z, .playerTurn
	ld hl, wBattleMonStatus
.playerTurn
	ld a, [hli] ; hl = w<>MonType1
	and a ; does the target already have a status ailment?
	ret nz
	call BattleRandom ; generates a random number in a

	; burn
	cp 17 ; 17/256 chance of result being 0-16 (6.6%)
	jr nc, .freeze
	; check if the target is immune due to types
	ld a, [hli] ; a = [w<>MonType1]
	cp FIRE
	ret z
	ld a, [hld] ; a = [w<>MonType2]
	cp FIRE
	ret z
	dec hl ; hl = w<>MonStatus
	ld [hl], 1 << BRN
	call HalveAttackDueToBurn
	ld hl, BurnedText
	jr .playAnimPrintText

.freeze
	cp 34 ; 17/256 chance of result being 17-33 (6.6%)
	jr nc, .paralyze
; check if the target is immune due to types
	ld a, [hli] ; a = [w<>MonType1]
	cp ICE
	ret z
	ld a, [hld] ; a = [w<>MonType2]
	cp ICE
	ret z
	dec hl ; hl = w<>MonStatus
	ld [hl], 1 << FRZ
	call ClearHyperBeam
	ld hl, FrozenText
	jr .playAnimPrintText

.paralyze
	cp 51 ; 17/256 chance of result being 34-50 (6.6%)
	ret nc
; check if the target is immune due to types
	ld a, [hli] ; a = [w<>MonType1]
	cp GROUND
	ret z
	ld a, [hld] ; a = [w<>MonType2]
	cp GROUND
	ret z
	dec hl ; hl = w<>MonStatus
	ld [hl], 1 << PAR
	call QuarterSpeedDueToParalysis
	ld hl, ParalyzedMayNotAttackText
	; fallthrough

.playAnimPrintText
	ldh a, [hWhoseTurn]
	and a
	jr nz, .skipAnimation ; skip animation on opponent's turn
	ld a, ENEMY_HUD_SHAKE_ANIM
	call PlayBattleAnimation ; preserves hl
.skipAnimation
	jp PrintText



Delay50AndPrintText: ; marcelnote - new for optimization
	ld c, 50
	call DelayFrames
	jp PrintText


FellAsleepText:
	text_far _FellAsleepText
	text_end

AlreadyAsleepText:
	text_far _AlreadyAsleepText
	text_end

PoisonedText:
	text_far _PoisonedText
	text_end

BadlyPoisonedText:
	text_far _BadlyPoisonedText
	text_end

ParalyzedMayNotAttackText:
	text_far _ParalyzedMayNotAttackText
	text_end

FrozenText:
	text_far _FrozenText
	text_end

BurnedText:
	text_far _BurnedText
	text_end

FireDefrostedText:
	text_far _FireDefrostedText
	text_end
