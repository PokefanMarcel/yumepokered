; marcelnote - merged 1F 2F 3F
CeladonMart1F2F3F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMart1F2F3F_TextPointers:
	def_text_pointers
	; object events
	dw_const CeladonMart1FReceptionistText,     TEXT_CELADONMART1F_RECEPTIONIST
	dw_const CeladonMart2FClerk1Text,           TEXT_CELADONMART2F_CLERK1
	dw_const CeladonMart2FClerk2Text,           TEXT_CELADONMART2F_CLERK2
	dw_const CeladonMart2FMiddleAgedManText,    TEXT_CELADONMART2F_MIDDLE_AGED_MAN
	dw_const CeladonMart2FGirlText,             TEXT_CELADONMART2F_GIRL
	dw_const CeladonMart2FBrunetteGirlText,     TEXT_CELADONMART2F_BRUNETTE_GIRL ; marcelnote - new NPC
	dw_const CeladonMart3FClerkText,            TEXT_CELADONMART3F_CLERK
	dw_const CeladonMart3FGameBoyKid1Text,      TEXT_CELADONMART3F_GAMEBOY_KID1
	dw_const CeladonMart3FGameBoyKid2Text,      TEXT_CELADONMART3F_GAMEBOY_KID2
	dw_const CeladonMart3FGameBoyKid3Text,      TEXT_CELADONMART3F_GAMEBOY_KID3
	dw_const CeladonMart3FLittleBoyText,        TEXT_CELADONMART3F_LITTLE_BOY
	; background events
	dw_const CeladonMart1FDirectorySignText,    TEXT_CELADONMART1F_DIRECTORY_SIGN
	dw_const CeladonMart1FCurrentFloorSignText, TEXT_CELADONMART1F_CURRENT_FLOOR_SIGN
	dw_const CeladonMart2FCurrentFloorSignText, TEXT_CELADONMART2F_CURRENT_FLOOR_SIGN
	dw_const CeladonMart3FSNESText,             TEXT_CELADONMART3F_SNES1
	dw_const CeladonMart3FRPGText,              TEXT_CELADONMART3F_RPG
	dw_const CeladonMart3FSNESText,             TEXT_CELADONMART3F_SNES2
	dw_const CeladonMart3FSportsGameText,       TEXT_CELADONMART3F_SPORTS_GAME
	dw_const CeladonMart3FSNESText,             TEXT_CELADONMART3F_SNES3
	dw_const CeladonMart3FPuzzleGameText,       TEXT_CELADONMART3F_PUZZLE_GAME
	dw_const CeladonMart3FSNESText,             TEXT_CELADONMART3F_SNES4
	dw_const CeladonMart3FFightingGameText,     TEXT_CELADONMART3F_FIGHTING_GAME
	dw_const CeladonMart3FCurrentFloorSignText, TEXT_CELADONMART3F_CURRENT_FLOOR_SIGN
	dw_const CeladonMart3FPokemonPosterText,    TEXT_CELADONMART3F_POKEMON_POSTER1
	dw_const CeladonMart3FPokemonPosterText,    TEXT_CELADONMART3F_POKEMON_POSTER2
	dw_const CeladonMart3FPokemonPosterText,    TEXT_CELADONMART3F_POKEMON_POSTER3

CeladonMart1FReceptionistText:
	text_far _CeladonMart1FReceptionistText
	text_end

CeladonMart1FDirectorySignText:
	text_far _CeladonMart1FDirectorySignText
	text_end

CeladonMart1FCurrentFloorSignText:
	text_far _CeladonMart1FCurrentFloorSignText
	text_end

CeladonMart2FMiddleAgedManText:
	text_far _CeladonMart2FMiddleAgedManText
	text_end

CeladonMart2FGirlText:
	text_far _CeladonMart2FGirlText
	text_end

CeladonMart2FBrunetteGirlText: ; marcelnote - new NPC
	text_far _CeladonMart2FBrunetteGirlText
	text_end

CeladonMart2FCurrentFloorSignText:
	text_far _CeladonMart2FCurrentFloorSignText
	text_end

CeladonMart2FClerk2Text: ; marcelnote - new text for dynamic list
	text_asm
	call MartTMClerkDialogue
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CeladonMart3FClerkText:
	text_asm
	CheckEvent EVENT_GOT_TM18
	jr nz, .got_item
	ld hl, .TM18PreReceiveText
	call PrintText
	lb bc, TM_COUNTER, 1
	call GiveItem
	jr nc, .bag_full
	SetEvent EVENT_GOT_TM18
	ld hl, .ReceivedTM18Text
	jr .done
.bag_full
	ld hl, .TM18NoRoomText
	jr .done
.got_item
	ld hl, .TM18ExplanationText
.done
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.TM18PreReceiveText:
	text_far _CeladonMart3FClerkTM18PreReceiveText
	text_end

.ReceivedTM18Text:
	text_far _CeladonMart3FClerkReceivedTM18Text
	sound_get_item_1
	text_end

.TM18ExplanationText:
	text_far _CeladonMart3FClerkTM18ExplanationText
	text_end

.TM18NoRoomText:
	text_far _CeladonMart3FClerkTM18NoRoomText
	text_end

CeladonMart3FGameBoyKid1Text:
	text_far _CeladonMart3FGameBoyKid1Text
	text_end

CeladonMart3FGameBoyKid2Text:
	text_far _CeladonMart3FGameBoyKid2Text
	text_end

CeladonMart3FGameBoyKid3Text:
	text_far _CeladonMart3FGameBoyKid3Text
	text_end

CeladonMart3FLittleBoyText:
	text_far _CeladonMart3FLittleBoyText
	text_end

CeladonMart3FSNESText:
	text_far _CeladonMart3FSNESText
	text_end

CeladonMart3FRPGText:
	text_far _CeladonMart3FRPGText
	text_end

CeladonMart3FSportsGameText:
	text_far _CeladonMart3FSportsGameText
	text_end

CeladonMart3FPuzzleGameText:
	text_far _CeladonMart3FPuzzleGameText
	text_end

CeladonMart3FFightingGameText:
	text_far _CeladonMart3FFightingGameText
	text_end

CeladonMart3FCurrentFloorSignText:
	text_far _CeladonMart3FCurrentFloorSignText
	text_end

CeladonMart3FPokemonPosterText:
	text_far _CeladonMart3FPokemonPosterText
	text_end


CeladonMart2FClerk1Text: ; marcelnote - moved Mart inventories
	script_mart GREAT_BALL, SUPER_POTION, REVIVE, SUPER_REPEL, ANTIDOTE, BURN_HEAL, ICE_HEAL, AWAKENING, PARLYZ_HEAL

; marcelnote - the TM seller's list is now filled dynamically in the CeladonMart1F2F3F script
;CeladonMart2FClerk2Text::
;	script_mart TM_DOUBLE_TEAM, TM_REFLECT, TM_RAZOR_WIND, TM_HORN_DRILL, TM_EGG_BOMB, TM_MEGA_PUNCH, TM_MEGA_KICK, TM_TAKE_DOWN, TM_SUBMISSION

MartTMClerkDialogue: ; marcelnote - this fills the TM seller list dynamically
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld hl, wItemList
	inc hl ; 1st entry = total number of items in the list, so we skip it for now
; start checking TMs one by one
	; TM01
	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
	;jr z, .checkTM02
	ld a, TM_MEGA_PUNCH
	ld [hli], a
.checkTM02
	; TM02
	CheckEvent EVENT_BEAT_KOGA
	jr z, .checkTM03
	ld a, TM_RAZOR_WIND
	ld [hli], a
.checkTM03
	; TM03
	CheckEvent EVENT_BECAME_CHAMPION
	jr z, .checkTM04
	ld a, TM_SWORDS_DANCE
	ld [hli], a
.checkTM04
	; TM04
	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
	;jr z, .checkTM05
	ld a, TM_WHIRLWIND
	ld [hli], a
.checkTM05
	; TM05
	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
	;jr z, .checkTM06
	ld a, TM_MEGA_KICK
	ld [hli], a
.checkTM06
	; TM06
	CheckEvent EVENT_BEAT_BLAINE
	jr z, .checkTM07
	ld a, TM_TOXIC
	ld [hli], a
.checkTM07
	; TM07
	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
	;jr z, .checkTM08
	ld a, TM_HORN_DRILL
	ld [hli], a
.checkTM08
	; TM08
	CheckEvent EVENT_BEAT_ERIKA
	jr z, .checkTM09
	ld a, TM_BODY_SLAM
	ld [hli], a
.checkTM09
	; TM09
	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
	;jr z, .checkTM10
	ld a, TM_TAKE_DOWN
	ld [hli], a
.checkTM10
	; TM10
	CheckEvent EVENT_BEAT_SABRINA
	jr z, .checkTM11
	ld a, TM_DOUBLE_EDGE
	ld [hli], a
.checkTM11
	; TM11
	CheckEvent EVENT_BEAT_ERIKA
	jr z, .checkTM12
	ld a, TM_BUBBLEBEAM
	ld [hli], a
.checkTM12
	; TM12
	CheckEvent EVENT_BEAT_MISTY
	jr z, .checkTM13
	ld a, TM_WATER_GUN
	ld [hli], a
.checkTM13
	; TM13
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr z, .checkTM14
	ld a, TM_ICE_BEAM
	ld [hli], a
.checkTM14
	; TM14
	CheckEvent EVENT_BECAME_CHAMPION
	jr z, .checkTM15
	ld a, TM_BLIZZARD
	ld [hli], a
.checkTM15
	; TM15
	CheckEvent EVENT_BECAME_CHAMPION
	jr z, .checkTM16
	ld a, TM_HYPER_BEAM
	ld [hli], a
.checkTM16
	; TM16
	CheckEvent EVENT_BEAT_SABRINA
	jr z, .checkTM17
	ld a, TM_PAY_DAY
	ld [hli], a
.checkTM17
	; TM17
	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
	;jr z, .checkTM18
	ld a, TM_SUBMISSION
	ld [hli], a
.checkTM18
	; TM18
	CheckEvent EVENT_BEAT_SABRINA
	jr z, .checkTM19
	ld a, TM_COUNTER
	ld [hli], a
.checkTM19
	; TM19
	CheckEvent EVENT_BEAT_ERIKA
	jr z, .checkTM20
	ld a, TM_SEISMIC_TOSS
	ld [hli], a
.checkTM20
	; TM20
	CheckEvent EVENT_BEAT_KOGA
	jr z, .checkTM21
	ld a, TM_RAGE
	ld [hli], a
.checkTM21
	; TM21
	CheckEvent EVENT_BEAT_BLAINE
	jr z, .checkTM22
	ld a, TM_MEGA_DRAIN
	ld [hli], a
.checkTM22
	; TM22
	CheckEvent EVENT_BECAME_CHAMPION
	jr z, .checkTM23
	ld a, TM_SOLARBEAM
	ld [hli], a
.checkTM23
	; TM23
	CheckEvent EVENT_BEAT_ERIKA
	jr z, .checkTM24
	ld a, TM_DRAGON_RAGE
	ld [hli], a
.checkTM24
	; TM24
	CheckEvent EVENT_BEAT_BLAINE
	jr z, .checkTM25
	ld a, TM_THUNDERBOLT
	ld [hli], a
.checkTM25
	; TM25
	CheckEvent EVENT_BECAME_CHAMPION
	jr z, .checkTM26
	ld a, TM_THUNDER
	ld [hli], a
.checkTM26
	; TM26
	CheckEvent EVENT_BECAME_CHAMPION
	jr z, .checkTM27
	ld a, TM_EARTHQUAKE
	ld [hli], a
.checkTM27
	; TM27
	CheckEvent EVENT_BECAME_CHAMPION
	jr z, .checkTM28
	ld a, TM_FISSURE
	ld [hli], a
.checkTM28
	; TM28
	CheckEvent EVENT_BEAT_ERIKA
	jr z, .checkTM29
	ld a, TM_DIG
	ld [hli], a
