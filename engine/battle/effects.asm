JumpMoveEffect:
	call _JumpMoveEffect
	ld b, $1
	ret

_JumpMoveEffect:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveEffect]
	jr z, .next
	ld a, [wEnemyMoveEffect]
.next
	dec a ; subtract 1, there is no special effect for 00
	add a ; x2, 16bit pointers
	ld hl, MoveEffectPointerTable
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl ; jump to special effect handler

INCLUDE "data/moves/effects_pointers.asm"


DrainHPEffect:
	jpfar DrainHPEffect_


ExplodeEffect:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonHP
	ld de, wPlayerBattleStatus2
	jr z, .gotPointers ; jump on player's turn
	ld hl, wEnemyMonHP
	ld de, wEnemyBattleStatus2
.gotPointers
	xor a
	ld [hli], a ; set the user mon's HP to 0
	ld [hli], a
	inc hl      ; hl = w<>MonStatus
	ld [hl], a  ; set mon's status to 0
	ld a, [de]
	res SEEDED, a ; clear mon's leech seed status
	ld [de], a
	ret


BideEffect: ; marcelnote - optimized
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus1
	ld de, wPlayerBideAccumulatedDamage
	ld bc, wPlayerNumAttacksLeft
	jr z, .gotPointers ; jump on player's turn
	ld hl, wEnemyBattleStatus1
	ld de, wEnemyBideAccumulatedDamage
	ld bc, wEnemyNumAttacksLeft
.gotPointers
	set STORING_ENERGY, [hl] ; mon is now using bide
	xor a
	ld [de], a ; [w<User>BideAccumulatedDamage] = 0
	inc de
	ld [de], a ; [w<User>BideAccumulatedDamage + 1] = 0
	ld [wPlayerMoveEffect], a
	ld [wEnemyMoveEffect], a
	call BattleRandom
	and $1     ; a = 0 or 1
	add $2     ; a = 2 or 3
	ld [bc], a ; set Bide counter to 2 or 3 at random
	ld a, XSTATITEM_ANIM
	jp PlayBattleAnimation2


ThrashPetalDanceEffect: ; marcelnote - optimized
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus1
	ld de, wPlayerNumAttacksLeft
	jr z, .gotPointers ; jump on player's turn
	ld hl, wEnemyBattleStatus1
	ld de, wEnemyNumAttacksLeft
.gotPointers
	set THRASHING_ABOUT, [hl] ; mon is now using thrash/petal dance
	call BattleRandom
	and $1     ; a = 0 or 1
	add $2     ; a = 2 or 3
	ld [de], a ; set counter to 2 or 3 at random
	ld a, SHRINKING_SQUARE_ANIM
	jp PlayBattleAnimation2


SwitchAndTeleportEffect: ; marcelnote - optimized
	ldh a, [hWhoseTurn]
	and a
	push af ; save z flag for turn
	jr z, .playerTurn
; Enemy turn
	ld a, [wIsInBattle] ; wild battle = 1, trainer battle = 2
	dec a
	jr nz, .fail ; fail if not wild battle
	ld a, [wBattleMonLevel]
	ld b, a
	ld a, [wCurEnemyLevel]
	jr .checkSuccess

.playerTurn
	ld a, [wIsInBattle] ; wild battle = 1, trainer battle = 2
	dec a
	jr nz, .fail ; fail if not wild battle
	ld a, [wCurEnemyLevel]
	ld b, a
	ld a, [wBattleMonLevel]
	; fallthrough

.checkSuccess ; a = level of user, b = level of opponent
	cp b
	jr nc, .success ; if user has higher level
	add b
	ld c, a
	inc c ; c = user level + opponent level + 1
.rejectionSampleLoop
	call BattleRandom
	cp c ; random a in [0, user level + opponent level]
	jr nc, .rejectionSampleLoop
	srl b
	srl b ; b = (opponent level) / 4
	cp b
	jr c, .fail ; fail if rand[0, user level + opponent level] < (opponent level) / 4
.success
	call ReadPlayerMonCurHPAndStatus
	xor a
	ld [wAnimationType], a
	inc a
	ld [wEscapedFromBattle], a
	pop af ; restore z flag for turn
	ld a, [wPlayerMoveNum]
	jr z, .gotMoveSuccess
	ld a, [wEnemyMoveNum]
