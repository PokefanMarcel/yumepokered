StatModifierUpEffect: ; marcelnote - optimized
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMonStatMods ; stat mod between 1 and 13 (-6 to +6)
	ld de, wPlayerMoveEffect
	jr z, .playerTurn
	ld hl, wEnemyMonStatMods  ; stat mod between 1 and 13 (-6 to +6)
	ld de, wEnemyMoveEffect
.playerTurn
	ld a, [de]  ; a = [w<User>MoveEffect]
	sub ATTACK_UP2_EFFECT                     ; a = stat offset for +2 effects
	jr nc, .gotStatOffset                     ; +2 effects are after +1 effects
	add ATTACK_UP2_EFFECT - ATTACK_UP1_EFFECT ; a = stat offset for +1 effects
.gotStatOffset
	ld c, a    ; c = offset for stat to increase: 0=Attack, 1=Defense, 2=Speed,
	ld b, $0   ;                                  3=Special, 4=Accuracy, 5=Evasion
	add hl, bc ; hl = w<User>Mon<Stat>Mod
	ld b, [hl]                     ; b = [w<User>Mon<Stat>Mod], current stat modifier
	ld a, $d - 1                   ; can't raise stat mod past +6 ($d or 13)
	cp b                           ; is b ≥ $d already?
	jp c, PrintNothingHappenedText ; if yes, do nothing
	inc b                          ; else +1
	cp b                           ; is b ≥ $d now?
	jr c, .doneIncreasing          ; if yes, stop
	ld a, [de]
	cp ATTACK_UP2_EFFECT           ; else, is it a +2 effect?
	jr c, .doneIncreasing
	inc b                          ; if yes, +1 again
.doneIncreasing
	ld [hl], b ; [w<User>Mon<Stat>Mod] = updated stat mod
	ld a, c    ; a = stat offset
	cp $4
	jr nc, UpdateUppedStatDone ; jump if stat affected is Accuracy/Evasion

;	push hl ; save hl = w<User>Mon<Stat>Mod (for RestoreOriginalStatModifier)
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonAttack + 1
	ld de, wPlayerMonUnmodifiedAttack
	jr z, .pointToStats
	ld hl, wEnemyMonAttack + 1
	ld de, wEnemyMonUnmodifiedAttack
.pointToStats
	push bc    ; save b = stat mod, c = stat offset
	sla c      ; multiply c by 2
	ld b, $0
	add hl, bc ; hl = w<User>Mon<Stat> + 1
	ld a, c    ; the next lines effectively do 'add de, bc' (not an actual command)
	add e
	ld e, a
	adc d
	sub e
	ld d, a    ; de = w<User>MonUnmodified<Stat>
	pop bc     ; restore b = stat mod, c = stat offset
	; check if stat is already 999 = $03E7
	ld a, [hld]  ; a = [w<User>Mon<Stat> + 1]
	sub LOW(MAX_STAT_VALUE)
	ld a, [hli]  ; a = [w<User>Mon<Stat>]
	sbc HIGH(MAX_STAT_VALUE)
;	jp nc, RestoreOriginalStatModifier ; used to do -1 on stat mod here
	jp nc, PrintNothingHappenedText    ; stat is already ≥ 999

	; recalculate affected stat taking into account badge boosts and status penalties
	call UpdateStat ; preserves c = stat offset, moves to hl = w<User>Mon<Stat>
	ldh a, [hWhoseTurn]
	and a           ; apply badge boost only if player increased own stats
	call z, ApplyBadgeBoostToSelectedStat ; preserves c = stat offset and hl = w<User>Mon<Stat>
	ld a, c
	and a   ; stat offset = attack?
	call z, HalveOwnAttackDueToBurn       ; preserves c = stat offset
	ld a, c
	cp 2    ; stat offset = speed?
	call z, QuarterOwnSpeedDueToParalysis ; preserves c = stat offset
	; fallthrough

UpdateUppedStatDone:
	inc c   ; c = stat offset + 1 for list search
	call BufferStatText ; uses c as counter
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus2
	ld de, wPlayerMoveNum
	ld bc, wPlayerMonMinimized
	jr z, .playerTurn
	ld hl, wEnemyBattleStatus2
	ld de, wEnemyMoveNum
	ld bc, wEnemyMonMinimized
