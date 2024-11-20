; marcelnote - new location
PokemonAcademy3F4F_Script:
	jp EnableAutoTextBoxDrawing

PokemonAcademy3F4F_TextPointers:
	def_text_pointers
	; object_events
    dw_const PokemonAcademy3FTeacherText,             TEXT_POKEMONACADEMY3F_TEACHER
    dw_const PokemonAcademy3FYoungsterText,           TEXT_POKEMONACADEMY3F_YOUNGSTER
    dw_const PokemonAcademy3FLittleGirlText,          TEXT_POKEMONACADEMY3F_LITTLE_GIRL
    dw_const PokemonAcademy3FRockerText,              TEXT_POKEMONACADEMY3F_ROCKER
    dw_const PokemonAcademy3FCooltrainerFText,        TEXT_POKEMONACADEMY3F_COOLTRAINER_F
    dw_const PokemonAcademy3FBeautyText,              TEXT_POKEMONACADEMY3F_BEAUTY
    dw_const PokemonAcademy3FSuperNerdText,           TEXT_POKEMONACADEMY3F_SUPER_NERD
    dw_const PokemonAcademy4FGameboyKid1Text,         TEXT_POKEMONACADEMY4F_GAMEBOY_KID1
    dw_const PokemonAcademy4FGameboyKid2Text,         TEXT_POKEMONACADEMY4F_GAMEBOY_KID2
    dw_const PokemonAcademy4FGrannyText,              TEXT_POKEMONACADEMY4F_GRANNY
    ; bg_events
	dw_const PokemonAcademy3FSignText,                TEXT_POKEMONACADEMY3F_SIGN
	dw_const PokemonAcademy4FSignText,                TEXT_POKEMONACADEMY4F_SIGN
	dw_const PokemonAcademy3FStatExpNotes,            TEXT_POKEMONACADEMY3F_STAT_EXP_NOTES
	dw_const PokemonAcademy3FDVsNotes,                TEXT_POKEMONACADEMY3F_DVS_NOTES
	dw_const PokemonAcademy3FMistHazeNotes,           TEXT_POKEMONACADEMY3F_MIST_HAZE_NOTES
	dw_const PokemonAcademy3FHyperBeamNotes,          TEXT_POKEMONACADEMY3F_HYPER_BEAM_NOTES


PokemonAcademy3FTeacherText:
	text_asm
	CheckEvent EVENT_PASSED_SENIOR_TEST
    jr nz, .passed
	ld hl, .Presentation
	call PrintText
	CheckEvent EVENT_PASSED_JUNIOR_TEST
	ld hl, .ComeBackToSeeMe
    jr z, .print_text
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
	jr nz, .fail
	ld hl, .Question2
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr z, .fail
	ld hl, .Question3
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr z, .fail
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
	jr z, .fail
	SetEvent EVENT_PASSED_SENIOR_TEST
	ld a, SFX_GET_ITEM_1
	call PlaySound
	call WaitForSoundToFinish
.passed
	ld hl, .WellDone
    jr .print_text
.fail
	ld a, SFX_DENIED
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld hl, .WrongAnswer
	call PrintText
.refused
	ld hl, .ComeBackWhenReady
.print_text
    call PrintText
    rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Presentation
	text_far _PokemonAcademy3FTeacherPresentationText
	text_end

.ComeBackToSeeMe
	text_far _PokemonAcademy3FTeacherComeBackToSeeMeText
	text_end

.DoYouWantToTakeTheTest
	text_far _PokemonAcademy3FTeacherTakeTestText
	text_end

.Question1
	text_far _PokemonAcademy3FTeacherQuestion1Text
	text_end

.Question2
	text_far _PokemonAcademy3FTeacherQuestion2Text
	text_end

.Question3
	text_far _PokemonAcademy3FTeacherQuestion3Text
	text_end

.Question4
	text_far _PokemonAcademy3FTeacherQuestion4Text
	text_end

.Question5
	text_far _PokemonAcademy3FTeacherQuestion5Text
	text_end

.WrongAnswer
	text_far _PokemonAcademy3FTeacherWrongAnswerText
	text_end

.WellDone
	text_far _PokemonAcademy3FTeacherWellDoneText
	text_end

.ComeBackWhenReady
	text_far _PokemonAcademy3FComeBackWhenReadyText
	text_end


PokemonAcademy3FYoungsterText:
	text_far _PokemonAcademy3FYoungsterText
	text_end

PokemonAcademy3FLittleGirlText:
	text_far _PokemonAcademy3FLittleGirlText
	text_end

PokemonAcademy3FRockerText:
	text_far _PokemonAcademy3FRockerText
	text_end

