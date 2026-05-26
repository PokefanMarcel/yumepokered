; marcelnote - new location
; TODO - Spanish translation
_BattleHallReceptionistNeedThreeMonText::
	text "You need exactly"
	line "three #MON"
	cont "in your team to"
	cont "start the battle."
	done

; TODO - Spanish translation
_BattleHallReceptionistTeamReadyText::
	text "Your team is"
	line "ready!"

	para "Speak to your"
	line "opponent to"
	cont "start the battle."
	done

; TODO - Spanish translation
_BattleHallReceptionistWhatABattleText::
	text "What an intense"
	line "battle that was!"
	done

; TODO - Spanish translation
_BattleHallTrainerPreBattleText::
	text "..."
	done

_BattleHallTrainerDefeatedText::
	text "¡<PLAYER> venció a"
	line "@"
	text_ram wTrainerName
	text "!"
	prompt

_BattleHallTrainerPostBattleText::
	text "...!"
	done

; TODO - Spanish translation
_BattleHallTrainerWinText:: ; marcelnote - this is used in HandlePlayerBlackOut
	text_ram wTrainerName
	text ": ..."
	prompt
