; marcelnote - imported file from pokeyellow to deal with Special Moves
;              maybe that frees up wLoneAttackNo
ReadTrainer:

; don't change any moves in a link battle
	ld a, [wLinkState]
	and a
	ret nz

; set [wEnemyPartyCount] to 0, [wEnemyPartySpecies] to FF
; XXX first is total enemy pokemon?
; XXX second is species of first pokemon?
	ld hl, wEnemyPartyCount
	xor a
	ld [hli], a
	dec a
	ld [hl], a

; get the pointer to trainer data for this class
	ld a, [wTrainerClass] ; get trainer class
	dec a
	add a
	ld hl, TrainerDataPointers
	ld c, a
	ld b, 0
	add hl, bc ; hl points to trainer class
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wTrainerNo]
	ld b, a
; At this point b contains the trainer number,
; and hl points to the trainer class.
; Our next task is to iterate through the trainers,
; decrementing b each time, until we get to the right one.
.outer
	dec b
	jr z, .IterateTrainer
.inner
	ld a, [hli]
	and a
	jr nz, .inner
	jr .outer

; if the first byte of trainer data is FF,
; - each pokemon has a specific level
;      (as opposed to the whole team being of the same level)
; - if [wLoneAttackNo] != 0, one pokemon on the team has a special move
; else the first byte is the level of every pokemon on the team
.IterateTrainer
	ld a, [hli]
	cp $FF ; is the trainer special?
	jr z, .SpecialTrainer ; if so, check for special moves
	ld [wCurEnemyLevel], a
.LoopTrainerData
	ld a, [hli]
	and a ; have we reached the end of the trainer data?
	jp z, .AddSpecialMoveData
	ld [wCurPartySpecies], a
	ld a, ENEMY_PARTY_DATA
	ld [wMonDataLocation], a ; if this is 1, added to Enemy party, else Player's
	push hl
	call AddPartyMon
	pop hl
	jr .LoopTrainerData
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; marcelnote - new for Battle Hall
.BattleHallTrainer
	ld hl, wPartyMon1Level
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [hl]
	ld d, 2 ; need to check 2 more Mons
.findMaxPartyLevelLoop
	add hl, bc
	ld e, [hl]
	cp e
	jr nc, .notHigher
	ld a, e
.notHigher
	dec d
	jr nz, .findMaxPartyLevelLoop
	ld [wCurEnemyLevel], a ; now a is max level of party Mons

	CheckEvent EVENT_BEAT_YELLOW
	ld hl, BattleHallMonsBeatYellowStart
	ld de, BattleHallMonsEnd - BattleHallMonsBeatYellowStart
	jr nz, .gotList
	CheckEvent EVENT_BECAME_CHAMPION
	ld hl, BattleHallMonsBeatChampionStart
	ld de, BattleHallMonsEnd - BattleHallMonsBeatChampionStart
	jr nz, .gotList
	ld hl, BattleHallMonsDefaultStart
	ld de, BattleHallMonsEnd - BattleHallMonsDefaultStart
.gotList
	; here e holds the number of Mons in the list
	ld d, 3 ; need to load 3 Mons
	ld b, 0 ; we'll need to add c to hl
.FillBattleHallTeamLoop
	call Random ; random number 0-255 in a
	cp e        ; we need a < e
	jr nc, .FillBattleHallTeamLoop ; a is too large, draw another
	; could also check if Mon already in team?
	ld c, a
	push hl
	add hl, bc
	ld a, [hl]
	pop hl
	ld [wCurPartySpecies], a
	ld a, ENEMY_PARTY_DATA
	ld [wMonDataLocation], a ; if this is 1, added to Enemy party, else Player's
	call AddPartyMon
	dec d
	ret z ; no need to .FinishUp since no money in Battle Hall
	jr .FillBattleHallTeamLoop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SpecialTrainer
	;;;;;;;;;;;;;;; marcelnote - new for Battle Hall
	ld a, [wTrainerClass]
	cp RED
	jr nc, .BattleHallTrainer
	;;;;;;;;;;;;;;;
; if this code is being run:
; - each pokemon has a specific level
;      (as opposed to the whole team being of the same level)
; - if [wLoneAttackNo] != 0, one pokemon on the team has a special move
.SpecialTrainerLoop
	ld a, [hli]
	and a ; have we reached the end of the trainer data?
	jr z, .AddSpecialMoveData
	ld [wCurEnemyLevel], a
	ld a, [hli]
	ld [wCurPartySpecies], a
	ld a, ENEMY_PARTY_DATA
	ld [wMonDataLocation], a
	push hl
	call AddPartyMon
	pop hl
	jr .SpecialTrainerLoop
.AddSpecialMoveData
; does the trainer have special move data?
	ld a, [wTrainerClass]
	ld b, a    ; b has trainer class (e.g. 2 for BUG_CATCHER, 0 is NOBODY)
	ld a, [wTrainerNo]
	ld c, a    ; c has trainer number (starts at 1)
	ld hl, SpecialTrainerMoves
.loopSpecialMoveData
; check if the first two elements of the SpecialTrainerMoves entry match b and c, if not skip that entry
	ld a, [hli]
	cp $ff
	jr z, .FinishUp
	cp b
	jr nz, .loopSkipTrainer
	ld a, [hli]
	cp c
	jr nz, .loopSkipTrainer
	ld d, h
	ld e, l
