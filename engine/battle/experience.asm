GainExperience:
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z ; return if link battle
	ld a, [wTrainerClass]
	cp RED
	ret nc ; marcelnote - no exp if Battle Hall battle
	call DivideExpDataByNumMonsGainingExp
	ld hl, wPartyMon1
	xor a
	ld [wWhichPokemon], a

.partyMonLoop      ; loop over each mon and add gained exp
	inc hl
	ld a, [hli]    ; hl = wPartyMon<n>HP
	or [hl]        ; is mon's HP 0?
	jp z, .nextMon ; if so, go to next mon
	push hl        ; save hl = wPartyMon<n>HP + 1
	ld hl, wPartyGainExpFlags
	ld a, [wWhichPokemon]
	ld c, a
	ld b, FLAG_TEST
	predef FlagActionPredef ; perform action b on bit c at hl ('bit c, [hl]')
	ld a, c        ; c = result
	and a          ; is mon's gain exp flag set?
	pop hl         ; restore hl = wPartyMon<n>HP + 1
	jp z, .nextMon ; if mon's gain exp flag not set, go to next mon

	ld de, wPartyMon1HPExp - wPartyMon1HP
	add hl, de     ; hl = wPartyMon<n>HPExp + 1
	ld d, h
	ld e, l        ; de = wPartyMon<n>HPExp + 1
	ld hl, wEnemyMonBaseStats
	ld c, NUM_STATS
.gainStatExpLoop
	ld a, [hli]    ; a = [wEnemyMonBaseStats + (NUM_STATS - c)]
	ld b, a        ; enemy mon base stat
	ld a, [de]     ; a = stat exp (low byte)
	add b          ; add enemy mon base stat to stat exp
	ld [de], a
	jr nc, .nextBaseStat
	dec de         ; add carry to stat exp high byte
	ld a, [de]
	inc a          ; a = $ff already?
	jr z, .maxStatExp ; if yes, set low byte to $ff as well
	ld [de], a
	inc de
	jr .nextBaseStat
.maxStatExp ; if the upper byte also overflowed, then we have hit the max stat exp
	dec a      ; a = $ff since a = 0 before jumping
	inc de     ; high byte is already $ff
	ld [de], a ; so just need to max low byte
.nextBaseStat
	dec c
	jr z, .statExpDone
	inc de
	inc de     ; move to next stat exp (low byte)
	jr .gainStatExpLoop

.statExpDone   ; de = wPartyMon<n>SpecialExp + 1
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, [wEnemyMonBaseExp]
	ldh [hMultiplicand + 2], a
	ld a, [wEnemyMonLevel]
	ldh [hMultiplier], a
	call Multiply                ; (base exp) * level
	ld a, 7
	ldh [hDivisor], a
	call Divide                  ; (base exp) * level / 7
	ld hl, wPartyMon1OTID - (wPartyMon1SpecialExp + 1)
	add hl, de
	ld a, [hli]
	ld b, a     ; b = [wPartyMon<n>OTID]
	ld a, [wPlayerID]
	cp b
	jr nz, .tradedMon
	ld b, [hl]  ; b = [wPartyMon<n>OTID + 1]
	ld a, [wPlayerID + 1]
	sub b
	jr z, .skipBoost ; a = 0 if jump
.tradedMon
	call BoostExp ; traded mon exp boost
	ld a, 1
.skipBoost
	ld [wGainBoostedExp], a
	ld a, [wIsInBattle]
	dec a             ; is it a wild battle?
	call nz, BoostExp ; if not (trainer battle), boost exp
	inc hl
	inc hl
	inc hl            ; hl = wPartyMon<n>Exp + 2 (low byte)
; add the gained exp to the party mon's exp
	ld b, [hl]
	ldh a, [hQuotient + 3]
	ld [wExpAmountGained + 1], a
	add b
	ld [hld], a
	ld b, [hl]
	ldh a, [hQuotient + 2]
	ld [wExpAmountGained], a
	adc b
	ld [hl], a
	jr nc, .noCarry
	dec hl
	inc [hl]
	inc hl
.noCarry
; calculate exp for the mon at max level, and cap the exp at that value
	inc hl
	push hl           ; save hl = wPartyMon<n>Exp + 2
	ld a, [wWhichPokemon]
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wCurSpecies], a
	call GetMonHeader
	ld d, MAX_LEVEL
	callfar CalcExperience ; get max exp
