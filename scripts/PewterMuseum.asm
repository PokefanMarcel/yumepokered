; marcelnote - merged Pewter Museum floors
PewterMuseum_Script:
	;ld a, 1 << BIT_NO_AUTO_TEXT_BOX
	;ld [wAutoTextBoxDrawingControl], a
	;xor a
	;ld [wDoNotWaitForButtonPressAfterDisplayingText], a ; marcelnote - all this is DisableAutoTextBoxDrawing (why?)
	call EnableAutoTextBoxDrawing
	ld hl, PewterMuseum_ScriptPointers
	ld a, [wPewterMuseumCurScript]
	jp CallFunctionInTable

PewterMuseum_ScriptPointers:
	def_script_pointers
	dw_const PewterMuseumDefaultScript, SCRIPT_PEWTERMUSEUM_DEFAULT
	dw_const DoRet,                     SCRIPT_PEWTERMUSEUM_NOOP ; PureRGB - DoRet

PewterMuseumDefaultScript:
	ld a, [wYCoord]
	cp 16
	ret nz
	ld a, [wXCoord]
	cp 9
	jr z, .continue
	ld a, [wXCoord]
	cp 10
	ret nz
.continue
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_PEWTERMUSEUM1F_SCIENTIST1
	ldh [hTextID], a
	jp DisplayTextID

PewterMuseum_TextPointers:
	def_text_pointers
	; 1F
	dw_const PewterMuseum1FScientist1Text, TEXT_PEWTERMUSEUM1F_SCIENTIST1
	dw_const PewterMuseum1FGamblerText,    TEXT_PEWTERMUSEUM1F_GAMBLER
	dw_const PewterMuseum1FScientist2Text, TEXT_PEWTERMUSEUM1F_SCIENTIST2
	dw_const PewterMuseum1FScientist3Text, TEXT_PEWTERMUSEUM1F_SCIENTIST3
	dw_const PewterMuseum1FOldAmberText,   TEXT_PEWTERMUSEUM1F_OLD_AMBER
	; 2F
	dw_const PewterMuseum2FYoungsterText,        TEXT_PEWTERMUSEUM2F_YOUNGSTER
	dw_const PewterMuseum2FGrampsText,           TEXT_PEWTERMUSEUM2F_GRAMPS
	dw_const PewterMuseum2FScientistText,        TEXT_PEWTERMUSEUM2F_SCIENTIST
	dw_const PewterMuseum2FBrunetteGirlText,     TEXT_PEWTERMUSEUM2F_BRUNETTE_GIRL
	dw_const PewterMuseum2FHikerText,            TEXT_PEWTERMUSEUM2F_HIKER
	dw_const PewterMuseum2FSpaceShuttleSignText, TEXT_PEWTERMUSEUM2F_SPACE_SHUTTLE_SIGN
	dw_const PewterMuseum2FMoonStoneSignText,    TEXT_PEWTERMUSEUM2F_MOON_STONE_SIGN

PewterMuseum1FScientist1Text: ; marcelnote - optimized
	text_asm
	ld a, [wYCoord]
	cp 16
	jr c, .behind_counter                  ; then y=15
	jr nz, .in_visitor_section_wrong_side  ; then y=18
	ld a, [wXCoord]                        ; else y=16
	cp 13
	jr nz, .in_visitor_section_right_side
.behind_counter
	ld hl, .DoYouKnowWhatAmberIsText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	cp $0
	ld hl, .AmberIsFossilizedTreeSapText
	jr nz, .answeredNo
	ld hl, .TheresALabSomewhereText
.answeredNo
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.in_visitor_section_wrong_side
	CheckEvent EVENT_BOUGHT_MUSEUM_TICKET
	jr nz, .already_bought_ticket
	ld hl, .GoToOtherSideText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.already_bought_ticket
	ld hl, .TakePlentyOfTimeText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.in_visitor_section_right_side
	CheckEvent EVENT_BOUGHT_MUSEUM_TICKET
	jr nz, .already_bought_ticket
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	xor a
	ldh [hJoyHeld], a
	ld hl, .WouldYouLikeToComeInText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .deny_entry
	xor a
	ldh [hMoney], a
	ldh [hMoney + 1], a
	ld a, $50
	ldh [hMoney + 2], a
	call HasEnoughMoney
	jr nc, .buy_ticket
	ld hl, .DontHaveEnoughMoneyText
	call PrintText
