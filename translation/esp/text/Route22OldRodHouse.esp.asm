; marcelnote - new location
_Route22OldRodHouseFishingGuruDoYouLikeToFishText::
	text "¡Yo soy el GURÚ"
	line "PESCADOR!"

	para "¡Me encanta"
	line "pescar!"

	para "¿Y a ti, te gusta"
	line "pescar?"
	done

_Route22OldRodHouseFishingGuruTakeThisText::
	text "¡Fenomenal! ¡Me"
	line "gusta tu estilo!"

	para "¡Toma esto y"
	line "pesca, jovencito!"

	para "¡<PLAYER> recibió"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_Route22OldRodHouseFishingGuruFishingIsAWayOfLifeText::
	text_start

	para "¡Pescar es una"
	line "forma de vivir!"

	para "¡Del mar a los"
	line "ríos, zarpa y"
	cont "pesca el más"
	cont "grande, chaval!"
	done

_Route22OldRodHouseFishingGuruThatsSoDisappointingText::
	text "¡Oh!...bueno..."
	line "¡Qué pena!..."
	done

_Route22OldRodHouseFishingGuruHowAreTheFishBitingText::
	text "¡Hola"
	line "<PLAYER>!"

	para "¿Qué, pican"
	line "los peces?"
	done

_Route22OldRodHouseFishingGuruNoRoomText::
	text "¡Oh no!"

	para "¡No tienes sitio"
	line "para mi regalo!"
	done