; compare max exp with current exp
	ldh a, [hExperience]
	ld b, a
	ldh a, [hExperience + 1]
	ld c, a
	ldh a, [hExperience + 2]
	ld d, a           ; bcd = max exp
	pop hl            ; restore hl = wPartyMon<n>Exp + 2
	ld a, [hld]
	sub d
	ld a, [hld]
	sbc c
	ld a, [hl]
	sbc b
	jr c, .next2      ; is current exp < max exp?
; the mon's exp is greater than the max exp, so overwrite it with the max exp
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hld], a
	dec hl
.next2
	push hl            ; save hl = wPartyMon<n>Exp
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, GainedText
	call PrintText
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	callfar AnimateEXPBar	; joenote - ADDED: animate the exp bar
	call LoadMonData
	pop hl             ; restore hl = wPartyMon<n>Exp
	ld bc, wPartyMon1Level - wPartyMon1Exp
	add hl, bc
	push hl            ; save hl = wPartyMon<n>Level
	callfar CalcLevelFromExperience ; outputs level d
	pop hl             ; restore hl = wPartyMon<n>Level
	ld a, [hl]         ; a = current level
	cp d
	jp z, .nextMon ; if level didn't change, go to next mon
;;;;;;;;;;;;;;;; joenote - ADDED: animate the exp bar
	push hl
	callfar KeepEXPBarFull
	pop hl
;;;;;;;;;;;;;;;;
	ld a, [wCurEnemyLevel]
	push af
	ld a, d            ; a = new level
	ld [wCurEnemyLevel], a
	ld [hl], a
	ld bc, wPartyMon1Species - wPartyMon1Level
	add hl, bc         ; hl = wPartyMon<n>Species
	ld a, [hl]
	ld [wCurSpecies], a
	ld [wPokedexNum], a
	call GetMonHeader ; preserves hl
	ld bc, (wPartyMon1MaxHP + 1) - wPartyMon1Species
	add hl, bc
	push hl            ; save hl = wPartyMon<n>MaxHP + 1
	ld a, [hld]
	ld c, a
	ld b, [hl]
	push bc            ; save bc = max HP (from before levelling up)
	ld d, h
	ld e, l            ; de = wPartyMon<n>MaxHP
	ld bc, (wPartyMon1HPExp - 1) - wPartyMon1MaxHP
	add hl, bc         ; hl = wPartyMon<n>HPExp - 1
	ld b, $1           ; consider stat exp when calculating stats
	call CalcStats     ; preserves hl
	pop bc             ; restore bc = max HP (from before levelling up)
	pop hl             ; restore hl = wPartyMon<n>MaxHP + 1
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a            ; bc = difference between old max HP and new max HP
	ld de, (wPartyMon1HP + 1) - wPartyMon1MaxHP
	add hl, de         ; hl = wPartyMon<n>HP + 1
; add to the current HP the amount of max HP gained when levelling
	ld a, [hl]         ; a = [wPartyMon<n>HP + 1]
	add c
	ld [hld], a
	ld a, [hl]         ; a = [wPartyMon<n>HP]
	adc b
	ld [hl], a
	ld a, [wPlayerMonNumber]
	ld b, a
	ld a, [wWhichPokemon]
	cp b ; is the current mon in battle?
	jr nz, .printGrewLevelText
; current mon is in battle
	ld de, wBattleMonHP
; copy party mon HP to battle mon HP
	ld a, [hli]        ; a = [wPartyMon<n>HP]
	ld [de], a
	inc de
	ld a, [hl]         ; a = [wPartyMon<n>HP + 1]
	ld [de], a
; copy other stats from party mon to battle mon
	ld bc, wPartyMon1Level - (wPartyMon1HP + 1)
	add hl, bc
	push hl            ; save hl = wPartyMon<n>Level
	ld de, wBattleMonLevel
	ld bc, 1 + NUM_STATS * 2 ; size of stats
	call CopyData
	pop hl             ; restore hl = wPartyMon<n>Level
	ld a, [wPlayerBattleStatus3]
	bit TRANSFORMED, a
	jr nz, .recalcStatChanges
; the mon is not transformed, so update the unmodified stats
	ld de, wPlayerMonUnmodifiedLevel
	ld bc, 1 + NUM_STATS * 2
	call CopyData
