RockTunnelB1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RockTunnelB1F_TrainerHeaders
	ld de, RockTunnelB1F_ScriptPointers
	ld bc, wRockTunnelB1FCurScript
	jp ExecuteCurMapScriptInTable

RockTunnelB1F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROCKTUNNELB1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROCKTUNNELB1F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROCKTUNNELB1F_END_BATTLE

RockTunnelB1F_TextPointers:
	def_text_pointers
	dw_const RockTunnelB1FCooltrainerF1Text, TEXT_ROCKTUNNELB1F_COOLTRAINER_F1
	dw_const RockTunnelB1FHiker1Text,        TEXT_ROCKTUNNELB1F_HIKER1
	dw_const RockTunnelB1FSuperNerd1Text,    TEXT_ROCKTUNNELB1F_SUPER_NERD1
	dw_const RockTunnelB1FSuperNerd2Text,    TEXT_ROCKTUNNELB1F_SUPER_NERD2
	dw_const RockTunnelB1FHiker2Text,        TEXT_ROCKTUNNELB1F_HIKER2
	dw_const RockTunnelB1FCooltrainerF2Text, TEXT_ROCKTUNNELB1F_COOLTRAINER_F2
	dw_const RockTunnelB1FHiker3Text,        TEXT_ROCKTUNNELB1F_HIKER3
	dw_const RockTunnelB1FSuperNerd3Text,    TEXT_ROCKTUNNELB1F_SUPER_NERD3

RockTunnelB1F_TrainerHeaders:
	def_trainers
RockTunnelB1FTrainerHeader0:
	trainer EVENT_BEAT_ROCK_TUNNEL_B1F_TRAINER_0, 4, RockTunnelB1FCooltrainerF1BattleText, RockTunnelB1FCooltrainerF1EndBattleText, RockTunnelB1FCooltrainerF1AfterBattleText
RockTunnelB1FTrainerHeader1:
	trainer EVENT_BEAT_ROCK_TUNNEL_B1F_TRAINER_1, 3, RockTunnelB1FHiker1BattleText, RockTunnelB1FHiker1EndBattleText, RockTunnelB1FHiker1AfterBattleText
RockTunnelB1FTrainerHeader2:
	trainer EVENT_BEAT_ROCK_TUNNEL_B1F_TRAINER_2, 3, RockTunnelB1FSuperNerd1BattleText, RockTunnelB1FSuperNerd1EndBattleText, RockTunnelB1FSuperNerd1AfterBattleText
RockTunnelB1FTrainerHeader3:
	trainer EVENT_BEAT_ROCK_TUNNEL_B1F_TRAINER_3, 4, RockTunnelB1FSuperNerd2BattleText, RockTunnelB1FSuperNerd2EndBattleText, RockTunnelB1FSuperNerd2AfterBattleText
RockTunnelB1FTrainerHeader4:
	trainer EVENT_BEAT_ROCK_TUNNEL_B1F_TRAINER_4, 3, RockTunnelB1FHiker2BattleText, RockTunnelB1FHiker2EndBattleText, RockTunnelB1FHiker2AfterBattleText
RockTunnelB1FTrainerHeader5:
	trainer EVENT_BEAT_ROCK_TUNNEL_B1F_TRAINER_5, 4, RockTunnelB1FCooltrainerF2BattleText, RockTunnelB1FCooltrainerF2EndBattleText, RockTunnelB1FCooltrainerF2AfterBattleText
RockTunnelB1FTrainerHeader6:
	trainer EVENT_BEAT_ROCK_TUNNEL_B1F_TRAINER_6, 3, RockTunnelB1FHiker3BattleText, RockTunnelB1FHiker3EndBattleText, RockTunnelB1FHiker3AfterBattleText
RockTunnelB1FTrainerHeader7:
	trainer EVENT_BEAT_ROCK_TUNNEL_B1F_TRAINER_7, 3, RockTunnelB1FSuperNerd3BattleText, RockTunnelB1FSuperNerd3EndBattleText, RockTunnelB1FSuperNerd3AfterBattleText
	db -1 ; end

RockTunnelB1FCooltrainerF1Text:
	text_asm
	ld hl, RockTunnelB1FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

RockTunnelB1FHiker1Text:
	text_asm
	ld hl, RockTunnelB1FTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

