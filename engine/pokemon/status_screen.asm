; marcelnote - the status screen code was extensively modified for new features
StatusScreen:
	ld hl, wStatusFlags2
	set BIT_NO_AUDIO_FADE_OUT, [hl]
	ld a, $33
	ldh [rNR50], a ; Reduce the volume
	;call GBPalWhiteOutWithDelay3
	;call ClearScreen
	;call UpdateSprites
	;call LoadHpBarAndStatusTilePatterns ; marcelnote - reorganized Battle HUD tiles, no need to load tiles here anymore
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a

.loadMonData ; label for later feature: jump here when moving from one Mon to the next
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call UpdateSprites
	call LoadStatExpTilePatterns

	call LoadMonData
	ld a, [wMonDataLocation]
	cp BOX_DATA
	jr c, .DontRecalculate
; mon is in a box or daycare
	ld a, [wLoadedMonBoxLevel]
	ld [wLoadedMonLevel], a
	ld [wCurEnemyLevel], a
	ld hl, wLoadedMonHPExp - 1
	ld de, wLoadedMonStats
	ld b, $1
	call CalcStats ; Recalculate stats
.DontRecalculate

	; first load the stuff in common to both pages: upper box, Pokemon number (not sprite though!)
	hlcoord 19, 1
	lb bc, 6, 10
	call DrawLineBox ; Draws the box around name, HP and status

	hlcoord 2, 7
	ld [hl], "№"
	inc hl
	ld [hl], "<DOT>"
	; fallthrough



StatusScreenStatsPage:
	hlcoord 19, 0
	ld a, "▶"
	ld [hl], a

	; this could in principle be outside, but for some reason doing this bugs the Pokemon species and exp
	; maybe something reuses the modified wPokedexNum later
	ld a, [wMonHIndex]
	ld [wPokedexNum], a
	ld [wCurSpecies], a ; commenting this line out triggers the bug
	predef IndexToPokedex
	hlcoord 4, 7
	ld de, wPokedexNum
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber ; Pokémon no.

	ld hl, NamePointers2
	call .GetStringPointer
	ld d, h
	ld e, l
	hlcoord 9, 1
	call PlaceString ; Pokémon nickname

	hlcoord 13, 2
	call PrintLevel ; Pokémon level

	xor a ; no vertical bar on right tip of HP bar
	ld [wHPBarType], a
	hlcoord 10, 3
	predef DrawHP
	ld hl, wStatusScreenHPBarColor
	call GetHealthBarColor
	ld b, SET_PAL_STATUS_SCREEN
	call RunPaletteCommand ; Pokémon HP bar

	hlcoord 9, 6
	ld de, StatusScreenStatusText
	call PlaceString ; "STATUS/"

	hlcoord 16, 6
	ld de, wLoadedMonStatus
	call PrintStatusCondition ; "PSN", "SLP", ...
	jr nz, .StatusWritten
	hlcoord 16, 6
	ld de, StatusScreenOKText
	call PlaceString ; "OK"
.StatusWritten

	hlcoord 10, 9
	ld de, StatusScreenTypeText
	call PlaceString ; "TYPE/"

	hlcoord 11, 10
	predef PrintMonType ; Pokémon type

	hlcoord 10, 12
	ld de, StatusScreenOTText
	call PlaceString ; "OT/" and "IDNo."

	ld hl, OTPointers
	call .GetStringPointer
	ld d, h
	ld e, l
	hlcoord 11, 13
	call PlaceString ; Original Trainer

	hlcoord 13, 14
	ld de, wLoadedMonOTID
	lb bc, LEADING_ZEROES | 2, 5
	call PrintNumber ; ID Number

	CheckEvent EVENT_PASSED_SENIOR_TEST ; only visible after passing Senior test at Pokémon Academy
	call nz, PlaceInfoStartAndStatsGraphics ; for switching between stats displayed

	hlcoord 19, 9
	lb bc, 8, 7
	call DrawLineBox ; Draws the box around name, HP and status

	ld d, $0 ; d=0 for status screen, d=1 for level up
	call PrintStatsBox

	ld a, [wStatusFlags2]
	bit BIT_PLAYED_CRY, a
	jr nz, .waitButtonPress ; skip drawing image and playing cry if already done
	call GBPalNormal
	hlcoord 1, 0
	call LoadFlippedFrontSpriteByMonIndex ; draw Pokémon picture
	ld a, [wCurPartySpecies]
	call PlayCry
	ld hl, wStatusFlags2
	set BIT_PLAYED_CRY, [hl]

