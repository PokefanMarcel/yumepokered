_Route1Youngster1MartSampleText::
	text "Salut! Je"
	line "travaille à la"
	cont "BOUTIQUE #MON."

	para "Nous avons plein"
	line "d'articles! Viens"
	cont "nous voir à"
	cont "JADIELLE."

	para "Prends donc"
	line "ceci comme"
	cont "échantillon!"
	prompt

_Route1Youngster1GotPotionText::
	text "<PLAYER> obtient:"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_Route1Youngster1AlsoGotPokeballsText::
	text "Nous avons aussi"
	line "des # BALL"
	cont "pour capturer les"
	cont "#MON!"
	done

_Route1Youngster1NoRoomText::
	text "Ton inventaire"
	line "est plein!"
	done

_Route1Youngster2Text::
	text "Tu vois ces"
	line "rebords le long"
	cont "de la route?"

	para "Tu peux sauter"
	line "par-dessus! C'est"
	cont "dingue, non?"

	para "Tu peux revenir"
	line "plus vite à"
	cont "BOURG PALETTE de"
	cont "cette façon!"
	done

_Route1SignText::
	text "ROUTE 1"
	line "BOURG PALETTE -"
	cont "JADIELLE"
	done


_Route1OakBeforeBattleText:: ; marcelnote - postgame Oak fight
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "CHEN: Oh,"
	line "<PLAYER>!"
	cont "Tu me surprends"
	cont "en pleine"
	cont "promenade."

	para "Ca tombe bien, je"
	line "voulais te voir."

	para "Tu sais, à mon"
	line "époque, j'étais"
	cont "un sacré dresseur"
	cont "moi aussi."

	para "Et te voir partir"
	line "du BOURG PALETTE"
	cont "jusqu'à décrocher"
	cont "le titre de"
	cont "champion de la"
	cont "LIGUE #MON..."

	para "Ca m'a rajeuni!"

	para "Alors, <PLAYER>!"
	line "Tu offrirais bien"
	cont "un combat amical"
	cont "à un vétéran"
	cont "comme moi, non?"
	done

.GirlText
	text "CHEN: Oh,"
	line "<PLAYER>!"
	cont "Tu me surprends"
	cont "en pleine"
	cont "promenade."

	para "Ca tombe bien, je"
	line "voulais te voir."

	para "Tu sais, à mon"
	line "époque, j'étais"
	cont "un sacré dresseur"
	cont "moi aussi."

	para "Et te voir partir"
	line "du BOURG PALETTE"
	cont "jusqu'à décrocher"
	cont "le titre de"
	cont "championne de la"
	cont "LIGUE #MON..."

	para "Ca m'a rajeuni!"

	para "Alors, <PLAYER>!"
	line "Tu offrirais bien"
	cont "un combat amical"
	cont "à un vétéran"
	cont "comme moi, non?"
	done

_Route1OakRefusedBattleText:: ; marcelnote - postgame Oak battle
	text "Une autre fois,"
	line "peut-être!"
	done

_Route1OakAcceptedBattleText:: ; marcelnote - postgame Oak battle
	text "Parfait!"
	line "Mettons ces vieux"
	cont "réflexes à"
	cont "l'épreuve!"
	done

_Route1OakDefeatText:: ; marcelnote - postgame Oak battle
_Route1OakVictoryText:: ; marcelnote - postgame Oak battle
	text "Ah!"
	line "Un tel combat,"
	cont "ça vous requinque"
	cont "un homme!"
	prompt

_Route1OakPostBattleText:: ; marcelnote - postgame Oak battle
	text "CHEN: Alors là,"
	line "<PLAYER>, chapeau!"

	para "Je n'avais pas"
	line "pris une telle"
	cont "dérouillée depuis"
	cont "des lustres!"

	para "Bon, maintenant,"
	line "retour au boulot!"
	done

_Route1OakOneMoreThingText:: ; marcelnote - postgame Oak battle
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Ah, encore"
	line "une chose!"

	para "Vu tes récents"
	line "exploits, j'ai"
	cont "demandé au garde"
	cont "de la ROUTE 22"
	cont "de t'ouvrir le"
	cont "passage."

	para "D'ailleurs, j'ai"
	line "aussi donné mon"
	cont "feu vert pour une"
	cont "autre dresseuse"
	cont "du BOURG PALETTE."

	para "Elle a vaincu le"
	line "CONSEIL des 4 et"
	cont "<RIVAL> au"
	cont "PLATEAU INDIGO!"

	para "Je te parie qu'elle"
	line "aimerait défier"
	cont "le vrai champion!"
	done

.GirlText
	text "Ah, encore"
	line "une chose!"

	para "Vu tes récents"
	line "exploits, j'ai"
	cont "demandé au garde"
	cont "de la ROUTE 22"
	cont "de t'ouvrir le"
	cont "passage."

	para "D'ailleurs, j'ai"
	line "aussi donné mon"
	cont "feu vert pour une"
	cont "autre dresseuse"
	cont "du BOURG PALETTE."

	para "Elle a vaincu le"
	line "CONSEIL des 4 et"
	cont "<RIVAL> au"
	cont "PLATEAU INDIGO!"

	para "Je te parie qu'elle"
	line "aimerait défier"
	cont "la véritable"
	cont "championne!"
	done
