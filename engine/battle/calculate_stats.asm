CalculateModifiedStats: ; marcelnote - optimized
	ld c, NUM_STATS - 2        ; c = 3 = special
.loop
	call CalculateModifiedStat ; preserves c
	dec c
	jr nz, .loop
	; fallthrough              ; compute Attack (c = 0)

; calculate modified stat for stat c (0 = attack, 1 = defense, 2 = speed, 3 = special)
CalculateModifiedStat: ; marcelnote - optimized
	push bc ; save c = stat offset
	ld a, [wCalculateWhoseStats] ; player = 0, enemy = 1
	and a
	ld a, c ; a = stat offset
	ld hl, wBattleMonAttack + 1
	ld de, wPlayerMonUnmodifiedAttack
	ld bc, wPlayerMonStatMods
	jr z, .gotPointers
	ld hl, wEnemyMonAttack + 1
	ld de, wEnemyMonUnmodifiedAttack
	ld bc, wEnemyMonStatMods
.gotPointers
	add c
	ld c, a
	adc b
	sub c
	ld b, a       ; bc = wPlayerMon<Stat>Mod
	ld a, [bc]    ; a = current stat mod (1 to 13)

	pop bc        ; restore c = stat offset
	sla c         ; c = 2 * (stat offset)
	ld b, 0
	add hl, bc    ; hl = wBattleMon<Stat> + 1

	ld b, a       ; save b = stat mod

	ld a, c       ; a = 2 * (stat offset)
	add e
	ld e, a
	adc d
	sub e
	ld d, a       ; de = wPlayerMonUnmodified<Stat>

	srl c         ; c = stat offset
	; fallthrough

; inputs:
; hl = adress of the stat to update (low byte)
; de = adress of the unmodified stat (high byte)
; b = stat modifier (1 to 13)
; c = stat offset (0 to 3)
UpdateStat: ; marcelnote - new subfunction
	push hl       ; save hl = wBattleMon<Stat> + 1
	ld a, c       ; save a = stat offset
	ld hl, StatModifierRatios
	dec b         ; b in [0, 12] for the pointer table
	sla b         ; multiply it by 2 (table size = 2)
	ld c, b
	ld b, 0
	add hl, bc    ; hl points to the numerator

	ld c, a       ; c = stat offset until the end

	xor a
	ldh [hMultiplicand], a
	ld a, [de]    ; a = [w<User>MonUnmodified<Stat>]
	ldh [hMultiplicand + 1], a
	inc de
	ld a, [de]    ; a = [w<User>MonUnmodified<Stat> + 1]
	ldh [hMultiplicand + 2], a
	ld a, [hli]   ; a = numerator to multiply with
	ldh [hMultiplier], a
	call Multiply ; preserves all 16-bit registers
	ld a, [hl]    ; a = denominator to divide with
	ldh [hDivisor], a
	ld b, $4      ; number of bytes in the dividend
	call Divide   ; preserves all 16-bit registers
	pop hl        ; restore hl = wBattleMon<Stat> + 1

	ldh a, [hDividend + 3]
	ld [hld], a   ; store low byte
	sub LOW(MAX_STAT_VALUE)
	ldh a, [hDividend + 2]
	ld [hli], a   ; store high byte, hl -> low byte
	sbc HIGH(MAX_STAT_VALUE) ; is the result ≥ MAX_STAT_VALUE (999)?
	jr nc, .capAtMax         ; if yes, cap it at MAX_STAT_VALUE
; else check if result is 0
	ld a, [hld]  ; a = low byte, hl -> high byte
	or [hl]      ; are both bytes 0?
	ret nz       ; returns hl = wBattleMon<Stat>
; if 0, increase to 1
	inc a        ; a = 1
	inc hl       ; hl -> low byte
	ld [hld], a  ; hl -> high byte
	ret          ; returns hl = wBattleMon<Stat>

.capAtMax
	ld a, LOW(MAX_STAT_VALUE)
	ld [hld], a                   ; [wBattleMon<Stat> + 1] = LOW(MAX_STAT_VALUE)
	ld [hl], HIGH(MAX_STAT_VALUE) ; [wBattleMon<Stat>]     = HIGH(MAX_STAT_VALUE)
	ret                           ; returns hl = wBattleMon<Stat>


ApplyBadgeStatBoosts: ; marcelnote - optimized
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z ; return if link battle
	ld a, [wObtainedBadges]
	ld b, a
	ld hl, wBattleMonAttack
	ld c, $4
