; marcelnote - new trainer AI, partly based on trainer AI from shinpokered

; Trainer move-choice AI
; ----------------------
; The AI selects an enemy move by scoring each move slot in `wBuffer`
; (one byte per move; LOWER scores are preferred). For each trainer class,
; `TrainerClassMoveChoiceModifications` lists which scoring layers to apply.
;
; Layers, in increasing skill:
;   1. Novice       -- avoid moves that obviously do nothing (no-ops, redundant
;                      buffs, status against statused targets, etc.)
;   2. PreferSetup  -- on the turn the mon is sent out, slightly prefer
;                      non-damaging setup moves (was vanilla "Modification 2")
;   3. Adept        -- type effectiveness, resource management
;                      (HP-aware healing/exploding, stat caps, etc.)
;   4. Expert       -- prediction, speed-tier reasoning, anti-spam,
;                      anti-omniscience (Counter/Rage prediction, OHKO
;                      timing, etc.)
;
; Scoring helpers used throughout:
;   inc [hl]              ; slight discourage
;   dec [hl]              ; slight encourage
;   add 5 / ld [hl], a    ; heavy discourage (jp .heavyDiscourage)

; creates a set of moves that may be used and returns its address in hl
; unused slots are filled with 0, all used slots may be chosen with equal probability
AIEnemyTrainerChooseMoves:
	ld a, $a
	ld hl, wBuffer ; init temporary move selection array. Only the moves with the lowest numbers are chosen in the end
	ld [hli], a   ; move 1
	ld [hli], a   ; move 2
	ld [hli], a   ; move 3
	ld [hl], a    ; move 4
	ld a, [wEnemyDisabledMove] ; forbid disabled move (if any)
	swap a
	and $f
	jr z, .noMoveDisabled
	ld hl, wBuffer
	dec a
	ld c, a
	ld b, $0
	add hl, bc    ; advance pointer to forbidden move
	ld [hl], $50  ; forbid (highly discourage) disabled move
.noMoveDisabled
	ld hl, TrainerClassMoveChoiceModifications
	ld a, [wTrainerClass]
	ld b, a
.loopTrainerClasses
	dec b
	jr z, .readTrainerClassData
.loopTrainerClassData
	ld a, [hli]
	and a
	jr nz, .loopTrainerClassData
	jr .loopTrainerClasses
.readTrainerClassData
	ld a, [hl]
	and a
	jr z, .useOriginalMoveSet
	push hl
.nextMoveChoiceModification
	pop hl
	ld a, [hli]
	and a
	jr z, .loopFindMinimumEntries
	push hl
	ld hl, AIMoveChoiceModificationFunctionPointers
	dec a
	add a
	ld c, a
	ld b, 0
	add hl, bc    ; skip to pointer
	ld a, [hli]   ; read pointer into hl
	ld h, [hl]
	ld l, a
	ld de, .nextMoveChoiceModification  ; set return address
	push de
	jp hl         ; execute modification function
.loopFindMinimumEntries ; all entries will be decremented sequentially until one of them is zero
	ld hl, wBuffer  ; temp move selection array
	ld de, wEnemyMonMoves  ; enemy moves
	ld c, NUM_MOVES
.loopDecrementEntries
	ld a, [de]
	inc de
	and a
	jr z, .loopFindMinimumEntries
	dec [hl]
	jr z, .minimumEntriesFound
	inc hl
	dec c
	jr z, .loopFindMinimumEntries
	jr .loopDecrementEntries
.minimumEntriesFound
	ld a, c
.loopUndoPartialIteration ; undo last (partial) loop iteration
	inc [hl]
	dec hl
	inc a
	cp NUM_MOVES + 1
	jr nz, .loopUndoPartialIteration
	ld hl, wBuffer  ; temp move selection array
	ld de, wEnemyMonMoves  ; enemy moves
	ld c, NUM_MOVES
.filterMinimalEntries ; all minimal entries now have value 1. All other slots will be disabled (move set to 0)
	ld a, [de]
	and a
	jr nz, .moveExisting
	ld [hl], a
.moveExisting
	ld a, [hl]
	dec a
	jr z, .slotWithMinimalValue
	xor a
	ld [hli], a     ; disable move slot
	jr .next
.slotWithMinimalValue
	ld a, [de]
	ld [hli], a     ; enable move slot
.next
	inc de
	dec c
	jr nz, .filterMinimalEntries
	ld hl, wBuffer    ; use created temporary array as move set
	ret
.useOriginalMoveSet
	ld hl, wEnemyMonMoves    ; use original move set
	ret

AIMoveChoiceModificationFunctionPointers:
	dw AIMoveChoiceNovice       ; 1
	dw AIMoveChoicePreferSetup  ; 2
	dw AIMoveChoiceAdept        ; 3
	dw AIMoveChoiceExpert       ; 4


; ============================================================================
; Novice layer
; ============================================================================
; Avoids moves that demonstrably accomplish nothing on this turn:
;   - Whirlwind/Roar/Teleport (do nothing in a trainer battle)
;   - Splash
;   - Status moves on an already-statused target  (the original vanilla rule)
;   - Disable on a player who already has a disabled move
;   - Non-stacking buffs already in effect (Focus Energy, Mist, Light Screen,
;     Reflect, Substitute, Leech Seed)
;   - Confuse Ray / Supersonic on an already-confused target
;   - Dream Eater on a non-sleeping target
AIMoveChoiceNovice:
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z
	inc hl
	ld a, [de]
	and a
	ret z
	inc de
	call ReadMove

	; Whirlwind/Roar/Teleport: nothing happens in trainer battles
	ld a, [wEnemyMoveEffect]
	cp SWITCH_AND_TELEPORT_EFFECT
	jp z, .heavyDiscourage
	; Splash literally does nothing
	cp SPLASH_EFFECT
	jp z, .heavyDiscourage

	; Don't apply a status effect to an already-statused target
	; (this is the only rule vanilla had in this layer)
	push hl
	push de
	ld hl, StatusAilmentMoveEffects
	call IsInList
	pop de
	pop hl
	jr nc, .notStatusMove
	ld a, [wBattleMonStatus]
	and a
	jr nz, .heavyDiscourage
.notStatusMove

	; Disable: don't try to disable a player who already has a disabled move
	ld a, [wEnemyMoveEffect]
	cp DISABLE_EFFECT
	jr nz, .notDisable
	ld a, [wPlayerDisabledMove]
	and a
	jr nz, .heavyDiscourage
