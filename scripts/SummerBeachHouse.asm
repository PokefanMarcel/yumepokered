; marcelnote - new location from pokeyellow
SummerBeachHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

; bit 6 of wd471 is supposed to be set if there is a surfing pikachu in the party

SummerBeachHouse_TextPointers:
	def_text_pointers
	dw_const SummerBeachHouseSurfinDudeText,          TEXT_SUMMERBEACHHOUSE_SURFINDUDE
	dw_const SummerBeachHousePikachuText,             TEXT_SUMMERBEACHHOUSE_PIKACHU
	dw_const SummerBeachHousePoster1Text,             TEXT_SUMMERBEACHHOUSE_POSTER1
	dw_const SummerBeachHousePoster2Text,             TEXT_SUMMERBEACHHOUSE_POSTER2
	dw_const SummerBeachHousePoster3Text,             TEXT_SUMMERBEACHHOUSE_POSTER3
	dw_const SummerBeachHousePokemonSurfboardText,    TEXT_SUMMERBEACHHOUSE_POKEMON_SURFBOARD
	dw_const SummerBeachHousePrinterText,             TEXT_SUMMERBEACHHOUSE_PRINTER

SummerBeachHouseSurfinDudeText:
	text_asm
	callfar IsSurfingPikachuInParty
	ld hl, .DogsBurgersText
	jr z, .print_text
	CheckEvent EVENT_SURFIN_DUDE_WHOA
	ld hl, .WannaGoSurfText
	jr nz, .alreadySawSurfinPikachu
	SetEvent EVENT_SURFIN_DUDE_WHOA
	ld hl, .WhoaText
.alreadySawSurfinPikachu
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr z, .StartSurfingPikachuMinigame
	ld hl, .ComeAnytimeText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.StartSurfingPikachuMinigame
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	callfar SurfingPikachuMinigame
	; The minigame reload path restores the map for the overworld, but not the
	; active NPC dialogue window.
	callfar DisplayTextIDInit
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	CheckEvent EVENT_GOT_SURF_VOUCHER
	ld hl, .ComeAnytimeText
	jr nz, .print_text
	ld a, [wSurfingMinigameHiScore + 1]
	cp $40 ; is high score < 4000?
	jr c, .print_text
	ld hl, .ImpressedText
	call PrintText
	lb bc, SURF_VOUCHER, 1
	call GiveItem
	ld hl, .BagFullText
	jr nc, .print_text
	SetEvent EVENT_GOT_SURF_VOUCHER
	ld hl, .ReceivedVoucherText
	jr .print_text

.DogsBurgersText
	text_far _SummerBeachHouseSurfinDudeDogsBurgersText
	text_end

.WhoaText
	text_far _SummerBeachHouseSurfinDudeWhoaText
	text_end

.WannaGoSurfText
	text_far _SummerBeachHouseSurfinDudeWannaGoSurfText
	text_end

.ComeAnytimeText
	text_far _SummerBeachHouseSurfinDudeComeAnytimeText
	text_end

.ImpressedText
	text_far _SummerBeachHouseSurfinDudeImpressedText
	text_end

.ReceivedVoucherText
	text_far _SummerBeachHouseReceivedSurfVoucherText
	sound_get_key_item
	text_far _SummerBeachHouseExplainSurfVoucherText
	text_end

.BagFullText
	text_far _SummerBeachHouseBagFullText
	text_end

; pokeyellow original
;SummerBeachHouseSurfinDudeText:
;	text_asm
;	ld a, [wd471] ; bit 6 of wd471 is supposed to be set if there is a surfing pikachu in the party
;	vc_patch Bypass_need_Pikachu_with_Surf_for_minigame
;IF DEF (_YELLOW_VC)
;	bit 7, a
;ELSE
;	bit 6, a
;ENDC
;	vc_patch_end
;	jr nz, .next
;	ld hl, .SurfinDudeText4
;	call PrintText
;	jr .done
;.next
;	ld hl, wd492
;	bit 0, [hl]
;	set 0, [hl]
;	jr nz, .next2
;	ld hl, .SurfinDudeText1
;	jr .next3
;.next2
;	ld hl, .SurfinDudeText3
;.next3
;	call PrintText
;	call YesNoChoice
;	ld a, [wCurrentMenuItem]
;	and a
;	jr nz, .asm_f226b
;	ld a, 1
;	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
;	callfar SurfingPikachuMinigame
;	ld hl, wd492
;	set 1, [hl]
;	jr .done
;.asm_f226b
;	ld hl, .SurfinDudeText2
;	call PrintText
;.done
;	jp TextScriptEnd
;
;.SurfinDudeText1
;	text_far _SummerBeachHouseSurfinDudeText1
;	text_end

;.SurfinDudeText2
;	text_far _SummerBeachHouseSurfinDudeText2
;	text_end

;.SurfinDudeText3
;	text_far _SummerBeachHouseSurfinDudeText3
;	text_end

;.SurfinDudeText4
;	text_far _SummerBeachHouseSurfinDudeText4
;	text_end

SummerBeachHousePikachuText:
	text_far _SummerBeachHousePikachuText
	text_asm
	ld a, PIKACHU
	call PlayCry
	call WaitForSoundToFinish
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

SummerBeachHousePoster1Text: ; marcelnote - shuffled poster texts
	text_far _SummerBeachHousePoster30YearsOfWavesText
	text_end

SummerBeachHousePoster2Text: ; marcelnote - shuffled poster texts
	text_asm
	callfar IsSurfingPikachuInParty
	ld hl, .ScribblesText
	jr z, .print_text
	ld hl, .SurfingTip1Text
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.ScribblesText
	text_far _SummerBeachHousePosterScribblesText
	text_end

.SurfingTip1Text
	text_far _SummerBeachHousePosterSurfingTip1Text
	text_end

SummerBeachHousePoster3Text: ; marcelnote - shuffled poster texts
	text_asm
	callfar IsSurfingPikachuInParty
	ld hl, .SeaUnitesAllText
	jr z, .print_text
	ld hl, .SurfingTip2Text
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.SeaUnitesAllText
	text_far _SummerBeachHousePosterSeaUnitesAllText
	text_end

.SurfingTip2Text
	text_far _SummerBeachHousePosterSurfingTip2Text
	text_end

SummerBeachHousePrinterText:
	text_asm
	CheckEvent EVENT_SURFIN_DUDE_WHOA
	jr nz, .checkHiScore
	ld hl, .SummerBeachHouseSomeMachineText
	call PrintText
	rst TextScriptEnd

.checkHiScore
	ld hl, .SummerBeachHousePrinterCheckItOutText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	xor a
	ld [wUpdateSpritesEnabled], a
	callfar DisplaySurfingMinigameHighScoreScreen
	ld a, $1
	ld [wUpdateSpritesEnabled], a
.done
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	rst TextScriptEnd

.SummerBeachHouseSomeMachineText
	text_far _SummerBeachHouseSomeMachineText
	text_end

.SummerBeachHousePrinterCheckItOutText
	text_far _SummerBeachHousePrinterCheckItOutText
	text_end

SummerBeachHousePokemonSurfboardText: ; marcelnote - new text
	text_far _SummerBeachHousePokemonSurfboardText
	text_end
