_CinnabarLabFishingGuruText::
	text "Ici on étudie"
	line "les #MON."

	para "On nous amène"
	line "souvent des"
	cont "#MON rares"
	cont "pour les étudier."
	done

_CinnabarLabPhotoText::
	text "Voici une photo"
	line "du créateur de ce"
	cont "LABO: Le DR.FUJI!"
	done

_CinnabarLabMeetingRoomSignText::
	text "Salle de réunion"
	line "du LABO #MON"
	done

_CinnabarLabRAndDSignText::
	text "Département"
	line "Recherche et"
	cont "Développement du"
	cont "LABO #MON"
	done

_CinnabarLabTestingRoomSignText::
	text "Salle de test du"
	line "LABO #MON"
	done


_CinnabarLabTradeRoomSuperNerdText::
	text "J'ai trouvé cet"
	line "étrange fossile"
	cont "sur le MONT"
	cont "SELENITE!"

	para "On dirait un"
	line "#MON"
	cont "préhistorique!"
	done


_CinnabarLabMetronomeRoomScientist1Text::
	text "Tiens tiens!"
	line "Je viens de créer"
	cont "une CT sympa!"

	para "Elle provoque des"
	line "trucs étranges!"
	prompt

_CinnabarLabMetronomeRoomScientist1ReceivedTM35Text::
	text "<PLAYER> reçoit:"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_CinnabarLabMetronomeRoomScientist1TM35ExplanationText::
	text "Tik-Tak-Tik-Tak!"
	line "C'est le bruit du"
	cont "METRONOME!"

	para "Cette technique"
	line "fait de la purée"
	cont "avec le cerveau"
	cont "d'un #MON et le"
	cont "force à utiliser"
	cont "des techniques"
	cont "inconnues!"
	done

_CinnabarLabMetronomeRoomScientist1TM35NoRoomText::
	text "Votre inventaire"
	line "est plein!"
	done

_CinnabarLabMetronomeRoomScientist2Text::
	text "EVOLI évolue en"
	line "3 #MON de"
	cont "type différent."
	done

_CinnabarLabMetronomeRoomPCText::
	text "Il y a un e-mail!"

	para "..."

	para "Les 3 #MON"
	line "légendaires sont:"
	cont "ARTIKODIN,"
	cont "ELECTHOR et"
	cont "SULFURA."

	para "On ne sait rien"
	line "d'eux."

	para "Nous allons"
	line "explorer les"
	cont "grottes près de"
	cont "AZURIA."

	para "De : L'EQUIPE DE"
	line "RECHERCHE #MON"

	para "..."
	done

_CinnabarLabMetronomeRoomAmberPipeText::
	text "Un tuyau à ambre!"
	done


_CinnabarLabFossilRoomScientist1Text::
	text "Salut!"

	para "Je suis un"
	line "scientifique très"
	cont "sérieux!"

	para "J'étudie les"
	line "fossiles anciens"
	cont "de #MON!"

	para "Toi! Là!"
	line "T'aurais pas un"
	cont "fossile pour moi?"
	prompt

_CinnabarLabFossilRoomScientist1NoFossilsText::
	text "Non? C'est bien"
	line "dommage!"
	done

_CinnabarLabFossilRoomScientist1GoForAWalkText::
	text "Ca va prendre du"
	line "temps!"

	para "Va te promener"
	line "pendant que je"
	cont "bosse!"
	done

_CinnabarLabFossilRoomScientist1FossilIsBackToLifeText::
	text "Ben alors! Où"
	line "étais-tu passé?"

	para "Ton fossile est"
	line "VIVANT!"

	para "Il ressemble à un"
	line "@"
	text_ram wStringBuffer
	text "!"
	prompt

_CinnabarLabFossilRoomScientist1SeesFossilText::
	text "Oh! C'est un"
	line "@"
	text_ram wNameBuffer
	text "!"

	para "C'est un fossile"
	line "de @"
	text_ram wStringBuffer
	text ","
	cont "un #MON qui a"
	cont "disparu!"

	para "Ma machine à"
	line "réanimer va faire"
	cont "revivre cet"
	cont "ancien #MON!"
	done

_CinnabarLabFossilRoomScientist1TakesFossilText::
	text "Tu te grouilles,"
	line "file-moi ça!"

	para "<PLAYER> donne:"
	line "@"
	text_ram wNameBuffer
	text "!"
	prompt

_CinnabarLabFossilRoomScientist1GoForAWalkText2::
	text "Ca va prendre un"
	line "peu de temps!"

	para "Traîne pas dans"
	line "mes pattes, va"
	cont "faire un tour!"
	done

_CinnabarLabFossilRoomScientist1ComeAgainText::
	text "Argayahhaha!"
	line "Tu reviendras!"
	done
