; Copies [hl, bc) to [de, de + bc - hl).
; In other words, the source data is from hl up to but not including bc,
; and the destination is de.
CopyDataUntil::
	ld a, [hli]
	ld [de], a
	inc de
	ld a, h
	cp b
	jr nz, CopyDataUntil
	ld a, l
	cp c
	jr nz, CopyDataUntil
	ret

; Function to remove a pokemon from the party or the current box.
; wWhichPokemon determines the pokemon.
; [wRemoveMonFromBox] == 0 specifies the party.
; [wRemoveMonFromBox] != 0 specifies the current box.
RemovePokemon::
	jpfar _RemovePokemon

AddPartyMon::
	push hl
	push de
	push bc
	farcall _AddPartyMon
	pop bc
	pop de
	pop hl
	ret

; calculates all 5 stats of current mon and writes them to [de]
CalcStats::
	ld c, $0
.statsLoop
	inc c
	call CalcStat
	ldh a, [hQuotient + 2]
	ld [de], a
	inc de
	ldh a, [hQuotient + 3]
	ld [de], a
	inc de
	ld a, c
	cp NUM_STATS
	jr nz, .statsLoop
	ret

; calculates stat c of current mon
; c: stat to calc (HP=1,Atk=2,Def=3,Spd=4,Spc=5)
; b: consider stat exp?
; hl: base ptr to stat exp values ([hl + 2*c - 1] and [hl + 2*c])
CalcStat::
	push hl
	push de
	push bc

; get stat exp bonus
	push hl             ; save hl = base pointer to stat exp values
	ld a, b             ; a = consider stat exp?
	and a
	jr z, .statExpDone  ; consider stat exp? if not, b = 0
	dec b               ; b = 0 for add hl, bc and sqrtLoop
	sla c
	add hl, bc          ; move hl to corresponding stat exp value
	srl c
	ld a, [hld]
	ld h, [hl]
	ld l, a             ; hl = S = stat exp
; calculate stat exp bonus = ceil(Sqrt(stat exp)) in b
	ld de, 1            ; to start at de = -1
.sqrtLoop ; use the formula n^2 = 1 + 3 + 5 + ... + (2n-1)
	inc b
	dec e               ; dec de, but de is odd
	dec de              ; de = -1, -3, -5...
	add hl, de
	jr nc, .statExpDone ; carry means S - 1 - 3 - ... - (2b-1) ≥ 0
	ld a, h             ; hl = 0? if yes S = b^2 is a perfect square
	or l
	jr nz, .sqrtLoop
.statExpDone            ; b = ceil(Sqrt(stat exp))
	pop hl              ; restore hl = base pointer to stat exp values

; get base stat
	push hl
	ld hl, wMonHeader
	ld d, $0
	ld e, c
	add hl, de          ; hl = wMonHBase<Stat>
	ld a, [hl]          ; a = base value of stat
	pop hl

; get stat IV
	ld de, wPartyMon1DVs - (wPartyMon1HPExp - 1) ; also wEnemyMonDVs - wEnemyMonHP
	add hl, de
	ld e, a             ; e = base value of stat
	ld a, c
	cp $2
	jr z, .getAttackIV
	cp $3
	jr z, .getDefenseIV
	cp $4
	jr z, .getSpeedIV
	cp $5
	jr z, .getSpecialIV
.getHpIV ; c = $1
	ld a, [hl]  ; Atk IV
	swap a
	and $1
	ld d, a     ; d = LSB of Atk IV

	ld a, [hli] ; Def IV
	rra
	rl d        ; rotate LSB of Def IV into d

	ld a, [hl]  ; Spd IV
	swap a
	rra
	rl d        ; rotate LSB of Spd IV into d

	ld a, [hl]  ; Spc IV
	rra
	rl d        ; rotate LSB of Spc IV into d

	ld a, d     ; HP IV: Least Significant Bit of the other 4 IVs (Atk|Def|Spd|Spc)
	jr .calcStatFromIV
.getAttackIV
	ld a, [hl]  ; Atk IV (high nibble)
	swap a
	and $f
	jr .calcStatFromIV
.getDefenseIV
	ld a, [hl]  ; Def IV (low nibble)
	and $f
	jr .calcStatFromIV
.getSpeedIV
	inc hl
	ld a, [hl]  ; Spd IV (high nibble)
	swap a
	and $f
	jr .calcStatFromIV
.getSpecialIV
	inc hl
	ld a, [hl]  ; Spc IV (low nibble)
	and $f
.calcStatFromIV
	ld d, $0
	add e                     ; a = stat IV + base stat (missing carry)
	jr nc, .addedBaseStat
	inc d                     ; da = stat IV + base stat
.addedBaseStat
	sla a
	rl d                      ; da = 2 * (Base + IV)
	srl b
	srl b                     ; b = ceil(Sqrt(stat exp)) / 4
	add b
	jr nc, .addedStatExp
	inc d                     ; da = 2 * (Base + IV) + ceil(Sqrt(stat exp)) / 4
.addedStatExp
	ldh [hMultiplicand + 2], a
	ld a, d
	ldh [hMultiplicand + 1], a
	xor a
	ldh [hMultiplicand], a
	ld a, [wCurEnemyLevel]
	ldh [hMultiplier], a
	call Multiply             ; [2 * (Base + IV) + ceil(Sqrt(stat exp)) / 4] * Level
	ld a, 100
	ldh [hDivisor], a
	call Divide               ; [2 * (Base + IV) + ceil(Sqrt(stat exp)) / 4] * Level / 100
	dec c                     ; is c = 1? (are we calculating HP stat?)
	ld a, 5 ; + 5 for non-HP stat
	jr nz, .notHPStat
	ld a, [wCurEnemyLevel]
	add 10  ; + Level + 10 for HP stat
.notHPStat
	ld b, a
	ldh a, [hQuotient + 3]
	add b
	ldh [hQuotient + 3], a
	jr nc, .addedExtraPoints
	ldh a, [hQuotient + 2]
	inc a                     ; non-HP: [2 * (Base + IV) + ceil(Sqrt(stat exp)) / 4] * Level / 100 + 5
	ldh [hQuotient + 2], a    ; HP: [2 * (Base + IV) + ceil(Sqrt(stat exp)) / 4] * Level / 100 + Level + 10
.addedExtraPoints
	ldh a, [hQuotient + 3]    ; check for overflow (> MAX_STAT_VALUE = 999)
	sub LOW(MAX_STAT_VALUE) + 1
	ldh a, [hQuotient + 2]
	sbc HIGH(MAX_STAT_VALUE)
	jr c, .noOverflow
	ld a, HIGH(MAX_STAT_VALUE) ; overflow: cap at 999
	ldh [hQuotient + 2], a
	ld a, LOW(MAX_STAT_VALUE)
	ldh [hQuotient + 3], a
.noOverflow
	pop bc
	pop de
	pop hl
	ret

AddEnemyMonToPlayerParty::
	homecall_sf _AddEnemyMonToPlayerParty
	ret

MoveMon::
	homecall_sf _MoveMon
	ret