PokemonAcademy3FCooltrainerFText:
	text_far _PokemonAcademy3FCooltrainerFText
	text_end

PokemonAcademy3FBeautyText:
	text_far _PokemonAcademy3FBeautyText
	text_end

PokemonAcademy3FSuperNerdText:
	text_far _PokemonAcademy3FSuperNerdText
	text_end


PokemonAcademy3FDVsNotes:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .DVsIntroText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .DVsExplanationText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .DVsGrowthText
	call PrintText
.doneReading
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.DVsIntroText:
	text_far _PokemonAcademy3FDVsIntroText
	text_end

.DVsExplanationText:
	text_far _PokemonAcademy3FDVsExplanationText
	text_end

.DVsGrowthText:
	text_far _PokemonAcademy3FDVsGrowthText
	text_end


PokemonAcademy3FMistHazeNotes:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .MistHazeIntroText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .MistText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .HazeText
	call PrintText
.doneReading
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.MistHazeIntroText:
	text_far _PokemonAcademy3FMistHazeIntroText
	text_end

.MistText:
	text_far _PokemonAcademy3FMistText
	text_end

.HazeText:
	text_far _PokemonAcademy3FHazeText
	text_end


PokemonAcademy3FHyperBeamNotes:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .HyperBeamIntroText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .HyperBeamExplanationText
	call PrintText
.doneReading
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.HyperBeamIntroText:
	text_far _PokemonAcademy3FHyperBeamIntroText
	text_end

.HyperBeamExplanationText:
	text_far _PokemonAcademy3FHyperBeamExplanationText
	text_end


PokemonAcademy3FStatExpNotes:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .StatExpIntroText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .StatExpBattleText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .StatExpGainText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .StatExpUseText
	call PrintText
	call KeepReadingNotes
	jr nz, .doneReading
	ld hl, .StatExpMaxText
	call PrintText
.doneReading
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.StatExpIntroText:
	text_far _PokemonAcademy3FStatExpIntroText
	text_end

.StatExpBattleText:
	text_far _PokemonAcademy3FStatExpBattleText
	text_end

.StatExpGainText:
	text_far _PokemonAcademy3FStatExpGainText
	text_end

.StatExpUseText:
	text_far _PokemonAcademy3FStatExpUseText
	text_end

.StatExpMaxText:
	text_far _PokemonAcademy3FStatExpMaxText
	text_end


PokemonAcademy3FSignText:
	text_far _PokemonAcademy3FSignText
	text_end


PokemonAcademy4FGameboyKid1Text:
	text_far _PokemonAcademy4FGameboyKid1Text
	text_end

PokemonAcademy4FGameboyKid2Text:
	text_far _PokemonAcademy4FGameboyKid2Text
	text_end


PokemonAcademy4FGrannyText:
	text_asm
	call SaveScreenTilesToBuffer2
	ld hl, .IntroText
	call PrintText
	;ld hl, TextScriptPromptButton
	;call TextCommandProcessor
	CheckEvent EVENT_PASSED_SENIOR_TEST
	jr z, .notPassed
	ld hl, .PassedTestsText
	call PrintText
	ld d, KADABRA
	callfar IsMonInParty ; outputs [wWhichPokemon] = index of Kadabra in party (0 to 5)
	jr z, .done
	ld hl, TextScriptPromptButton
	call TextCommandProcessor
	ld hl, .KadabraCapableText
	call PrintText
	ld a, $01
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	ld hl, .GetToWorkText
	call PrintText
	ld a, KADABRA
	call PlayCry
	call WaitForSoundToFinish
	call GBFadeOutToBlack
	call Delay3
	call Delay3
	call Delay3
	call GBFadeInFromBlack
	ld hl, .GoodProgressText
	call PrintText
	callfar EvolveMonInteraction    ; actual evolution and map reloading
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.notPassed
	ld hl, .BitBusyText
	call PrintText
.done
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.IntroText
	text_far _PokemonAcademy4FGrannyIntroText
	text_end

.BitBusyText:
	text_far _PokemonAcademy4FGrannyBitBusyText
	text_end

.PassedTestsText:
	text_far _PokemonAcademy4FGrannyPassedTestsText
	text_end

.KadabraCapableText:
	text_far _PokemonAcademy4FGrannyKadabraCapableText
	text_end

.GetToWorkText:
	text_far _PokemonAcademy4FGrannyGetToWorkText
	text_end

.GoodProgressText:
	text_far _PokemonAcademy4FGrannyGoodProgressText
	text_end


PokemonAcademy4FSignText:
	text_far _PokemonAcademy4FSignText
	text_end
