_VermilionGoodRodHouseFishingGuruDoYouLikeToFishText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Je suis le grand"
	line "frère du MAITRE"
	cont "PECHEUR!"

	para "Moi, mon truc,"
	line "c'est la pêche!"

	para "T'aimes la"
	line "pêche, petit?"
	done

.GirlText
	text "Je suis le grand"
	line "frère du MAITRE"
	cont "PECHEUR!"

	para "Moi, mon truc,"
	line "c'est la pêche!"

	para "T'aimes la"
	line "pêche, petite?"
	done

_VermilionGoodRodHouseFishingGuruTakeThisText::
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_IS_GIRL, a
	ld hl, .BoyText
	ret z
	ld hl, .GirlText
	ret

.BoyText
	text "Cool! T'as l'air"
	line "d'un bon gars!"

	para "Prends ça!"
	line "Que la Grand'"
	cont "Pêche soit avec"
	cont "toi, p'tit!"

	para "<PLAYER> reçoit"
	line "une @"
	text_ram wStringBuffer
	text "!@"
	text_end

.GirlText
	text "Cool! T'as l'air"
	line "d'une chic fille!"

	para "Prends ça!"
	line "Que la Grand'"
	cont "Pêche soit avec"
	cont "toi, p'tite!"

	para "<PLAYER> reçoit"
	line "une @"
	text_ram wStringBuffer
	text "!@"
	text_end

_VermilionGoodRodHouseFishingGuruThatsSoDisappointingText::
	text "Oh...Pas cool!"
	line "Pas cool du tout!"
	done

_VermilionGoodRodHouseFishingGuruHowAreTheFishBitingText::
	text "Salut,"
	line "<PLAYER>!"

	para "Ca mord?"
	done

_VermilionGoodRodHouseFishingGuruNoRoomText::
	text "Oh non!"

	para "Ton inventaire"
	line "est plein!"
	done