.recalcStatChanges
	xor a ; battle mon
	ld [wCalculateWhoseStats], a
	callfar CalculateModifiedStats
	callfar ApplyBurnAndParalysisPenaltiesToPlayer
	callfar ApplyBadgeStatBoosts
	callfar DrawPlayerHUDAndHPBar
	callfar PrintEmptyString
	call SaveScreenTilesToBuffer1
.printGrewLevelText
	ld hl, GrewLevelText
	call PrintText
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	callfar AnimateEXPBarAgain	; joenote - ADDED: animate the exp bar
	call LoadMonData
	ld d, $1
	callfar PrintStatsBox
	call WaitForTextScrollButtonPress
	call LoadScreenTilesFromBuffer1
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	ld a, [wCurSpecies]
	ld [wPokedexNum], a
	predef LearnMoveFromLevelUp
	ld hl, wCanEvolveFlags
	ld a, [wWhichPokemon]
	ld c, a
	ld b, FLAG_SET
	predef FlagActionPredef
	pop af
	ld [wCurEnemyLevel], a

.nextMon
	ld a, [wPartyCount]
	ld b, a
	ld a, [wWhichPokemon]
	inc a
	cp b
	jr z, .done
	ld [wWhichPokemon], a
	ld bc, wPartyMon2 - wPartyMon1
	ld hl, wPartyMon1
	call AddNTimes
	jp .partyMonLoop
.done
	ld hl, wPartyGainExpFlags
	ld [hl], 0 ; clear gain exp flags
	ld a, [wPlayerMonNumber]
	ld c, a
	ld b, FLAG_SET
	push bc
	predef FlagActionPredef ; set the gain exp flag for the mon that is currently out
	ld hl, wPartyFoughtCurrentEnemyFlags
	ld [hl], 0
	pop bc
	predef_jump FlagActionPredef ; set the fought current enemy flag for the mon that is currently out

; divide enemy base stats, catch rate, and base exp by the number of mons gaining exp
DivideExpDataByNumMonsGainingExp:
	ld a, [wPartyGainExpFlags]
	ld b, a    ; b = [wPartyGainExpFlags]
	xor a      ; a = 0
	ld c, $8   ; c = 8
	ld d, a    ; d = 0 for adc 0
.countSetBitsLoop ; loop to count set bits in wPartyGainExpFlags
	srl b
	adc d      ; adc 0 but faster/lighter with register
	dec c
	jr nz, .countSetBitsLoop
	cp $2
	ret c   ; return if only one mon is gaining exp
	ld c, a ; c = number of mons gaining exp
	ld hl, wEnemyMonBaseStats
	ld b, wEnemyMonBaseExp - wEnemyMonBaseStats + 1
	xor a
	ldh [hDividend], a
	ldh [hDividend + 1], a
	ldh [hDividend + 2], a
.divideLoop
	ld a, [hl]
	ldh [hDividend + 3], a ; [hDividend = 3] = number of mons gaining exp
	ld a, c
	ldh [hDivisor], a ; [hDivisor] = number of mons gaining exp
	call Divide
	ldh a, [hQuotient + 3]
	ld [hli], a
	dec b
	jr nz, .divideLoop
	ret

; multiplies exp by 1.5
BoostExp:
	ldh a, [hQuotient + 2]
	ld b, a
	ldh a, [hQuotient + 3]
	ld c, a
	srl b
	rr c
	add c
	ldh [hQuotient + 3], a
	ldh a, [hQuotient + 2]
	adc b
	ldh [hQuotient + 2], a
	ret

GainedText:
	text_far _GainedText
	text_asm
	;ld a, [wBoostExpByExpAll] ; marcelnote - shortened ExpAll messages
	;ld hl, WithExpAllText
	;and a
	;ret nz
	ld hl, ExpPointsText
	ld a, [wGainBoostedExp]
	and a
	ret z
	ld hl, BoostedText
	ret

;WithExpAllText: ; marcelnote - shortened ExpAll messages
;	text_far _WithExpAllText
;	text_asm
;	ld hl, ExpPointsText
;	ret

BoostedText:
	text_far _BoostedText

ExpPointsText:
	text_far _ExpPointsText
	text_end

GrewLevelText:
	text_far _GrewLevelText
	sound_level_up
	text_end
