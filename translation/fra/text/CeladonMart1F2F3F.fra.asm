_CeladonMart1FReceptionistText::
	text "Bonjour et bien-"
	line "venue au CENTRE"
	cont "COMMERCIAL de"
	cont "CELADOPOLE."

	para "Le tableau sur la"
	line "droite décrit les"
	cont "différents rayons"
	cont "du magasin."
	done

_CeladonMart1FDirectorySignText::
	text "RDC:"
	line "RENSEIGNEMENTS"

	para "1er: MARCHE DES"
	line "     DRESSEURS" ; marcelnote - realigned

	para "2ème: JEUX VIDEO"

	para "3ème: CADEAUX"

	para "4ème: MEDICAMENTS"

	para "6ème: TONIQUES" ; marcelnote - new floor

	para "DERNIER ETAGE:"
	line "DISTRIBUTEURS"
	done

_CeladonMart1FCurrentFloorSignText::
	text "RDC: "
	line "RENSEIGNEMENTS"
	done


_CeladonMart2FMiddleAgedManText::
	text "Le SUPEREPOUSSE"
	line "tient les faibles"
	cont "#MON à"
	cont "l'écart..."

	para "C'est un REPOUSSE"
	line "plus puissant!"
	done

_CeladonMart2FBrunetteGirlText:: ; marcelnote - new NPC
	text "Ici, chaque BADGE"
	line "te donne accès"
	cont "à plus de CT."

	para "Je veux apprendre"
	line "BULLES D'O à mon"
	cont "GRODOUDOU, mais"
	cont "le vendeur dit"
	cont "qu'il me faut un"
	cont "BADGE PRISME..."
	done

_CeladonMart2FGirlText::
	text "Equipe-toi de"
	line "RAPPELS avant"
	cont "de partir à"
	cont "l'aventure."
	done

_CeladonMart2FCurrentFloorSignText::
	text "Les objets de"
	line "premier choix!"

	para "1er: MARCHE DES"
	line "DRESSEURS"
	done


_CeladonMart3FClerkTM18PreReceiveText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "J'ai fini!!!!"
	line "J'ai fini"
	cont "#MON!!!!"

	para "Pas toi? Yahaha!"
	line "Prends donc ceci,"
	cont "petit!"
	prompt

.GirlText
	text "J'ai fini!!!!"
	line "J'ai fini"
	cont "#MON!!!!"

	para "Pas toi? Yahaha!"
	line "Prends donc ceci,"
	cont "petite!"
	prompt

_CeladonMart3FClerkReceivedTM18Text::
	text "<PLAYER> reçoit"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_CeladonMart3FClerkTM18ExplanationText::
	text "CT18: RIPOSTE!"
	line "Bon allez..."
	cont "Bonne chance!"
	done

_CeladonMart3FClerkTM18NoRoomText::
	text "Ton sac est plein"
	line "à craquer!"
	done

_CeladonMart3FGameBoyKid1Text::
	text "Tous les #MON"
	line "capturés ont un"
	cont "numéro d'immatri-"
	cont "culation et un"
	cont "nom de DO"
	cont "(Dresseur"
	cont "d'Origine)!"
	done

_CeladonMart3FGameBoyKid2Text::
	text "Ouaiiis!"

	para "Mon pote va"
	line "m'échanger son"
	cont "KANGOUREX contre"
	cont "mon GRAVALANCH!"
	done

_CeladonMart3FGameBoyKid3Text::
	text "Cool! Un"
	line "GRAVALANCH!"

	para "J'adore les"
	line "GRAVALANCH!"

	para "Qu...Hein??"

	para "GRAVALANCH se"
	line "transforme en un"
	cont "autre #MON!"
	done

_CeladonMart3FLittleBoyText::
	text "Le numéro d'imma-"
	line "triculation d'un"
	cont "#MON sert à"
	cont "l'identifier lors"
	cont "d'un échange!"
	done

_CeladonMart3FSNESText::
	text "Une SUPER"
	line "NINTENDO!"
	done

_CeladonMart3FRPGText::
	text "Un RPG! Cool..."
	line "Mais trop dur!"
	done

_CeladonMart3FSportsGameText::
	text "Un jeu de sport!"
	line "Vive le foot!"
	done

_CeladonMart3FPuzzleGameText::
	text "Quatre lignes!"
	line "En un seul coup!"
	done

_CeladonMart3FFightingGameText::
	text "Kan contre Ryo!"
	line "Hadoh Ken!"
	done

_CeladonMart3FCurrentFloorSignText::
	text "2ème: JEUX VIDEO"
	done

_CeladonMart3FPokemonPosterText::
	text "Rouge et Bleu!"
	line "Deux #MON!"
	done