.notDisable

	; Don't stack a buff/screen we already have
	ld a, [wEnemyMoveEffect]
	cp FOCUS_ENERGY_EFFECT
	jr z, .checkFocusEnergy
	cp LIGHT_SCREEN_EFFECT
	jr z, .checkLightScreen
	cp REFLECT_EFFECT
	jr z, .checkReflect
	cp MIST_EFFECT
	jr z, .checkMist
	cp SUBSTITUTE_EFFECT
	jr z, .checkSubstitute
	cp LEECH_SEED_EFFECT
	jr z, .checkLeechSeedActive
	jr .endStacking
.checkFocusEnergy
	ld a, [wEnemyBattleStatus2]
	bit GETTING_PUMPED, a
	jr nz, .heavyDiscourage
	jr .endStacking
.checkLightScreen
	ld a, [wEnemyBattleStatus3]
	bit HAS_LIGHT_SCREEN_UP, a
	jr nz, .heavyDiscourage
	jr .endStacking
.checkReflect
	ld a, [wEnemyBattleStatus3]
	bit HAS_REFLECT_UP, a
	jr nz, .heavyDiscourage
	jr .endStacking
.checkMist
	ld a, [wEnemyBattleStatus2]
	bit PROTECTED_BY_MIST, a
	jr nz, .heavyDiscourage
	jr .endStacking
.checkSubstitute
	ld a, [wEnemyBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a
	jr nz, .heavyDiscourage
	jr .endStacking
.checkLeechSeedActive
	ld a, [wPlayerBattleStatus2]
	bit SEEDED, a
	jr nz, .heavyDiscourage
.endStacking

	; Confuse Ray / Supersonic on a confused target = wasted turn
	ld a, [wEnemyMoveEffect]
	cp CONFUSION_EFFECT
	jr nz, .notConfuseRay
	ld a, [wPlayerBattleStatus1]
	bit CONFUSED, a
	jr nz, .heavyDiscourage
.notConfuseRay

	; Dream Eater requires a sleeping target
	ld a, [wEnemyMoveEffect]
	cp DREAM_EATER_EFFECT
	jr nz, .notDreamEater
	ld a, [wBattleMonStatus]
	and SLP_MASK
	jr z, .heavyDiscourage
.notDreamEater
	jp .nextMove

.heavyDiscourage
	ld a, [hl]
	add 5
	ld [hl], a
	jp .nextMove


; ============================================================================
; PreferSetup layer (was vanilla "Modification 2")
; ============================================================================
; On the turn a Pokémon is sent out, slightly encourage non-damaging effect
; moves (stat ups/downs and other "in-between" effects). The vanilla check
; was `cp 1` which only activated on the second AI cycle for the mon; the
; check below activates on the very first cycle, which matches the apparent
; intent of the layer.
AIMoveChoicePreferSetup:
	ld a, [wAILayer2Encouragement]
	and a
	ret nz
	ld hl, wBuffer - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMoveEffect]
	cp ATTACK_UP1_EFFECT
	jr c, .nextMove
	cp BIDE_EFFECT
	jr c, .preferMove
	cp ATTACK_UP2_EFFECT
	jr c, .nextMove
	cp POISON_EFFECT
	jr c, .preferMove
	jr .nextMove
.preferMove
	dec [hl]
	jr .nextMove

; ============================================================================
; Adept layer
; ============================================================================
; - Type effectiveness (encourage SE, discourage NVE, hard immunity ban)
; - Resource awareness (heal/explode by HP, Substitute below 1/4, anti-spam
;   at low HP)
; - Stat-mod cap respect
; - Substitute / category / type-immunity awareness for status & screens
; - STAB nudge on neutral matchups
;
; This layer also early-exits if the player has just switched in a Pokémon.
; That keeps the AI from immediately exploiting type information about the
; new mon -- a deliberately Expert-style behavior baked in here because all
; the type-scoring logic would otherwise need to run.
AIMoveChoiceAdept:
	; Anti-omniscience: skip the whole Adept layer for one turn after a
	; voluntary player switch (wActionResultOrTookBattleTurn == $a is set
	; in core.asm when the player picks a different mon).
	ld a, [wActionResultOrTookBattleTurn]
	cp $a
	ret z

	ld hl, wBuffer - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove

	; Stat-modifying move at the +6 / -6 cap is wasted
	call IsStatModCapped
	jp c, .heavyDiscourage

	; Substitute below 1/4 HP would faint the user
	ld a, [wEnemyMoveEffect]
	cp SUBSTITUTE_EFFECT
	jr nz, .notSubstitute
	ld a, 4
	call AICheckIfHPBelowFraction
	jp c, .heavyDiscourage
.notSubstitute

	; Haze without player boosts or enemy debuffs does nothing useful
	ld a, [wEnemyMoveEffect]
	cp HAZE_EFFECT
	jr nz, .notHaze
	call IsHazeWasted
	jp c, .heavyDiscourage
