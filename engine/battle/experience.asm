GainExperience: ; marcelnote - refactored
; without ExpAll, exp is split across battle participants as in vanilla
; with ExpAll, exp is split into equal shares so that battle participants get two shares and nonparticipants one
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z ; return if link battle
	ld a, [wTrainerClass]
	cp RED
	ret nc ; marcelnote - no exp if Battle Hall battle

	ld hl, wStatusFlags1         ; if ExpAll is activated, print a single message
	bit BIT_EXP_ALL_ACTIVE, [hl] ; saying how much total Exp there is to share
	jr z, .skipGetTotalExp
	call GetTotalExpToShare
	ld hl, ExpAllSharedText
	call PrintText
.skipGetTotalExp

	call DivideExpDataInShares
	ld hl, wPartyMon1HP
	xor a
	ld [wWhichPokemon], a

.partyMonLoop      ; loop over each mon and add gained exp
	ld a, [hli]    ; a = [wPartyMon<n>HP]
	or [hl]        ; OR [wPartyMon<n>HP + 1], is mon's HP 0?
	jp z, .nextMon ; if so, go to next mon
	push hl        ; save hl = wPartyMon<n>HP + 1

	ld hl, wPartyGainExpFlags
	ld a, [wWhichPokemon]
	ld c, a
	ld b, FLAG_TEST
	predef FlagActionPredef ; perform action b on bit c at hl ('bit c, [hl]')
	ld a, c        ; c = result
	and a          ; is mon's gain exp flag set?
	jr z, .checkForExpAll ; if not, get zero share of exp
	ld a, 1        ; if yes, get one share of exp

.checkForExpAll
	ld hl, wStatusFlags1
	bit BIT_EXP_ALL_ACTIVE, [hl] ; is ExpAll activated?
	jr z, .noExpAll
	inc a          ; if yes, any nonfainted Mon gets one more share of Exp
.noExpAll
	and a          ; does mon have at least one share of Exp?
	pop hl         ; restore hl = wPartyMon<n>HP + 1
	jp z, .nextMon ; if no share of Exp, go to next mon
	ld [wNumSharesExp], a

	ld de, (MON_HP_EXP + 1) - (MON_HP + 1)
	add hl, de     ; hl = wPartyMon<n>HPExp + 1
	ld de, wEnemyMonBaseStats
	ld b, NUM_STATS
.gainStatExpOuterLoop
	ld a, [wNumSharesExp] ; a = 1 or 2
	ld c, a
.gainStatExpInnerLoop
	ld a, [de]     ; a = [wEnemyMonBaseStats + (NUM_STATS - b)]
	add [hl]       ; add enemy mon base stat to stat exp (low byte)
	ld [hl], a
	jr nc, .nextBaseStat
	dec hl         ; hl = stat exp (high byte)
	inc [hl]       ; increment high byte
	inc hl         ; return to low byte, does not affect flags
	jr nz, .nextBaseStat ; if high byte was < $ff, move to next stat
	ld a, $ff      ; else, clamp both to $ff
	ld [hld], a    ; low byte
	ld [hli], a    ; high byte
.nextBaseStat
	dec c
	jr nz, .gainStatExpInnerLoop
	dec b
	jr z, .statExpDone
	inc de     ; move to next enemy mon base stat
	inc hl
	inc hl     ; move to next stat exp (low byte)
	jr .gainStatExpOuterLoop

.statExpDone   ; hl = wPartyMon<n>SpecialExp + 1
	ld a, [wNumSharesExp]
	ld c, a
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, [wEnemyMonBaseExp]
	ldh [hMultiplicand + 2], a

	dec c      ; two shares of Exp?
	jr z, .gotMultiplicand
	sla a      ; if yes, multiply base exp by 2
	ldh [hMultiplicand + 2], a
	jr nc, .gotMultiplicand
	ld a, c    ; c = 1 here
	ldh [hMultiplicand + 1], a ; add carry to second byte
.gotMultiplicand

	ld a, [wEnemyMonLevel]
	ldh [hMultiplier], a
	call Multiply                ; (base exp) * level

	ld a, 7
	ldh [hDivisor], a
	call Divide                  ; (base exp) * level / 7

;	ld a, wStatusFlags1          ; boost exp if upgraded exp all active or traded mon
;	bit BIT_EXP_ALL_ACTIVE, a
;	jr z, .checkTradedMon
;	CheckEvent EVENT_BOOSTED_EXP_ALL
;	jr nz, .applyBoost
;.checkTradedMon
	ld de, wPartyMon1OTID - (wPartyMon1SpecialExp + 1)
	add hl, de  ; hl = wPartyMon<n>OTID
	ld a, [wPlayerID]
	cp [hl]
	inc hl      ; hl = wPartyMon<n>OTID + 1
	jr nz, .applyBoost
	ld a, [wPlayerID + 1]
	sub [hl]
	jr z, .skipBoost ; a = 0 if jump
.applyBoost
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
	ldh a, [hQuotient + 3]
	ld [wExpAmountGained + 1], a
	add [hl]
	ld [hld], a       ; hl = wPartyMon<n>Exp + 1 (middle byte)
	ldh a, [hQuotient + 2]
	ld [wExpAmountGained], a
	adc [hl]
	ld [hl], a
	jr nc, .noCarry
	dec hl
	inc [hl]
	inc hl
.noCarry
; calculate exp for the mon at max level, and cap the exp at that value
	inc hl            ; hl = wPartyMon<n>Exp + 2 (low byte)
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
	jr c, .noClamp    ; is current exp < max exp?
