; marcelnote - new location
PokemonAcademy1F2F_Script:
	jp EnableAutoTextBoxDrawing

PokemonAcademy1F2F_TextPointers:
	def_text_pointers
	; object_events
	dw_const PokemonAcademy1FReceptionistText,        TEXT_POKEMONACADEMY1F_RECEPTIONIST
	dw_const PokemonAcademy1FCooltrainerFText,        TEXT_POKEMONACADEMY1F_COOLTRAINER_F
	dw_const PokemonAcademy1FYoungsterText,           TEXT_POKEMONACADEMY1F_YOUNGSTER
	dw_const PokemonAcademy2FTeacherText,             TEXT_POKEMONACADEMY2F_TEACHER
	dw_const PokemonAcademy2FSuperNerdText,           TEXT_POKEMONACADEMY2F_SUPER_NERD
	dw_const PokemonAcademy2FSuperNerd2Text,          TEXT_POKEMONACADEMY2F_SUPER_NERD2
	dw_const PokemonAcademy2FBrunetteGirlText,        TEXT_POKEMONACADEMY2F_BRUNETTE_GIRL
	dw_const PokemonAcademy2FYoungsterText,           TEXT_POKEMONACADEMY2F_YOUNGSTER
	dw_const PokemonAcademy2FBeautyText,              TEXT_POKEMONACADEMY2F_BEAUTY
	; bg_events
	dw_const PokemonAcademy1FSignText,                TEXT_POKEMONACADEMY1F_SIGN
	dw_const PokemonAcademy2FSignText,                TEXT_POKEMONACADEMY2F_SIGN
	dw_const PokemonAcademy2FPhysicalSpecialNotes,    TEXT_POKEMONACADEMY2F_PHYSICAL_SPECIAL_NOTES
	dw_const PokemonAcademy2FCriticalHitsNotes,       TEXT_POKEMONACADEMY2F_CRITICAL_HITS_NOTES
	dw_const PokemonAcademy2FSTABNotes,               TEXT_POKEMONACADEMY2F_STAB_NOTES
	dw_const PokemonAcademy2FReflectLightScreenNotes, TEXT_POKEMONACADEMY2F_REFLECT_LIGHT_SCREEN_NOTES
	dw_const PokemonAcademy2FBlackboard,              TEXT_POKEMONACADEMY2F_BLACKBOARD

PokemonAcademy1FReceptionistText:
	text_far _PokemonAcademy1FReceptionistText
	text_end

PokemonAcademy1FCooltrainerFText:
	text_far _PokemonAcademy1FCooltrainerFText
	text_end

PokemonAcademy1FYoungsterText:
	text_far _PokemonAcademy1FYoungsterText
	text_end

PokemonAcademy1FSignText:
	text_far _PokemonAcademy1FSignText
	text_end


PokemonAcademy2FTeacherText:
	text_asm
	CheckEvent EVENT_PASSED_JUNIOR_TEST
    jr nz, .passed
	ld hl, .DoYouWantToTakeTheTest
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	ld hl, .Question1
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr z, .fail
	ld hl, .Question2
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .fail
	ld hl, .Question3
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .fail
	ld hl, .Question4
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr z, .fail
	ld hl, .Question5
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .fail
	SetEvent EVENT_PASSED_JUNIOR_TEST
.passed
	ld hl, .WellDone
    call PrintText
    rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.fail
	ld a, SFX_DENIED
	call PlaySound
	call WaitForSoundToFinish
	ld hl, .WrongAnswer
	call PrintText
.refused
	ld hl, .ComeBackWhenReady
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.DoYouWantToTakeTheTest:
	text_far _PokemonAcademy2FTeacherTakeTestText
	text_end

.Question1:
	text_far _PokemonAcademy2FTeacherQuestion1Text
	text_end

.Question2:
	text_far _PokemonAcademy2FTeacherQuestion2Text
	text_end

.Question3:
	text_far _PokemonAcademy2FTeacherQuestion3Text
	text_end

.Question4:
	text_far _PokemonAcademy2FTeacherQuestion4Text
	text_end

.Question5:
	text_far _PokemonAcademy2FTeacherQuestion5Text
	text_end