.playerTurn
	ld a, [de] ; a = [w<User>MoveNum]
	cp MINIMIZE
	jr nz, .notMinimize
 ; if a substitute is up, slide off the substitute and show the mon pic before
 ; playing the minimize animation
	bit HAS_SUBSTITUTE_UP, [hl]
	push af  ; save z flag for substitute
	push bc  ; save bc = w<User>MonMinimized
	ld hl, HideSubstituteShowMonAnim
	ld b, BANK(HideSubstituteShowMonAnim)
	call nz, Bankswitch ; hide substitute if there is one
	call PlayCurrentMoveAnimation ; play Minimize animation
	pop bc  ; restore bc = w<User>MonMinimized
	ld a, $1
	ld [bc], a
	ld hl, ReshowSubstituteAnim
	ld b, BANK(ReshowSubstituteAnim)
	pop af  ; restore z flag for substitute
	call nz, Bankswitch ; reshow substitute if there is one
	jr .printStatsRoseText
.notMinimize
	call PlayCurrentMoveAnimation
.printStatsRoseText
; marcelnote - fixed those glitches with calls after UpdateStat above
;	ldh a, [hWhoseTurn]
;	and a
;	call z, ApplyBadgeStatBoosts ; whenever the player uses a stat-up move, badge boosts get reapplied again to every stat,
	                             ; even to those not affected by the stat-up move (will be boosted further)
;	call QuarterSpeedDueToParalysis ; apply speed penalty to the Mon whose turn is not, if it's paralyzed
;	call HalveAttackDueToBurn       ; apply attack penalty to the Mon whose turn is not, if it's burned

	ld hl, MonsStatsRoseText
	jp PrintText


StatModifierDownEffect: ; marcelnote - optimized
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonStatMods ; stat mod between 1 and 13 (-6 to +6)
	ld de, wPlayerMoveEffect
	ld bc, wEnemyBattleStatus2
	jr z, .playerTurn
	ld hl, wPlayerMonStatMods ; stat mod between 1 and 13 (-6 to +6)
	ld de, wEnemyMoveEffect
	ld bc, wPlayerBattleStatus2
;	ld a, [wLinkState]            ; marcelnote - removed 25% chance for opponent to miss
;	cp LINK_STATE_BATTLING
;	jr z, .playerTurn
;	call BattleRandom
;	cp 25 percent + 1 ; chance to miss in regular battle
;	jp c, ConditionalPrintButItFailed
.playerTurn
	ld a, [bc]                         ; a = [w<Target>BattleStatus2]
	bit HAS_SUBSTITUTE_UP, a           ; does the target have a substitute up?
	jp nz, ConditionalPrintButItFailed ; if yes, fail but print only if stat down was main effect
	ld a, [de]                         ; a = [w<User>MoveEffect]
	cp ATTACK_DOWN1_EFFECT             ; side effects come before Down1 and Down2 effects
	push af                            ; save c flag (set = side effect)
	jr nc, .mainEffect
	; side effect
	call BattleRandom
	cp 33 percent + 1           ; chance for side effects
	jr nc, .butItFailed         ; here we'd like 'ret nc' but we have to pop af
	ld a, [de]                  ; a = [w<User>MoveEffect]
	sub ATTACK_DOWN_SIDE_EFFECT ; a = stat offset (0 to 3)
	jr .gotStatOffset

.butItFailed
	pop af     ; restore c flag (set = side effect)
	ret c      ; don't print anything if only side effect
	jp PrintButItFailedText_

.nothingHappened
	pop af     ; restore c flag (set = side effect)
	ret c      ; don't print anything if only side effect
	jp PrintNothingHappenedText

.mainEffect ; main effect only
	dec bc               ; bc = w<Target>BattleStatus1
	ld a, [bc]           ; a = [w<Target>BattleStatus1]
	bit INVULNERABLE, a  ; is the target in fly/dig?
	jr nz, .butItFailed  ; if yes, fail
	push hl
	push de
	call MoveHitTest ; apply accuracy tests
	pop de
	pop hl
	ld a, [wMoveMissed]
	and a
	jr nz, .butItFailed
	ld a, [de]                                    ; a = w<User>MoveEffect
	sub ATTACK_DOWN2_EFFECT                       ; a = stat offset for -2 effects
	jr nc, .gotStatOffset                         ; -2 effects are after -1 effects
	add ATTACK_DOWN2_EFFECT - ATTACK_DOWN1_EFFECT ; a = stat offset for -1 effects
.gotStatOffset
	ld c, a                 ; c = offset for stat to increase: 0=Attack, 1=Defense, 2=Speed,
	ld b, $0                ;                                  3=Special, 4=Accuracy, 5=Evasion
	add hl, bc              ; hl = w<Target>Mon<Stat>Mod
	ld b, [hl]              ; b = [w<Target>Mon<Stat>Mod], current stat modifier
	dec b                   ; decrease stat mod
	jr z, .nothingHappened  ; can't lower stat mod below 1 (-6)
	ld a, [de]
	cp ATTACK_DOWN2_EFFECT  ; is it a -2 effect?
	jr c, .doneDecreasing   ; if not, stop
	dec b                   ; else, -1 again
	jr nz, .doneDecreasing  ; if result is not 0, we're done
	inc b                   ; else keep b = 1 (stat mod -6)