; the mon's exp is greater than the max exp, so overwrite it with the max exp
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hld], a
	dec hl
.noClamp
	push hl            ; save hl = wPartyMon<n>Exp
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld a, [wStatusFlags1]
	bit BIT_EXP_ALL_ACTIVE, a
	jr nz, .skipIndividualText ; skip individual Exp gain messages if ExpAll is on
	ld hl, GainedText
	call PrintText
.skipIndividualText
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	callfar AnimateEXPBar	; joenote - ADDED: animate the exp bar
	call LoadMonData
	pop hl             ; restore hl = wPartyMon<n>Exp
	ld bc, MON_LEVEL - MON_EXP
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
	ld bc, MON_SPECIES - MON_LEVEL
	add hl, bc         ; hl = wPartyMon<n>Species
	ld a, [hl]
	ld [wCurSpecies], a
	ld [wPokedexNum], a
	call GetMonHeader ; preserves hl
	ld bc, (MON_MAXHP + 1) - MON_SPECIES
	add hl, bc
	push hl            ; save hl = wPartyMon<n>MaxHP + 1
	ld a, [hld]
	ld c, a
	ld b, [hl]
	push bc            ; save bc = max HP (from before levelling up)
	ld d, h
	ld e, l            ; de = wPartyMon<n>MaxHP
	ld bc, (MON_HP_EXP - 1) - MON_MAXHP
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
	ld de, (MON_HP + 1) - MON_MAXHP
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
	ld bc, MON_LEVEL - (MON_HP + 1)
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
	ld d, LEVEL_UP_STATS_BOX
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
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1HP
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

; marcelnote - when ExpAll is activated, display message with total Exp to be split
GetTotalExpToShare:
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
;	ld a, [wStatusFlags1]
;	bit BIT_EXP_ALL_ACTIVE, a ; is ExpAll activated?
;	jr nz, .skipExpAllBoost
;	CheckEvent EVENT_BOOSTED_EXP_ALL
;	call nz, BoostExp
;.skipExpAllBoost
	ld hl, wExpAmountGained
	ldh a, [hQuotient + 2]
	ld [hli], a
	ldh a, [hQuotient + 3]
	ld [hl], a
	ret

; divide enemy base stats, catch rate, and base exp by the number of exp shares
; Number of shares = (Number of Mons who fought) + (ExpAll is on) x (Number of nonfainted Mons in party)
DivideExpDataInShares:
	ld a, [wPartyGainExpFlags]
	ld c, a    ; c = [wPartyGainExpFlags]
	xor a      ; a = 0
	ld b, 8    ; b = 8 bits to check
	ld d, a    ; d = 0 for adc 0
.countBattleParticipantsLoop ; loop to count set bits in wPartyGainExpFlags
	srl c
	adc d      ; adc 0 but faster/lighter with register
	dec b
	jr nz, .countBattleParticipantsLoop
	ld c, a    ; c = running total
	ld a, [wStatusFlags1]
	bit BIT_EXP_ALL_ACTIVE, a ; is ExpAll activated?
	jr z, .divide             ; if not, proceed with division
	; if yes, count non-fainted party mons and add them to c
	ld a, [wPartyCount]
	ld b, a
	ld hl, wPartyMon1HP
	ld e, PARTYMON_STRUCT_LENGTH - 1 ; d = 0 already, so de = PARTYMON_STRUCT_LENGTH - 1
.countNonFaintedLoop
	ld a, [hli]    ; a = [wPartyMon<n>HP] (high HP byte)
	or [hl]        ; OR [wPartyMon<n>HP + 1] (low HP byte)
	jr z, .nextMon ; skip if fainted
	inc c
.nextMon
	add hl, de     ; hl = wPartyMon<n+1>HP
	dec b
	jr nz, .countNonFaintedLoop
.divide
	dec c
	ret z   ; return if only one share
	inc c
	ld hl, wEnemyMonBaseStats
	ld b, wEnemyMonBaseExp - wEnemyMonBaseStats + 1
	xor a
	ldh [hDividend], a
	ldh [hDividend + 1], a
	ldh [hDividend + 2], a
.divideLoop
	ld a, [hl]
	ldh [hDividend + 3], a ; [hDividend + 3] = stat to be divided
	ld a, c
	ldh [hDivisor], a      ; [hDivisor] = number of exp shares
	call Divide
	ldh a, [hQuotient + 3]
	ld [hli], a            ; [hl] <- [hl] / c
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

GainedText: ; marcelnote - removed ExpAll messages
	text_far _GainedText
	text_asm
	ld hl, ExpPointsText
	ld a, [wGainBoostedExp]
	and a
	ret z
	ld hl, BoostedText
	ret

ExpAllSharedText: ; marcelnote - shortened ExpAll messages
	text_far _ExpAllSharedText
	text_asm
	ld hl, ExpPointsText
;	CheckEvent EVENT_BOOSTED_EXP_ALL
;	ret z
;	ld hl, BoostedText
	ret

;WithExpAllText: ; marcelnote - shortened ExpAll messages
;	text_far _WithExpAllText
;	text_asm
;	ld hl, ExpPointsText
;	ret

BoostedText:
	text_far _BoostedText
	; fallthrough

ExpPointsText:
	text_far _ExpPointsText
	text_end

GrewLevelText:
	text_far _GrewLevelText
	sound_level_up
	text_end
