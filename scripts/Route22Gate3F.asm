; marcelnote - new floor
Route22Gate3F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route22Gate3F_ScriptPointers
	ld a, [wRoute22Gate3FCurScript]
	jp CallFunctionInTable

Route22Gate3F_ScriptPointers:
	def_script_pointers
	dw_const DoRet,                         SCRIPT_ROUTE22GATE3F_DEFAULT ; PureRGB - DoRet
	dw_const Route22Gate3FPostBattleScript, SCRIPT_ROUTE22GATE3F_POST_BATTLE

Route22Gate3FPostBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jr z, .lost
	SetEvent EVENT_BEAT_BATTLE_HALL_TRAINER
	ld a, TEXT_ROUTE22GATE3F_RED ; doesn't matter if Red or Green
	ldh [hTextID], a
	call DisplayTextID
.lost
	xor a ; SCRIPT_ROUTE22GATE3F_DEFAULT
	ld [wRoute22Gate3FCurScript], a
	ld [wCurMapScript], a
	ret

Route22Gate3F_TextPointers:
	def_text_pointers
	dw_const Route22Gate3FTrainerText,      TEXT_ROUTE22GATE3F_RED
	dw_const Route22Gate3FTrainerText,      TEXT_ROUTE22GATE3F_GREEN
	dw_const Route22Gate3FReceptionistText, TEXT_ROUTE22GATE3F_RECEPTIONIST

Route22Gate3FReceptionistText:
	text_far _Route22Gate3FReceptionistText
	text_end

Route22Gate3FTrainerText:
	text_asm
	CheckEvent EVENT_BEAT_BATTLE_HALL_TRAINER
	jr z, .beforeBeat
	ld hl, .PostBattleText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.beforeBeat
	ld hl, .PreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .TrainerDefeatedText
	ld de, .TrainerDefeatedText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_ROUTE22GATE3F_POST_BATTLE
	ld [wRoute22Gate3FCurScript], a
	ld [wCurMapScript], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.PreBattleText:
	text_far _Route22Gate3FTrainerPreBattleText
	text_end

.TrainerDefeatedText:
	text_far _Route22Gate3FTrainerDefeatedText
	text_end

.PostBattleText:
	text_far _Route22Gate3FTrainerPostBattleText
	text_end
