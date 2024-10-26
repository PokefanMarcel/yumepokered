; marcelnote - new location
MtSilver3F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, MtSilver3F_ScriptPointers
	ld a, [wMtSilver3FCurScript]
	jp CallFunctionInTable

MtSilver3F_ScriptPointers:
	def_script_pointers
	dw_const DoRet,                            SCRIPT_MTSILVER3F_DEFAULT ; PureRGB - DoRet
	dw_const MtSilver3FYellowPostBattleScript, SCRIPT_MTSILVER3F_YELLOW_POST_BATTLE

MtSilver3FYellowPostBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jr z, .lost
	call UpdateSprites
	ld a, TEXT_MTSILVER3F_YELLOW_POST_BATTLE
	ldh [hTextID], a
	call DisplayTextID
	call Delay3
	call GBFadeOutToBlack
	ld a, HS_MT_SILVER_3F_YELLOW
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	call UpdateSprites
	call Delay3
	SetEvent EVENT_BEAT_YELLOW
	;ld a, HS_REDS_YELLOWS_HOUSES_YELLOW
	;ld [wMissableObjectIndex], a
	;predef ShowObjectCont
	call GBFadeInFromBlack
	ld c, 50
	call DelayFrames
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	call UpdateSprites
	ld c, 100
	call DelayFrames
	ld hl, wEmotionBubbleSpriteIndex
	xor a
	ld [hli], a ; player's sprite
	ld a, 2 ; HAPPY_BUBBLE
	ld [hl], a
	predef EmotionBubble
	ld c, 100
	call DelayFrames
	xor a
	ld [wMtSilver3FCurScript], a ; SCRIPT_MTSILVER3F_DEFAULT
	ld [wCurMapScript], a
	ret
.lost
	ld a, SCRIPT_MTSILVER3F_DEFAULT
	ld [wMtSilver3FCurScript], a
	ld [wCurMapScript], a
	ret

MtSilver3F_TextPointers:
	def_text_pointers
	dw_const MtSilver3FYellowText,           TEXT_MTSILVER3F_YELLOW
	dw_const MtSilver3FYellowPostBattleText, TEXT_MTSILVER3F_YELLOW_POST_BATTLE

MtSilver3FYellowText:
	text_asm
	ld hl, .PreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .YellowDefeatedText
	ld de, .YellowDefeatedText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_MTSILVER3F_YELLOW_POST_BATTLE
	ld [wMtSilver3FCurScript], a
	ld [wCurMapScript], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.PreBattleText:
	text_far _MtSilver3FYellowBattleText
	text_end

.YellowDefeatedText:
	text_far _MtSilver3FYellowDefeatedText
	text_end

MtSilver3FYellowPostBattleText:
	text_far _MtSilver3FYellowPostBattleText
	text_end