RockTunnelB1FSuperNerd1Text:
	text_asm
	ld hl, RockTunnelB1FTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

RockTunnelB1FSuperNerd2Text:
	text_asm
	ld hl, RockTunnelB1FTrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

RockTunnelB1FHiker2Text:
	text_asm
	ld hl, RockTunnelB1FTrainerHeader4
	call TalkToTrainer
	rst TextScriptEnd

RockTunnelB1FCooltrainerF2Text:
	text_asm
	ld hl, RockTunnelB1FTrainerHeader5
	call TalkToTrainer
	rst TextScriptEnd

RockTunnelB1FHiker3Text:
	text_asm
	ld hl, RockTunnelB1FTrainerHeader6
	call TalkToTrainer
	rst TextScriptEnd

RockTunnelB1FSuperNerd3Text:
	text_asm
	ld hl, RockTunnelB1FTrainerHeader7
	call TalkToTrainer
	rst TextScriptEnd

RockTunnelB1FCooltrainerF1BattleText:
	text_far _RockTunnelB1FCooltrainerF1BattleText
	text_end

RockTunnelB1FCooltrainerF1EndBattleText:
	text_far _RockTunnelB1FCooltrainerF1EndBattleText
	text_end

RockTunnelB1FCooltrainerF1AfterBattleText:
	text_far _RockTunnelB1FCooltrainerF1AfterBattleText
	text_end

RockTunnelB1FHiker1BattleText:
	text_far _RockTunnelB1FHiker1BattleText
	text_end

RockTunnelB1FHiker1EndBattleText:
	text_far _RockTunnelB1FHiker1EndBattleText
	text_end

RockTunnelB1FHiker1AfterBattleText:
	text_far _RockTunnelB1FHiker1AfterBattleText
	text_end

RockTunnelB1FSuperNerd1BattleText:
	text_far _RockTunnelB1FSuperNerd1BattleText
	text_end

RockTunnelB1FSuperNerd1EndBattleText:
	text_far _RockTunnelB1FSuperNerd1EndBattleText
	text_end

RockTunnelB1FSuperNerd1AfterBattleText:
	text_far _RockTunnelB1FSuperNerd1AfterBattleText
	text_end

RockTunnelB1FSuperNerd2BattleText:
	text_far _RockTunnelB1FSuperNerd2BattleText
	text_end

RockTunnelB1FSuperNerd2EndBattleText:
	text_far _RockTunnelB1FSuperNerd2EndBattleText
	text_end

RockTunnelB1FSuperNerd2AfterBattleText:
	text_far _RockTunnelB1FSuperNerd2AfterBattleText
	text_end

RockTunnelB1FHiker2BattleText:
	text_far _RockTunnelB1FHiker2BattleText
	text_end

RockTunnelB1FHiker2EndBattleText:
	text_far _RockTunnelB1FHiker2EndBattleText
	text_end

RockTunnelB1FHiker2AfterBattleText:
	text_far _RockTunnelB1FHiker2AfterBattleText
	text_end

RockTunnelB1FCooltrainerF2BattleText:
	text_far _RockTunnelB1FCooltrainerF2BattleText
	text_end

RockTunnelB1FCooltrainerF2EndBattleText:
	text_far _RockTunnelB1FCooltrainerF2EndBattleText
	text_end

RockTunnelB1FCooltrainerF2AfterBattleText:
	text_far _RockTunnelB1FCooltrainerF2AfterBattleText
	text_end

RockTunnelB1FHiker3BattleText:
	text_far _RockTunnelB1FHiker3BattleText
	text_end

RockTunnelB1FHiker3EndBattleText:
	text_far _RockTunnelB1FHiker3EndBattleText
	text_end

RockTunnelB1FHiker3AfterBattleText:
	text_far _RockTunnelB1FHiker3AfterBattleText
	text_end

RockTunnelB1FSuperNerd3BattleText:
	text_far _RockTunnelB1FSuperNerd3BattleText
	text_end

RockTunnelB1FSuperNerd3EndBattleText:
	text_far _RockTunnelB1FSuperNerd3EndBattleText
	text_end

RockTunnelB1FSuperNerd3AfterBattleText:
	text_far _RockTunnelB1FSuperNerd3AfterBattleText
	text_end