; the boost is applied for badges whose bit position is even
; the order of boosts matches the order they are laid out in RAM
; Boulder (bit 0) - attack
; Thunder (bit 2) - defense
; Soul (bit 4) - speed
; Volcano (bit 6) - special
.loop
	srl b
	call c, ApplyBoostToStat
	inc hl
	inc hl
	srl b
	dec c
	jr nz, .loop
	ret

; marcelnote - new function
; inputs: c = stat offset, hl = w<Subject>Mon<Stat> (both preserved)
ApplyBadgeBoostToSelectedStat:
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z ; return if link battle
	ld a, [wObtainedBadges]
	ld d, c ; d = stat offset
	inc d
.loop
	dec d
	jr z, .testBadge
	rrca
	rrca
	jr .loop
.testBadge
	rrca
	ret nc
	; fallthrough

; multiply stat at hl by 1.125 (cap at MAX_STAT_VALUE)
ApplyBoostToStat:
	ld a, [hli]
	ld d, a       ; d = high byte
	ld a, [hl]    ; a = low byte
	; divide 'da' by 8
	srl d
	rra
	srl d
	rra
	srl d
	rra
	; add 'da' (12.5% of stat) to stat
	add [hl]      ; hl -> low byte
	ld [hld], a
	ld a, [hl]    ; hl -> high byte
	adc d
	ld [hli], a
	; cap stat at MAX_STAT_VALUE
	ld a, [hld]
	sub LOW(MAX_STAT_VALUE)
	ld a, [hl]
	sbc HIGH(MAX_STAT_VALUE)
	ret c  ; hl -> high byte
	ld a, HIGH(MAX_STAT_VALUE)
	ld [hli], a
	ld a, LOW(MAX_STAT_VALUE)
	ld [hld], a
	ret    ; hl -> high byte


ApplyBurnAndParalysisPenaltiesToPlayer:
	ld a, $1
	jr ApplyBurnAndParalysisPenalties

ApplyBurnAndParalysisPenaltiesToEnemy:
	xor a

ApplyBurnAndParalysisPenalties:
	ldh [hWhoseTurn], a
	call QuarterSpeedDueToParalysis
	jp HalveAttackDueToBurn


QuarterOwnSpeedDueToParalysis: ; marcelnote - new
	ldh a, [hWhoseTurn]
	dec a ; z flag set on Enemy turn (a = 1)
	jr QuarterSpeedDueToParalysis.gotTurn

QuarterSpeedDueToParalysis: ; marcelnote - optimized
	ldh a, [hWhoseTurn]
	and a
.gotTurn
	ld a, [wEnemyMonStatus]
	ld hl, wEnemyMonSpeed + 1
	jr z, .gotPointers
	ld a, [wBattleMonStatus]
	ld hl, wBattleMonSpeed + 1
.gotPointers
	and 1 << PAR
	ret z ; return if target not paralysed
	ld a, [hld]
	ld b, a     ; b = [w<>MonSpeed + 1]  (low byte)
	ld a, [hl]  ; a = [w<>MonSpeed]      (high byte)
	srl a
	rr b
	srl a
	rr b
	ld [hli], a ; [w<>MonSpeed] (high byte)
	or b
	jr nz, .storeSpeed
	inc b       ; give at least one speed point
.storeSpeed
	ld [hl], b  ; [w<>MonSpeed + 1] (low byte)
	ret


HalveOwnAttackDueToBurn: ; marcelnote - new
	ldh a, [hWhoseTurn]
	dec a ; z flag set on Enemy turn (a = 1)
	jr HalveAttackDueToBurn.gotTurn

HalveAttackDueToBurn: ; marcelnote - optimized
	ldh a, [hWhoseTurn]
	and a
.gotTurn
	ld a, [wEnemyMonStatus]
	ld hl, wEnemyMonAttack + 1
	jr z, .gotPointers
	ld a, [wBattleMonStatus]
	ld hl, wBattleMonAttack + 1
.gotPointers
	and 1 << BRN
	ret z ; return if target not burnt
	ld a, [hld]
	ld b, a     ; b = [w<>MonAttack + 1]  (low byte)
	ld a, [hl]  ; a = [w<>MonAttack]      (high byte)
	; here could even jump into QuarterSpeedDueToParalysis routine
	srl a
	rr b
	ld [hli], a ; [w<>MonAttack] (high byte)
	or b
	jr nz, .storeAttack
	inc b ; give at least one attack point
.storeAttack
	ld [hl], b  ; [w<>MonAttack + 1] (low byte)
	ret


; does nothing since no stats are ever selected (barring glitches)
;DoubleOrHalveSelectedStats:
;	callfar DoubleSelectedStats
;	jpfar HalveSelectedStats
