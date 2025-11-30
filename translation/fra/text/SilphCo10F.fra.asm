_SilphCo10FSilphWorkerFImScaredText::
	text "Waaaaa!"
	line "Mamaaaan!"
	done

_SilphCo10FSilphWorkerFQuietAboutMyCryingText::
	text "Ne répète à"
	line "personne que j'ai"
	cont "pleuré!"
	done

_SilphCo10FRocketBattleText::
	text "Bienvenue au"
	line "9ème étage!"
	cont "J'adore les"
	cont "visites!" ; marcelnote - removed space before !
	done

_SilphCo10FRocketEndBattleText::
	text "Aïe!"
	line "Bobo!"
	prompt

_SilphCo10FRocketAfterBattleText::
	text "Bien joué, mais"
	line "la salle du"
	cont "conseil est"
	cont "au-dessus!"
	done

_SilphCo10FScientistBattleText::
	text "Maintenant..."
	line "Fini de jouer!"
	done

_SilphCo10FScientistEndBattleText::
	text "Oh!"
	line "Game Over!"
	prompt

_SilphCo10FScientistAfterBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "T'as gagné!"
	line "T'es content?"
	done

.GirlText
	text "T'as gagné!"
	line "T'es contente?"
	done