.writeSpecialMoveDataLoop
	ld a, [de]
	inc de
	;and a
	cp $ff ; marcelnote - new terminator to prevent issues with NO_MOVE
	jp z, .FinishUp
	dec a
	ld hl, wEnemyMon1Moves
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld a, [de]
	inc de
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [de]
	inc de
	ld [hl], a
	jr .writeSpecialMoveDataLoop
.loopSkipTrainer
	ld a, [hli]
	;and a
	cp $ff ; marcelnote - new terminator to prevent issues with NO_MOVE
	jr nz, .loopSkipTrainer
	jr .loopSpecialMoveData
.FinishUp
; clear wAmountMoneyWon addresses
	xor a
	ld de, wAmountMoneyWon
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	ld a, [wCurEnemyLevel]
	ld b, a
.LastLoop
; update wAmountMoneyWon addresses (money to win) based on enemy's level
	ld hl, wTrainerBaseMoney + 1
	ld c, 2 ; wAmountMoneyWon is a 3-byte number
	push bc
	predef AddBCDPredef
	pop bc
	inc de
	inc de
	dec b
	jr nz, .LastLoop ; repeat wCurEnemyLevel times
	ret

; marcelnote -
; These are the lists of Mons for random battles.
; Becoming champion or beating Yellow unlocks new Mons to fight against.
BattleHallMonsBeatYellowStart:
	db ARTICUNO
	db ZAPDOS
	db MOLTRES
	db MEWTWO
	db MEW
BattleHallMonsBeatChampionStart:
	db VENUSAUR
	db CHARIZARD
	db BLASTOISE
	db ALAKAZAM
	db MACHAMP
	db GOLEM
	db GENGAR
	db LAPRAS
	db OMASTAR
	db KABUTOPS
	db AERODACTYL
	db DRAGONITE
BattleHallMonsDefaultStart:
	;db BULBASAUR
	db IVYSAUR
	;db VENUSAUR
	;db CHARMANDER
	db CHARMELEON
	;db CHARIZARD
	;db SQUIRTLE
	db WARTORTLE
	;db BLASTOISE
	;db CATERPIE
	;db METAPOD
	db BUTTERFREE
	;db WEEDLE
	;db KAKUNA
	db BEEDRILL
	;db PIDGEY
	;db PIDGEOTTO
	db PIDGEOT
	;db RATTATA
	db RATICATE
	;db SPEAROW
	db FEAROW
	;db EKANS
	db ARBOK
	;db PIKACHU
	db RAICHU
	;db SANDSHREW
	db SANDSLASH
	;db NIDORAN_F
	db NIDORINA
	db NIDOQUEEN
	;db NIDORAN_M
	db NIDORINO
	db NIDOKING
	;db CLEFAIRY
	db CLEFABLE
	;db VULPIX
	db NINETALES
	;db JIGGLYPUFF
	db WIGGLYTUFF
	;db ZUBAT
	db GOLBAT
	;db ODDISH
	db GLOOM
	db VILEPLUME
	;db PARAS
	db PARASECT
	;db VENONAT
	db VENOMOTH
	;db DIGLETT
	db DUGTRIO
	;db MEOWTH
	db PERSIAN
	;db PSYDUCK
	db GOLDUCK
	;db MANKEY
	db PRIMEAPE
	;db GROWLITHE
	db ARCANINE
	;db POLIWAG
	db POLIWHIRL
	db POLIWRATH
	;db ABRA
	db KADABRA
	;db ALAKAZAM
	;db MACHOP
	db MACHOKE
	;db MACHAMP
	;db BELLSPROUT
	db WEEPINBELL
	db VICTREEBEL
	;db TENTACOOL
	db TENTACRUEL
	;db GEODUDE
	db GRAVELER
	;db GOLEM
	;db PONYTA
	db RAPIDASH
	;db SLOWPOKE
	db SLOWBRO
	;db MAGNEMITE
	db MAGNETON
	db FARFETCHD
	;db DODUO
	db DODRIO
	;db SEEL
	db DEWGONG
	;db GRIMER
	db MUK
	;db SHELLDER
	db CLOYSTER
	;db GASTLY
	db HAUNTER
	;db GENGAR
	db ONIX
	;db DROWZEE
	db HYPNO
	;db KRABBY
	db KINGLER
	;db VOLTORB
	db ELECTRODE
	;db EXEGGCUTE
	db EXEGGUTOR
	;db CUBONE
	db MAROWAK
	db HITMONLEE
	db HITMONCHAN
	db LICKITUNG
	;db KOFFING
	db WEEZING
	;db RHYHORN
	db RHYDON
	db CHANSEY
	db TANGELA
	db KANGASKHAN
	;db HORSEA
	db SEADRA
	;db GOLDEEN
	db SEAKING
	;db STARYU
	db STARMIE
	db MR_MIME
	db SCYTHER
	db JYNX
	db ELECTABUZZ
	db MAGMAR
	db PINSIR
	db TAUROS
	;db MAGIKARP
	db GYARADOS
	;db LAPRAS
	db DITTO
	db EEVEE
	db VAPOREON
	db JOLTEON
	db FLAREON
	db PORYGON
	;db OMANYTE
	;db OMASTAR
	;db KABUTO
	;db KABUTOPS
	;db AERODACTYL
	db SNORLAX
	;db ARTICUNO
	;db ZAPDOS
	;db MOLTRES
	;db DRATINI
	db DRAGONAIR
	;db DRAGONITE
	;db MEWTWO
	;db MEW
BattleHallMonsEnd:
