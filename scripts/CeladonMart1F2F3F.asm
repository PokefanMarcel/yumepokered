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
	dw_const CeladonMart1FPhoneText,            TEXT_CELADONMART1F_PHONE1 ; marcelnote - new
	dw_const CeladonMart1FPhoneText,            TEXT_CELADONMART1F_PHONE2 ; marcelnote - new
	dw_const CeladonMart2FCurrentFloorSignText, TEXT_CELADONMART2F_CURRENT_FLOOR_SIGN
	dw_const CeladonMart3FSNESText,             TEXT_CELADONMART3F_SNES1
	dw_const CeladonMart3FSNESText,             TEXT_CELADONMART3F_SNES2
	dw_const CeladonMart3FSNESText,             TEXT_CELADONMART3F_SNES3
	dw_const CeladonMart3FSNESText,             TEXT_CELADONMART3F_SNES4
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

CeladonMart1FPhoneText: ; marcelnote - new for pay phones
	script_pay_phone

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

CeladonMart3FClerkText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_GOT_TM18
	ld hl, .TM18ExplanationText
	jr nz, .print_text
	ld hl, .TM18PreReceiveText
	call PrintText
	lb bc, TM_COUNTER, 1
	call GiveItem
	ld hl, .TM18NoRoomText
	jr nc, .print_text
	SetEvent EVENT_GOT_TM18
	ld hl, .ReceivedTM18Text
.print_text
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

CeladonMart3FCurrentFloorSignText:
	text_far _CeladonMart3FCurrentFloorSignText
	text_end

CeladonMart3FPokemonPosterText:
	text_far _CeladonMart3FPokemonPosterText
	text_end


CeladonMart2FClerk1Text: ; marcelnote - moved Mart inventories
	script_mart GREAT_BALL, SUPER_POTION, REVIVE, SUPER_REPEL, ANTIDOTE, BURN_HEAL, ICE_HEAL, AWAKENING, PARLYZ_HEAL

; marcelnote - original TM seller list
;CeladonMart2FClerk2Text::
;	script_mart TM_DOUBLE_TEAM, TM_REFLECT, TM_RAZOR_WIND, TM_HORN_DRILL, TM_EGG_BOMB, TM_MEGA_PUNCH, TM_MEGA_KICK, TM_TAKE_DOWN, TM_SUBMISSION

MartTMClerkDialogue: ; marcelnote - this fills the TM seller list dynamically
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld hl, wItemList + 1 ; 1st entry = total number of items in the list, so we skip it for now
; start checking TMs one by one
	ld de, DynamicTMSellerConditions
	ld a, [wObtainedBadges]
	ld b, a             ; b contains the byte of obtained badges
	ld c, TM_MEGA_PUNCH ; c will contain the current TM id
.loop
	ld a, [de] ; condition for current TM
	cp -2
	jr z, .checkIfChampion ; if a = -2
	jr nc, .finish         ; if a = -1
	and b ; has required badge?
	jr z, .skipTM
.addTM
	ld [hl], c
	inc hl
.skipTM
	inc c  ; next TM
	inc de ; next condition
	jr .loop

.checkIfChampion
	CheckEvent EVENT_BECAME_CHAMPION
	jr z, .skipTM
	jr .addTM

.finish
	ld [hl], -1 ; add list terminator
; recovering the final number of TMs in the list to put as first entry of wItemList
	ld a, l  ; address after last item (can ignore high byte because list length is < $FF)
	ld hl, wItemList
	sub l    ; a - l - 1 is the final number of items
	dec a    ; counted terminator address so one too many
	ld [hl], a
; loading text
	ld hl, PokemartGreetingText
	call PrintText
	ld a, PRICEDITEMLISTMENU
	ld [wListMenuID], a
	callfar DisplayPokemartDialogue_
	ret

; marcelnote - this list indicates which badge is needed to buy each TM
;              -2 means you need to have become champion
DynamicTMSellerConditions:
	db 1 << BIT_CASCADEBADGE ; TM01 MEGA_PUNCH (default list)
	db 1 << BIT_SOULBADGE    ; TM02 RAZOR_WIND (was on default list but not anymore)
	db -2                    ; TM03 SWORDS_DANCE ; elite 4
	db 1 << BIT_CASCADEBADGE ; TM04 WHIRLWIND
	db 1 << BIT_CASCADEBADGE ; TM05 MEGA_KICK (default list)
	db 1 << BIT_VOLCANOBADGE ; TM06 TOXIC
	db 1 << BIT_CASCADEBADGE ; TM07 HORN_DRILL (default list)
	db 1 << BIT_RAINBOWBADGE ; TM08 BODY_SLAM
	db 1 << BIT_CASCADEBADGE ; TM09 TAKE_DOWN (default list)
	db 1 << BIT_MARSHBADGE   ; TM10 DOUBLE_EDGE
	db 1 << BIT_RAINBOWBADGE ; TM11 BUBBLEBEAM
	db 1 << BIT_CASCADEBADGE ; TM12 WATER_GUN
	db 1 << BIT_EARTHBADGE   ; TM13 ICE_BEAM
	db -2                    ; TM14 BLIZZARD ; elite 4
	db -2                    ; TM15 HYPER_BEAM ; elite 4
	db 1 << BIT_MARSHBADGE   ; TM16 PAY_DAY
	db 1 << BIT_CASCADEBADGE ; TM17 SUBMISSION (default list)
	db 1 << BIT_MARSHBADGE   ; TM18 COUNTER
	db 1 << BIT_RAINBOWBADGE ; TM19 SEISMIC_TOSS
	db 1 << BIT_SOULBADGE    ; TM20 RAGE
	db 1 << BIT_EARTHBADGE   ; TM21 MEGA_DRAIN
	db -2                    ; TM22 SOLARBEAM ; elite 4
	db 1 << BIT_RAINBOWBADGE ; TM23 DRAGON_RAGE
	db 1 << BIT_VOLCANOBADGE ; TM24 THUNDERBOLT
	db -2                    ; TM25 THUNDER ; elite 4
	db -2                    ; TM26 EARTHQUAKE ; elite 4
	db -2                    ; TM27 FISSURE ; elite 4
	db 1 << BIT_RAINBOWBADGE ; TM28 DIG
	db 1 << BIT_EARTHBADGE   ; TM29 PSYCHIC_M
	db 1 << BIT_THUNDERBADGE ; TM30 TELEPORT
	db 1 << BIT_VOLCANOBADGE ; TM31 MIMIC
	db 1 << BIT_CASCADEBADGE ; TM32 DOUBLE_TEAM (default list)
	db 1 << BIT_CASCADEBADGE ; TM33 REFLECT (default list)
	db 1 << BIT_RAINBOWBADGE ; TM34 BIDE
	db 1 << BIT_VOLCANOBADGE ; TM35 METRONOME
	db 1 << BIT_VOLCANOBADGE ; TM36 SELFDESTRUCT
	db 1 << BIT_CASCADEBADGE ; TM37 EGG_BOMB (default list)
	db -2                    ; TM38 FIRE_BLAST ; elite 4
	db 1 << BIT_SOULBADGE    ; TM39 SWIFT
	db 1 << BIT_MARSHBADGE   ; TM40 SKULL_BASH
	db 1 << BIT_VOLCANOBADGE ; TM41 SOFTBOILED
	db 1 << BIT_RAINBOWBADGE ; TM42 DREAM_EATER
	db -2                    ; TM43 SKY_ATTACK ; elite 4
	db 1 << BIT_EARTHBADGE   ; TM44 REST
	db 1 << BIT_THUNDERBADGE ; TM45 THUNDER_WAVE
	db 1 << BIT_EARTHBADGE   ; TM46 PSYWAVE
	db -2                    ; TM47 EXPLOSION ; elite 4
	db 1 << BIT_MARSHBADGE   ; TM48 ROCK_SLIDE
	db 1 << BIT_VOLCANOBADGE ; TM49 TRI_ATTACK
	db -2                    ; TM50 SUBSTITUTE ; elite 4
	db 1 << BIT_VOLCANOBADGE ; TM51 HEX
	db -1 ; end

