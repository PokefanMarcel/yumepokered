; marcelnote - merged Safari Zone houses

_SafariZoneCenterRestHouseGirlText::
	text "JULIA: Où est"
	line "NICO, mon petit"
	cont "ami?"
	done

_SafariZoneCenterRestHouseScientistText::
	text "Je capture des"
	line "#MON pour"
	cont "les offrir!"
	done


_SafariZoneWestRestHouseScientistText::
	text "Un CAILLOU peut" ; marcelnote - was "Une PIERRE"
	line "faire fuir les"
	cont "#MON mais ils"
	cont "seront plus fa-"
	cont "ciles à capturer."
	done

_SafariZoneWestRestHouseCooltrainerMText::
	text "Un APPAT peut"
	line "faciliter vos"
	cont "captures."
	done

_SafariZoneWestRestHouseSilphWorkerFText::
	text "J'ai cherché"
	line "toute la sainte"
	cont "journée mais j'ai"
	cont "rien capturé."
	done


_SafariZoneNorthRestHouseScientistText::
	text "Tu peux garder"
	line "tous les objets"
	cont "trouvés dans le"
	cont "coin."

	para "Mais ne perds pas"
	line "de temps à tous"
	cont "les essayer!"
	done

_SafariZoneNorthRestHouseSafariZoneWorkerText::
	text "Un recoin du PARC"
	line "SAFARI renferme"
	cont "un prix!"
	done

_SafariZoneNorthRestHouseGentlemanText::
	text "Mon EVOLI s'est"
	line "transformé en un"
	cont "PYROLI!"

	para "Mais celui d'un"
	line "ami s'est changé"
	cont "en AQUALI!"
	cont "Bah pourquoi?"
	done


_SafariZoneEastRestHouseScientistText::
	text "T'en as capturé"
	line "combien? Moi"
	cont "j'suis naze!"
	done

_SafariZoneEastRestHouseRockerText::
	text "J'ai trouvé un"
	line "LEVEINARD!"

	para "J'ai bien fait"
	line "de chercher"
	cont "pendant 4 heures!"
	done

_SafariZoneEastRestHouseSilphWorkerMText::
	text "Pffff!"
	line "J'en ai marre!"
	done

;_UnusedBenchGuyText2:: ; marcelnote - second translation for text above
;	text "La fatigue..."
;	cont "Doucement..."
;	cont "Me gagne..."
;	done


_SafariZoneSecretHouseFishingGuruYouHaveWonText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Ah! Quand même!"

	para "Tu es le premier"
	line "à découvrir la"
	cont "CABANE SECRETE!"

	para "J'avais peur que"
	line "personne ne gagne"
	cont "notre prix."

	para "Félicitations!"
	line "Tu as gagné!"
	prompt

.GirlText
	text "Ah! Quand même!"

	para "Tu es la première"
	line "à découvrir la"
	cont "CABANE SECRETE!"

	para "J'avais peur que"
	line "personne ne gagne"
	cont "notre prix."

	para "Félicitations!"
	line "Tu as gagné!"
	prompt

_SafariZoneSecretHouseFishingGuruReceivedHM03Text::
	text "<PLAYER> obtient:"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_SafariZoneSecretHouseFishingGuruHM03ExplanationText::
	text "CS03 est SURF!"

	para "Un #MON pourra"
	line "te faire naviguer"
	cont "sur les flots!"

	para "En plus, cette CS"
	line "peut s'utiliser à"
	cont "l'infini!"

	para "T'en as de la"
	line "chance, mon p'tit"
	cont "bouchon!"
	done

_SafariZoneSecretHouseFishingGuruHM03NoRoomText::
	text "Heu... Tu n'as"
	line "pas assez de"
	cont "place!"
	done

_SafariZoneSecretHousePosterText:: ; marcelnote - new
	text "Fans de SURF,"
	line "rendez-vous à la"
	cont "PAILLOTE D'ETE!"

	para "Venez montrer vos"
	line "flips les plus"
	cont "dingues!"

	para "MAITRE SURFEUR"
	done