.checkTM29
	; TM29
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr z, .checkTM30
	ld a, TM_PSYCHIC_M
	ld [hli], a
.checkTM30
	; TM30
	CheckEvent EVENT_BEAT_LT_SURGE
	jr z, .checkTM31
	ld a, TM_TELEPORT
	ld [hli], a
.checkTM31
	; TM31
	CheckEvent EVENT_BEAT_BLAINE
	jr z, .checkTM32
	ld a, TM_MIMIC
	ld [hli], a
.checkTM32
	; TM32
	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
	;jr z, .checkTM33
	ld a, TM_DOUBLE_TEAM
	ld [hli], a
.checkTM33
	; TM33
	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
	;jr z, .checkTM34
	ld a, TM_REFLECT
	ld [hli], a
.checkTM34
	; TM34
	CheckEvent EVENT_BEAT_ERIKA
	jr z, .checkTM35
	ld a, TM_BIDE
	ld [hli], a
.checkTM35
	; TM35
	CheckEvent EVENT_BEAT_BLAINE
	jr z, .checkTM36
	ld a, TM_METRONOME
	ld [hli], a
.checkTM36
	; TM36
	CheckEvent EVENT_BEAT_BLAINE
	jr z, .checkTM37
	ld a, TM_SELFDESTRUCT
	ld [hli], a
.checkTM37
	; TM37
	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
	;jr z, .checkTM38
	ld a, TM_EGG_BOMB
	ld [hli], a
.checkTM38
	; TM38
	CheckEvent EVENT_BECAME_CHAMPION
	jr z, .checkTM39
	ld a, TM_FIRE_BLAST
	ld [hli], a
.checkTM39
	; TM39
	CheckEvent EVENT_BEAT_KOGA
	jr z, .checkTM40
	ld a, TM_SWIFT
	ld [hli], a
.checkTM40
	; TM40
	CheckEvent EVENT_BEAT_SABRINA
	jr z, .checkTM41
	ld a, TM_SKULL_BASH
	ld [hli], a
.checkTM41
	; TM41
	CheckEvent EVENT_BEAT_BLAINE
	jr z, .checkTM42
	ld a, TM_SOFTBOILED
	ld [hli], a
.checkTM42
	; TM42
	CheckEvent EVENT_BEAT_ERIKA
	jr z, .checkTM43
	ld a, TM_DREAM_EATER
	ld [hli], a
.checkTM43
	; TM43
	CheckEvent EVENT_BECAME_CHAMPION
	jr z, .checkTM44
	ld a, TM_SKY_ATTACK
	ld [hli], a
.checkTM44
	; TM44
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr z, .checkTM45
	ld a, TM_REST
	ld [hli], a
.checkTM45
	; TM45
	CheckEvent EVENT_BEAT_LT_SURGE
	jr z, .checkTM46
	ld a, TM_THUNDER_WAVE
	ld [hli], a
.checkTM46
	; TM46
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr z, .checkTM47
	ld a, TM_PSYWAVE
	ld [hli], a
.checkTM47
	; TM47
	CheckEvent EVENT_BECAME_CHAMPION
	jr z, .checkTM48
	ld a, TM_EXPLOSION
	ld [hli], a
.checkTM48
	; TM48
	CheckEvent EVENT_BEAT_SABRINA
	jr z, .checkTM49
	ld a, TM_ROCK_SLIDE
	ld [hli], a
.checkTM49
	; TM49
	CheckEvent EVENT_BEAT_BLAINE
	jr z, .checkTM50
	ld a, TM_TRI_ATTACK
	ld [hli], a
.checkTM50
	; TM50
	CheckEvent EVENT_BECAME_CHAMPION
	jr z, .checkTM51
	ld a, TM_SUBSTITUTE
	ld [hli], a
.checkTM51
	; TM51
	CheckEvent EVENT_BEAT_BLAINE
	jr z, .checkTMDONE
	ld a, TM_HEX
	ld [hli], a
.checkTMDONE
	ld a, -1 ; ends the list
	ld [hld], a