.WrongAnswer:
	text_far _PokemonAcademy2FTeacherWrongAnswerText
	text_end

.WellDone:
	text_far _PokemonAcademy2FTeacherWellDoneText
	text_end

.ComeBackWhenReady:
	text_far _PokemonAcademy2FComeBackWhenReadyText
	text_end


PokemonAcademy2FBrunetteGirlText:
	text_far _PokemonAcademy2FBrunetteGirlText
	text_end

PokemonAcademy2FYoungsterText:
	text_far _PokemonAcademy2FYoungsterText
	text_end

PokemonAcademy2FBeautyText:
	text_far _PokemonAcademy2FBeautyText
	text_end

PokemonAcademy2FSuperNerdText:
	text_far _PokemonAcademy2FSuperNerdText
	text_end

PokemonAcademy2FSuperNerd2Text:
	text_far _PokemonAcademy2FSuperNerd2Text
	text_end


PokemonAcademy2FPhysicalSpecialNotes:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .PokemonAcademy2FPhysicalSpecialIntroText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .PokemonAcademy2FPhysicalSpecialTypesText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .PokemonAcademy2FPhysicalTypesText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .PokemonAcademy2FSpecialTypesText
	call PrintText
.doneReading
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.PokemonAcademy2FPhysicalSpecialIntroText:
	text_far _PokemonAcademy2FPhysicalSpecialIntroText
	text_end

.PokemonAcademy2FPhysicalSpecialTypesText:
	text_far _PokemonAcademy2FPhysicalSpecialTypesText
	text_end

.PokemonAcademy2FPhysicalTypesText:
	text_far _PokemonAcademy2FPhysicalTypesText
	text_end

.PokemonAcademy2FSpecialTypesText:
	text_far _PokemonAcademy2FSpecialTypesText
	text_end


PokemonAcademy2FCriticalHitsNotes:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .PokemonAcademy2FCriticalHitsIntroText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .PokemonAcademy2FCriticalSpeedText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .PokemonAcademy2FIncreaseCritText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .PokemonAcademy2FHighCritMovesText
	call PrintText
.doneReading
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.PokemonAcademy2FCriticalHitsIntroText:
	text_far _PokemonAcademy2FCriticalHitsIntroText
	text_end

.PokemonAcademy2FCriticalSpeedText:
	text_far _PokemonAcademy2FCriticalSpeedText
	text_end

.PokemonAcademy2FIncreaseCritText:
	text_far _PokemonAcademy2FIncreaseCritText
	text_end

.PokemonAcademy2FHighCritMovesText:
	text_far _PokemonAcademy2FHighCritMovesText
	text_end


PokemonAcademy2FReflectLightScreenNotes:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .PokemonAcademy2FReflectLightScreenIntroText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .PokemonAcademy2FReflectText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .PokemonAcademy2FLightScreenText
	call PrintText
.doneReading
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.PokemonAcademy2FReflectLightScreenIntroText:
	text_far _PokemonAcademy2FReflectLightScreenIntroText
	text_end

.PokemonAcademy2FReflectText:
	text_far _PokemonAcademy2FReflectText
	text_end

.PokemonAcademy2FLightScreenText:
	text_far _PokemonAcademy2FLightScreenText
	text_end


PokemonAcademy2FSTABNotes:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .PokemonAcademy2FSTABIntroText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .PokemonAcademy2FSTABExplanationText
	call PrintText
.doneReading
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.PokemonAcademy2FSTABIntroText:
	text_far _PokemonAcademy2FSTABIntroText
	text_end

.PokemonAcademy2FSTABExplanationText:
	text_far _PokemonAcademy2FSTABExplanationText
	text_end


PokemonAcademy2FBlackboard:
	text_asm
	ld hl, .DescribesText
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
.loop
	ld hl, .WhichHeadingText
	call PrintText
	ld hl, .TypeItemList
	call LoadItemList
	ld hl, wItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld [wMenuItemToSwap], a
	ld a, SPECIALLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	jr c, .done
	ld hl, PokemonAcademy2FBlackboardTypeTextPointers
	ld a, [wCurItem]
	sub NORMAL_ITEM
	add a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	jr .loop
