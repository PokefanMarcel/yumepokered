_LancesRoomLanceBeforeBattleText::
	text "Ah! Enfin..."
	line "J'ai entendu"
	cont "parler de toi, "
	cont "<PLAYER>!"

	para "Je règne sur le"
	line "CONSEIL des 4!"
	cont "Mon nom est PETER"
	cont "le dresseur de"
	cont "dragons!"

	para "Les dragons sont"
	line "des #MON"
	cont "mystiques!"

	para "Les capturer et"
	line "les entraîner est"
	cont "difficile mais"
	cont "leurs pouvoirs"
	cont "sont supérieurs!"

	para "Ils sont presque"
	line "invincibles!"

	para "Le glas de la"
	line "défaite et de la"
	cont "honte sonne pour"
	cont "toi..."

	para "L'entends-tu?"
	done

_LancesRoomLanceEndBattleText::
	text "Incroyable!"

	para "Tu as bien mérité"
	line "le titre de..."
	cont "Maître #MON!"
	prompt

_LancesRoomLanceAfterBattleText::
	text "Comment mes"
	line "dragons ont-ils"
	cont "pu succomber à"
	cont "tes attaques,"
	cont "<PLAYER>?"

	para "Tu es désormais"
	line "champion de la"
	cont "LIGUE #MON!"

	para "Enfin..."
	line "Pas tout à fait."
	cont "Une épreuve doit"
	cont "encore t'être"
	cont "imposée..."

	para "Un grand dresseur"
	line "t'attend. Son nom"
	cont "est..."

	para "<RIVAL>!"
	line "Il a vaincu le"
	cont "CONSEIL des 4"
	cont "avant toi!"

	para "Il est le vrai"
	line "champion #MON!@"
	text_end


_LancesRoomLanceRematchBeforeBattleText:: ; marcelnote - Lance rematch text
	text "Ah, <PLAYER>!"
	line "Je t'attendais."

	para "J'ai entraîné"
	line "mes dragons sans"
	cont "relâche afin"
	cont "qu'ils dépassent"
	cont "leurs limites."

	para "Peux-tu encore"
	line "tenir face à"
	cont "leur puissance?"
	done

_LancesRoomLanceRematchEndBattleText:: ; marcelnote - Lance rematch text
	text "Incroyable!"

	para "Tu deviens encore"
	line "plus fort avec"
	cont "chaque combat."
	prompt

_LancesRoomLanceRematchAfterBattleText:: ; marcelnote - Lance rematch text
	text "J'ai du mal"
	line "à y croire!"

	para "Même ma nouvelle"
	line "équipe n'a pas pu"
	cont "te faire face."

	para "Tu mérites"
	line "vraiment le titre"
	cont "de champion," ; gendered text
	cont "<PLAYER>!@"
	text_end