; recovering the final number of TMs in the list to put as first entry of wItemList
	ld a, l          ; address of last item (can ignore high byte because list length is < 1 byte)
	ld hl, wItemList
	sub l            ; (a - l) is the final number of items
	ld [hl], a
; loading text
	ld hl, PokemartGreetingText
	call PrintText
	ld a, PRICEDITEMLISTMENU
	ld [wListMenuID], a
	callfar DisplayPokemartDialogue_
	ret

    ; marcelnote - current allocation of TMs
    ; for now based on badges obtained but could also put other events as conditions
	; TM_MEGA_PUNCH   ; TM01 ; badge 2 (default)
	; TM_RAZOR_WIND   ; TM02 ; badge 5
	; TM_SWORDS_DANCE ; TM03 ; elite 4
	; TM_WHIRLWIND    ; TM04 ; badge 2
	; TM_MEGA_KICK    ; TM05 ; badge 2 (default)
	; TM_TOXIC        ; TM06 ; badge 7
	; TM_HORN_DRILL   ; TM07 ; badge 2 (default)
	; TM_BODY_SLAM    ; TM08 ; badge 4
	; TM_TAKE_DOWN    ; TM09 ; badge 2 (default)
	; TM_DOUBLE_EDGE  ; TM10 ; badge 6
	; TM_BUBBLEBEAM   ; TM11 ; badge 4
	; TM_WATER_GUN    ; TM12 ; badge 2
	; TM_ICE_BEAM     ; TM13 ; badge 8
	; TM_BLIZZARD     ; TM14 ; elite 4
	; TM_HYPER_BEAM   ; TM15 ; elite 4
	; TM_PAY_DAY      ; TM16 ; badge 6
	; TM_SUBMISSION   ; TM17 ; badge 2 (default)
	; TM_COUNTER      ; TM18 ; badge 6
	; TM_SEISMIC_TOSS ; TM19 ; badge 4
	; TM_RAGE         ; TM20 ; badge 5
	; TM_MEGA_DRAIN   ; TM21 ; badge 8
	; TM_SOLARBEAM    ; TM22 ; elite 4
	; TM_DRAGON_RAGE  ; TM23 ; badge 4
	; TM_THUNDERBOLT  ; TM24 ; badge 7
	; TM_THUNDER      ; TM25 ; elite 4
	; TM_EARTHQUAKE   ; TM26 ; elite 4
	; TM_FISSURE      ; TM27 ; elite 4
	; TM_DIG          ; TM28 ; badge 4
	; TM_PSYCHIC_M    ; TM29 ; badge 8
	; TM_TELEPORT     ; TM30 ; badge 3
	; TM_MIMIC        ; TM31 ; badge 7
	; TM_DOUBLE_TEAM  ; TM32 ; badge 2 (default)
	; TM_REFLECT      ; TM33 ; badge 2 (default)
	; TM_BIDE         ; TM34 ; badge 4
	; TM_METRONOME    ; TM35 ; badge 7
	; TM_SELFDESTRUCT ; TM36 ; badge 7
	; TM_EGG_BOMB     ; TM37 ; badge 2 (default)
	; TM_FIRE_BLAST   ; TM38 ; elite 4
	; TM_SWIFT        ; TM39 ; badge 5
	; TM_SKULL_BASH   ; TM40 ; badge 6
	; TM_SOFTBOILED   ; TM41 ; badge 7
	; TM_DREAM_EATER  ; TM42 ; badge 4
	; TM_SKY_ATTACK   ; TM43 ; elite 4
	; TM_REST         ; TM44 ; badge 8
	; TM_THUNDER_WAVE ; TM45 ; badge 3
	; TM_PSYWAVE      ; TM46 ; badge 8
	; TM_EXPLOSION    ; TM47 ; elite 4
	; TM_ROCK_SLIDE   ; TM48 ; badge 6
	; TM_TRI_ATTACK   ; TM49 ; badge 7
	; TM_SUBSTITUTE   ; TM50 ; elite 4
	; TM_HEX          ; TM51 ; badge 7