.waitButtonPress
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	bit B_PAD_B, a
	jp nz, StatusScreenExit
	bit B_PAD_START, a ; marcelnote - switch between Stats and DVs
	jr nz, .switchStatsDVsStatExp
	;bit B_PAD_DOWN, a ; marcelnote - for switching up and down
	;jr nz, .checkIfLastMon
	and PAD_A | PAD_RIGHT
	jr nz, StatusScreenMovesPage
	jr .waitButtonPress

.switchStatsDVsStatExp
	CheckEvent EVENT_PASSED_SENIOR_TEST
	jr z, .waitButtonPress ; only visible after passing Senior test at Pokémon Academy
	ld a, SFX_TINK
	call PlaySound
	hlcoord 15, 16 ; fifth letter of current text
	ld a, [hl]
	cp "S" ; text currently saying "STATS"?
	jp z, SwitchToDVs ; if yes, switch to DVs
	cp " " ; text currently saying "DVS"?
	jp z, SwitchToStatExp ; if yes, switch to StatExp
	; if neither then switch to Stats
	jp SwitchToStats

;.checkIfLastMon
;	ld a, [wWhichPokemon]
;	cp 5 ; here need to account for team size wPartyCount, or number of Mons in box...
;	jr z, .waitButtonPress
;	inc a
;	ld [wWhichPokemon], a
;   ; also need to move cursor in the overarching list
;	ld hl, wStatusFlags2
;	res BIT_PLAYED_CRY, [hl]
;	jp StatusScreen.loadMonData

.GetStringPointer
	ld a, [wMonDataLocation]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMonDataLocation]
	cp DAYCARE_DATA
	ret z
	ld a, [wWhichPokemon]
	jp SkipFixedLengthTextEntries



StatusScreenMovesPage:
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld bc, NUM_MOVES + 1
	ld hl, wMoves
	call FillMemory
	ld hl, wLoadedMonMoves
	ld de, wMoves
	ld bc, NUM_MOVES
	call CopyData
	callfar FormatMovesString

	call StatusScreenClearScreen ; clears name area, bottom screen part, and directional arrows

	hlcoord 0, 0
	ld a, "◀"
	ld [hl], a

	ld a, [wMonHIndex]
	ld [wNamedObjectIndex], a
	call GetMonName
	hlcoord 9, 1
	call PlaceString ; Pokémon species

	hlcoord 9, 3
	ld de, StatusScreenExpText
	call PlaceString ; "EXP.POINTS" and "LEVEL UP"

	hlcoord 14, 6
	ld de, StatusScreenToNextLevelText
	call PlaceString ; "to"

	ld a, [wLoadedMonLevel]
	push af
	cp MAX_LEVEL
	jr z, .Level100
	inc a
	ld [wLoadedMonLevel], a ; Increase temporarily if not 100
