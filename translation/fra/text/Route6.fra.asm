_Route6CooltrainerM1BattleText::
	text "Qui est là?"
	line "Arrête de nous"
	cont "espionner!"
	done

_Route6CooltrainerM1EndBattleText::
	text "..."
	line "J'suis nul!"
	prompt

_Route6CooltrainerAfterBattleText::
	text "Soupirs..."
	line "Gros soupirs..."
	done

_Route6CooltrainerF1BattleText::
	text "Heu, c'est une"
	line "conversation"
	cont "privée, DEGAGE!"
	done

_Route6CooltrainerF1EndBattleText::
	text "Non!"
	line "Pas bon perdre!"
	prompt

_Route6Youngster1BattleText::
	text "C'est plein"
	line "d'insectes, ici."
	done

_Route6Youngster1EndBattleText::
	text "Non!"
	line "C'est une blague!"
	prompt

_Route6Youngster1AfterBattleText::
	text "Les insectes"
	line "j'aime ça, je"
	cont "retourne dans la"
	cont "FORET DE JADE."
	done

_Route6CooltrainerM2BattleText::
	text "Hein? Tu veux"
	line "me causer?"
	done

_Route6CooltrainerM2EndBattleText::
	text "..."
	line "J'ai rien fait!"
	prompt

_Route6CooltrainerM2AfterBattleText::
	text "Il me faut plus"
	line "de #MON"
	cont "pour me protéger."
	done

_Route6CooltrainerF2BattleText::
	text "Qui ça? Moi?"
	line "Ok. Attaque!"
	done

_Route6CooltrainerF2EndBattleText::
	text "Ho."
	line "Pas glop!"
	prompt

_Route6CooltrainerF2AfterBattleText::
	text "Je veux être"
	line "forte! Comme toi!"
	cont "C'est quoi ton"
	cont "secret?"
	done

_Route6Youngster2BattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "J't'ai jamais"
	line "vu dans le coin!"
	cont "T'es puissant?"
	done

.GirlText
	text "J't'ai jamais"
	line "vue dans le coin!"
	cont "T'es puissante?"
	done

_Route6Youngster2EndBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Whaa!"
	line "Trop puissant!"
	prompt

.GirlText
	text "Whaa!"
	line "Trop puissante!"
	prompt

_Route6Youngster2AfterBattleText::
	text "Mes #MON sont"
	line "nuls ou je suis"
	cont "très mauvais?"
	done


_Route6LassBattleText:: ; marcelnote - new trainer
	text "Le garde ne veut"
	line "laisser passer"
	cont "personne."
	done

_Route6LassEndBattleText:: ; marcelnote - new trainer
	text "Tu fais"
	line "peur à PARAS!"
	prompt

_Route6LassAfterBattleText:: ; marcelnote - new trainer
	text "Je prends l'air"
	line "en attendant de"
	cont "pouvoir passer."
	done


_Route6UndergroundPathSignText::
	text "SOUTERRAIN"
	line "AZURIA -"
	cont "CARMIN SUR MER"
	done
