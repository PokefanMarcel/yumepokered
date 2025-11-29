_SSAnne1FRoomsWigglytuffText::
	text "GRODOUDOU: Gro!"
	line "Douuuuuuu!@"
	text_end

_SSAnne1FRoomsGentleman1BattleText::
	text "Je voyage"
	line "toujours en"
	cont "solitaire!"

	para "Mes #MON"
	line "sont mes amis!"
	done

_SSAnne1FRoomsGentleman1EndBattleText::
	text "Non!"
	line "Mes p'tits amis!"
	prompt

_SSAnne1FRoomsGentleman1AfterBattleText::
	text "Il faut être"
	line "gentil avec ses"
	cont "#MON!"
	done

_SSAnne1FRoomsGentleman2BattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Toi, jeune sot! Tu"
	line "oses entrer ici!?"
	done

.GirlText
	text "Toi, jeune sotte!"
	line "Tu oses entrer"
	cont "ici!?"
	done

_SSAnne1FRoomsGentleman2EndBattleText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Huf!"
	line "Tu es mal élevé!!"
	prompt

.GirlText
	text "Huf! Tu"
	line "es mal élevée!!"
	prompt

_SSAnne1FRoomsGentleman2AfterBattleText::
	text "J'aimerais être"
	line "seul! Va-t'en!"
	done

_SSAnne1FRoomsYoungsterBattleText::
	text "J'aime les"
	line "#MON! Et toi?"
	done

_SSAnne1FRoomsYoungsterEndBattleText::
	text "Woo!"
	line "T'es cool, toi!"
	prompt

_SSAnne1FRoomsYoungsterAfterBattleText::
	text "Soyons amis,"
	line "OK?"

	para "On pourra alors"
	line "échanger nos"
	cont "#MON!"
	done

_SSAnne1FRoomsCooltrainerFBattleText::
	text "J'ai déniché"
	line "ces #MON"
	cont "un peu partout"
	cont "dans le monde!"
	done

_SSAnne1FRoomsCooltrainerFEndBattleText::
	text "Quoi!"
	line "Un tour du monde"
	cont "pour ce résultat!"
	cont "C'est nul!"
	prompt

_SSAnne1FRoomsCooltrainerFAfterBattleText::
	text "Tu as fait mal"
	line "à mes #MON!"

	para "Il faut que"
	line "tu les soignes"
	cont "dans un"
	cont "CENTRE #MON!!!"
	done

_SSAnne1FRoomsGirl1WaiterText::
	text "Serveur,"
	line "amenez-moi une"
	cont "tarte aux poires!"
	done

_SSAnne1FRoomsGirl1WaitressText:: ; marcelnote - new for girl player
	text "Serveuse,"
	line "amenez-moi une"
	cont "tarte aux poires!"
	done

_SSAnne1FRoomsMiddleAgedManText::
	text "Ha! Une croisière!"
	line "C'est tellement"
	cont "romantique!"
	done

_SSAnne1FRoomsLittleGirlText::
	text "Je voyage"
	line "toujours avec"
	cont "GRODOUDOU!"
	done

_SSAnne1FRoomsGirl2Text::
	text "Nous parcourons"
	line "les mers du"
	cont "monde entier!"
	done

_SSAnne1FRoomsGentleman3Text::
	text "Pst! Je suis de"
	line "l'INTERPOLICE!"

	para "Je suis sur la"
	line "trace de la"
	cont "TEAM ROCKET!"
	cont "Chut!"
	done

_SSAnne1FRoomsNurseAreYouTiredText:: ; marcelnote - new nurse room
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Tu es fatigué?"
	line "Repose-toi"
	cont "peu ici."
	prompt

.GirlText
	text "Tu es fatiguée?"
	line "Repose-toi"
	cont "peu ici."
	prompt

_SSAnne1FRoomsNurseEnjoyThePartyText:: ; marcelnote - new nurse room
	text "Retourne t'amuser!"
	done