.Level100
	hlcoord 16, 6
	call PrintLevel ; Next level
	pop af
	ld [wLoadedMonLevel], a ; restore actual level
	; this needs to stay in that order
	ld de, wLoadedMonExp
	hlcoord 12, 4
	lb bc, 3, 7
	call PrintNumber ; Exp.Points
	; this needs to stay in that order
	call CalcExpToLevelUp
	ld de, wLoadedMonExp
	hlcoord 7, 6
	lb bc, 3, 7
	call PrintNumber ; Exp to Level Up
	call CalcExpToLevelUp ; this restores [wLoadedMonExp] to current Total Exp

	hlcoord 0, 8
	ld b, 8  ; y
	ld c, 12 ; x
	call TextBoxBorder ; Draw move container

	hlcoord 1, 9
	ld de, wMovesString
	call PlaceString ; Print moves
	ld a, [wNumMovesMinusOne]
	inc a
	ld c, a
	ld a, $4
	sub c
	ld b, a ; Number of moves ?
	hlcoord 5, 10
	ld de, SCREEN_WIDTH * 2
	ld a, "<BOLD_P>"
	call StatusScreen_PrintPP ; Print "PP"
	ld a, b
	and a
	jr z, .InitPP
	ld c, a
	ld a, "-"
	call StatusScreen_PrintPP ; Fill the rest with --
.InitPP
	ld hl, wLoadedMonMoves
	decoord 8, 10
	ld b, 0
.PrintPP
	ld a, [hli]
	and a
	jr z, .PPDone
	push bc
	push hl
	push de
	ld hl, wCurrentMenuItem
	ld a, [hl]
	push af
	ld [hl], b
	push hl
	callfar GetMaxPP
	pop hl
	pop af
	ld [hl], a
	pop de
	pop hl
	push hl
	ld bc, wPartyMon1PP - wPartyMon1Moves - 1
	add hl, bc
	ld a, [hl]
	and PP_MASK
	ld [wStatusScreenCurrentPP], a
	ld h, d
	ld l, e
	push hl
	ld de, wStatusScreenCurrentPP
	lb bc, 1, 2
	call PrintNumber
	ld a, "/"
	ld [hli], a
	ld de, wMaxPP
	lb bc, 1, 2
	call PrintNumber
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop bc
	inc b
	ld a, b
	cp $4
	jr nz, .PrintPP
.PPDone

	hlcoord 14, 9
	ld de, StatusScreenFieldMoveText
	call PlaceString ; "SKILL"

	hlcoord 14, 11
	ld [hl], "-" ; by default write "-" for field move
	ld a, [wMonDataLocation]
	cp PLAYER_PARTY_DATA ; no field move if not in party
	jr nz, .FieldMoveDone
	ld a, [wWhichPokemon]
	ld c, a
	ld b, 0
	ld hl, wTempFieldMoves
	add hl, bc
	ld a, [hl]
	and a
	jr z, .FieldMoveDone
	ld [wNameListIndex], a
	ld a, BANK(MoveNames)
	ld [wPredefBank], a
	ld a, MOVE_NAME
	ld [wNameListType], a
	call GetName
	hlcoord 14, 11
	ld de, wNameBuffer
	call PlaceStringWithHyphen ; Field move
.FieldMoveDone

	ld a, $1
	ldh [hAutoBGTransferEnabled], a ; ??? could this be in initialization / exit instead
	call Delay3

.waitButtonPress
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	bit B_PAD_LEFT, a
	jr nz, .clearScreenAndGoBackToStats
	and PAD_A | PAD_B
	jr nz, StatusScreenExit
	jr .waitButtonPress

.clearScreenAndGoBackToStats
	call StatusScreenClearScreen ; clears name area, bottom screen part, and directional arrows
	jp StatusScreenStatsPage



StatusScreenExit:
	pop af
	ldh [hTileAnimations], a
	ld hl, wStatusFlags2
	res BIT_NO_AUDIO_FADE_OUT, [hl]
	res BIT_PLAYED_CRY, [hl]
	ld a, $77
	ldh [rAUDVOL], a
	call GBPalWhiteOut
	jp ClearScreen




OTPointers:
	dw wPartyMonOT
	dw wEnemyMonOT
	dw wBoxMonOT
	dw wDayCareMonOT

NamePointers2:
	dw wPartyMonNicks
	dw wEnemyMonNicks
	dw wBoxMonNicks
	dw wDayCareMonName