.doneDecreasing
	ld [hl], b ; [w<Target>Mon<Stat>Mod] = updated stat mod
	ld a, c    ; a = stat offset
	cp $4
	jr nc, UpdateLoweredStatDone ; jump if stat affected is Accuracy/Evasion

	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonAttack + 1
	ld de, wEnemyMonUnmodifiedAttack
	jr z, .pointToStat ; jump if player's turn
	ld hl, wBattleMonAttack + 1
	ld de, wPlayerMonUnmodifiedAttack
.pointToStat
	push bc    ; save b = stat mod, c = stat offset
	sla c      ; multiply c by 2
	ld b, $0
	add hl, bc ; hl = w<Target>Mon<Stat> + 1
	ld a, c    ; the next lines effectively do 'add de, bc' (not an actual command)
	add e
	ld e, a
	adc d
	sub e
	ld d, a    ; de = w<Target>MonUnmodified<Stat>
	pop bc     ; restore b = stat mod, c = stat offset
	; check if stat is already 1
	ld a, [hld]              ; a = [w<Target>Mon<Stat> + 1]
	dec a                    ; a = 0 only if low byte is 1
	or [hl]                  ; are both bytes 0?
	jr z, .nothingHappened   ; if yes, can't decrease more
	inc hl                   ; hl = w<Target>Mon<Stat> + 1

	; recalculate affected stat taking into account badge boosts and status penalties
	call UpdateStat ; preserves c = stat offset, moves to hl = w<User>Mon<Stat>
	ldh a, [hWhoseTurn]
	and a           ; apply badge boost only if enemy lowered player's stats
	call nz, ApplyBadgeBoostToSelectedStat ; preserves c = stat offset and hl = w<User>Mon<Stat>
	ld a, c
	and a   ; stat offset = attack?
	call z, HalveAttackDueToBurn       ; preserves c = stat offset
	ld a, c
	cp 2    ; stat offset = speed?
	call z, QuarterSpeedDueToParalysis ; preserves c = stat offset
	; fallthrough

UpdateLoweredStatDone:
	inc c               ; c = stat offset + 1 for list search
	call BufferStatText ; uses c as counter
	pop af              ; restore c flag (set = side effect)
	jr c, .printMonStatsFellTest ; don't play move animation if only side effect
	call PlayCurrentMoveAnimation2
.printMonStatsFellTest
; marcelnote - fixed those glitches with calls after UpdateStat above
;	ldh a, [hWhoseTurn]
;	and a
;	call nz, ApplyBadgeStatBoosts ; whenever the player uses a stat-down move, badge boosts get reapplied again to every stat,
	                              ; even to those not affected by the stat-up move (will be boosted further)
; Always called regardless of the stat affected by the stat-down move.
;	call QuarterSpeedDueToParalysis
;	call HalveAttackDueToBurn

	ld hl, MonsStatsFellText
	jp PrintText



;RestoreOriginalStatModifier:
;	pop hl
;	dec [hl]

PrintNothingHappenedText:
	ld hl, NothingHappenedText
	jp PrintText

MonsStatsRoseText:
	text_far _MonsStatsRoseText
	text_asm
	ld hl, RoseText
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveEffect]
	jr z, .playerTurn
	ld a, [wEnemyMoveEffect]
.playerTurn
	cp ATTACK_UP2_EFFECT
	ret c
	ld hl, GreatlyRoseText
	ret

GreatlyRoseText:
	text_pause
	text_far _GreatlyRoseText
; fallthrough
RoseText:
	text_far _RoseText
	text_end

MonsStatsFellText:
	text_far _MonsStatsFellText
	text_asm
	ld hl, FellText
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveEffect]
	jr z, .playerTurn
	ld a, [wEnemyMoveEffect]
.playerTurn
; check if the move's effect decreases a stat by 2
	cp ATTACK_DOWN2_EFFECT
	ret c
	ld hl, GreatlyFellText
	ret

GreatlyFellText:
	text_pause
	text_far _GreatlyFellText
; fallthrough
FellText:
	text_far _FellText
	text_end


BufferStatText: ; uses c as counter
	ld hl, StatModTextStrings
	ld b, "@"
.findStatName
	dec c
	jr z, .foundStatName
.skipStatName
	ld a, [hli]
	cp b
	jr nz, .skipStatName ; if not "@" go to next character
	jr .findStatName
.foundStatName
	ld de, wStringBuffer
	ld bc, $a
	jp CopyData


INCLUDE "data/battle/stat_mod_names.asm"

INCLUDE "data/battle/stat_modifiers.asm"