.deny_entry
	ld hl, .ComeAgainText
	call PrintText
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	call UpdateSprites
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.buy_ticket
	ld hl, .ThankYouText
	call PrintText
	SetEvent EVENT_BOUGHT_MUSEUM_TICKET
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 1], a
	ld a, $50
	ld [wPriceTemp + 2], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld a, SCRIPT_PEWTERMUSEUM_NOOP
	ld [wPewterMuseumCurScript], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.ComeAgainText:
	text_far _PewterMuseum1FScientist1ComeAgainText
	text_end

.WouldYouLikeToComeInText:
	text_far _PewterMuseum1FScientist1WouldYouLikeToComeInText
	text_end

.ThankYouText:
	text_far _PewterMuseum1FScientist1ThankYouText
	text_end

.DontHaveEnoughMoneyText:
	text_far _PewterMuseum1FScientist1DontHaveEnoughMoneyText
	text_end

.DoYouKnowWhatAmberIsText:
	text_far _PewterMuseum1FScientist1DoYouKnowWhatAmberIsText
	text_end

.TheresALabSomewhereText:
	text_far _PewterMuseum1FScientist1TheresALabSomewhereText
	text_end

.AmberIsFossilizedTreeSapText:
	text_far _PewterMuseum1FScientist1AmberIsFossilizedTreeSapText
	text_end

.GoToOtherSideText:
	text_far _PewterMuseum1FScientist1GoToOtherSideText
	text_end

.TakePlentyOfTimeText:
	text_far _PewterMuseum1FScientist1TakePlentyOfTimeText
	text_end

PewterMuseum1FGamblerText:
	text_far _PewterMuseum1FGamblerText
	text_end

PewterMuseum1FScientist2Text: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_GOT_OLD_AMBER
	ld hl, .GetTheOldAmberCheckText
	jr nz, .done
	ld hl, .TakeThisToAPokemonLabText
	call PrintText
	lb bc, OLD_AMBER, 1
	call GiveItem
	ld hl, .YouDontHaveSpaceText
	jr nc, .done
	SetEvent EVENT_GOT_OLD_AMBER
	ld a, HS_OLD_AMBER
	ld [wMissableObjectIndex], a
	predef HideObject
	ld hl, .ReceivedOldAmberText
.done
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.TakeThisToAPokemonLabText:
	text_far _PewterMuseum1FScientist2TakeThisToAPokemonLabText
	text_end

.ReceivedOldAmberText:
	text_far _PewterMuseum1FScientist2ReceivedOldAmberText
	sound_get_item_1
	text_end

.GetTheOldAmberCheckText:
	text_far _PewterMuseum1FScientist2GetTheOldAmberCheckText
	text_end

.YouDontHaveSpaceText:
	text_far _PewterMuseum1FScientist2YouDontHaveSpaceText
	text_end

PewterMuseum1FScientist3Text:
	text_far _PewterMuseum1FScientist3Text
	text_end

PewterMuseum1FOldAmberText:
	text_far _PewterMuseum1FOldAmberText
	text_end

PewterMuseum2FYoungsterText:
	text_far _PewterMuseum2FYoungsterText
	text_end

PewterMuseum2FGrampsText:
	text_far _PewterMuseum2FGrampsText
	text_end

PewterMuseum2FScientistText:
	text_far _PewterMuseum2FScientistText
	text_end

PewterMuseum2FBrunetteGirlText:
	text_far _PewterMuseum2FBrunetteGirlText
	text_end

PewterMuseum2FHikerText:
	text_far _PewterMuseum2FHikerText
	text_end

PewterMuseum2FSpaceShuttleSignText:
	text_far _PewterMuseum2FSpaceShuttleSignText
	text_end

PewterMuseum2FMoonStoneSignText:
	text_far _PewterMuseum2FMoonStoneSignText
	text_end