StatusScreenClearScreen:
	hlcoord 9, 1
	lb bc, 6, 10 ; y, x
	call ClearScreenArea ; Clear top part of screen
	hlcoord 0, 8
	lb bc, 10, 20 ; y, x
	call ClearScreenArea ; Clear bottom part of screen
	ld a, " "
	hlcoord 0, 0
	ld [hl], a
	hlcoord 19, 0
	ld [hl], a
	ret


; Draws a line starting from hl high b and wide c
DrawLineBox:
	ld de, SCREEN_WIDTH ; New line
.PrintVerticalLine
	ld [hl], "<HUD_VERTI_BAR>" ; │
	add hl, de
	dec b
	jr nz, .PrintVerticalLine
	ld [hl], "<RIGHT_CORNER>" ; ┘
	dec hl
.PrintHorizLine
	ld [hl], "<HUD_HORIZ_BAR>" ; ─
	dec hl
	dec c
	jr nz, .PrintHorizLine
	ld [hl], "<LEFT_TRIANGLE>" ; ← (halfarrow ending)
	ret


DrawHP:
; Draws the HP bar in the stats screen, party screen, and battle screen
	call GetPredefRegisters
	ld a, [wLoadedMonHP]
	ld b, a
	ld a, [wLoadedMonHP + 1]
	ld c, a
	or b
	jr nz, .nonzeroHP
	ld d, $6
	ld e, a  ; e = 0
	jp .drawHPBarAndPrintFraction
.nonzeroHP
	ld a, [wLoadedMonMaxHP]
	ld d, a
	ld a, [wLoadedMonMaxHP + 1]
	ld e, a
	predef HPBarLength ; preserves hl
	ld d, $6
	ld c, d  ; c = $6
.drawHPBarAndPrintFraction
	push de
	call DrawHPBar ; [wHPBarType] set before calling DrawHP
	ldh a, [hUILayoutFlags]
	bit BIT_PARTY_MENU_HP_BAR, a
	ld bc, $9 ; right of bar
	jr nz, .printFraction
	ld bc, SCREEN_WIDTH + 1 ; below bar
.printFraction
	add hl, bc
	ld de, wLoadedMonHP
	lb bc, 2, 3
	call PrintNumber
	ld a, "/"
	ld [hli], a
	ld de, wLoadedMonMaxHP
	lb bc, 2, 3
	call PrintNumber
	pop de ; e is used to determine bar color in SGB
	ret


PrintStatsBox:
	ld a, d
	and a ; a is 0 for the status screen
	jr nz, .LevelUpBox
	hlcoord 0, 8
	ld b, 8 ; y
	ld c, 8 ; x
	call TextBoxBorder ; Draws the box
	hlcoord 1, 9 ; Start printing stats from here
	ld bc, SCREEN_WIDTH + 3 ; Number offset
	jr .PrintStatsNames
.LevelUpBox
	hlcoord 9, 2
	ld b, 8 ; y
	ld c, 9 ; x
	call TextBoxBorder
	hlcoord 11, 3
	ld bc, SCREEN_WIDTH + 2
.PrintStatsNames
	push bc
	push hl
	ld de, StatsText
	call PlaceString
	pop hl
	pop bc
	add hl, bc
.PrintStats
	lb bc, 2, 5 ; for PrintNumber, b = 2 bytes and c = 5 digits
	ld de, wLoadedMonAttack
	call PrintStat
	ld de, wLoadedMonDefense
	call PrintStat
	ld de, wLoadedMonSpeed
	call PrintStat
	ld de, wLoadedMonSpecial
	jp PrintNumber

PrintStat:
	call PrintNumber
	ld de, SCREEN_WIDTH * 2 - 5
	add hl, de
	ret


