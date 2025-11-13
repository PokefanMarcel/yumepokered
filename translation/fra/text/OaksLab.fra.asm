_OaksLabRivalGrampsIsntAroundText::
	text "<RIVAL>: Yo!"
	line "<PLAYER>! Pépé"
	cont "n'est pas là!"
	done

_OaksLabRivalGoAheadAndChooseText::
	text "<RIVAL>: Je ne"
	line "suis pas avide"
	cont "comme toi!"

	para "Allez, choisis,"
	line "<PLAYER>!"
	done

_OaksLabRivalMyPokemonLooksStrongerText::
	text "<RIVAL>: Mon"
	line "#MON est"
	cont "plus fort."
	done

_OaksLabThoseArePokeBallsText::
	text "Ces # BALL"
	line "contiennent des"
	cont "#MON!"
	done

_OaksLabYouWantCharmanderText::
	text "Veux-tu le"
	line "#MON de feu,"
	cont "SALAMECHE?"
	done

_OaksLabYouWantSquirtleText::
	text "Veux-tu le"
	line "#MON de l'eau,"
	cont "CARAPUCE?"
	done

_OaksLabYouWantBulbasaurText::
	text "Veux-tu le"
	line "#MON des"
	cont "plantes,"
	cont "BULBIZARRE?"
	done

_OaksLabMonEnergeticText::
	text "Ce #MON est"
	line "très énergique!"
	prompt

_OaksLabReceivedMonText::
	text "<PLAYER> obtient:"
	line "@"
	text_ram wNameBuffer
	text "!@"
	text_end

_OaksLabLastMonText::
	text "C'est le dernier"
	line "#MON du"
	cont "PROF. CHEN!"
	done

_OaksLabOakWhichPokemonDoYouWantText::
	text "CHEN: <PLAYER>,"
	line "quel #MON "
	cont "choisis-tu?"
	done

_OaksLabOakYourPokemonCanFightText::
	text "CHEN: Ton #MON"
	line "te protègera des"
	cont "#MON sauvages!"
	done

_OaksLabOakRaiseYourYoungPokemonText::
	text "CHEN: <PLAYER>,"
	line "entraîne ton"
	cont "#MON au combat"
	cont "pour qu'il"
	cont "devienne fort!"
	done

_OaksLabOakDeliverParcelText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "CHEN: <PLAYER>!"

	para "Comment va ton"
	line "#MON?"

	para "Je crois qu'il"
	line "t'aime bien!"

	para "Tu m'as l'air"
	line "doué pour"
	cont "entraîner les"
	cont "#MON!"

	para "Comment? Tu as"
	line "quelque chose à"
	cont "me donner?"

	para "<PLAYER> donne"
	line "le COLIS DE CHEN.@"
	text_end

.GirlText
	text "CHEN: <PLAYER>!"

	para "Comment va ton"
	line "#MON?"

	para "Je crois qu'il"
	line "t'aime bien!"

	para "Tu m'as l'air"
	line "douée pour"
	cont "entraîner les"
	cont "#MON!"

	para "Comment? Tu as"
	line "quelque chose à"
	cont "me donner?"

	para "<PLAYER> donne"
	line "le COLIS DE CHEN.@"
	text_end

_OaksLabOakParcelThanksText::
	text_start

	para "Ah! C'est la"
	line "# BALL que"
	cont "j'ai commandée!"
	cont "Merci!"
	done

_OaksLabOakPokemonAroundTheWorldText::
	text "Les #MON du"
	line "monde entier sont"
	cont "à toi, <PLAYER>!"
	done

_OaksLabOakReceivedPokeballsText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "CHEN: Il ne te"
	line "suffit pas de"
	cont "voir un #MON"
	cont "pour tout savoir"
	cont "sur lui, mon"
	cont "p'tit bonhomme!"

	para "Il te faut aussi"
	line "l'attraper! Voici"
	cont "des # BALL"
	cont "pour en capturer."

	para "<PLAYER> obtient"
	line "5 # BALL!@"
	text_end

.GirlText
	text "CHEN: Il ne te"
	line "suffit pas de"
	cont "voir un #MON"
	cont "pour tout savoir"
	cont "sur lui, ma"
	cont "p'tite dame!"

	para "Il te faut aussi"
	line "l'attraper! Voici"
	cont "des # BALL"
	cont "pour en capturer."

	para "<PLAYER> obtient"
	line "5 # BALL!@"
	text_end

_OaksLabGivePokeballsExplanationText::
	text_start
	para "Quand un #MON"
	line "sauvage apparaît,"
	cont "il faut jouer"
	cont "serré."

	para "Lance-lui une"
	line "# BALL pour le"
	cont "capturer!" ; marcelnote - fixed 'line' to 'cont'

	para "Mais ça ne"
	line "marchera pas à"
	cont "tous les coups!"

	para "Un #MON en"
	line "pleine forme peut"
	cont "s'échapper!"
	cont "C'est ça, la"
	cont "grande aventure"
	cont "des #MON!"
	done