.gotMoveSuccess
	push af ; save move
	call PlayBattleAnimation
	ld c, 20
	call DelayFrames
	pop af ; restore move
	ld hl, RanFromBattleText
	cp TELEPORT
	jr z, .printText
	ld hl, RanAwayScaredText
	cp ROAR
	jr z, .printText
	ld hl, WasBlownAwayText ; WHIRLWIND
.printText
	jp PrintText

.fail
	ld c, 50
	call DelayFrames
	pop af ; restore z flag for turn
	ld a, [wPlayerMoveNum]
	jr z, .gotMoveFail
	ld a, [wEnemyMoveNum]
.gotMoveFail
	ld hl, DidntAffectText ; marcelnote - was IsUnaffectedText for fail in trainer battles
	cp TELEPORT
	jr nz, .printText
	jp PrintButItFailedText_ ; was ConditionalPrintButItFailed, but accuracy check prevents effect to run anyway?

RanFromBattleText:
	text_far _RanFromBattleText
	text_end

RanAwayScaredText:
	text_far _RanAwayScaredText
	text_end

WasBlownAwayText:
	text_far _WasBlownAwayText
	text_end


TwoToFiveAttacksEffect: ; marcelnote - optimized
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus1
	jr z, .checkIfAlreadyAttacking ; jump on player's turn
	ld hl, wEnemyBattleStatus1
.checkIfAlreadyAttacking
	bit ATTACKING_MULTIPLE_TIMES, [hl] ; already attacking multiple times?
	ret nz
	set ATTACKING_MULTIPLE_TIMES, [hl] ; mon is now attacking multiple times
	and a ; a = [hWhoseTurn] still
	ld hl, wPlayerMoveEffect
	ld de, wPlayerNumAttacksLeft
	ld bc, wPlayerNumHits
	jr z, .gotPointers ; jump on player's turn
	ld hl, wEnemyMoveEffect
	ld de, wEnemyNumAttacksLeft
	ld bc, wEnemyNumHits
.gotPointers
	ld a, [hl]
	cp TWO_TO_FIVE_ATTACKS_EFFECT
	jr nz, .attackTwiceOrTwineedle
	call BattleRandom
	and $3 ; a = 0 to 3
	cp $2  ; is a < 2 ?
	jr c, .gotNumHits ; if yes, lock it in: 1/4 chance for each of 0 or 1
	call BattleRandom ; otherwise, re-roll
	and $3 ; a = 0 to 3
.gotNumHits
	add $2 ; finally, 3/8 chance for 2 or 3 hits, 1/8 chance for 4 or 5 hits
.saveNumberOfHits
	ld [de], a
	ld [bc], a
	ret

.attackTwiceOrTwineedle
	cp ATTACK_TWICE_EFFECT
	ld a, $2 ; number of hits
	jr z, .saveNumberOfHits
	; TWINEEDLE_EFFECT left, so set Twineedle's secondary side effect
	ASSERT POISON_SIDE_EFFECT1 == $2
	ld [hl], a ; [w<User>MoveEffect] = POISON_SIDE_EFFECT1
	jr .saveNumberOfHits


FlinchSideEffect:
	call CheckTargetSubstitute
	ret nz
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus1
	ld de, wPlayerMoveEffect
	jr z, .gotPointers ; jump on player's turn
	ld hl, wPlayerBattleStatus1
	ld de, wEnemyMoveEffect
.gotPointers
	ld a, [de]
	cp FLINCH_SIDE_EFFECT1
	ld b, 10 percent + 1 ; chance for FLINCH_SIDE_EFFECT1
	jr z, .gotEffectChance
	ld b, 30 percent + 1 ; chance for FLINCH_SIDE_EFFECT2
.gotEffectChance
	call BattleRandom
	cp b
	ret nc
	set FLINCHED, [hl] ; set mon's status to flinching
	call ClearHyperBeam
	ret


OneHitKOEffect:
	jpfar OneHitKOEffect_


ChargeEffect: ; marcelnote - adjusted for removing FLY_EFFECT
	ld b, XSTATITEM_ANIM
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus1
	ld de, wPlayerMoveNum
	jr z, .gotPointers
	ld hl, wEnemyBattleStatus1
	ld de, wEnemyMoveNum
.gotPointers
	set CHARGING_UP, [hl]
	ld a, [de]
	cp FLY
	jr nz, .notFly
	set INVULNERABLE, [hl] ; mon is now invulnerable to typical attacks (fly/dig)
	ld b, TELEPORT ; load Teleport's animation
.notFly
	cp DIG
	jr nz, .notDig
	set INVULNERABLE, [hl] ; mon is now invulnerable to typical attacks (fly/dig)
	ld b, SLIDE_DOWN_ANIM