; marcelnote - old function with custom check for each TM
;              more flexible if want to check different events
;MartTMClerkDialogue:
;	ld a, 1
;	ld [wUpdateSpritesEnabled], a
;	ld hl, wItemList + 1 ; 1st entry = total number of items in the list, so we skip it for now
; start checking TMs one by one
;	; TM01
;	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
;	;jr z, .checkTM02
;	ld a, TM_MEGA_PUNCH
;	ld [hli], a
;.checkTM02
;	; TM02
;	CheckEvent EVENT_BEAT_KOGA
;	jr z, .checkTM03
;	ld a, TM_RAZOR_WIND
;	ld [hli], a
;.checkTM03
;	; TM03
;	CheckEvent EVENT_BECAME_CHAMPION
;	jr z, .checkTM04
;	ld a, TM_SWORDS_DANCE
;	ld [hli], a
;.checkTM04
;	; TM04
;	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
;	;jr z, .checkTM05
;	ld a, TM_WHIRLWIND
;	ld [hli], a
;.checkTM05
;	; TM05
;	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
;	;jr z, .checkTM06
;	ld a, TM_MEGA_KICK
;	ld [hli], a
;.checkTM06
;	; TM06
;	CheckEvent EVENT_BEAT_BLAINE
;	jr z, .checkTM07
;	ld a, TM_TOXIC
;	ld [hli], a
;.checkTM07
;	; TM07
;	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
;	;jr z, .checkTM08
;	ld a, TM_HORN_DRILL
;	ld [hli], a
;.checkTM08
;	; TM08
;	CheckEvent EVENT_BEAT_ERIKA
;	jr z, .checkTM09
;	ld a, TM_BODY_SLAM
;	ld [hli], a
;.checkTM09
;	; TM09
;	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
;	;jr z, .checkTM10
;	ld a, TM_TAKE_DOWN
;	ld [hli], a
;.checkTM10
;	; TM10
;	CheckEvent EVENT_BEAT_SABRINA
;	jr z, .checkTM11
;	ld a, TM_DOUBLE_EDGE
;	ld [hli], a
;.checkTM11
;	; TM11
;	CheckEvent EVENT_BEAT_ERIKA
;	jr z, .checkTM12
;	ld a, TM_BUBBLEBEAM
;	ld [hli], a
;.checkTM12
;	; TM12
;	CheckEvent EVENT_BEAT_MISTY
;	jr z, .checkTM13
;	ld a, TM_WATER_GUN
;	ld [hli], a
;.checkTM13
;	; TM13
;	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
;	jr z, .checkTM14
;	ld a, TM_ICE_BEAM
;	ld [hli], a
;.checkTM14
;	; TM14
;	CheckEvent EVENT_BECAME_CHAMPION
;	jr z, .checkTM15
;	ld a, TM_BLIZZARD
;	ld [hli], a
;.checkTM15
;	; TM15
;	CheckEvent EVENT_BECAME_CHAMPION
;	jr z, .checkTM16
;	ld a, TM_HYPER_BEAM
;	ld [hli], a
;.checkTM16
;	; TM16
;	CheckEvent EVENT_BEAT_SABRINA
;	jr z, .checkTM17
;	ld a, TM_PAY_DAY
;	ld [hli], a
;.checkTM17
;	; TM17
;	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
;	;jr z, .checkTM18
;	ld a, TM_SUBMISSION
;	ld [hli], a
;.checkTM18
;	; TM18
;	CheckEvent EVENT_BEAT_SABRINA
;	jr z, .checkTM19
;	ld a, TM_COUNTER
;	ld [hli], a
;.checkTM19
;	; TM19
;	CheckEvent EVENT_BEAT_ERIKA
;	jr z, .checkTM20
;	ld a, TM_SEISMIC_TOSS
;	ld [hli], a
;.checkTM20
;	; TM20
;	CheckEvent EVENT_BEAT_KOGA
;	jr z, .checkTM21
;	ld a, TM_RAGE
;	ld [hli], a
;.checkTM21
;	; TM21
;	CheckEvent EVENT_BEAT_BLAINE
;	jr z, .checkTM22
;	ld a, TM_MEGA_DRAIN
;	ld [hli], a
;.checkTM22
;	; TM22
;	CheckEvent EVENT_BECAME_CHAMPION
;	jr z, .checkTM23
;	ld a, TM_SOLARBEAM
;	ld [hli], a
;.checkTM23
;	; TM23
;	CheckEvent EVENT_BEAT_ERIKA
;	jr z, .checkTM24
;	ld a, TM_DRAGON_RAGE
;	ld [hli], a
;.checkTM24
;	; TM24
;	CheckEvent EVENT_BEAT_BLAINE
;	jr z, .checkTM25
;	ld a, TM_THUNDERBOLT
;	ld [hli], a
;.checkTM25
;	; TM25
;	CheckEvent EVENT_BECAME_CHAMPION
;	jr z, .checkTM26
;	ld a, TM_THUNDER
;	ld [hli], a
;.checkTM26
;	; TM26
;	CheckEvent EVENT_BECAME_CHAMPION
;	jr z, .checkTM27
;	ld a, TM_EARTHQUAKE
;	ld [hli], a
;.checkTM27
;	; TM27
;	CheckEvent EVENT_BECAME_CHAMPION
;	jr z, .checkTM28
;	ld a, TM_FISSURE
;	ld [hli], a
;.checkTM28
;	; TM28
;	CheckEvent EVENT_BEAT_ERIKA
;	jr z, .checkTM29
;	ld a, TM_DIG
;	ld [hli], a
;.checkTM29
;	; TM29
;	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
;	jr z, .checkTM30
;	ld a, TM_PSYCHIC_M
;	ld [hli], a
;.checkTM30
;	; TM30
;	CheckEvent EVENT_BEAT_LT_SURGE
;	jr z, .checkTM31
;	ld a, TM_TELEPORT
;	ld [hli], a
;.checkTM31
;	; TM31
;	CheckEvent EVENT_BEAT_BLAINE
;	jr z, .checkTM32
;	ld a, TM_MIMIC
;	ld [hli], a
;.checkTM32
;	; TM32
;	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
;	;jr z, .checkTM33
;	ld a, TM_DOUBLE_TEAM
;	ld [hli], a
;.checkTM33
;	; TM33
;	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
;	;jr z, .checkTM34
;	ld a, TM_REFLECT
;	ld [hli], a
;.checkTM34
;	; TM34
;	CheckEvent EVENT_BEAT_ERIKA
;	jr z, .checkTM35
;	ld a, TM_BIDE
;	ld [hli], a
;.checkTM35
;	; TM35
;	CheckEvent EVENT_BEAT_BLAINE
;	jr z, .checkTM36
;	ld a, TM_METRONOME
;	ld [hli], a
;.checkTM36
;	; TM36
;	CheckEvent EVENT_BEAT_BLAINE
;	jr z, .checkTM37
;	ld a, TM_SELFDESTRUCT
;	ld [hli], a
;.checkTM37
;	; TM37
;	;CheckEvent EVENT_BEAT_MISTY ; obtainable by default
;	;jr z, .checkTM38
;	ld a, TM_EGG_BOMB
;	ld [hli], a
;.checkTM38
;	; TM38
;	CheckEvent EVENT_BECAME_CHAMPION
;	jr z, .checkTM39
;	ld a, TM_FIRE_BLAST
;	ld [hli], a
;.checkTM39
;	; TM39
;	CheckEvent EVENT_BEAT_KOGA
;	jr z, .checkTM40
;	ld a, TM_SWIFT
;	ld [hli], a
;.checkTM40
;	; TM40
;	CheckEvent EVENT_BEAT_SABRINA
;	jr z, .checkTM41
;	ld a, TM_SKULL_BASH
;	ld [hli], a
;.checkTM41
;	; TM41
;	CheckEvent EVENT_BEAT_BLAINE
;	jr z, .checkTM42
;	ld a, TM_SOFTBOILED
;	ld [hli], a
;.checkTM42
;	; TM42
;	CheckEvent EVENT_BEAT_ERIKA
;	jr z, .checkTM43
;	ld a, TM_DREAM_EATER
;	ld [hli], a
;.checkTM43
;	; TM43
;	CheckEvent EVENT_BECAME_CHAMPION
;	jr z, .checkTM44
;	ld a, TM_SKY_ATTACK
;	ld [hli], a
;.checkTM44
;	; TM44
;	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
;	jr z, .checkTM45
;	ld a, TM_REST
;	ld [hli], a
;.checkTM45
;	; TM45
;	CheckEvent EVENT_BEAT_LT_SURGE
;	jr z, .checkTM46
;	ld a, TM_THUNDER_WAVE
;	ld [hli], a
;.checkTM46
;	; TM46
;	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
;	jr z, .checkTM47
;	ld a, TM_PSYWAVE
;	ld [hli], a
;.checkTM47
;	; TM47
;	CheckEvent EVENT_BECAME_CHAMPION
;	jr z, .checkTM48
;	ld a, TM_EXPLOSION
;	ld [hli], a
;.checkTM48
;	; TM48
;	CheckEvent EVENT_BEAT_SABRINA
;	jr z, .checkTM49
;	ld a, TM_ROCK_SLIDE
;	ld [hli], a
;.checkTM49
;	; TM49
;	CheckEvent EVENT_BEAT_BLAINE
;	jr z, .checkTM50
;	ld a, TM_TRI_ATTACK
;	ld [hli], a
;.checkTM50
;	; TM50
;	CheckEvent EVENT_BECAME_CHAMPION
;	jr z, .checkTM51
;	ld a, TM_SUBSTITUTE
;	ld [hli], a
;.checkTM51
;	; TM51
;	CheckEvent EVENT_BEAT_BLAINE
;	jr z, .checkTMDONE
;	ld a, TM_HEX
;	ld [hli], a
;.checkTMDONE
;	ld a, -1 ; ends the list
;	ld [hld], a
;; recovering the final number of TMs in the list to put as first entry of wItemList
;	ld a, l          ; address of last item (can ignore high byte because list length is < 1 byte)
;	ld hl, wItemList
;	sub l            ; (a - l) is the final number of items
;	ld [hl], a
;; loading text
;	ld hl, PokemartGreetingText
;	call PrintText
;	ld a, PRICEDITEMLISTMENU
;	ld [wListMenuID], a
;	callfar DisplayPokemartDialogue_
;	ret