_OaksLabOakComeSeeMeSometimesText::
	text "CHEN: Reviens me"
	line "voir de temps en"
	cont "temps."

	para "Tiens-moi informé"
	line "du niveau de ton"
	cont "#DEX."
	done

_OaksLabOakHowIsYourPokedexComingText::
	text "CHEN: Je suis"
	line "content de te"
	cont "revoir. Où en"
	cont "es-tu avec ton"
	cont "#DEX?"
	cont "Voyons, voyons..."
	prompt

_OaksLabPokedexText::
	text "C'est comme une"
	line "encyclopédie"
	cont "mais les pages"
	cont "sont blanches!"
	done

_OaksLabOakWalkingText:: ; marcelnote - this is not seen since this Oak is just for the walking animation
	text "?"
	done

_OaksLabGirlText::
	text "Le PROF. CHEN est"
	line "la référence en"
	cont "matière de"
	cont "#MON!"

	para "Il est très"
	line "respecté parmi"
	cont "les dresseurs de"
	cont "#MON!"
	done

_OaksLabRivalFedUpWithWaitingText::
	text "<RIVAL>: Pépé!"
	line "J'en ai marre"
	cont "d'attendre!"
	done

_OaksLabOakChooseMonText::
	text "CHEN: <RIVAL>?"
	line "Heu..."

	para "Ah, c'est vrai!"
	line "Je t'ai dit de"
	cont "venir..."

	para "Tiens, <PLAYER>!"

	para "Voici 3 #MON!"

	para "Mais..."

	para "Ils sont dans des"
	line "# BALL."

	para "Plus jeune,"
	line "j'étais un sacré"
	cont "dresseur de"
	cont "#MON! Et oui!"

	para "Mais avec l'âge,"
	line "il ne m'en reste"
	cont "plus que 3!"
	cont "Choisis-en un!"
	done

_OaksLabRivalWhatAboutMeText::
	text "<RIVAL>: Ben!"
	line "Pépé! Mon pépé!"
	cont "Et moi?"
	done

_OaksLabOakBePatientText::
	text "CHEN: Patience,"
	line "<RIVAL>! Tu en"
	cont "auras un aussi!"
	done

_OaksLabOakDontGoAwayYetText::
	text "CHEN: Hé! Ne pars"
	line "pas tout d'suite!"
	done

_OaksLabRivalIllTakeThisOneText::
	text "<RIVAL>: Je"
	line "prends celui-ci!"
	done

_OaksLabRivalReceivedMonText::
	text "<RIVAL> reçoit"
	line "un @"
	text_ram wNameBuffer
	text "!@"
	text_end

_OaksLabRivalIllTakeYouOnText::
	text "<RIVAL>: Minute,"
	line "<PLAYER>!"
	cont "Voyons lequel de"
	cont "nos #MON est"
	cont "le plus fort!"

	para "Allez viens te"
	line "battre, minable!"
	done

_OaksLabRivalIPickedTheWrongPokemonText::
	text "QUOI???"
	line "Incroyable!"
	cont "J'ai pas pris le"
	cont "bon #MON!"
	prompt

_OaksLabRivalAmIGreatOrWhatText::
	text "<RIVAL>: Yeah! Je"
	line "suis fort, hein?"
	prompt

_OaksLabRivalSmellYouLaterText::
	text "<RIVAL>: OK!"
	line "Je vais entraîner"
	cont "mon #MON!"

	para "<PLAYER>! Pépé!"
	line "A plus tard!"
	done

_OaksLabRivalGrampsText::
	text "<RIVAL>: Pépé!"
	done

_OaksLabRivalWhatDidYouCallMeForText::
	text "<RIVAL>: Pourquoi"
	line "tu m'as appelé?"
	done

_OaksLabOakIHaveARequestText::
	text "CHEN: Bon! J'ai"
	line "une faveur à vous"
	cont "demander."
	done

_OaksLabOakMyInventionPokedexText::
	text "Il y a sur ce"
	line "bureau mon"
	cont "invention..."
	cont "Le #DEX!"

	para "Il enregistre les"
	line "informations sur"
	cont "les #MON"
	cont "rencontrés ou"
	cont "capturés!"

	para "C'est comme une"
	line "encyclopédie!"
	done

_OaksLabOakGotPokedexText::
	text "CHEN: <PLAYER> et"
	line "<RIVAL>! Prenez"
	cont "ces #DEX!"

	para "<PLAYER> obtient"
	line "le #DEX!@"
	text_end

_OaksLabOakThatWasMyDreamText::
	text "Faire un guide"
	line "complet sur les"
	cont "#MON du monde"
	cont "entier..."

	para "C'est mon rêve!"

	para "Mais je suis trop"
	line "vieux maintenant!"

	para "C'est pourquoi je"
	line "veux que vous"
	cont "terminiez mon"
	cont "travail!"

	para "Allez, roulez"
	line "jeunesse!"

	para "Que la grande"
	line "quête des #MON"
	cont "commence!"
	done