.notDig
	xor a
	ld [wAnimationType], a
	ld a, b
	call PlayBattleAnimation
	ld a, [de]
	ld [wChargeMoveNum], a
	ld hl, ChargeMoveEffectText
	jp PrintText

ChargeMoveEffectText:   ; marcelnote - replaced jr z, .gotText by ret z
	text_far _ChargeMoveEffectText
	text_asm
	ld a, [wChargeMoveNum]
	cp DIG
	ld hl, DugAHoleText
	ret z
	cp FLY
	ld hl, FlewUpHighText
	ret z
	cp SOLARBEAM
	ld hl, TookInSunlightText
	ret z
	cp SKY_ATTACK
	ld hl, SkyAttackGlowingText
	ret z
;	cp RAZOR_WIND  ; marcelnote - changed RAZOR WIND to HYPER_BEAM_EFFECT
;	ld hl, MadeWhirlwindText
;	ret z
	; SKULL_BASH
	ld hl, LoweredItsHeadText
	ret

MadeWhirlwindText:
	text_far _MadeWhirlwindText
	text_end

TookInSunlightText:
	text_far _TookInSunlightText
	text_end

LoweredItsHeadText:
	text_far _LoweredItsHeadText
	text_end

SkyAttackGlowingText:
	text_far _SkyAttackGlowingText
	text_end

FlewUpHighText:
	text_far _FlewUpHighText
	text_end

DugAHoleText:
	text_far _DugAHoleText
	text_end

; BIND, WRAP, FIRE_SPIN, CLAMP
ASSERT FIRE_SPIN > BIND
ASSERT FIRE_SPIN > WRAP
ASSERT FIRE_SPIN < CLAMP
TrappingEffect: ; marcelnote - added immunity check
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus1
	ld de, wPlayerNumAttacksLeft
	ld bc, wEnemyMonType
	ld a, [wPlayerMoveNum]
	jr z, .gotPointers ; jump on player's turn
	ld hl, wEnemyBattleStatus1
	ld de, wEnemyNumAttacksLeft
	ld bc, wBattleMonType
	ld a, [wEnemyMoveNum]
.gotPointers
	bit USING_TRAPPING_MOVE, [hl]
	ret nz
	cp FIRE_SPIN
	jr nc, .notImmune
.testGhosts
	; move is either WRAP or BIND, so GHOSTs are immune
	ld a, [bc] ; a = type 1 of defending Mon
	cp GHOST
	ret z
	inc bc
	ld a, [bc] ; a = type 2 of defending Mon
	cp GHOST
	ret z
.notImmune
	set USING_TRAPPING_MOVE, [hl] ; mon is now using a trapping move
	call ClearHyperBeam ; since this effect is called before testing whether the move will hit,
                        ; the target won't need to recharge even if the trapping move missed
	call BattleRandom ; 3/8 chance for 2 and 3 attacks, and 1/8 chance for 4 and 5 attacks
	and $3
	cp $2
	jr c, .setTrappingCounter
	call BattleRandom
	and $3
.setTrappingCounter
	inc a
	ld [de], a
	ret

MistEffect:
	jpfar MistEffect_

FocusEnergyEffect:
	jpfar FocusEnergyEffect_

RecoilEffect:
	jpfar RecoilEffect_


SubstituteEffect:
	jpfar SubstituteEffect_

HyperBeamEffect:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus2
	jr z, .gotPointer ; jump on player's turn
	ld hl, wEnemyBattleStatus2
.gotPointer
	set NEEDS_TO_RECHARGE, [hl] ; mon now needs to recharge
	ret

ClearHyperBeam:
;	push hl
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus2
	jr z, .gotPointer ; jump on player's turn
	ld hl, wPlayerBattleStatus2
.gotPointer
	res NEEDS_TO_RECHARGE, [hl] ; mon no longer needs to recharge
;	pop hl
	ret

RageEffect:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus2
	jr z, .gotPointer
	ld hl, wEnemyBattleStatus2
.gotPointer
	set USING_RAGE, [hl] ; mon is now in "rage" mode
	ret

MimicEffect: ; marcelnote - optimized
	ld c, 50
	call DelayFrames
	call MoveHitTest ; why is this here? this is a main effect
	ld a, [wMoveMissed]
	and a
	jr nz, .butItFailed
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonMoves
	ld a, [wPlayerBattleStatus1]
	jr nz, .gotTargetPointers ; jump on enemy's turn
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ld hl, wEnemyMonMoves
	ld a, [wEnemyBattleStatus1]
	jr nz, .letPlayerChooseMove ; can choose move outside of link battles only
