TransformEffect_: ; marcelnote - optimized and fixed bugs
	ldh a, [hWhoseTurn]
	and a ; player turn?
	ld hl, wPlayerBattleStatus2
	ld a, [wEnemyBattleStatus1]
	jr z, .hitTest
	ld hl, wEnemyBattleStatus2
	ld a, [wPlayerBattleStatus1]
.hitTest
	bit INVULNERABLE, a
	jp nz, EffectPrintButItFailedText
; animation(s) played are different if user has Substitute up
	bit HAS_SUBSTITUTE_UP, [hl]
	push af ; save substitute flag
	ld hl, HideSubstituteShowMonAnim
	ld b, BANK(HideSubstituteShowMonAnim)
	call nz, Bankswitch
	ld a, [wOptions]
	ASSERT BIT_BATTLE_ANIM_OFF == 7
	add a ; battle animations off?
	ld hl, PlayCurrentMoveAnimation
	ld b, BANK(PlayCurrentMoveAnimation)
	jr nc, .gotAnimToPlay
	ld hl, AnimationTransformMon
	ld b, BANK(AnimationTransformMon)
.gotAnimToPlay
	rst _Bankswitch ; marcelnote - free space in Home bank, changed from call Bankswitch
	pop af  ; restore substitute flag
	ld hl, ReshowSubstituteAnim
	ld b, BANK(ReshowSubstituteAnim)
	call nz, Bankswitch
	ldh a, [hWhoseTurn]
	and a ; player turn?
	jr z, .playerPointers
; enemy's turn: save its original DVs before overwriting them
	ld a, [wEnemyMonDVs]
	ld [wTransformedEnemyMonOriginalDVs], a
	ld a, [wEnemyMonDVs + 1]
	ld [wTransformedEnemyMonOriginalDVs + 1], a
	ld bc, wBattleMonSpecies
	ld de, wEnemyMonSpecies
	ld hl, wEnemyBattleStatus3
	jr .gotPointers
.playerPointers
; player's turn: reset move list index to 0
	ld [wPlayerMoveListIndex], a
	ld bc, wEnemyMonSpecies
	ld de, wBattleMonSpecies
	ld hl, wPlayerBattleStatus3
.gotPointers
	set TRANSFORMED, [hl] ; mon is now transformed
	ld h, b
	ld l, c
; transform user into opposing Pokemon species
	ld a, [hl]
	ld [de], a
	ld [wNamedObjectIndex], a ; for GetMonName below
; copy type 1, type 2, catch rate, moves, and DVs
	ld bc, wBattleMonType1 - wBattleMonSpecies ; = $5
	add hl, bc ; hl points to target's type 1
	inc de
	inc de
	inc de
	inc de
	inc de     ; de points to user's type 1
	ld c, wBattleMonLevel - wBattleMonType1 ; b = 0 still
	call CopyData
; Skip level and max HP
	inc hl
	inc hl
	inc hl
	inc de
	inc de
	inc de
; Attack, Defense, Speed, and Special stats
	ld bc, (NUM_STATS - 1) * 2
	call CopyData
	ld bc, wBattleMonMoves - wBattleMonPP
	add hl, bc ; hl = wBattleMonMoves or wEnemyMonMoves
	lb bc, NUM_MOVES, 5
.copyPPLoop
	ld a, [hli]
	and a
	jr z, .noMove ; 0 PP for blank moves
	ld a, c       ; 5 PP for actual moves
.noMove
	ld [de], a
	inc de
	dec b
	jr nz, .copyPPLoop
; original (unmodified) stats and stat mods
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonUnmodifiedAttack
	ld de, wPlayerMonUnmodifiedAttack
	jr z, .gotStatsPointers
	ld hl, wPlayerMonUnmodifiedAttack
	ld de, wEnemyMonUnmodifiedAttack
.gotStatsPointers
	ld bc, wEnemyMonStatModsEnd - wEnemyMonUnmodifiedAttack
	call CopyData
	call GetMonName
	ld hl, TransformedText
	jp PrintText

TransformedText:
	text_far _TransformedText
	text_end
