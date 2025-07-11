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
	;dw_const SummerBeachHousePrinterText,             TEXT_SUMMERBEACHHOUSE_PRINTER

SummerBeachHouseSurfinDudeText:
	text_asm
	callfar IsSurfingPikachuInParty
	ld hl, .SummerBeachHouseSurfinDudeDogsBurgersText
	jr z, .print_text
	CheckEvent EVENT_SURFIN_DUDE_WHOA
	ld hl, .SummerBeachHouseSurfinDudeWannaGoSurfText
	jr nz, .alreadySawSurfinPikachu
	SetEvent EVENT_SURFIN_DUDE_WHOA
	ld hl, .SummerBeachHouseSurfinDudeWhoaText
.alreadySawSurfinPikachu
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr z, .StartSurfingPikachuMinigame
	ld hl, .SummerBeachHouseSurfinDudeComeAnytimeText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.StartSurfingPikachuMinigame
;	ld a, 1
;	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
;	callfar SurfingPikachuMinigame
;	ld hl, wd492
;	set 1, [hl]
	ld hl, .SummerBeachHouseSurfinDudeNotReadyYetText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.SummerBeachHouseSurfinDudeDogsBurgersText
	text_far _SummerBeachHouseSurfinDudeDogsBurgersText
	text_end

.SummerBeachHouseSurfinDudeWhoaText
	text_far _SummerBeachHouseSurfinDudeWhoaText
	text_end

.SummerBeachHouseSurfinDudeWannaGoSurfText
	text_far _SummerBeachHouseSurfinDudeWannaGoSurfText
	text_end

.SummerBeachHouseSurfinDudeComeAnytimeText
	text_far _SummerBeachHouseSurfinDudeComeAnytimeText
	text_end

.SummerBeachHouseSurfinDudeNotReadyYetText ; marcelnote - temporary until minigame works
	text_far _SummerBeachHouseSurfinDudeNotReadyYetText
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

;SummerBeachHousePrinterText:
;	text_asm
;	ld a, 1
;	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
;	ld a, [wd471]
;	vc_patch Bypass_need_Pikachu_with_Surf_for_high_score
;IF DEF(_YELLOW_VC)
;	bit 7, a
;ELSE
;	bit 6, a
;ENDC
;	vc_patch_end
;	jr z, .asm_f2369
;
;	ld hl, wd492
;	bit 1, [hl]
;	jr z, .next2
;	ld a, 0
;	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
;.next2
;	ld hl, .SummerBeachHousePrinterText2
;	call PrintText
;	ld a, [wd492]
;	bit 1, a
;	jr z, .asm_f236f
;
;	ld a, 1
;	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
;	ld hl, .SummerBeachHousePrinterText3
;	call PrintText
;	call YesNoChoice
;	ld a, [wCurrentMenuItem]
;	and a
;	jp z, Func_f23d0
;	call SaveScreenTilesToBuffer2
;	ld hl, wStatusFlags5
;	set BIT_NO_TEXT_DELAY, [hl]
;	xor a
;	ld [wUpdateSpritesEnabled], a
;	callfar Printer_PrepareSurfingMinigameHighScoreTileMap
;	call WaitForTextScrollButtonPress
;	ld hl, wStatusFlags5
;	res BIT_NO_TEXT_DELAY, [hl]
;	call GBPalWhiteOutWithDelay3
;	call ReloadTilesetTilePatterns
;	call RestoreScreenTilesAndReloadTilePatterns
;	call LoadScreenTilesFromBuffer2
;	call Delay3
;	call GBPalNormal
;	ld a, 1
;	ld [wUpdateSpritesEnabled], a
;	jr .asm_f236f
;.asm_f2369
;	ld hl, .SummerBeachHousePrinterText1
;	call PrintText
;.asm_f236f
;	jp TextScriptEnd
;
;.SummerBeachHousePrinterText1
;	text_far _SummerBeachHousePrinterText1
;	text_waitbutton
;	text_end
;
;.SummerBeachHousePrinterText2
;	text_far _SummerBeachHousePrinterText2
;	text_waitbutton
;	text_end
;
;.SummerBeachHousePrinterText3
;	text_far _SummerBeachHousePrinterText3
;	text_end
;
;.SummerBeachHousePrinterText4
;	text_far _SummerBeachHousePrinterText4
;	text_end

;Func_f23d0:
;	call SaveScreenTilesToBuffer2
;	xor a
;	ld [wUpdateSpritesEnabled], a
;	ld hl, wStatusFlags5
;	set BIT_NO_TEXT_DELAY, [hl]
;	callfar PrintSurfingMinigameHighScore
;	ld hl, wStatusFlags5
;	res BIT_NO_TEXT_DELAY, [hl]
;	call GBPalWhiteOutWithDelay3
;	call ReloadTilesetTilePatterns
;	call RestoreScreenTilesAndReloadTilePatterns
;	call LoadScreenTilesFromBuffer2
;	call Delay3
;	call GBPalNormal
;	ld hl, Text_f2412
;	ldh a, [hOaksAideResult]
;	and a
;	jr nz, .asm_f2406
;	ld hl, Text_f240c
;.asm_f2406
;	call PrintText
;	jp TextScriptEnd

;Text_f240c:
;	text_far _SummerBeachHousePrinterText5
;	text_waitbutton
;	text_end

;Text_f2412:
;	text_far _SummerBeachHousePrinterText6
;	text_waitbutton
;	text_end

SummerBeachHousePokemonSurfboardText: ; marcelnote - new text
	text_far _SummerBeachHousePokemonSurfboardText
	text_end