SwitchToStats:
	call ClearStatsLines
	hlcoord 11, 4
	ld de, wLoadedMonHP
	lb bc, 2, 3
	call PrintNumber
	ld a, "/"
	ld [hli], a
	ld de, wLoadedMonMaxHP
	lb bc, 2, 3
	call PrintNumber
	hlcoord 4, 10
	call PrintStatsBox.PrintStats
	ld de, StatusScreenStatsText ; "STATS"
	call PlaceStatsDVsOrStatExpText
	jp StatusScreenStatsPage.waitButtonPress


SwitchToDVs: ; we'll use wTempByteValue to store DVs
	call ClearStatsLines
	hlcoord 4, 10
	lb bc, 1, 5 ; for PrintNumber, b = 1 byte and c = 5 digits

	ld de, wTempByteValue
	ld a, [wLoadedMonDVs]
	swap a
	and %00001111
	ld [de], a
	call PrintStat ; ATTACK

	ld de, wTempByteValue
	ld a, [wLoadedMonDVs]
	and %00001111
	ld [de], a
	call PrintStat ; DEFENSE

	ld de, wTempByteValue
	ld a, [wLoadedMonDVs+1]
	swap a
	and %00001111
	ld [de], a
	call PrintStat ; SPEED

	ld de, wTempByteValue
	ld a, [wLoadedMonDVs+1]
	and %00001111
	ld [de], a
	call PrintNumber ; SPECIAL

	ld hl, wLoadedMonDVs
	ld e, 0
	ld a, [hl]
	swap a
	rrca ; carry = Attack LSB
	rl e
	ld a, [hli]
	rrca ; carry = Defense LSB
	rl e
	ld a, [hl]
	swap a
	rrca ; carry = Speed LSB
	rl e
	ld a, [hl]
	rrca ; carry = Special LSB
	rl e
	ld a, e
	ld de, wTempByteValue
	ld [de], a
	hlcoord 13, 4
	call PrintNumber ; HP

	ld de, StatusScreenDVsText ; "DVs"
	call PlaceStatsDVsOrStatExpText
	jp StatusScreenStatsPage.waitButtonPress


SwitchToStatExp:
	call ClearStatsLines
;	hlcoord 5, 10 ; code to print numbers instead
;	lb bc, 2, 5 ; for PrintNumber, b = 2 byte and c = 5 digits
;	ld de, wLoadedMonAttackExp
;	call PrintStat
	hlcoord 12, 4
	ld de, wLoadedMonHPExp + 1 ; low byte
	call PrintStatBar
	hlcoord 3, 10
	ld de, wLoadedMonAttackExp + 1
	call PrintStatBar
	ld de, wLoadedMonDefenseExp + 1
	call PrintStatBar
	ld de, wLoadedMonSpeedExp + 1
	call PrintStatBar
	ld de, wLoadedMonSpecialExp + 1
	call PrintStatBar

	ld de, StatusScreenStatExpText ; "STAT.EXP"
	call PlaceStatsDVsOrStatExpText
	jp StatusScreenStatsPage.waitButtonPress


PrintStatBar:
	ld c, 0 ; extra pixel to handle full bar case
	ld a, [de] ; low byte of stat
	inc a      ; is low byte full?
	dec de     ; de -> high byte (flags unaffected)
	ld a, [de] ; high byte of stat
	jr nz, .notFull
	cp $ff     ; is high byte full?
	jr nz, .notFull
	inc c      ; if full stat, we'll add 1 pixel
.notFull
	srl a
	srl a
	srl a ; a = stat exp (0-31)
	add c ; when stat is full, add last pixel
	ld b, 4 ; b = number of tiles per bar
	ld c, a ; c = length of bar in pixels
	ld a, $d0 ; left bar tip ; to move back to $40 after improving uncompression routine
	ld [hli], a
.loopFullTile
	ld a, c
	sub 8
	jr c, .partialTile
	ld c, a
	ld a, $d9  ; full tile ; to move back to $49 after improving uncompression routine
	ld [hli], a
	dec b
	jr nz, .loopFullTile
	jr .finish
