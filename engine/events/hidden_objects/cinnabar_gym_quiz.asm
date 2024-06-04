PrintCinnabarQuiz:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump CinnabarGymQuiz

CinnabarGymQuiz::
	text_asm
	xor a
	ld [wOpponentAfterWrongAnswer], a
	ld a, [wHiddenObjectFunctionArgument]
	push af
	and $f
	ldh [hGymGateIndex], a
	pop af
	and $f0
	swap a
	ldh [hGymGateAnswer], a
	ld hl, CinnabarGymQuizIntroText
	call PrintText
	ldh a, [hGymGateIndex]
	dec a
	add a
	ld d, 0
	ld e, a
	ld hl, CinnabarQuizQuestions
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call CinnabarGymQuiz_AskQuestion
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarGymQuizIntroText:
	text_far _CinnabarGymQuizIntroText
	text_end

CinnabarQuizQuestions:
	dw CinnabarQuizQuestionsText1
	dw CinnabarQuizQuestionsText2 ; marcelnote - new quiz question
	dw CinnabarQuizQuestionsText3 ; marcelnote - questions 2-6 reindexed as 3-7
	dw CinnabarQuizQuestionsText4
	dw CinnabarQuizQuestionsText5
	dw CinnabarQuizQuestionsText6
	dw CinnabarQuizQuestionsText7

CinnabarQuizQuestionsText1:
	text_far _CinnabarQuizQuestionsText1
	text_end

CinnabarQuizQuestionsText2: ; marcelnote - new quiz question
	text_far _CinnabarQuizQuestionsText2
	text_end

CinnabarQuizQuestionsText3: ; marcelnote - reindexed from 2
	text_far _CinnabarQuizQuestionsText3
	text_end

CinnabarQuizQuestionsText4: ; marcelnote - reindexed from 3
	text_far _CinnabarQuizQuestionsText4
	text_end

CinnabarQuizQuestionsText5: ; marcelnote - reindexed from 4
	text_far _CinnabarQuizQuestionsText5
	text_end

CinnabarQuizQuestionsText6: ; marcelnote - reindexed from 5
	text_far _CinnabarQuizQuestionsText6
	text_end

CinnabarQuizQuestionsText7: ; marcelnote - reindexed from 6
	text_far _CinnabarQuizQuestionsText7
	text_end

CinnabarGymGateFlagAction:
	EventFlagAddress hl, EVENT_CINNABAR_GYM_GATE0_UNLOCKED
	predef_jump FlagActionPredef

CinnabarGymQuiz_AskQuestion:
	call YesNoChoice
	ldh a, [hGymGateAnswer]
	ld c, a
	ld a, [wCurrentMenuItem]
	cp c
	jr nz, .wrongAnswer
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	ldh a, [hGymGateIndex]
	ldh [hBackupGymGateIndex], a
	ld hl, CinnabarGymQuizCorrectText
	call PrintText
	ldh a, [hBackupGymGateIndex]
	AdjustEventBit EVENT_CINNABAR_GYM_GATE0_UNLOCKED, 0
	ld c, a
	ld b, FLAG_SET
	call CinnabarGymGateFlagAction
	jp UpdateCinnabarGymGateTileBlocks_
.wrongAnswer
	call WaitForSoundToFinish
	ld a, SFX_DENIED
	call PlaySound
	call WaitForSoundToFinish
	ld hl, CinnabarGymQuizIncorrectText
	call PrintText
	ldh a, [hGymGateIndex]
	add $2
	AdjustEventBit EVENT_BEAT_CINNABAR_GYM_TRAINER_0, 2
	ld c, a
	ld b, FLAG_TEST
	EventFlagAddress hl, EVENT_BEAT_CINNABAR_GYM_TRAINER_0
	predef FlagActionPredef
	ld a, c
	and a
	ret nz
	ldh a, [hGymGateIndex]
	add $1 ; marcelnote - adjusted from $2 to accommodate new quiz question
	ld [wOpponentAfterWrongAnswer], a
	ret

CinnabarGymQuizCorrectText:
	sound_get_item_1
	text_far _CinnabarGymQuizCorrectText
	text_promptbutton
	text_asm

	ldh a, [hBackupGymGateIndex]
	AdjustEventBit EVENT_CINNABAR_GYM_GATE0_UNLOCKED, 0
	ld c, a
	ld b, FLAG_TEST
	call CinnabarGymGateFlagAction
	ld a, c
	and a
	jr nz, .done      ; PureRGB - rst TextScriptEnd
	call WaitForSoundToFinish
	ld a, SFX_GO_INSIDE
	call PlaySound
	call WaitForSoundToFinish
.done                 ; PureRGB - rst TextScriptEnd
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CinnabarGymQuizIncorrectText:
	text_far _CinnabarGymQuizIncorrectText
	text_end

UpdateCinnabarGymGateTileBlocks_::
; Update the overworld map with open floor blocks or locked gate blocks
; depending on event flags.
	ld a, 7 ; marcelnote - adjusted up from 6 to accommodate new quiz question
	ldh [hGymGateIndex], a
.loop
	ldh a, [hGymGateIndex]
	dec a
	add a
	add a
	ld d, 0
	ld e, a
	ld hl, CinnabarGymGateCoords
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	inc hl
	ld a, [hl]
	ld [wGymGateTileBlock], a
	push bc
	ldh a, [hGymGateIndex]
	ldh [hBackupGymGateIndex], a
	AdjustEventBit EVENT_CINNABAR_GYM_GATE0_UNLOCKED, 0
	ld c, a
	ld b, FLAG_TEST
	call CinnabarGymGateFlagAction
	ld a, c
	and a
	jr nz, .unlocked
	ld a, [wGymGateTileBlock]
	jr .next
.unlocked
	ld a, $e
.next
	pop bc
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	ld hl, hGymGateIndex
	dec [hl]
	jr nz, .loop
	ret

MACRO gym_gate_coord
	db \1, \2, \3, 0
ENDM

DEF HORIZONTAL_GATE_BLOCK EQU $54
DEF VERTICAL_GATE_BLOCK   EQU $30 ; marcelnote - use block with gate on the left instead

CinnabarGymGateCoords:
	; x coord, y coord, block id
	gym_gate_coord 9, 3, HORIZONTAL_GATE_BLOCK
	gym_gate_coord 7, 1, VERTICAL_GATE_BLOCK ; marcelnote - new quiz question
	gym_gate_coord 6, 3, HORIZONTAL_GATE_BLOCK
	gym_gate_coord 6, 6, HORIZONTAL_GATE_BLOCK
	gym_gate_coord 4, 8, VERTICAL_GATE_BLOCK ; marcelnote - adjusted to use the same gate block
	gym_gate_coord 2, 6, HORIZONTAL_GATE_BLOCK
	gym_gate_coord 2, 3, HORIZONTAL_GATE_BLOCK
