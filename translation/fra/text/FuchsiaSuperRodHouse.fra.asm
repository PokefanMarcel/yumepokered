_FuchsiaSuperRodHouseFishingGuruDoYouLikeToFishText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Mon frère,"
	line "j'suis le maître"
	cont "pêcheur!"

	para "Moi, dans la vie,"
	line "j'suis pêcheur!"

	para "T'aimes la pêche,"
	line "mon frère?"
	done

.GirlText
	text "Ma grande,"
	line "j'suis le maître"
	cont "pêcheur!"

	para "Moi, dans la vie,"
	line "j'suis pêcheur!"

	para "T'aimes la pêche,"
	line "ma grande?"
	done

_FuchsiaSuperRodHouseFishingGuruTakeThisText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Trop cool!"
	line "J't'aime bien!"

	para "Prends cette"
	line "canne à pêche,"
	cont "mon frère!"

	para "<PLAYER> obtient:"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

.GirlText
	text "Trop cool!"
	line "J't'aime bien!"

	para "Prends cette"
	line "canne à pêche,"
	cont "ma grande!"

	para "<PLAYER> obtient:"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_FuchsiaSuperRodHouseFishingGuruFishingWayOfLifeText::
	text_start

	para "La pêche c'est"
	line "comme la vie!"

	para "Quand ça mord,"
	line "ça va! "
	cont "Quand ça mord"
	cont "pas, ça va pas!"
	done

_FuchsiaSuperRodHouseFishingGuruThatsDisappointingText::
	text "Oh... Je suis"
	line "très déçu..."
	done

_FuchsiaSuperRodHouseFishingGuruTryFishingText::
	text "Salut,"
	line "<PLAYER>!"

	para "Avec cette MEGA"
	line "CANNE, tu vas"
	cont "vider les océans"
	cont "de tous les"
	cont "#MON."

	para "Pêche, pêche,"
	line "et pêche encore! "
	done

_FuchsiaSuperRodHouseFishingGuruNoRoomText::
	text "Ha ben non!"

	para "J'avais un cadeau"
	line "pour toi, mais"
	cont "t'as plus de"
	cont "place!"
	done