.notHaze

	; Status moves are pointless through a player Substitute
	ld a, [wPlayerBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a
	jr z, .noPlayerSub
	ld a, [wEnemyMoveEffect]
	push hl
	push de
	ld hl, SubstituteImmuneEffects
	call IsInList
	pop de
	pop hl
	jp c, .heavyDiscourage
.noPlayerSub

	; Defense-up / screens are wasted vs the wrong move category
	;   Light Screen vs Physical          -- player just used a physical move
	;   Reflect / DEF UP vs Special       -- player just used a special move
	call IsScreenAgainstWrongCategory
	jp c, .heavyDiscourage

	; Heal / Explode get a stronger or weaker push depending on HP
	call ScoreHealOrExplodeByHP

	; Leech Seed wasted on a Grass-type
	ld a, [wEnemyMoveEffect]
	cp LEECH_SEED_EFFECT
	jr nz, .notLeechSeedType
	ld a, [wBattleMonType]
	cp GRASS
	jp z, .heavyDiscourage
	ld a, [wBattleMonType + 1]
	cp GRASS
	jp z, .heavyDiscourage
.notLeechSeedType

	; Poisoning-effect moves are wasted on a Poison-type target
	ld a, [wEnemyMoveEffect]
	cp POISON_EFFECT
	jr nz, .notPoisonEffect
	ld a, [wBattleMonType]
	cp POISON
	jp z, .heavyDiscourage
	ld a, [wBattleMonType + 1]
	cp POISON
	jp z, .heavyDiscourage
.notPoisonEffect

	; Burning-effect moves are wasted on a Fire-type target
	ld a, [wEnemyMoveEffect]
	cp BURN_EFFECT
	jr nz, .notBurnEffect
	ld a, [wBattleMonType]
	cp FIRE
	jp z, .heavyDiscourage
	ld a, [wBattleMonType + 1]
	cp FIRE
	jp z, .heavyDiscourage
.notBurnEffect

	; Electric paralysis moves, e.g. Thunder Wave, do not affect Ground-types
	ld a, [wEnemyMoveEffect]
	cp PARALYZE_EFFECT
	jr nz, .notElectricParalysis
	ld a, [wEnemyMoveType]
	cp ELECTRIC
	jr nz, .notElectricParalysis
	ld a, [wBattleMonType]
	cp GROUND
	jp z, .heavyDiscourage
	ld a, [wBattleMonType + 1]
	cp GROUND
	jp z, .heavyDiscourage
.notElectricParalysis

	; Truly non-damaging moves: anti-spam check, then done
	ld a, [wEnemyMovePower]
	and a
	jp z, .scoreNonDamaging

	; Special-damage moves (encoded as power == 1) bypass type scoring;
	; small random nudge to encourage their use occasionally
	ld a, [wEnemyMovePower]
	cp 1
	jr nz, .doTypeScoring
	call Random
	cp 25 percent
	jp c, .encourage
	jp .nextMove

.doTypeScoring
	push hl
	push bc
	push de
	callfar AIGetTypeEffectiveness
	pop de
	pop bc
	pop hl
	ld a, [wTypeEffectiveness]
	and a
	jp z, .heavyDiscourage    ; 0x effectiveness: hard immunity, never use
	cp EFFECTIVE
	jr z, .neutralMove
	jr c, .notEffectiveMove
	jp .encourage             ; super-effective

.neutralMove
	; STAB on a neutral matchup: 25% chance to lightly encourage
	call Random
	cp 25 percent
	jp nc, .nextMove
	ld a, [wEnemyMoveType]
	ld b, a
	ld a, [wEnemyMonType1]
	cp b
	jr z, .encourage
	ld a, [wEnemyMonType2]
	cp b
	jr z, .encourage
	jp .nextMove

.notEffectiveMove
	; Vanilla logic: discourage NVE moves only when at least one better
	; alternative exists (a damaging move of a different type, Super Fang,
	; or a special-damage move).
	push hl
	push de
	push bc
	ld a, [wEnemyMoveType]
	ld d, a
	ld hl, wEnemyMonMoves
	lb bc, NUM_MOVES + 1, 0
.loopMoves
	dec b
	jr z, .doneSearch
	ld a, [hli]
	and a
	jr z, .doneSearch
	call ReadMove
	ld a, [wEnemyMoveEffect]
	cp SUPER_FANG_EFFECT
	jr z, .betterMoveFound
	cp SPECIAL_DAMAGE_EFFECT
	jr z, .betterMoveFound
	ld a, [wEnemyMoveType]
	cp d
	jr z, .loopMoves
	ld a, [wEnemyMovePower]
	and a
	jr nz, .betterMoveFound
	jr .loopMoves
.betterMoveFound
	ld c, a
.doneSearch
	ld a, c
	pop bc
	pop de
	pop hl
	and a
	jp z, .nextMove
	inc [hl] ; slightly discourage
	jp .nextMove

.scoreNonDamaging
	; 0-power move when the player is below half HP: small discourage
	; (better to keep attacking and finish them)
	ld a, 2
	call AICheckIfPlayerHPBelowFraction
	jr nc, .notLowPlayer
	inc [hl]
.notLowPlayer

	; If this is a 0-BP "wasteful" effect (status / Leech Seed / Disable /
	; Confuse Ray) and we are at HP < 1/3, heavily discourage
	; (Heal and Substitute are intentionally exempt -- those can be exactly
	; what we want at low HP.)
	ld a, [wEnemyMoveEffect]
	push hl
	push de
	ld hl, SpamProtectedEffects
	call IsInList
	pop de
	pop hl
	jp nc, .nextMove
	ld a, 3
	call AICheckIfHPBelowFraction
	jr c, .heavyDiscourage
	jp .nextMove

.heavyDiscourage
	ld a, [hl]
	add 5
	ld [hl], a
	jp .nextMove

.encourage
	dec [hl]
	jp .nextMove


; ============================================================================
; Expert layer
; ============================================================================
; - Predict-the-player heuristics: Counter, Rage, Fly/Dig, Defense-vs-category
; - Speed-tier reasoning: OHKO, Fly/Dig vs Fly/Dig, Explode-vs-fast-target
; - Stat-aware preferences: Atk vs Sp.Atk
; - Anti-spam: don't follow up a 0-BP move with another 0-BP move
; - Anti-omniscience: ~80% chance to "not realize" the player switched
;   when picking a status move (avoids reflexively statusing a new sendout)
AIMoveChoiceExpert:
	ld hl, wBuffer - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z
	inc hl
	ld a, [de]
	and a
	ret z
	inc de
	call ReadMove

	; --- Rage --- only worth it when we outspeed and the player is using
	; a multi-hit move (which generates lots of Rage stacks)
	ld a, [wEnemyMoveEffect]
	cp RAGE_EFFECT
	jr nz, .notRage
	call StrCmpSpeed
	jp nc, .heavyDiscourage    ; not faster than player
	ld a, [wPlayerMoveEffect]
	cp TWO_TO_FIVE_ATTACKS_EFFECT
	jr z, .nextMove
	cp ATTACK_TWICE_EFFECT
	jp nz, .heavyDiscourage
	jr .nextMove
.notRage

	; --- Counter --- requires a Physical move from the player, with non-zero power
	ld a, [wEnemyMoveNum]
	cp COUNTER
	jr nz, .notCounter
	ld a, [wPlayerMovePower]
	and a
	jp z, .heavyDiscourage
	push bc
	push hl
	call IsPlayerMoveTypeSpecial
	pop hl
	pop bc
	jp nz, .heavyDiscourage
.notCounter

	; --- Two-turn moves --- random discourage when we're paralyzed or
	; confused (the second turn might never land)
	ld a, [wEnemyMoveEffect]
	cp CHARGE_EFFECT
	jr nz, .notTwoTurn
	; paralyzed: ~56% chance to discourage
	ld a, [wEnemyMonStatus]
	bit PAR, a
	jr z, .twoTurnConfusionCheck
	call Random
	cp $70
	jr nc, .twoTurnConfusionCheck
	inc [hl]
	inc [hl]
.twoTurnConfusionCheck
	ld a, [wEnemyBattleStatus1]
	bit CONFUSED, a
	jr z, .notTwoTurn
	call Random
	cp $C0
	jr nc, .notTwoTurn
	inc [hl]
	inc [hl]
.notTwoTurn

	; --- Fly/Dig vs Fly/Dig --- when both sides try to dig/fly and the AI
	; is faster, the AI will miss and the player will hit. Discourage.
	ld a, [wEnemyMoveNum]
	call IsDigOrFly
	jr nz, .notDigOrFlyDuel
	ld a, [wPlayerMoveNum]
	call IsDigOrFly
	jr nz, .notDigOrFlyDuel
	ld a, [wPlayerBattleStatus1]
	bit INVULNERABLE, a
	jr nz, .notDigOrFlyDuel    ; player already invulnerable: no race
	call StrCmpSpeed
	jr z, .notDigOrFlyDuel
	jr nc, .notDigOrFlyDuel    ; not faster: no problem
	inc [hl]
	inc [hl]
.notDigOrFlyDuel

	; --- Stat-down moves blocked by Mist --- if player is Mist-protected
	; and this is a stat-lowering move, heavily discourage
	ld a, [wPlayerBattleStatus2]
	bit PROTECTED_BY_MIST, a
	jr z, .noMistBlock
	ld a, [wEnemyMoveEffect]
	push hl
	push de
	ld hl, MistBlockEffects
	call IsInList
	pop de
	pop hl
	jp c, .heavyDiscourage
.noMistBlock

	; --- OHKO moves --- always miss when the user is slower; pointless
	ld a, [wEnemyMoveEffect]
	cp OHKO_EFFECT
	jr nz, .notOHKO
	ld a, [wEnemyBattleStatus2]
	bit USING_X_ACCURACY, a
	jr nz, .notOHKO        ; X-Accuracy in effect: OHKO can't auto-miss
	call StrCmpSpeed
	jp nc, .heavyDiscourage
.notOHKO

	; --- Explode vs Fly/Dig --- if the player is invulnerable and we're
	; faster, Explode will miss and we sacrifice the user for nothing
	ld a, [wEnemyMoveEffect]
	cp EXPLODE_EFFECT
	jr nz, .notExplodeFlyCheck
	ld a, [wPlayerBattleStatus1]
	bit INVULNERABLE, a
	jr z, .notExplodeFlyCheck
	call StrCmpSpeed
	jp c, .heavyDiscourage     ; faster: will miss
.notExplodeFlyCheck

	; --- Atk vs Sp.Atk awareness --- 25% chance to nudge against a move
	; whose category doesn't match our better attacking stat
	ld a, [wEnemyMovePower]
	and a
	jr z, .skipAtkSpaCheck
	cp 1
	jr z, .skipAtkSpaCheck     ; special-damage move
	call Random
	cp 75 percent
	jr c, .skipAtkSpaCheck
	call StrCmpAtkSPA
	jr z, .skipAtkSpaCheck     ; stats equal
	push af
	ld a, [wEnemyMoveType]
	push hl
	push bc
	ld c, a
	ld b, 0
	ld hl, SpecialTypesList
	add hl, bc
	ld a, [hl]
	pop bc
	pop hl
	and a                       ; nz = special type, z = physical type
	jr nz, .specialMove
.physicalMove
	pop af                      ; carry was set if Sp.Atk > Atk
	jr nc, .skipAtkSpaCheck
	inc [hl]                    ; physical move with weak Atk: discourage
	jr .skipAtkSpaCheck
.specialMove
	pop af
	jr c, .skipAtkSpaCheck
	inc [hl]                    ; special move with weak Sp.Atk: discourage
.skipAtkSpaCheck

	; --- Discourage offensive moves into a Fly/Dig opponent when faster ---
	; (We attack into thin air; they hit us next turn.)
	ld a, [wPlayerBattleStatus1]
	bit INVULNERABLE, a
	jr z, .notHittingThinAir
	ld a, [wEnemyMovePower]
	and a
	jr z, .notHittingThinAir
	; quick attacks should be exempted -- treat them as safer
	ld a, [wEnemyMoveNum]
	cp QUICK_ATTACK
	jr z, .notHittingThinAir
	; Charge-effect (Fly/Dig/Solar Beam) is itself a counter -- exempt
	ld a, [wEnemyMoveEffect]
	cp CHARGE_EFFECT
	jr z, .notHittingThinAir
	call StrCmpSpeed
	jr nc, .notHittingThinAir
	inc [hl]
.notHittingThinAir

	; --- Anti-spam: don't use another 0-BP move right after a 0-BP move ---
	; (Adept already discourages 0-BP moves at low HP; this is the meta-aware
	; "I literally just did this" check, regardless of HP.)
	ld a, [wEnemyMovePower]
	and a
	jr nz, .notSpamFollowup
	ld a, [wAILastMovePower]
	and a
	jr nz, .notSpamFollowup
	; Heal and Substitute are exempt: chaining heal->heal or sub->sub is
	; fine if both pass their own resource checks
	ld a, [wEnemyMoveEffect]
	cp HEAL_EFFECT
	jr z, .notSpamFollowup
	cp SUBSTITUTE_EFFECT
	jr z, .notSpamFollowup
	jr .heavyDiscourage
.notSpamFollowup

	; --- Anti-omniscience on player switch ---
	; If the player just switched, ~80% per move chance to apply a random
	; bias to status moves: 50% heavy discourage, 12.5% encourage, otherwise
	; nothing. With multiple status moves on the AI's mon this works out to
	; roughly 50% odds the AI doesn't reflexively status the new sendout.
	ld a, [wActionResultOrTookBattleTurn]
	cp $a
	jp nz, .nextMove
	ld a, [wEnemyMoveEffect]
	push hl
	push de
	ld hl, SpamProtectedEffects
	call IsInList
	pop de
	pop hl
	jp nc, .nextMove
	call Random
	cp 204
	jp nc, .nextMove           ; ~20% per move: AI "sees through" the switch
	call Random
	cp 50 percent + 1
	jr nc, .heavyDiscourage    ; 50%: heavy discourage
	cp 13 percent
	jr c, .encourage           ; 12.5%: lightly encourage
	jp .nextMove

.heavyDiscourage
	ld a, [hl]
	add 5
	ld [hl], a
	jp .nextMove
.encourage
	dec [hl]
	jp .nextMove


; ============================================================================
; Effect tables
; ============================================================================

StatusAilmentMoveEffects:
	db BURN_EFFECT ; marcelnote - replaces unused sleep effect EFFECT_01
	db SLEEP_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db -1 ; end

; Effects that are blocked by an active player Substitute
SubstituteImmuneEffects:
	db SLEEP_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db BURN_EFFECT
	db CONFUSION_EFFECT
	db ATTACK_DOWN1_EFFECT
	db DEFENSE_DOWN1_EFFECT
	db SPEED_DOWN1_EFFECT
	db SPECIAL_DOWN1_EFFECT
	db ACCURACY_DOWN1_EFFECT
	db EVASION_DOWN1_EFFECT
	db DRAIN_HP_EFFECT
	db LEECH_SEED_EFFECT
	db DREAM_EATER_EFFECT
	db ATTACK_DOWN2_EFFECT
	db DEFENSE_DOWN2_EFFECT
	db SPEED_DOWN2_EFFECT
	db SPECIAL_DOWN2_EFFECT
	db ACCURACY_DOWN2_EFFECT
	db EVASION_DOWN2_EFFECT
	db -1 ; end

; Stat-lowering effects blocked by an active player Mist
MistBlockEffects:
	db ATTACK_DOWN1_EFFECT
	db DEFENSE_DOWN1_EFFECT
	db SPEED_DOWN1_EFFECT
	db SPECIAL_DOWN1_EFFECT
	db ACCURACY_DOWN1_EFFECT
	db EVASION_DOWN1_EFFECT
	db ATTACK_DOWN2_EFFECT
	db DEFENSE_DOWN2_EFFECT
	db SPEED_DOWN2_EFFECT
	db SPECIAL_DOWN2_EFFECT
	db ACCURACY_DOWN2_EFFECT
	db EVASION_DOWN2_EFFECT
	db -1 ; end

; Wasteful 0-BP effects that should be heavily discouraged at low HP
; (intentionally excludes Heal and Substitute, which are sometimes ideal
; even at low HP)
SpamProtectedEffects:
	db SLEEP_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db BURN_EFFECT
	db CONFUSION_EFFECT
	db LEECH_SEED_EFFECT
	db DISABLE_EFFECT
	db -1

; ============================================================================
; Adept helper subroutines
; ============================================================================

; Return carry if the move's stat-modifying effect targets a stat that's
; already capped (+6 for stat-up, -6 for stat-down). Preserves bc, de, hl.
IsStatModCapped:
	push hl
	push bc
	ld a, [wEnemyMoveEffect]
	; Stat-down range: ATTACK_DOWN1 .. EVASION_DOWN1 and ATTACK_DOWN2 .. EVASION_DOWN2
	cp ATTACK_DOWN1_EFFECT
	jr c, .checkStatUp
	cp EVASION_DOWN2_EFFECT + 1
	jr nc, .checkStatUp
	cp EVASION_DOWN1_EFFECT + 1
	jr c, .statDown
	cp ATTACK_DOWN2_EFFECT
	jr c, .checkStatUp        ; falls in the gap of side-effect IDs
.statDown
	sub ATTACK_DOWN2_EFFECT
	jr nc, .checkPlayerStatMod
	add ATTACK_DOWN2_EFFECT - ATTACK_DOWN1_EFFECT
.checkPlayerStatMod
	ld c, a
	ld b, 0
	ld hl, wPlayerMonStatMods
	add hl, bc
	ld a, [hl]
	cp 2                       ; can't lower if the mod is 1 or 0
	jr c, .capped
	jr .notCapped
.checkStatUp
	; Stat-up range: ATTACK_UP1 .. EVASION_UP1 and ATTACK_UP2 .. EVASION_UP2
	ld a, [wEnemyMoveEffect]
	cp ATTACK_UP1_EFFECT
	jr c, .notCapped
	cp EVASION_UP2_EFFECT + 1
	jr nc, .notCapped
	cp EVASION_UP1_EFFECT + 1
	jr c, .statUp
	cp ATTACK_UP2_EFFECT
	jr c, .notCapped
.statUp
	sub ATTACK_UP2_EFFECT
	jr nc, .checkEnemyStatMod
	add ATTACK_UP2_EFFECT - ATTACK_UP1_EFFECT
.checkEnemyStatMod
	ld c, a
	ld b, 0
	ld hl, wEnemyMonStatMods
	add hl, bc
	ld a, [hl]
	cp MAX_STAT_LEVEL          ; can't raise past +6 (= mod value 13)
	jr nc, .capped
.notCapped
	pop bc
	pop hl
	and a
	ret
.capped
	pop bc
	pop hl
	scf
	ret

; Return carry if Haze would do nothing useful right now: no player boosts to
; clear and no enemy debuffs to clear.
; Preserves bc, de, hl.
IsHazeWasted:
	push hl
	push bc
	ld b, NUM_STAT_MODS
	ld hl, wPlayerMonStatMods
.checkPlayerStats
	ld a, [hli]
	cp 8                       ; player has a positive stat mod
	jr nc, .useful
	dec b
	jr nz, .checkPlayerStats
	ld b, NUM_STAT_MODS
	ld hl, wEnemyMonStatMods
.checkEnemyStats
	ld a, [hli]
	cp 7                       ; enemy has a negative stat mod
	jr c, .useful
	dec b
	jr nz, .checkEnemyStats
	pop bc
	pop hl
	scf
	ret
.useful
	pop bc
	pop hl
	and a                      ; clear carry
	ret

; Return carry if the move is a Defense-up effect / Light Screen / Reflect
; that would be wasted against the player's last move category.
;   Light Screen vs Physical    -- physical attacks bypass it
;   Reflect / DEF UP vs Special -- special attacks bypass it
; Preserves bc, de, hl.
IsScreenAgainstWrongCategory:
	push bc
	push hl
	ld a, [wEnemyMoveEffect]
	cp LIGHT_SCREEN_EFFECT
	jr z, .checkLightScreen
	cp REFLECT_EFFECT
	jr z, .checkReflect
	cp DEFENSE_UP1_EFFECT
	jr z, .checkReflect
	cp DEFENSE_UP2_EFFECT
	jr z, .checkReflect
	jr .noMatch
.checkLightScreen
	; Player's last move must be a non-trivial attack
	call PlayerUsedDamagingMove
	jr nc, .noMatch
	; Wasted if player is using a physical move
	call IsPlayerMoveTypeSpecial
	jr nz, .noMatch
	jr .wasted
.checkReflect
	call PlayerUsedDamagingMove
	jr nc, .noMatch
	; Wasted if player is using a special move
	call IsPlayerMoveTypeSpecial
	jr z, .noMatch
.wasted
	pop hl
	pop bc
	scf
	ret
.noMatch
	pop hl
	pop bc
	and a
	ret

; Carry set if the player's last move had power >= 10 and isn't fixed-damage.
; Preserves bc, de, hl.
PlayerUsedDamagingMove:
	ld a, [wPlayerMoveEffect]
	cp SPECIAL_DAMAGE_EFFECT
	jr z, .notDamage           ; OHKO/seismic toss/etc. ignore screens
	cp OHKO_EFFECT
	jr z, .notDamage
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .notDamage
	scf
	ret
.notDamage
	and a
	ret

; Zero flag set if the player's last-used move type is Physical, clear if Special.
; Preserves de; clobbers bc and hl.
IsPlayerMoveTypeSpecial:
	ld a, [wPlayerMoveType]
	ld c, a
	ld b, 0
	ld hl, SpecialTypesList
	add hl, bc
	ld a, [hl]
	and a
	ret ; nz for Special, z for physical

; Score Heal / Explode based on current HP fraction.
;   HP at max     : +5 (heavy discourage)
;   HP > 1/2      : +1 (slight discourage)
;   HP 1/3 .. 1/2 : 0  (neutral)
;   HP < 1/3      : -1 (slight encourage)
; No-op when the move isn't HEAL or EXPLODE. Preserves bc, de, hl.
ScoreHealOrExplodeByHP:
	ld a, [wEnemyMoveEffect]
	cp HEAL_EFFECT
	jr z, .scoreByHP
	cp EXPLODE_EFFECT
	ret nz
.scoreByHP
	ld a, 1
	call AICheckIfHPBelowFraction
	jr c, .belowMax
	; HP at max: heavy discourage
	ld a, [hl]
	add 5
	ld [hl], a
	ret
.belowMax
	inc [hl]                   ; default: slight discourage
	ld a, 2
	call AICheckIfHPBelowFraction
	ret nc                     ; HP > 1/2: keep slight discourage
	dec [hl]                   ; HP <= 1/2: cancel the discourage
	ld a, 3
	call AICheckIfHPBelowFraction
	ret nc                     ; HP > 1/3: neutral
	dec [hl]                   ; HP < 1/3: slight encourage
	ret


; ============================================================================
; Generic helpers
; ============================================================================

; Compare enemy speed against player speed.
;   z   = equal
;   nc  = player faster (or equal)
;   c   = enemy faster
; Preserves all registers.
StrCmpSpeed:
	push bc
	push de
	push hl
	ld de, wBattleMonSpeed
	ld hl, wEnemyMonSpeed
	ld c, 2
.loop
	ld a, [de]
	cp [hl]
	jr nz, .done
	inc de
	inc hl
	dec c
	jr nz, .loop
.done
	pop hl
	pop de
	pop bc
	ret

; Compare enemy Attack against enemy Special.
;   z   = equal
;   nc  = Attack >= Special
;   c   = Special > Attack
; Preserves all registers.
StrCmpAtkSPA:
	push bc
	push de
	push hl
	ld de, wEnemyMonAttack
	ld hl, wEnemyMonSpecial
	ld c, 2
.loop
	ld a, [de]
	cp [hl]
	jr nz, .done
	inc de
	inc hl
	dec c
	jr nz, .loop
.done
	pop hl
	pop de
	pop bc
	ret

; Returns z if the move number in a is Dig or Fly. Preserves everything else.
IsDigOrFly:
	cp DIG
	ret z
	cp FLY
	ret


ReadMove:
	push hl
	push de
	push bc
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wEnemyMoveNum
	ld a, BANK(Moves)
	call FarCopyData
	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/trainers/move_choices.asm"

INCLUDE "data/trainers/pic_pointers_money.asm"

IF DEF(_FRA) ; marcelnote - for translation
	INCLUDE "translation/fra/data/trainers/names.fra.asm"
ELSE
	INCLUDE "data/trainers/names.asm"
ENDC

INCLUDE "engine/battle/misc.asm"

INCLUDE "engine/battle/read_trainer_party.asm"

INCLUDE "data/trainers/special_moves.asm"

INCLUDE "data/trainers/parties.asm"

TrainerAI:
	and a
	ld a, [wIsInBattle]
	dec a
	ret z ; if not a trainer, we're done here
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z ; if in a link battle, we're done as well
	ld a, [wTrainerClass] ; what trainer class is this?
	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerAIPointers
	add hl, bc
	add hl, bc
	add hl, bc ; now hl points to the trainer dbw entry
	ld a, [wAICount] ; wAICount is initialized at -1
	and a
	ret z  ; if no AI uses left, we're done here
	;inc hl ; now hl points to the trainer AI
	inc a  ; cp -1
	jr nz, .getpointer ; on the first run, load Trainer AI count in wAICount
	;dec hl
	;ld a, [hli]
	ld a, [hl]
	ld [wAICount], a
.getpointer
	inc hl ; now hl points to the trainer AI pointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Random
	jp hl ; now hl is the Trainer AI pointer

INCLUDE "data/trainers/ai_pointers.asm"

JrTrainerAI: ; marcelnote - new
	cp 25 percent + 1
	ret nc
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUsePotion

BikerAI: ; marcelnote - new
	cp 13 percent - 1
	ret nc
	jp AIUseXSpeed

EngineerAI: ; marcelnote - new
	cp 13 percent - 1
	ret nc
	jp AIUseXDefend

PsychicAI: ; marcelnote - new
	cp 13 percent - 1
	ret nc
	jp AIUseXSpecial

JugglerAI:
	cp 25 percent + 1
	ret nc
	jp AISwitchIfEnoughMons

TamerAI: ; marcelnote - new
	cp 13 percent - 1
	ret nc
	jp AIUseXAccuracy

BlackbeltAI:
	cp 13 percent - 1
	ret nc
	jp AIUseXAttack

GiovanniAI: ; marcelnote - was 25% chance of using GuardSpec
	cp 38 percent - 1
	ret nc
	cp 25 percent + 1
	jp nc, AIUseXSpecial ; now also 13% chance to use XSpecial
	jp AIUseGuardSpec

CooltrainerMAI:
	cp 25 percent + 1
	ret nc
	jp AIUseXAttack

CooltrainerFAI:
	; The intended 25% chance to consider switching will not apply.
	; Uncomment the line below to fix this.
	cp 25 percent + 1
	ret nc ; marcelnote - fixes bug above
	ld a, 10
	call AICheckIfHPBelowFraction
	jp c, AIUseHyperPotion
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AISwitchIfEnoughMons

BrockAI:
; if his active monster has a status condition, use a full heal
	ld a, [wEnemyMonStatus]
	and a
	ret z
	jp AIUseFullHeal

MistyAI:
	cp 25 percent + 1
	ret nc
	jp AIUseXDefend

LtSurgeAI:
	cp 25 percent + 1
	ret nc
	jp AIUseXSpeed

ErikaAI:
	cp 50 percent + 1
	ret nc
	ld a, 5 ; marcelnote - modified, 1/5 HP instead of 1/10
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseSuperPotion

KogaAI:
	cp 25 percent + 1
	ret nc
	jp AIUseXAttack

BlaineAI:
SabrinaAI:
	cp 50 percent + 1 ; marcelnote - modified, 50% chance instead of 25%
	ret nc
	ld a, 5 ; marcelnote - modified, 1/5 HP instead of 1/10
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseHyperPotion

;BlaineAI: ; marcelnote - fix for potion use threshold
;	cp 50 percent + 1 ; marcelnote - modified, 50% chance instead of 25%
;	ret nc
;	ld a, 5 ; marcelnote - modified, 1/5 HP instead of 1/10
;	call AICheckIfHPBelowFraction
;	ret nc
;	jp AIUseHyperPotion ; marcelnote - changed from Super Potion

Rival2AI:
	cp 25 percent + 1 ; marcelnote - modified, 25% chance instead of 13%
	ret nc
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUsePotion

Rival3AI: ; marcelnote - modified, was 13% chance of Full Restore if HP < 1/5 HPMax
	cp 50 percent + 1
	ret nc
	cp 25 percent + 1
	jr nc, .checkHP ; 25% chance to heal status condition
	ld a, [wEnemyMonStatus]
	and a
	jr nz, AIUseFullRestore
.checkHP
	ld a, 3
	call AICheckIfHPBelowFraction
	ret nc
	jr AIUseFullRestore

LoreleiAI:
	cp 50 percent + 1
	ret nc
	ld a, 3 ; marcelnote - modified, 1/3 HP instead of 1/5
	call AICheckIfHPBelowFraction
	ret nc
	jr AIUseHyperPotion ; marcelnote - modified from Super Potion

BrunoAI: ; marcelnote - modified, was 25% chance of using XDefend
	cp 50 percent + 1
	ret nc
	ld a, 3
	call AICheckIfHPBelowFraction
	jr c, AIUseHyperPotion
	call Random
	cp 50 percent + 1
	ret nc
	jp AIUseDireHit

AgathaAI:
	cp 8 percent
	jp c, AISwitchIfEnoughMons
	cp 50 percent + 1
	ret nc
	ld a, 4
	call AICheckIfHPBelowFraction
	ret nc
	jr AIUseHyperPotion ; marcelnote - changed to Hyper Potion

LanceAI: ; marcelnote - now also chance to use Full Heal
	cp 50 percent + 1
	ret nc
	ld a, 3
	call AICheckIfHPBelowFraction
	jr c, AIUseHyperPotion
	call Random
	cp 50 percent + 1
	ret nc
	ld a, [wEnemyMonStatus]
	and a
	ret z
	jp AIUseFullHeal

GenericAI:
	and a ; clear carry
	ret

; end of individual trainer AI routines

DecrementAICount:
	ld hl, wAICount
	dec [hl]
	scf ; set carry flag to indicate that AI took action
	ret

AIPlayRestoringSFX:
	ld a, SFX_HEAL_AILMENT
	jp PlaySoundWaitForCurrent

AIUseFullRestore:
	call AICureStatus
	ld a, FULL_RESTORE
	ld [wAIItem], a
	ld de, wHPBarOldHP
	ld hl, wEnemyMonHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld hl, wEnemyMonMaxHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld [wHPBarMaxHP], a
	ld [wEnemyMonHP + 1], a
	ld a, [hl]
	ld [de], a
	ld [wHPBarMaxHP+1], a
	ld [wEnemyMonHP], a
	jr AIPrintItemUseAndUpdateHPBar

AIUsePotion:
; enemy trainer heals his monster with a potion
	ld a, POTION
	ld b, 20
	jr AIRecoverHP

AIUseSuperPotion:
; enemy trainer heals his monster with a super potion
	ld a, SUPER_POTION
	ld b, 50
	jr AIRecoverHP

AIUseHyperPotion:
; enemy trainer heals his monster with a hyper potion
	ld a, HYPER_POTION
	ld b, 200
	; fallthrough

AIRecoverHP:
; heal b HP and print "trainer used $(a) on pokemon!"
	ld [wAIItem], a
	ld hl, wEnemyMonHP + 1
	ld a, [hl]
	ld [wHPBarOldHP], a
	add b
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [hl]
	ld [wHPBarOldHP+1], a
	ld [wHPBarNewHP+1], a
	jr nc, .next
	inc a
	ld [hl], a
	ld [wHPBarNewHP+1], a
.next
	inc hl
	ld a, [hld]
	ld b, a
	ld de, wEnemyMonMaxHP + 1
	ld a, [de]
	dec de
	ld [wHPBarMaxHP], a
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	ld [wHPBarMaxHP+1], a
	sbc b
	jr nc, AIPrintItemUseAndUpdateHPBar
	inc de
	ld a, [de]
	dec de
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [de]
	ld [hl], a
	ld [wHPBarNewHP+1], a
	; fallthrough

AIPrintItemUseAndUpdateHPBar:
	call AIPrintItemUse_
	hlcoord 2, 2
	xor a
	ld [wHPBarType], a
	predef UpdateHPBar
	jp DecrementAICount

AISwitchIfEnoughMons:
; enemy trainer switches if there are 2 or more unfainted mons in party
	ld a, [wEnemyPartyCount]
	ld c, a
	ld hl, wEnemyMon1HP

	ld d, 0 ; keep count of unfainted monsters

	; count how many monsters haven't fainted yet
.loop
	ld a, [hli]
	ld b, a
	ld a, [hld]
	or b
	jr z, .Fainted ; has monster fainted?
	inc d
.Fainted
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec c
	jr nz, .loop

	ld a, d ; how many available monsters are there?
	cp 2    ; don't bother if only 1
	jr nc, SwitchEnemyMon
	and a
	ret

SwitchEnemyMon:
; prepare to withdraw the active monster: copy HP, party pos, and status to roster
	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wEnemyMonHP
	ld bc, MON_STATUS + 1 - MON_HP ; also copies party pos in-between HP and status
	call CopyData

	ld hl, AIBattleWithdrawText
	call PrintText

	; This wFirstMonsNotOutYet variable is abused to prevent the player from
	; switching in a new mon in response to this switch.
	ld a, 1
	ld [wFirstMonsNotOutYet], a
	callfar EnemySendOut
	xor a
	ld [wFirstMonsNotOutYet], a

	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z
	scf
	ret

AIBattleWithdrawText:
	text_far _AIBattleWithdrawText
	text_end

AIUseFullHeal:
	call AIPlayRestoringSFX
	call AICureStatus
	ld a, FULL_HEAL
	jp AIPrintItemUse

AICureStatus:
; cures the status of enemy's active pokemon
	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1Status
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	xor a
	ld [hl], a ; clear status in enemy team roster
	ld [wEnemyMonStatus], a ; clear status of active enemy
	ld hl, wEnemyBattleStatus3
	res BADLY_POISONED, [hl]
	ret

AIUseXAccuracy: ; marcelnote - was unused, now used by Tamer
	call AIPlayRestoringSFX
	ld hl, wEnemyBattleStatus2
	set USING_X_ACCURACY, [hl]
	ld a, X_ACCURACY
	jp AIPrintItemUse

AIUseGuardSpec: ; marcelnote - modified
	and a ; clear carry flag in case no action taken
	ld hl, wEnemyBattleStatus2
	bit PROTECTED_BY_MIST, [hl] ; now checks if Mon already protected, if yes don't use it
	ret nz
	set PROTECTED_BY_MIST, [hl]
	call AIPlayRestoringSFX
	ld a, GUARD_SPEC
	jp AIPrintItemUse

AIUseDireHit: ; marcelnote - was unused, now modified and used by Bruno
	and a ; clear carry flag in case no action taken
	ld hl, wEnemyBattleStatus2
	bit GETTING_PUMPED, [hl] ; now checks if Mon already pumped, if yes don't use it
	ret nz
	set GETTING_PUMPED, [hl]
	call AIPlayRestoringSFX
	ld a, DIRE_HIT
	jp AIPrintItemUse

; Return carry if the enemy's current HP is below 1/a of its maximum.
; Special case: a == 1 means "below maximum" (any damage taken).
; Preserves bc, de, hl.
AICheckIfHPBelowFraction:
	push hl
	push bc
	push de
	cp 1
	jr nz, .notFullHP
	ld a, [wEnemyMonMaxHP]
	ld b, a
	ld a, [wEnemyMonHP]
	cp b
	jr c, .return
	ld a, [wEnemyMonMaxHP + 1]
	ld b, a
	ld a, [wEnemyMonHP + 1]
	cp b
	jr .return
.notFullHP
	ldh [hDivisor], a
	ld hl, wEnemyMonMaxHP
	xor a
	ldh [hDividend], a
	ldh [hDividend + 1], a
	ld a, [hli]
	ldh [hDividend + 2], a
	ld a, [hl]
	ldh [hDividend + 3], a
	call Divide
	ldh a, [hQuotient + 3]
	ld c, a
	ldh a, [hQuotient + 2]
	ld b, a
	ld hl, wEnemyMonHP + 1
	ld a, [hld]
	ld e, a
	ld a, [hl]
	sub b
	jr nz, .return
	ld a, e
	sub c
.return
	pop de
	pop bc
	pop hl
	ret

; Return carry if the player's current HP is below 1/a of their maximum.
; Special case: a == 1 means "below maximum".
; Preserves bc, de, hl.
AICheckIfPlayerHPBelowFraction:
	push hl
	push bc
	push de
	cp 1
	jr nz, .notFullHP
	ld a, [wBattleMonMaxHP]
	ld b, a
	ld a, [wBattleMonHP]
	cp b
	jr c, .return
	ld a, [wBattleMonMaxHP + 1]
	ld b, a
	ld a, [wBattleMonHP + 1]
	cp b
	jr .return
.notFullHP
	ldh [hDivisor], a
	ld hl, wBattleMonMaxHP
	xor a
	ldh [hDividend], a
	ldh [hDividend + 1], a
	ld a, [hli]
	ldh [hDividend + 2], a
	ld a, [hl]
	ldh [hDividend + 3], a
	call Divide
	ldh a, [hQuotient + 3]
	ld c, a
	ldh a, [hQuotient + 2]
	ld b, a
	ld hl, wBattleMonHP + 1
	ld a, [hld]
	ld e, a
	ld a, [hl]
	sub b
	jr nz, .return
	ld a, e
	sub c
.return
	pop de
	pop bc
	pop hl
	ret

AIUseXAttack:
	ld b, ATTACK_UP1_EFFECT
	ld a, X_ATTACK
	jr AIIncreaseStat

AIUseXDefend:
	ld b, DEFENSE_UP1_EFFECT
	ld a, X_DEFEND
	jr AIIncreaseStat

AIUseXSpeed:
	ld b, SPEED_UP1_EFFECT
	ld a, X_SPEED
	jr AIIncreaseStat

AIUseXSpecial:
	ld b, SPECIAL_UP1_EFFECT
	ld a, X_SPECIAL
	; fallthrough

AIIncreaseStat:
	ld [wAIItem], a
	push bc
	call AIPrintItemUse_
	pop bc
	ld hl, wEnemyMoveEffect
	ld a, [hld]
	push af
	ld a, [hl]
	push af
	push hl
	ld a, XSTATITEM_DUPLICATE_ANIM
	ld [hli], a
	ld [hl], b
	callfar StatModifierUpEffect
	pop hl
	pop af
	ld [hli], a
	pop af
	ld [hl], a
	jp DecrementAICount

AIPrintItemUse:
	ld [wAIItem], a
	call AIPrintItemUse_
	jp DecrementAICount

AIPrintItemUse_:
; print "x used [wAIItem] on z!"
	ld a, [wAIItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, AIBattleUseItemText
	jp PrintText

AIBattleUseItemText:
	text_far _AIBattleUseItemText
	text_end