.done
	xor a
	ld [wListScrollOffset], a
	ld [wAutoTextBoxDrawingControl], a
	inc a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.TypeItemList:
	table_width 1, .TypeItemList
	db NUM_TYPES_ITEMS ; #
	db NORMAL_ITEM
	db GRASS_ITEM
	db FIRE_ITEM
	db WATER_ITEM
	db ELECTRIC_ITEM
	db FIGHTING_ITEM
	db POISON_ITEM
	db GROUND_ITEM
	db FLYING_ITEM
	db BUG_ITEM
	db ROCK_ITEM
	db PSYCHIC_ITEM
	db ICE_ITEM
	db GHOST_ITEM
	db DRAGON_ITEM
	db -1 ; end
	assert_table_length NUM_TYPES_ITEMS + 2

.DescribesText:
	text_far _PokemonAcademy2FBlackboardDescribesText
	text_end

.WhichHeadingText:
	text_far _PokemonAcademy2FBlackboardWhichHeadingText
	text_end

PokemonAcademy2FBlackboardNormalText:
	text_far _PokemonAcademy2FBlackboardNormalText
	text_end

PokemonAcademy2FBlackboardGrassText:
	text_far _PokemonAcademy2FBlackboardGrassText
	text_end

PokemonAcademy2FBlackboardFireText:
	text_far _PokemonAcademy2FBlackboardFireText
	text_end

PokemonAcademy2FBlackboardWaterText:
	text_far _PokemonAcademy2FBlackboardWaterText
	text_end

PokemonAcademy2FBlackboardElectricText:
	text_far _PokemonAcademy2FBlackboardElectricText
	text_end

PokemonAcademy2FBlackboardFightingText:
	text_far _PokemonAcademy2FBlackboardFightingText
	text_end

PokemonAcademy2FBlackboardPoisonText:
	text_far _PokemonAcademy2FBlackboardPoisonText
	text_end

PokemonAcademy2FBlackboardGroundText:
	text_far _PokemonAcademy2FBlackboardGroundText
	text_end

PokemonAcademy2FBlackboardFlyingText:
	text_far _PokemonAcademy2FBlackboardFlyingText
	text_end

PokemonAcademy2FBlackboardBugText:
	text_far _PokemonAcademy2FBlackboardBugText
	text_end

PokemonAcademy2FBlackboardRockText:
	text_far _PokemonAcademy2FBlackboardRockText
	text_end

PokemonAcademy2FBlackboardPsychicText:
	text_far _PokemonAcademy2FBlackboardPsychicText
	text_end

PokemonAcademy2FBlackboardIceText:
	text_far _PokemonAcademy2FBlackboardIceText
	text_end

PokemonAcademy2FBlackboardGhostText:
	text_far _PokemonAcademy2FBlackboardGhostText
	text_end

PokemonAcademy2FBlackboardDragonText:
	text_far _PokemonAcademy2FBlackboardDragonText
	text_end

PokemonAcademy2FBlackboardTypeTextPointers:
	table_width 2, PokemonAcademy2FBlackboardTypeTextPointers
	dw PokemonAcademy2FBlackboardNormalText
	dw PokemonAcademy2FBlackboardGrassText
	dw PokemonAcademy2FBlackboardFireText
	dw PokemonAcademy2FBlackboardWaterText
	dw PokemonAcademy2FBlackboardElectricText
	dw PokemonAcademy2FBlackboardFightingText
	dw PokemonAcademy2FBlackboardPoisonText
	dw PokemonAcademy2FBlackboardGroundText
	dw PokemonAcademy2FBlackboardFlyingText
	dw PokemonAcademy2FBlackboardBugText
	dw PokemonAcademy2FBlackboardRockText
	dw PokemonAcademy2FBlackboardPsychicText
	dw PokemonAcademy2FBlackboardIceText
	dw PokemonAcademy2FBlackboardGhostText
	dw PokemonAcademy2FBlackboardDragonText
	assert_table_length NUM_TYPES_ITEMS


PokemonAcademy2FSignText:
	text_far _PokemonAcademy2FSignText
	text_end

KeepReadingNotes:   ; marcelnote - copies TurnPageSchoolNotebook
	ld hl, .KeepReadingText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret

.KeepReadingText:
	text_far _KeepReadingText
	text_end