.gotTargetPointers
	bit INVULNERABLE, a
	jr nz, .butItFailed
.getRandomMove
	push hl ; save hl = w<Target>MonMoves
	call BattleRandom
	and $3 ; draw a move (0 to 3)
	ld c, a
	ld b, $0
	add hl, bc ; hl = w<Target>MonMoves + move offset
	ld a, [hl]
	pop hl ; restore hl = w<Target>MonMoves
	and a  ; is it NO_MOVE?
	jr z, .getRandomMove ; if yes, find another move
	ld d, a ; d = mimicked move
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonMoves
	ld a, [wPlayerMoveListIndex]
	jr z, .gotUserPointers
	ld hl, wEnemyMonMoves
	ld a, [wEnemyMoveListIndex]
	jr .gotUserPointers

.letPlayerChooseMove
	bit INVULNERABLE, a ; a = [wEnemyBattleStatus1]
	jr nz, .butItFailed
	ld a, [wCurrentMenuItem] ; current position of MIMIC
	push af ; save current position of MIMIC
	ld a, $1 ; Mimic menu
	ld [wMoveMenuType], a
	call MoveSelectionMenu ; uses hl = wEnemyMonMoves for Mimic
	call LoadScreenTilesFromBuffer1
	ld hl, wEnemyMonMoves
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, $0
	add hl, bc
	ld d, [hl] ; d = mimicked move
	pop af ; restore current position of MIMIC
	ld hl, wBattleMonMoves
.gotUserPointers
	ld c, a
	ld b, 0
	add hl, bc ; hl = w<User>MonMoves + move offset
	ld a, d    ; a = mimicked move
	ld [hl], a
	ld [wNamedObjectIndex], a
	call GetMoveName
	call PlayCurrentMoveAnimation
	ld hl, MimicLearnedMoveText
	jp PrintText

.butItFailed
	jp PrintButItFailedText_

MimicLearnedMoveText:
	text_far _MimicLearnedMoveText
	text_end


LeechSeedEffect:
	jpfar LeechSeedEffect_

SplashEffect:
	call PlayCurrentMoveAnimation
	jp PrintNoEffectText

DisableEffect: ; marcelnote - optimized
	call MoveHitTest ; why is this here and not in the main battle loop?
	ld a, [wMoveMissed]
	and a
	jr nz, .butItFailed
	ldh a, [hWhoseTurn]
	and a
	ld de, wEnemyDisabledMove
	ld hl, wEnemyMonMoves
	jr z, .gotPointers ; jump on player's turn
	ld de, wPlayerDisabledMove
	ld hl, wBattleMonMoves
.gotPointers
	ld a, [de] ; de = w<Target>DisabledMove
	and a      ; target already has a move disabled?
	jr nz, .butItFailed ; if yes, fail
.pickMoveToDisable
	push hl    ; save hl = w<Target>MonMoves
	call BattleRandom
	and $3     ; a = 0, 1, 2, or 3
	ld c, a    ; c = move offset
	ld b, 0
	add hl, bc ; hl = w<Target>MonMoves + move offset
	ld a, [hl] ; a = move to disable
	and a      ; is it NO_MOVE?
	jr z, .pickAnotherMove     ; if yes, pick another move
	ld [wNamedObjectIndex], a  ; store move (used by GetMoveName below)
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonPP
	jr nz, .checkMoveHasPP ; hl -> player's PP if enemy turn
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr nz, .disableMove    ; don't track enemy's PP outside link battles
	ld hl, wEnemyMonPP     ; hl -> enemy's PP if player turn and link battle
.checkMoveHasPP
	push hl    ; save hl = w<Target>MonPP
	add hl, bc ; b = 0, c = move offset
	ld a, [hl] ; a = [w<Target>MonPP + move offset]
	pop hl     ; restore hl = w<Target>MonPP
	and a
	jr nz, .disableMove
; selected move had no PP left, but does any move have PP left?
	ld a, [hli] ; a = [w<Target>MonPP]
	or [hl]     ; hl = w<Target>MonPP + 1
	inc hl
	or [hl]     ; hl = w<Target>MonPP + 2
	inc hl
	or [hl]     ; hl = w<Target>MonPP + 3
	and PP_MASK
	jr z, .butItFailed_PopHL ; no move with PP left, so disable fails
