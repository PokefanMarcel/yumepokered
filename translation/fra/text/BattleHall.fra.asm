; marcelnote - new location
_BattleHallReceptionistNeedThreeMonText::
	text "Il vous faut"
	line "exactement trois"
	cont "#MON pour com-"
	cont "mencer le combat."
	done

_BattleHallReceptionistTeamReadyText::
	text "Votre équipe est"
	line "prête!"

	para "Allez voir votre"
	line "adversaire pour"
	cont "lancer le combat."
	done

_BattleHallReceptionistWhatABattleText::
	text "Quel combat! Un"
	line "vrai spectacle!"
	done

_BattleHallTrainerPreBattleText::
	text "..."
	done

_BattleHallTrainerDefeatedText::
	text "..."
	prompt

_BattleHallTrainerPostBattleText::
	text "...!"
	done

_BattleHallTrainerWinText:: ; marcelnote - this is used in HandlePlayerBlackOut
	text_ram wTrainerName
	text ": ..."
	prompt
