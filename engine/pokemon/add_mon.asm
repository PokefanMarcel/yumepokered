_AddPartyMon::
; Adds a new mon to the player's or enemy's party.
; [wMonDataLocation] is used in an unusual way in this function.
; If the lower nybble is 0, the mon is added to the player's party, else the enemy's.
; If the entire value is 0, then the player is allowed to name the mon.
	ld de, wPartyCount
	ld a, [wMonDataLocation]
	and $f
	jr z, .next
	ld de, wEnemyPartyCount
.next
	ld a, [de]
	inc a
	cp PARTY_LENGTH + 1
	ret nc ; return if the party is already full
	ld [de], a
	ld a, [de]
	ldh [hNewPartyLength], a
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry
	ld a, [wCurPartySpecies]
	ld [de], a ; write species of new mon in party list
	inc de
	ld a, $ff ; terminator
	ld [de], a
	ld hl, wPartyMonOT
	ld a, [wMonDataLocation]
	and $f
	jr z, .next2
	ld hl, wEnemyMonOT
.next2
	ldh a, [hNewPartyLength]
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	ld hl, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData
	ld a, [wMonDataLocation]
	and a
	jr nz, .skipNaming
	ld hl, wPartyMonNicks
	ldh a, [hNewPartyLength]
	dec a
	call SkipFixedLengthTextEntries
	ld a, NAME_MON_SCREEN
	ld [wNamingScreenType], a
	predef AskName
.skipNaming
	ld hl, wPartyMons
	ld a, [wMonDataLocation]
	and $f
	jr z, .next3
	ld hl, wEnemyMons
.next3
	ldh a, [hNewPartyLength]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld e, l
	ld d, h
	push hl
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetMonHeader
	ld hl, wMonHeader
	ld a, [hli]
	ld [de], a ; species
	inc de
	pop hl
	push hl
	ld a, [wMonDataLocation]
	and $f
	ld a, ATKDEFDV_TRAINER  ; set enemy trainer mon IVs to fixed average values
	ld b, SPDSPCDV_TRAINER
	jr nz, .next4

; If the mon is being added to the player's party, update the pokedex.
	ld a, [wCurPartySpecies]
	ld [wPokedexNum], a
	push de
	predef IndexToPokedex
	pop de
	ld a, [wPokedexNum]
	dec a
	ld c, a
	ld b, FLAG_TEST
	ld hl, wPokedexOwned
	call FlagAction
	;ld a, c ; whether the mon was already flagged as owned
	;ld [wUnusedAlreadyOwnedFlag], a
	ld a, [wPokedexNum]
	dec a
	ld c, a
	ld b, FLAG_SET
	push bc
	call FlagAction
	pop bc
	ld hl, wPokedexSeen
	call FlagAction

	pop hl
	push hl

	ld a, [wIsInBattle]
	and a ; is this a wild mon caught in battle?
	jr nz, .copyEnemyMonData

; Not wild.
	call Random ; generate random IVs
	ld b, a
	call Random

.next4
	push bc
	ld bc, MON_DVS
	add hl, bc
	pop bc
	ld [hli], a
	ld [hl], b         ; write IVs
	ld bc, (MON_HP_EXP - 1) - (MON_DVS + 1)
	add hl, bc
	ld a, 1
	ld c, a
	xor a
	ld b, a
	call CalcStat      ; calc HP stat (set cur Hp to max HP)
	ldh a, [hMultiplicand+1]
	ld [de], a
	inc de
	ldh a, [hMultiplicand+2]
	ld [de], a
	inc de
	xor a
	ld [de], a         ; box level
	inc de
	ld [de], a         ; status ailments
	inc de
	jr .copyMonTypesAndMoves
.copyEnemyMonData
	ld bc, MON_DVS
	add hl, bc
	ld a, [wEnemyMonDVs] ; copy IVs from cur enemy mon
	ld [hli], a
	ld a, [wEnemyMonDVs + 1]
	ld [hl], a
	ld a, [wEnemyMonHP]    ; copy HP from cur enemy mon
	ld [de], a
	inc de
	ld a, [wEnemyMonHP+1]
	ld [de], a
	inc de
	xor a
	ld [de], a                ; box level
	inc de
	ld a, [wEnemyMonStatus]   ; copy status ailments from cur enemy mon
	ld [de], a
	inc de
.copyMonTypesAndMoves
	ld hl, wMonHTypes
	ld a, [hli]       ; type 1
	ld [de], a
	inc de
	ld a, [hli]       ; type 2
	ld [de], a
	inc de
	ld a, [hli]       ; catch rate (held item in gen 2)
	ld [de], a
	ld hl, wMonHMoves
	ld a, [hli]
	inc de
	push de
	ld [de], a
	ld a, [hli]
	inc de
	ld [de], a
	ld a, [hli]
	inc de
	ld [de], a
	ld a, [hli]
	inc de
	ld [de], a
	push de
	dec de
	dec de
	dec de
	xor a
	ld [wLearningMovesFromDayCare], a
	predef WriteMonMoves
	pop de
	ld a, [wPlayerID]  ; set trainer ID to player ID
	inc de
	ld [de], a
	ld a, [wPlayerID + 1]
	inc de
	ld [de], a
	push de
	ld a, [wCurEnemyLevel]
	ld d, a
	callfar CalcExperience
	pop de
	inc de
	ldh a, [hExperience] ; write experience
	ld [de], a
	inc de
	ldh a, [hExperience + 1]
	ld [de], a
	inc de
	ldh a, [hExperience + 2]
	ld [de], a
	xor a
	ld b, NUM_STATS * 2