.pickAnotherMove
	pop hl     ; restore hl = w<Target>MonMoves
	jr .pickMoveToDisable

.disableMove
	pop hl     ; restore hl = w<Target>MonMoves (clean stack)
	call BattleRandom
	and $7
	inc a      ; 1-8 turns disabled
	inc c      ; c = move offset + 1 (move 1-4 will be disabled)
	swap c
	add c      ; a = turns disabled (low nibble) and move number disabled (high nibble)
	ld [de], a ; [w<Target>DisabledMove] = a
	call PlayCurrentMoveAnimation2
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerDisabledMoveID
	jr nz, .printDisableText
	inc hl ; wEnemyDisabledMoveID
	ASSERT wPlayerDisabledMoveID + 1 == wEnemyDisabledMoveID
.printDisableText
	ld a, [wNamedObjectIndex] ; a = move ID
	ld [hl], a ; hl = w<Target>DisabledMoveID
	call GetMoveName
	ld hl, MoveWasDisabledText
	jp PrintText

.butItFailed_PopHL
	pop hl
.butItFailed
	jp PrintButItFailedText_

MoveWasDisabledText:
	text_far _MoveWasDisabledText
	text_end


HexEffect:  ; marcelnote - new effect for HEX: gets to 90 base power if opponent has PAR/SLP/PSN/BRN/FRZ
	ldh a, [hWhoseTurn]
	and a
	ld de, wEnemyMonStatus
	ld hl, wPlayerMovePower
	jr z, .gotPointers ; jump on player's turn
	ld de, wBattleMonStatus
	ld hl, wEnemyMovePower
.gotPointers
	ld a, [de]
	and a ; does the target have a status ailment?
	ret z
	ld [hl], 90 ; if yes, change Hex base power from 60 to 90
	ret


PayDayEffect:
	jpfar PayDayEffect_

ConversionEffect:
	jpfar ConversionEffect_

HazeEffect:
	jpfar HazeEffect_

HealEffect:
	jpfar HealEffect_

TransformEffect:
	jpfar TransformEffect_

ReflectLightScreenEffect:
	jpfar ReflectLightScreenEffect_

NothingHappenedText:
	text_far _NothingHappenedText
	text_end

PrintNoEffectText:
	ld hl, NoEffectText
	jp PrintText

NoEffectText:
	text_far _NoEffectText
	text_end

ConditionalPrintButItFailed:
	ld a, [wMoveDidntMiss]
	and a
	ret nz ; return if the side effect failed, yet the attack was successful
	; fallthrough

PrintButItFailedText_:
	ld hl, ButItFailedText
	jp PrintText

ButItFailedText:
	text_far _ButItFailedText
	text_end

PrintDidntAffectText:
	ld hl, DidntAffectText
	jp PrintText

DidntAffectText:
	text_far _DidntAffectText
	text_end

IsUnaffectedText:
	text_far _IsUnaffectedText
	text_end

CheckTargetSubstitute:
	push hl
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus2
	jr z, .playerTurn
	ld hl, wPlayerBattleStatus2
.playerTurn
	bit HAS_SUBSTITUTE_UP, [hl]
	pop hl
	ret


PlayCurrentMoveAnimation2:
; animation at MOVENUM will be played unless MOVENUM is 0
; plays wAnimationType 3 or 6
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	jr z, .playerTurn
	ld a, [wEnemyMoveNum]
.playerTurn
	and a
	ret z
	; fallthrough

PlayBattleAnimation2:
; play animation ID at a and animation type 6 or 3
	ld [wAnimationID], a
	ldh a, [hWhoseTurn]
	and a
	ld a, ANIMATIONTYPE_SHAKE_SCREEN_HORIZONTALLY_SLOW_2
	jr z, .playerTurn
	ld a, ANIMATIONTYPE_SHAKE_SCREEN_HORIZONTALLY_SLOW
.playerTurn
	ld [wAnimationType], a
	jr PlayBattleAnimationGotID

PlayCurrentMoveAnimation:
; animation at MOVENUM will be played unless MOVENUM is 0
; resets wAnimationType
	xor a
	ld [wAnimationType], a
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	jr z, .playerTurn
	ld a, [wEnemyMoveNum]
.playerTurn
	and a
	ret z
	; fallthrough

PlayBattleAnimation:
; play animation ID at a and predefined animation type
	ld [wAnimationID], a

PlayBattleAnimationGotID:
; play animation at wAnimationID
	push hl
	push de
	push bc
	predef MoveAnimation
	pop bc
	pop de
	pop hl
	ret