_OaksLabRivalLeaveItAllToMeText::
	text "<RIVAL>: OK,"
	line "pépé! Donne-les"
	cont "moi tous!"

	para "<PLAYER>, c'est"
	line "clair, j'ai pas"
	cont "besoin de toi,"
	cont "minable!"

	para "Je sais! Je vais"
	line "voler une CARTE à"
	cont "ma soeur!"

	para "Et je lui dirai"
	line "de ne pas t'en"
	cont "donner une! Yark!"
	done

_OaksLabScientistText::
	text "J'assiste le"
	line "PROF. CHEN."
	cont "Je suis donc son"
	cont "...ta daaa!..."
	cont "ASSISTANT!"
	done

_OaksLabScientistOakWentForWalkText:: ; marcelnote - new for Oak battle
	text "Le PROF. CHEN est"
	line "parti faire sa"
	cont "promenade."
	done

_OaksLabRivalShowingDexText:: ; marcelnote - postgame Rival event
	text "<RIVAL>: Yo,"
	line "<PLAYER>!"

	para "Je montrais mon"
	line "#DEX à pépé."

	para "J'ai enregistré"
	line "146 espèces de"
	cont "#MON! Ca en"
	cont "jette, hein?"

	para "Mais pépé me parle"
	line "toujours d'oiseaux"
	cont "légendaires."

	para "Et toi, <PLAYER>?"
	line "T'as croisé un"
	cont "de ces #MON"
	cont "légendaires?"
	prompt


_OaksLabRivalSeenNoBirdText:: ; marcelnote - postgame Rival event
	text "Non? Je m'en"
	line "doutais."

	para "C'est sûrement"
	line "des contes pour"
	cont "minables."
	done

; marcelnote - there must be a smarter way to define these text variants
;              by making use of string buffers like wcd6d (stores names) and wStringBuffer
_OaksLabRivalSeenArticunoText:: ; marcelnote - postgame Rival event
	text "Alors t'as vu"
	line "ARTIKODIN, hein."

	para "Peut-être que pépé"
	line "dit vrai, après"
	cont "tout..."
	done

_OaksLabRivalSeenZapdosText:: ; marcelnote - postgame Rival event
	text "Alors t'as vu"
	line "ELECTHOR, hein."

	para "Peut-être que pépé"
	line "dit vrai, après"
	cont "tout..."
	done

_OaksLabRivalSeenMoltresText:: ; marcelnote - postgame Rival event
	text "Alors t'as vu"
	line "SULFURA, hein."

	para "Peut-être que pépé"
	line "dit vrai, après"
	cont "tout..."
	done

_OaksLabRivalSeenArticunoZapdosText:: ; marcelnote - postgame Rival event
	text "Quoi? T'as vu"
	line "ARTIKODIN et"
	cont "ELECTHOR?"

	para "Alors... SULFURA"
	line "existe-t-il"
	cont "lui aussi?"
	done

_OaksLabRivalSeenArticunoMoltresText:: ; marcelnote - postgame Rival event
	text "Quoi? T'as vu"
	line "ARTIKODIN et"
	cont "SULFURA?"

	para "Alors... ELECTHOR"
	line "existe-t-il"
	cont "lui aussi?"
	done

_OaksLabRivalSeenZapdosMoltresText:: ; marcelnote - postgame Rival event
	text "Quoi? T'as vu"
	line "ELECTHOR et"
	cont "SULFURA?"

	para "Alors... ARTIKODIN"
	line "existe-t-il"
	cont "lui aussi?"
	done

_OaksLabRivalSeenAllBirdsText:: ; marcelnote - postgame Rival event
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Hein, t'as vu"
	line "les trois oiseaux"
	cont "légendaires?"

	para "ARTIKODIN,"
	line "ELECTHOR et"
	cont "SULFURA..."
	cont "Incroyable!"

	para "T'es vraiment un"
	line "sacré dresseur,"
	cont "<PLAYER>!"
	done

.GirlText
	text "Hein, t'as vu"
	line "les trois oiseaux"
	cont "légendaires?"

	para "ARTIKODIN,"
	line "ELECTHOR et"
	cont "SULFURA..."
	cont "Incroyable!"

	para "T'es vraiment une"
	line "sacrée dresseuse,"
	cont "<PLAYER>!"
	done

_OaksLabRivalBackToIndigoText:: ; marcelnote - postgame Rival event
	text "Bon, je retourne"
	line "m'entraîner au"
	cont "PLATEAU INDIGO."

	para "Eh, devine quoi!"
	line "GIOVANNI était"
	cont "le chef caché de"
	cont "la TEAM ROCKET!"

	para "Maintenant qu'il a"
	line "disparu, JADIELLE"
	cont "aura besoin"
	cont "d'un nouveau"
	cont "CHAMPION d'ARENE."

	para "Réfléchis-y,"
	line "<PLAYER>!"
	cont "Un poste peinard"
	cont "dans une ARENE,"
	cont "ça t'irait bien!"

	para "<PLAYER>! Pépé!"
	line "A plus tard!"
	done