.writeEVsLoop              ; set all EVs to 0
	inc de
	ld [de], a
	dec b
	jr nz, .writeEVsLoop
	inc de
	inc de
	pop hl
	call AddPartyMon_WriteMovePP
	inc de
	ld a, [wCurEnemyLevel]
	ld [de], a
	inc de
	ld a, [wIsInBattle]
	dec a
	jr nz, .calcFreshStats
	ld hl, wEnemyMonMaxHP
	ld bc, NUM_STATS * 2
	call CopyData          ; copy stats of cur enemy mon
	pop hl
	jr .done
.calcFreshStats
	pop hl
	ld bc, MON_HP_EXP - 1
	add hl, bc
	ld b, $0
	call CalcStats         ; calculate fresh set of stats
.done
	scf
	ret

LoadMovePPs:
	call GetPredefRegisters
	; fallthrough
AddPartyMon_WriteMovePP:
	ld b, NUM_MOVES
.pploop
	ld a, [hli]     ; read move ID
	and a
	jr z, .empty
	dec a
	push hl
	push de
	push bc
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wMoveData
	ld a, BANK(Moves)
	call FarCopyData
	pop bc
	pop de
	pop hl
	ld a, [wMoveData + MOVE_PP]
.empty
	inc de
	ld [de], a
	dec b
	jr nz, .pploop ; there are still moves to read
	ret

; adds enemy mon [wCurPartySpecies] (at position [wWhichPokemon] in enemy list) to own party
; used in the cable club trade center
_AddEnemyMonToPlayerParty::
	ld hl, wPartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	scf
	ret z            ; party full, return failure
	inc a
	ld [hl], a       ; add 1 to party members
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wCurPartySpecies]
	ld [hli], a      ; add mon as last list entry
	ld [hl], $ff     ; write new sentinel
	ld hl, wPartyMons
	ld a, [wPartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wLoadedMon
	call CopyData    ; write new mon's data (from wLoadedMon)
	ld hl, wPartyMonOT
	ld a, [wPartyCount]
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	ld hl, wEnemyMonOT
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld bc, NAME_LENGTH
	call CopyData    ; write new mon's OT name (from an enemy mon)
	ld hl, wPartyMonNicks
	ld a, [wPartyCount]
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	ld hl, wEnemyMonNicks
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld bc, NAME_LENGTH
	call CopyData    ; write new mon's nickname (from an enemy mon)
	ld a, [wCurPartySpecies]
	ld [wPokedexNum], a
	predef IndexToPokedex
	ld a, [wPokedexNum]
	dec a
	ld c, a
	ld b, FLAG_SET
	ld hl, wPokedexOwned
	push bc
	call FlagAction ; add to owned pokemon
	pop bc
	ld hl, wPokedexSeen
	call FlagAction ; add to seen pokemon
	and a
	ret                  ; return success

; marcelnote - revamped Bill's PC, replaces _MoveMon, now only handles Daycare deposit and withdrawal
_CopyMonDaycare::
	ld a, [wCopyMonType]
	and a ; DAYCARE_TO_PARTY?
	jr nz, .partyToDaycare

	; Copy species.
	ld hl, wPartyCount
	ld a, [hli]         ; hl = wPartySpecies
	ld c, a
	ld b, 0
	add hl, bc          ; hl = wPartySpecies<n> (current party list terminator)
	ld a, [wDayCareMon]
	ld [hli], a
	ld [hl], $ff        ; new sentinel

	; Copy mon data.
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wPartyCount] ; old party count
	call AddNTimes
	push hl ; save hl = wPartyMons<n>
	ld d, h
	ld e, l ; de = wPartyMons<n>
	ld hl, wDayCareMon
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyData

	; Copy OT.
	ld hl, wPartyMonOT
	ld a, [wPartyCount] ; old party count
	call SkipFixedLengthTextEntries ; sets bc = NAME_LENGTH
	ld d, h
	ld e, l ; de = wPartyMon<n>OT
	ld hl, wDayCareMonOT
	call CopyData

	; Copy nickname.
	ld hl, wPartyMonNicks
	ld a, [wPartyCount] ; old party count
	call SkipFixedLengthTextEntries ; sets bc = NAME_LENGTH
	ld d, h
	ld e, l ; de = wPartyMon<n>Nick
	ld hl, wDayCareMonName
	call CopyData

	; Update party count.
	ld hl, wPartyCount
	inc [hl]

	; Compute the new party mon's level and stats from its experience.
	ld a, DAYCARE_DATA
	ld [wMonDataLocation], a
	call LoadMonData
	callfar CalcLevelFromExperience
	ld a, d
	ld [wCurEnemyLevel], a
	pop hl ; restore hl = wPartyMon<n>
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc ; hl = wPartyMon<n>Level
	ld [hli], a
	ld d, h
	ld e, l    ; de = wPartyMon<n>Stats
	ld bc, (MON_HP_EXP - 1) - MON_STATS
	add hl, bc ; hl = wPartyMon<n>HPExp - 1
	ld b, 1    ; consider stat exp
	jp CalcStats

.partyToDaycare
	; Copy wPartyMon<n> into the daycare slot.
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	push hl ; save hl = wPartyMon<n>
	ld de, wDayCareMon
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyData

	; Copy the party mon's level into wDayCareMonBoxLevel.
	pop hl ; restore hl = wPartyMon<n>
	ld bc, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [wDayCareMonBoxLevel], a

	; Copy OT.
	ld hl, wPartyMonOT
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries ; sets bc = NAME_LENGTH
	ld de, wDayCareMonOT
	call CopyData

	; Copy nickname.
	ld hl, wPartyMonNicks
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries ; sets bc = NAME_LENGTH
	ld de, wDayCareMonName
	jp CopyData