.partialTile
	add 8 + $d1 ; $41 = empty, $42 = 1px, etc ; to move back to $41... after improving uncompression routine
	ld [hli], a
	dec b
	jr z, .finish
	ld a, $d1 ; to move back to $41 after improving uncompression routine
.loopEmptyTile
	ld [hli], a
	dec b
	jr nz, .loopEmptyTile
.finish
	ld a, $da ; right tip ; to move back to $4a after improving uncompression routine
	ld [hl], a
	ld de, SCREEN_WIDTH * 2 - 5 ; line offset between bars
	add hl, de ; move hl to next bar start
	ret

LoadStatExpTilePatterns:
	ld de, StatExpBarGraphics
	ld hl, vFont tile $50 ; to move back to vChars2 tile $40 after improving uncompression routine
	lb bc, BANK(StatExpBarGraphics), (StatExpBarGraphicsEnd - StatExpBarGraphics) / $10
	jp CopyVideoData


ClearStatsLines:
	hlcoord 11, 4 ; first HP stats bar tile
	ld d, 7 ; number of tiles
	ld a, " "
.clearHP
	ld [hli], a
	dec d
	jr nz, .clearHP
; then in Stats box
	hlcoord 3, 10 ; first tile
	ld bc, 2*SCREEN_WIDTH - 6
	ld e, 4 ; number of stats
	ld a, " "
.loopStats
	ld d, 6 ; number of tiles
.loopTiles
	ld [hli], a
	dec d
	jr nz, .loopTiles
	add hl, bc
	dec e
	jr nz, .loopStats
	ret


PlaceInfoStartAndStatsGraphics:
	hlcoord 10, 15
	ld de, StatusScreenInfoText
	call PlaceString ; "INFO/"

	hlcoord 15, 15
	ld a, "<ST>" ; left of [START▶] button
	ld b, 3 ; 3 tiles long
.loop
	ld [hli], a
	inc a
	dec b
	jr nz, .loop

	ld de, StatusScreenStatsText ; "STATS"
	; fallthrough

PlaceStatsDVsOrStatExpText:
	hlcoord 11, 16
	jp PlaceString ; "STATS" or "DVS" or "STAT.EXP"


CalcExpToLevelUp:
	ld a, [wLoadedMonLevel]
	cp MAX_LEVEL
	jr z, .atMaxLevel
	inc a
	ld d, a
	callfar CalcExperience ; calculates experience needed for lvl a = [wLoadedMonLevel]+1
	ld hl, wLoadedMonExp + 2
	ldh a, [hExperience + 2]
	sub [hl]
	ld [hld], a
	ldh a, [hExperience + 1]
	sbc [hl]
	ld [hld], a
	ldh a, [hExperience]
	sbc [hl]
	ld [hld], a
	ret
.atMaxLevel
	ld hl, wLoadedMonExp
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret


StatusScreen_PrintPP:
; print PP or -- c times, going down two rows each time
	ld [hli], a
	ld [hld], a
	add hl, de
	dec c
	jr nz, StatusScreen_PrintPP
	ret


PlaceStringWithHyphen: ; to print field moves with hyphen after 4 letters (won't work for other languages)
	ld b, 4
.placeNextChar
	ld a, [de]
	cp "@"
	ret z
	ld [hli], a
	inc de
	dec b
	jr nz, .placeNextChar
	inc de
	ld a, [de] ; check the 6th character (Flash)
	dec de     ; go back to 5th
	cp "@"
	jr z, .placeNextChar
	ld a, "-"
	ld [hl], a
	ld bc, SCREEN_WIDTH - 4
	add hl, bc
	ld b, 0
	jr .placeNextChar


IF DEF(_FRA) ; marcelnote - added for translation
	INCLUDE "translation/fra/data/text/status_screen.fra.asm"
ELSE
	INCLUDE "data/text/status_screen.asm"
ENDC
