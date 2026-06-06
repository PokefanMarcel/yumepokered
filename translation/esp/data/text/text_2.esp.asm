_AIBattleWithdrawText::
	text "¡@"
	text_ram wTrainerName
	text_start
	line "recogió"
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	prompt

_AIBattleUseItemText::
	text "¡@"
	text_ram wTrainerName
	text_start
	line "usó @"
	text_ram wNameBuffer
	text_start
	cont "en @"
	text_ram wEnemyMonNick
	text "!"
	prompt

_TradeWentToText::
	text_ram wStringBuffer
	text " fue"
	line "a @"
	text_ram wLinkEnemyTrainerName
	text "."
	done

_TradeForText::
	text "Por @"
	text_ram wStringBuffer
	text_start
	line "de <PLAYER>,"
	done

_TradeSendsText::
	text_ram wLinkEnemyTrainerName
	text " envía a"
	line "@"
	text_ram wNameBuffer
	text "."
	done

_TradeWavesFarewellText::
	text_ram wLinkEnemyTrainerName
	text " se"
	line "despide de"
	done

_TradeTransferredText::
	text_ram wNameBuffer
	text_start
	line "mientras es"
	cont "transferido."
	done

_TradeTakeCareText::
	text "¡Cuida bien de"
	line "@"
	text_ram wNameBuffer
	text "!"
	done

_TradeWillTradeText::
	text_ram wLinkEnemyTrainerName
	text " cambiará"
	line "a @"
	text_ram wNameBuffer
	text_start
	done

_TradeforText::
	text "por @"
	text_ram wStringBuffer
	text_start
	line "de <PLAYER>."
	done

_PlaySlotMachineText::
	text "¡Una máquina"
	line "tragaperras!"
	cont "¿Quieres jugar?"
	done

_OutOfCoinsSlotMachineText::
	text "¡Vaya! ¡No tengo"
	line "más fichas!"
	done

_BetHowManySlotMachineText::
	text "¿Cuánto"
	line "apuestas?"
	done

_StartSlotMachineText::
	text "¡Adelante!"
	done

_NotEnoughCoinsSlotMachineText::
	text "¡No hay bastantes"
	line "fichas!"
	prompt

_OneMoreGoSlotMachineText::
	text "¿Una vez más?"
	done

_LinedUpText::
	text "¡Línea! ¡Ganas"
	line "@"
	text_ram wStringBuffer
	text " fichas!"
	done

_NotThisTimeText::
	text "¡Esta vez no!"
	prompt

_YeahText::
	text "¡Bien!@"
	text_end

_DexSeenOwnedText::
	text "Has visto: @"
	text_decimal wDexRatingNumMonsSeen, 1, 3
	text_start
	line "Atrapaste: @"
	text_decimal wDexRatingNumMonsOwned, 1, 3
	text "@"
	text_end

_DexRatingText::
	text "Evaluación del"
	line "#DEX<COLON>"
	done

_GymStatueText1::
	text "LÍDER GIMNASIO"
	line "#MON de"
	cont "@"
	text_ram wGymCityName
	text ":"
	cont "@"
	text_ram wGymLeaderName
	text_start

	para "ENTRENADORES"
	line "GANADORES:"
	cont "<RIVAL>"
	done

_GymStatueText2::
	text "LÍDER GIMNASIO"
	line "#MON de"
	cont "@"
	text_ram wGymCityName
	text ":"
	cont "@"
	text_ram wGymLeaderName
	text_start

	para "ENTRENADORES"
	line "GANADORES:"
	cont "<RIVAL>, <PLAYER>"
	done

_GymStatueText3:: ; marcelnote - added for Yellow
	text "LÍDER GIMNASIO"
	line "#MON de"
	cont "@"
	text_ram wGymCityName
	text ":"
	cont "@"
	text_ram wGymLeaderName
	text_start

	para "ENTRENADORES"
	line "GANADORES:"
	line "<RIVAL>"
	cont "<PLAYER>"
	cont "YELLOW"
	done

_BookcaseText::
	text "¡Totalmente llena"
	line "de libros sobre"
	cont "los #MON!"
	done

_NewBicycleText::
	text "¡Una BICI nueva"
	line "y reluciente!"
	done

; TODO - Spanish translation
_NewSurfboardText::  ; marcelnote - new for Mandarin Surf Shop
	text "A shiny new"
	line "SURFBOARD!"
	done

_PushStartText::
	text "¡Pulsa START para"
	line "abrir el MENÚ!"
	done

_SaveOptionText::
	text "En la pantalla"
	line "del MENÚ está la"
	cont "opción GUARDAR."
	done

_StrengthsAndWeaknessesText::
	text "Todo #MON"
	line "tiene sus puntos"
	cont "débiles y fuertes"
	cont "contra otros."
	done

_TimesUpText::
	text "AVISO:"
	line "¡Ding-dong!"

	para "¡Se acabó"
	line "el tiempo!"
	prompt

_GameOverText::
	text "AVISO: ¡Tu JUEGO"
	line "de SAFARI se ha"
	cont "terminado!"
	done

_CinnabarGymQuizIntroText::
	text "¡#Acertijo!"

	para "¡Responde bien y"
	line "abrirás la puerta"
	cont "a la siguiente"
	cont "habitación!"

	para "¡Responde mal y"
	line "lucharás contra"
	cont "un entrenador!"

	para "Si prefieres"
	line "guardar tus"
	cont "#MON para"
	cont "el LÍDER del"
	cont "GIMNASIO..."

	para "¡Hazlo bien!"
	line "¡Vamos allá!"
	prompt

_CinnabarQuizQuestionsText1::
	text "¿CATERPIE se"
	line "transforma en"
	cont "BUTTERFREE?"
	done

; TODO - Spanish translation
_CinnabarQuizQuestionsText2:: ; marcelnote - new quiz question for 2nd trainer
	text "VULPIX and"
	line "NINETALES are"
	cont "able to learn"
	cont "WILL-O-WISP?" ; FUEGO FATUO
	done

_CinnabarQuizQuestionsText3:: ; marcelnote - reindexed from 2
	text "¿Hay 9 MEDALLAS"
	line "oficiales de la"
	cont "LIGA #MON?"
	done

_CinnabarQuizQuestionsText4:: ; marcelnote - reindexed from 3
	text "¿POLIWAG se"
	line "transforma"
	cont "3 veces?"
	done

_CinnabarQuizQuestionsText5:: ; marcelnote - reindexed from 4
	text "¿Los movimientos"
	line "del tipo-trueno"
	cont "afectan a los"
	cont "#MON del"
	cont "tipo-tierra?"
	done

_CinnabarQuizQuestionsText6:: ; marcelnote - reindexed from 5
	text "¿Son distintos"
	line "los #MON"
	cont "del mismo tipo y"
	cont "del mismo nivel?"
	done

_CinnabarQuizQuestionsText7:: ; marcelnote - reindexed from 6
	text "¿La MT28 contiene"
	line "una TUMBAPIEDRA?"
	done

_CinnabarGymQuizCorrectText::
	text "¡Respuesta"
	line "correcta!"

	para "¡Adelante!@"
	text_end

_CinnabarGymQuizIncorrectText::
	text "¡Mal! ¡Lo siento!"
	prompt

_MagazinesText::
	text "¡Revistas de"
	line "los #MON!"

	para "¡Cuadernos de"
	line "los #MON!"

	para "¡Dibujos de los"
	line "#MON!"
	done

_BillsHouseMonitorText::
	text "¡En el monitor"
	line "del PC aparece el"
	cont "TELETRANSPORTE!"
	done

_BillsHouseInitiatedText::
	text "¡<PLAYER> inició"
	line "el Separador"
	cont "Celular del"
	cont "TELETRANSPORTE!@"
	text_end

_BillsHousePokemonListText1::
	text "¡Lista de los"
	line "#MON favoritos"
	cont "de BILL!"
	prompt

_BillsHousePokemonListText2::
	text "¿Qué #MON"
	line "te gustaría ver?"
	done

_OakLabEmailText::
	text "¡Aquí hay un"
	line "mensaje e-mail!"

	para "..."

	para "¡Aviso a todos"
	line "los entrenadores"
	cont "de #MON!"

	para "¡Los entrenadores"
	line "de élite de la"
	cont "LIGA #MON"
	cont "están listos"
	cont "para desafiaros"
	cont "a todos!"

	para "¡Traed a vuestros"
	line "mejores #MON"
	cont "y descubrid"
	cont "vuestra "
	cont "puntuación como"
	cont "entrenadores!"

	para "CG de la LIGA"
	line "#MON"
	cont "MESETA AÑIL"

	para "PD: ¡PROF. OAK,"
	line "visítenos por"
	cont "favor!..."
	done

_GameCornerCoinCaseText::
	text "¡Se requiere un"
	line "MONEDERO!"
	done

_GameCornerNoCoinsText::
	text "¡No tienes"
	line "más fichas!"
	done

_GameCornerOutOfOrderText::
	text "NO FUNCIONA"
	line "Está rota."
	done

_GameCornerOutToLunchText::
	text "ESTAMOS COMIENDO"
	line "Máquina reservada."
	done

_GameCornerSomeonesKeysText::
	text "¡Unas llaves!"
	line "Ellos volverán."
	done

_JustAMomentText::
	text "¡Un momento!"
	done

TMNotebookText::
	text "Es un informe"
	line "sobre las MT."

	para "..."

	para "Hay un total de"
	line "50 MT."

	para "Y 5 MO, que"
	line "pueden ser"
	cont "utilizadas una"
	cont "y otra vez."

	para "SILPH S.A.@"
	text_end

_TurnPageText::
	text "¿Paso la página?"
	done

_ViridianSchoolNotebookText5::
	text "NIÑA: ¡Oye! ¡No"
	line "mires mis notas!@"
	text_end

_ViridianSchoolNotebookText1::
	text "¡Leíste el"
	line "cuaderno!"

	para "Primera página..."

	para "Las # BALL"
	line "son para atrapar"
	cont "a los #MON."

	para "Puedes llevar"
	line "hasta 6 #MON."

	para "Los entrenadores"
	line "son la gente que"
	cont "entrena y hace"
	cont "pelear a sus"
	cont "#MON."
	prompt

_ViridianSchoolNotebookText2::
	text "Segunda página..."

	para "¡Un #MON sano"
	line "no es tan fácil"
	cont "de atrapar, mejor"
	cont "debilitarlo"
	cont "primero!"

	para "¡Los venenos, las"
	line "quemaduras y"
	cont "otros daños son"
	cont "muy efectivos!"
	prompt

_ViridianSchoolNotebookText3::
	text "Tercera página..."

	para "Los entrenadores"
	line "#MON luchan"
	cont "contra otros en"
	cont "peleas de <PKMN>."

	para "En los GIMNASIOS"
	line "siempre se están"
	cont "librando peleas"
	cont "de #MON."
	prompt

_ViridianSchoolNotebookText4::
	text "Cuarta página..."

	para "El objetivo de"
	line "todo entrenador"
	cont "es derrotar a los"
	cont "8 mejores LÍDERES"
	cont "de GIMNASIO."

	para "Si lo consiguen"
	line "podrán desafiar..."

	para "¡Al ALTO MANDO"
	line "de la LIGA"
	cont "#MON!"
	prompt

_EnemiesOnEverySideText::
	text "¡Hay enemigos por"
	line "todas partes!"
	done

_WhatGoesAroundComesAroundText::
	text "¡Pase lo"
	line "que pase!"
	done

_FightingDojoText::
	text "DOJO-KARATE"
	done

_Route11GateLeftBinocularsSnorlaxText::
	text "Miraste por los"
	line "prismáticos."

	para "¡Un gran #MON"
	line "está durmiendo"
	cont "en el camino!"
	done

_Route11GateLeftBinocularsNoSnorlaxText::
	text "Miraste por los"
	line "prismáticos."

	para "¡Es una hermosa"
	line "vista!"
	done

_Route11GateRightBinocularsText::
	text "Miraste por los"
	line "prismáticos."

	para "¡Puedes ir de"
	line "la CIUDAD CELESTE"
	cont "al PUEBLO"
	cont "LAVANDA por el"
	cont "TÚNEL ROCA!"
	done

_Route12GateLeftBinocularsText::
	text "Miraste por los"
	line "prismáticos."

	para "¡Un hombre está"
	line "pescando!"
	done

_Route12GateRightBinocularsText::
	text "Miraste por los"
	line "prismáticos."

	para "¡Es la TORRE"
	line "#MON!"
	done

_Route15GateLeftBinocularsArticunoText:: ; marcelnote - added alternative text after Articuno is fought
	text "Miraste por los"
	line "prismáticos..."

	para "Un pájaro grande"
	line "y brillante vuela"
	cont "hacia el mar."
	done

_Route15GateLeftBinocularsNoArticunoText:: ; marcelnote - added alternative text after Articuno is fought
	text "Miraste por los"
	line "prismáticos."

	para "El mar brilla"
	line "bajo el sol."
	done

_Route15GateRightBinocularsText::
	text "Miraste por los"
	line "prismáticos."

	para "¡Parece una"
	line "pequeña isla!"
	done

_Route16GateLeftBinocularsText::
	text "Miraste por los"
	line "prismáticos."

	para "¡Es el CENTRO"
	line "COMERCIAL de la"
	cont "CIUDAD AZULONA!"
	done

_Route16GateRightBinocularsText::
	text "Miraste por los"
	line "prismáticos."

	para "¡Hay un largo"
	line "camino sobre"
	cont "el agua!"
	done

_Route18GateLeftBinocularsText::
	text "Miraste por los"
	line "prismáticos."

	para "¡El PUEBLO PALETA"
	line "está al oeste!"
	done

_Route18GateRightBinocularsText::
	text "Miraste por los"
	line "prismáticos."

	para "¡Hay gente"
	line "nadando!"
	done

; TODO - Spanish translation
_Route22GateLeftBinocularsText:: ; marcelnote - new
	text "Miraste por los"
	line "prismáticos."

	para "A remote mountain"
	line "rises above"
	cont "the horizon."
	done

; TODO - Spanish translation
_Route22GateRightBinocularsText:: ; marcelnote - new
	text "Miraste por los"
	line "prismáticos."

	para "A winding path"
	line "leads to the"
	cont "#MON LEAGUE."
	done

_AerodactylFossilText::
	text "Fósil AERODACTYL."
	line "Un primitivo y"
	cont "raro #MON."
	done

_KabutopsFossilText::
	text "Fósil KABUTOPS."
	line "Un primitivo y"
	cont "raro #MON."
	done

_LinkCableHelpText1::
	text "PISTAS ENTRENADOR"

	para "Uso del cable"
	line "Game Link"
	prompt

_LinkCableHelpText2::
	text "¿Qué capítulo"
	line "quieres leer?"
	done

_LinkCableInfoText1::
	text "Cuando enlaces tu"
	line "GAME BOY a otro"
	cont "GAME BOY, habla"
	cont "con la empleada"
	cont "de la derecha en"
	cont "cualquier CENTRO"
	cont "#MON."
	prompt

_LinkCableInfoText2::
	text "COLISEO te deja"
	line "jugar contra"
	cont "un amigo."
	prompt

_LinkCableInfoText3::
	text "En el CENTRO DE"
	line "CAMBIO puedes"
	cont "intercambiar a"
	cont "tus #MON."
	prompt

_ViridianSchoolBlackboardText1::
	text "La pizarra indica"
	line "los cambios de"
	cont "CONDICIÓN de los"
	cont "#MON durante"
	cont "los combates."
	prompt

_ViridianSchoolBlackboardText2::
	text "¿Qué capítulo"
	line "quieres leer?"
	done

_ViridianBlackboardSleepText::
	text "¡Un #MON no"
	line "puede atacar si"
	cont "está dormido!"

	para "¡Los #MON"
	line "seguirán dormidos"
	cont "incluso después"
	cont "de pelear!"

	para "¡Usa DESPERTAR y"
	line "se despertarán!"
	prompt

_ViridianBlackboardPoisonText::
	text "Todo #MON"
	line "envenenado"
	cont "seguirá perdiendo"
	cont "energía."

	para "El veneno sigue"
	line "afectándoles tras"
	cont "el combate."

	para "¡Usa un ANTÍDOTO"
	line "para curarlos!"
	prompt

_ViridianBlackboardPrlzText::
	text "¡Paralizar podría"
	line "anular ciertos"
	cont "movimientos!"

	para "La parálisis"
	line "permanecerá tras"
	cont "el combate."

	para "Usa ANTIPARALIZAR"
	line "para curarlos."
	prompt

_ViridianBlackboardBurnText::
	text "Toda quemadura"
	line "reduce potencia"
	cont "y velocidad. Y"
	cont "causa daños"
	cont "progresivos."

	para "Las quemaduras"
	line "permanecerán tras"
	cont "el combate."

	para "¡ANTIQUEMADURAS"
	line "curará las"
	cont "quemaduras!"
	prompt

_ViridianBlackboardFrozenText::
	text "¡Todo #MON"
	line "congelado no"
	cont "podrá moverse!"

	para "Y permanecerá"
	line "congelado tras"
	cont "el combate."

	para "¡Usa el ANTIHIELO"
	line "para descongelar"
	cont "a los #MON!"
	prompt

_VermilionGymTrashText::
	text "¡No, aquí sólo"
	line "hay basura!"
	done

_VermilionGymTrashSuccessText1::
	text "¡Oye! ¡Hay un"
	line "botón debajo"
	cont "de la basura!"
	cont "¡Púlsalo!"

	para "Abierto primer"
	line "cierre eléctrico.@"
	text_end

_VermilionGymTrashSuccessText2::
	text "¡Oye! ¡Hay otro"
	line "botón debajo de"
	cont "la basura!"
	cont "¡Púlsalo!"
	prompt

_VermilionGymTrashSuccessText3::
	text "Abierto segundo"
	line "cierre eléctrico."

	para "¡Abierta la"
	line "puerta mecánica!@"
	text_end

_VermilionGymTrashFailText::
	text "¡No! Aquí sólo"
	line "hay basura. ¡Las"
	cont "cerraduras"
	cont "eléctricas fueron"
	cont "reajustadas!@"
	text_end

_FoundHiddenItemText::
	text "¡<PLAYER> encontró"
	line "@"
	text_ram wNameBuffer
	text "!@"
	text_end

_HiddenItemBagFullText::
	text "¡Pero <PLAYER>"
	line "no tiene sitio"
	cont "para más objetos!"
	done

_FoundHiddenCoinsText::
	text "¡<PLAYER>"
	line "encontró"
	cont "@"
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " fichas!@"
	text_end

_FoundHiddenCoins2Text::
	text "¡<PLAYER>"
	line "encontró"
	cont "@"
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " fichas!@"
	text_end

_DroppedHiddenCoinsText::
	text_start
	para "¡Uups! ¡Se"
	line "cayeron algunas"
	cont "fichas!"
	done

_IndigoPlateauStatuesText1::
	text "MESETA AÑIL"
	prompt

_IndigoPlateauStatuesText2::
	text "¡El objetivo de"
	line "todo entrenador:"
	cont "El CG de la"
	cont "LIGA #MON!"
	done

_IndigoPlateauStatuesText3::
	text "La máxima"
	line "autoridad #MON"
	cont "del CG de la LIGA"
	cont "#MON."
	done

_PokemonBooksText::
	text "¡Totalmente lleno"
	line "de libros sobre"
	cont "los #MON!"
	done

; TODO - Spanish translation
_DiglettSculptureText::
;	text "Es una escultura" ; original Red/Blue
;	line "de DIGLETT."
;	text "It's a statue of" ; translation from shinpokered of original Japanese
;	line "a fat Buddha."
	text "It's an altar with" ; new version
	line "a small statue."
;	text "An altar with a" ; variant
;	line "peaceful statue."
	done

_ElevatorText::
	text "Esto es"
	line "un ascensor."
	done

_TownMapText::
	text "MAPA DE PUEBLOS.@"
	text_end

_PokemonStuffText::
	text "¡Uauu! ¡Cantidad"
	line "de artículos de"
	cont "los #MON!"
	done

; TODO - Spanish translation
_HotSnacksText:: ; marcelnote - new for Marts
	text "A sale on hot"
	line "snacks! Yummy!"
	done

; TODO - Spanish translation
_ColdDrinksText:: ; marcelnote - new for Marts
	text "Cold drinks, all"
	line "neatly arranged!"
	done

; TODO - Spanish translation
_HolidayBrochuresText:: ; marcelnote - new for Safari Rest houses
	text "Holiday brochures!"

	para "Beach resorts on"
	line "MANDARIN ISLAND,"
	cont "hikes around"
	cont "MT.MOON, shopping"
	cont "in CELADON..."
	done

_OutOfSafariBallsText::
	text "Aviso:¡Ding-dong!"

	para "¡No tienes más"
	line "SAFARI BALL!"
	prompt

_WildRanText::
	text "¡@"
	text_ram wEnemyMonNick
	text_start
	line "salvaje huyó!"
	prompt

_EnemyRanText::
	text "¡@"
	text_ram wEnemyMonNick
	text_start
	line "enemigo huyó!"
	prompt

_HurtByPoisonText::
	text "¡<USER>"
	line "es dañado por"
	cont "el veneno!"
	prompt

_HurtByBurnText::
	text "¡<USER>"
	line "herido por"
	cont "quemaduras!"
	prompt

_HurtByLeechSeedText::
	text "¡Las DRENADORAS"
	line "debilitaron a"
	cont "<USER>!"
	prompt

_EnemyMonFaintedText::
	text "¡@"
	text_ram wEnemyMonNick
	text_start
	line "enemigo se"
	cont "desmayó!"
	prompt

_MoneyForWinningText::
	text "¡<PLAYER> ganó"
	line "@"
	text_bcd wAmountMoneyWon, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "¥!"
	prompt

_TrainerDefeatedText::
	text "¡<PLAYER> venció a"
	line "@"
	text_ram wTrainerName
	text "!"
	prompt

_PlayerMonFaintedText::
	text "¡@"
	text_ram wBattleMonNick
	text_start
	line "debilitado!"
	prompt

_UseNextMonText::
	text "¿Usar otro"
	line "#MON?"
	done

_Rival1WinText::
	text "<RIVAL>: ¡Sí!"
	line "¿A que soy"
	cont "demasiado bueno?"
	prompt

_PlayerBlackedOutText2::
	text "¡<PLAYER> no tiene"
	line "más #MON!"

	para "¡<PLAYER> perdió"
	line "el conocimiento!"
	prompt

_LinkBattleLostText::
	text "¡@"
	text_ram wTrainerName
	text_start
	line "ganó a <PLAYER>!"
	prompt

_TrainerAboutToUseText::
	text "¡@"
	text_ram wTrainerName
	text_start
	line "va a utilizar a"
	cont "@"
	text_ram wEnemyMonNick
	text "!"

	para "¿<PLAYER> quiere"
	line "cambiar de"
	cont "#MON?"
	done

_TrainerSentOutText::
	text "¡@"
	text_ram wTrainerName
	text_start
	line "envió a"
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	done

_NoWillText::
	text "¡No puede luchar!"
	prompt

_CantEscapeText::
	text "¡No puede huir!"
	prompt

_NoRunningText::
	text "¡No puedes huir"
	line "de una pelea con"
	cont "un entrenador!"
	prompt

_GotAwayText::
	text "¡Escapaste sano"
	line "y salvo!"
	prompt

_ItemsCantBeUsedHereText::
	text "Los objetos no"
	line "pueden ser"
	cont "usados aquí."
	prompt

_AlreadyOutText::
	text "¡@"
	text_ram wBattleMonNick
	text_start
	line "ya está luchando!"
	prompt

_MoveNoPPText::
	text "¡No quedan PP"
	line "para este ataque!"
	prompt

_MoveDisabledText::
	text "¡Ataque no"
	line "activo!"
	prompt

_NoMovesLeftText::
	text "A @"
	text_ram wBattleMonNick
	text_start
	line "no le quedan"
	cont "más ataques."
	done

_MultiHitText::
	text "Golpeó al enemigo"
	line "@"
	text_decimal wPlayerNumHits, 1, 1
	text " veces."
	prompt

_ScaredText::
	text "¡@"
	text_ram wBattleMonNick
	text " está"
	line "tan asustado que"
	cont "no puede moverse!"
	prompt

_GetOutText::
	text "GHOST: Fuera..."
	line "Fuera..."
	prompt

_FastAsleepText::
	text "¡<USER>"
	line "está dormido!"
	prompt

_WokeUpText::
	text "¡<USER>"
	line "se despertó!"
	prompt

_IsFrozenText::
	text "¡<USER>"
	line "está congelado!"
	prompt

_FullyParalyzedText::
	text "¡<USER>"
	line "está paralizado!"
	prompt

_FlinchedText::
	text "¡<USER>"
	line "retrocedió!"
	prompt

_MustRechargeText::
	text "¡<USER>"
	line "debe recargarse!"
	prompt

_DisabledNoMoreText::
	text "¡<USER>"
	line "restaurado!"
	prompt

_IsConfusedText::
	text "¡<USER>"
	line "está confuso!"
	prompt

_HurtItselfText::
	text "¡Tan confuso"
	line "está que se"
	cont "hiere a sí mismo!"
	prompt

_ConfusedNoMoreText::
	text "¡<USER>"
	line "no está confuso!"
	prompt

_SavingEnergyText::
	text "¡<USER>"
	line "guarda energía!"
	prompt

_UnleashedEnergyText::
	text "¡<USER>"
	line "liberó energía!"
	prompt

_ThrashingAboutText::
	text "¡<USER>"
	line "está furioso!"
	done

_AttackContinuesText::
	text "¡<USER>"
	line "sigue atacando!"
	done

_CantMoveText::
	text "¡<USER>"
	line "no se mueve!"
	prompt

_MoveIsDisabledText::
	text "¡@"
	text_ram wNameBuffer
	text_start
	line "de <USER>"
	cont "anulado!"
	prompt

_ActorNameText::
	text "¡<USER>@"
	text_end

_UsedText:: ; marcelnote - merged _Used1Text and _Used2Text
	text_start
	line "usó @"
	text_end

_UsedInsteadText::
	text "en su lugar"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer
	text "@"

_EndUsedMoveText::
	text "!"
	done

_AttackMissedText::
	text "¡<USER>"
	line "falló!"
	prompt

_KeptGoingAndCrashedText::
	text "¡<USER>"
	line "siguió adelante"
	cont "y fracasó!"
	prompt

_UnaffectedText::
	text "¡No le afectó a"
	line "<TARGET>!"
	prompt

_DoesntAffectMonText::
	text "¡No afectó a"
	line "<TARGET>!"
	prompt

_CriticalHitText::
	text "¡Ataque crítico!"
	prompt

_OHKOText::
	text "¡KO en 1 ataque!"
	prompt

_LoafingAroundText::
	text_ram wBattleMonNick
	text_start
	line "está vagueando."
	prompt

_BeganToNapText::
	text "¡@"
	text_ram wBattleMonNick
	text " se"
	line "echó una siesta!"
	prompt

_WontObeyText::
	text "¡@"
	text_ram wBattleMonNick
	text_start
	line "no obedecerá!"
	prompt

_TurnedAwayText::
	text "¡@"
	text_ram wBattleMonNick
	text_start
	line "se alejó!"
	prompt

_IgnoredOrdersText::
	text "¡@"
	text_ram wBattleMonNick
	text_start
	line "ignoró órdenes!"
	prompt

_SubstituteTookDamageText::
	text "¡El SUSTITUTO"
	line "recibió daños"
	cont "de <TARGET>!"
	prompt

_SubstituteBrokeText::
	text "¡El SUSTITUTO"
	line "fue destruido!"
	prompt

_BuildingRageText::
	text "¡Sube la FURIA de"
	line "<USER>!"
	prompt

_MirrorMoveFailedText::
;	text "¡El MOVIMIENTO en" ; original
;	next "ESPEJO falló!"

	text "¡El movimiento" ; marcelnote - adapted for new name
	next "ESPEJO falló!"
	prompt

_HitXTimesText::
	text "¡Tocado @"
	text_decimal wEnemyNumHits, 1, 1
	text " veces!"
	prompt

_GainedText::
	text "¡@"
	text_ram wNameBuffer
	text " ganó"
	line "@"
	text_end

; TODO - Spanish translation
_ExpAllSharedText:: ; marcelnote - shortened ExpAll messages
	text "EXP.ALL shared"
	line "@"
	text_end

_BoostedText::
	text "un extra de"
	cont "@"
	text_end

_ExpPointsText::
	text_decimal wExpAmountGained, 2, 4
	text " Puntos EXP.!"
	prompt

_GrewLevelText::
	text "¡@"
	text_ram wNameBuffer
	text " subió"
	line "al nivel @"
	text_decimal wCurEnemyLevel, 1, 3
	text "!@"
	text_end

_WildMonAppearedText::
	text "¡Un @"
	text_ram wEnemyMonNick
	text_start
	line "salvaje apareció!"
	prompt

_HookedMonAttackedText::
	text "¡El malvado"
	line "@"
	text_ram wEnemyMonNick
	text_start
	cont "atacó!"
	prompt

_EnemyAppearedText::
	text "¡@"
	text_ram wEnemyMonNick
	text_start
	line "apareció!"
	prompt

_TrainerWantsToFightText::
	text "¡@"
	text_ram wTrainerName
	text_start
	line "quiere luchar!"
	prompt

_UnveiledGhostText::
	text "¡El SCOPE SILPH"
	line "reveló la"
	cont "identidad"
	cont "del GHOST!"
	prompt

_GhostCantBeIDdText::
	text "¡Maldición! ¡El"
	line "GHOST no puede"
	cont "ser identificado!"
	prompt

_GoText::
	text "¡Ve @"
	text_end

_DoItText::
	text "¡Ataca @"
	text_end

_GetmText::
	text "¡Ataca @"
	text_end

_EnemysWeakText::
	text "¡Está débil!"
	line "¡Ve @"
	text_end

_PlayerMon1Text::
	text_ram wBattleMonNick
	text "!"
	done

_PlayerMon2Text::
	text_ram wBattleMonNick
	text ", @"
	text_end

_EnoughText::
	text "¡Para!@"
	text_end

_OKExclamationText::
	text "¡VALE!@"
	text_end

_GoodText::
	text "¡Bien!@"
	text_end

_ComeBackText::
	text_start
	line "¡Vuelve!@"
	text_end

_SuperEffectiveText::
	text "¡Es súper"
	line "efectivo!"
	prompt

_NotVeryEffectiveText::
	text "No es muy"
	line "efectivo..."
	prompt

_SafariZoneEatingText::
	text "¡El @"
	text_ram wEnemyMonNick
	text_start
	line "salvaje está"
	cont "comiendo!"
	prompt

_SafariZoneAngryText::
	text "¡El @"
	text_ram wEnemyMonNick
	text_start
	line "salvaje está"
	cont "enfadado!"
	prompt

_PickUpPayDayMoneyText::
	text "¡<PLAYER> recogió"
	line "@"
	text_bcd wTotalPayDayMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "¥!"
	prompt

_ClearSaveDataText::
	text "¿Borrar todos los"
	line "datos guardados?"
	done

_WhichFloorText::
	text "¿A qué piso"
	line "quieres ir?"
	done

_PartyMenuNormalText::
	text "Elige un #MON."
	done

_PartyMenuItemUseText::
	text "¿Usar objeto en"
	line "qué #MON?"
	done

_PartyMenuBattleText::
	text "¿Qué #MON"
	line "quieres utilizar?"
	done

_PartyMenuUseTMText::
	text "¿Usar la MT/MO en"
	line "qué #MON?"
	done

_PartyMenuSwapMonText::
	text "¿Mover #MON"
	line "adónde?"
	done

_PotionText::
	text "¡@"
	text_ram wNameBuffer
	text_start
	line "ha recuperado @"
	text_decimal wHPBarHPDifference, 2, 3
	text "!"
	done

_AntidoteText::
	text "¡@"
	text_ram wNameBuffer
	text " fue"
	line "curado del veneno!"
	done

_ParlyzHealText::
	text "¡@"
	text_ram wNameBuffer
	text_start
	line "no está paraliz.!"
	done

_BurnHealText::
	text "¡@"
	text_ram wNameBuffer
	text_start
	line "fue curado!"
	done

_IceHealText::
	text "¡@"
	text_ram wNameBuffer
	text_start
	line "fue descongelado!"
	done

_AwakeningText::
	text "¡@"	
	text_ram wNameBuffer
	text_start
	line "se despertó!"
	done

_FullHealText::
	text "¡@"
	text_ram wNameBuffer
	text_start
	line "está recuperado!"
	done

_ReviveText::
	text "¡@"
	text_ram wNameBuffer
	text_start
	line "revitalizado!"
	done

_RareCandyText::
	text "¡@"
	text_ram wNameBuffer
	text " subió"
	line "al nivel @"
	text_decimal wCurEnemyLevel, 1, 3
	text "!@"
	text_end

_TurnedOnPC1Text::
	text "<PLAYER> encendió"
	line "el PC."
	prompt

_AccessedBillsPCText::
	text "Accedes al"
	line "PC de BILL."

	para "Accedes al"
	line "Sistema de"
	cont "Almacenamiento"
	cont "de los #MON."
	prompt

_AccessedSomeonesPCText::
	text "Accedes al PC"
	line "de Alguien."

	para "Accedes al"
	line "Sistema de"
	cont "Almacenamiento"
	cont "de los #MON."
	prompt

_AccessedMyPCText::
	text "Accedes a tu PC."

	para "Accedes al"
	line "Sistema de"
	cont "Almacenamiento"
	cont "de Objetos."
	prompt

_TurnedOnPC2Text::
	text "<PLAYER> encendió"
	line "el PC."
	prompt

_WhatDoYouWantText::
	text "¿Qué quieres"
	line "hacer?"
	done

_WhatToDepositText::
	text "¿Qué quieres"
	line "guardar?"
	done

_DepositHowManyText::
	text "¿Cuántos?"
	done

_ItemWasStoredText::
	text_ram wNameBuffer
	text " fue"
	line "guardado vía PC."
	prompt

_NothingToDepositText::
	text "No tienes nada"
	line "para dejar."
	prompt

_NoRoomToStoreText::
	text "No tienes sitio"
	line "donde guardar"
	cont "los objetos."
	prompt

_WhatToWithdrawText::
	text "¿Qué quieres"
	line "retirar?"
	done

_WithdrawHowManyText::
	text "¿Cuántos?"
	done

_WithdrewItemText::
	text "Retirado:"
	line "@"
	text_ram wNameBuffer
	text "."
	prompt

_NothingStoredText::
	text "No hay nada"
	line "almacenado."
	prompt

_CantCarryMoreText::
	text "No puedes llevar"
	line "más objetos."
	prompt

_WhatToTossText::
	text "¿Qué quieres"
	line "tirar?"
	done

_TossHowManyText::
	text "¿Cuántos?"
	done

; TODO - Spanish translation
_TMItContainsText:: ; marcelnote - new for TM printing
	text "It contains"
	line "@"
	text_ram wStringBuffer
	text "."
	done

_AccessedHoFPCText::
	text "Accedido sitio de"
	line "la LIGA #MON."

	para "Accedida la lista"
	line "del HALL de FAMA."
	prompt

_MonWasStoredText::
	text_ram wStringBuffer
	text " fue"
	line "guardado en la"
	cont "Caja @"
	text_ram wBoxNumString
	text "."
	prompt

_CantDepositLastMonText::
	text "¡No puedes"
	line "guardar el"
	cont "último #MON!"
	prompt

_BoxFullText::
	text "¡Uups! ¡Esta Caja"
	line "está llena de"
	cont "#MON!"
	prompt

_MonIsTakenOutText::
	text "Retirado"
	line "@"
	text_ram wStringBuffer
	text "."
	cont "Recibes"
	cont "@"
	text_ram wStringBuffer
	text "."
	prompt

_NoMonText::
	text "¡Aquí no hay"
	line "ningún #MON!"
	prompt

_CantTakeMonText::
	text "No puedes recoger"
	line "más #MON."

	para "Primero deposita"
	line "algún #MON."
	prompt

_OnceReleasedText::
	text "Si lo sueltas,"
	line "no volverás a ver"
	cont "a @"
	text_ram wStringBuffer
	text "."
	cont "¿De acuerdo?"
	done

_MonWasReleasedText::
	text_ram wStringBuffer
	text " fue"
	line "liberado. ¡Adiós"
	cont "@"
	text_ram wStringBuffer
	text "!"
	prompt

_RequireCoinCaseText::
	text "¡Se requiere un"
	line "MONEDERO!@"
	text_end

_ExchangeCoinsForPrizesText::
	text "Intercambiamos"
	line "tus fichas por"
	cont "premios."
	prompt

_WhichPrizeText::
	text "¿Qué premio"
	line "quieres?"
	done

_HereYouGoText::
	text "¡Aquí tienes!@"
	text_end

_SoYouWantPrizeText::
	text "Bien, ¿quieres"
	line "@"
	text_ram wNameBuffer
	text "?"
	done

_SorryNeedMoreCoinsText::
	text "Perdón, necesitas"
	line "más fichas.@"
	text_end

_OopsYouDontHaveEnoughRoomText::
	text "¡Uups! No tienes"
	line "bastante sitio.@"
	text_end

_OhFineThenText::
	text "Bueno. Muy bien.@"
	text_end

_GetDexRatedText::
	text "¿Quieres evaluar"
	line "tu #DEX?"
	done

_ClosedOaksPCText::
	text "Cerrado enlace al"
	line "PC del PROF. OAK.@"
	text_end

_AccessedOaksPCText::
	text "Accedes al PC"
	line "del PROF.OAK."

	para "Accedes al Sist."
	line "de Evaluación de"
	cont "la #DEX."
	prompt

_WhereWouldYouLikeText::
	text "¿Adónde te"
	line "gustaría ir?"
	done

_PleaseWaitText::
	text "Vale, un momento"
	line "por favor."
	done

_LinkCanceledText::
	text "El enlace fue"
	line "cancelado."
	done

; TODO - Spanish translation
_ColosseumUnavailableText:: ; marcelnote - disable Colosseum
	text "I'm sorry."
	line "The COLOSSEUM is"
	cont "closed for now."
	done

_OakSpeechText1::
	text "¡Hola a todos!"
	line "¡Bienvenidos al"
	cont "mundo de #MON!"

	para "¡Me llamo OAK!"
	line "¡Pero la gente me"
	cont "llama el PROFESOR"
	cont "#MON!"
	prompt

_OakSpeechText2A::
	text "¡Este mundo está"
	line "habitado por unas"
	cont "criaturas"
	cont "llamadas #MON!@"
	text_end

_OakSpeechText2B::
	text_start

	para "Para algunos, los"
	line "#MON son"
	cont "mascotas. Pero"
	cont "otros los usan"
	cont "para pelear."

	para "En cuanto a mí..."

	para "Estudio a los"
	line "#MON como"
	cont "profesión."
	prompt

_IntroducePlayerText::
	text "Pero primero dime"
	line "cómo te llamas."
	prompt

_IntroduceRivalText::
	text "Este es mi nieto."
	line "Él ha sido tu"
	cont "rival desde que"
	cont "eras un niño."

	para "...Mmm, ¿podrías"
	line "decirme cómo se"
	cont "llama?"
	prompt

_OakSpeechText3::
	text "¡<PLAYER>!"

	para "¡Tu propia"
	line "leyenda #MON"
	cont "está a punto de"
	cont "comenzar!"

	para "¡Te espera un"
	line "mundo de sueños"
	cont "y aventuras con"
	cont "los #MON!"
	cont "¡Adelante!"
	done

; TODO - Spanish translation
_BoyGirlText:: ;joenote - add female player
	text "Are you a boy or"
	line "a girl?"
	done

_DoYouWantToNicknameText::
	text "¿Quieres darle"
	line "un mote a tu"
	cont "@"
	text_ram wNameBuffer
	text "?"
	done

_YourNameIsText::
	text "¡Bien! ¡Tu nombre"
	line "es <PLAYER>!"
	prompt

_HisNameIsText::
	text "¡Ah, sí! ¡Ahora"
	line "lo recuerdo! ¡Se"
	cont "llama <RIVAL>!"
	prompt

_WillBeTradedText::
	text_ram wNameOfPlayerMonToBeTraded
	text " y"
	line "@"
	text_ram wNameBuffer
	text_start
	cont "serán cambiados."
	done

_TextIDErrorText::
	text_decimal hTextID, 1, 2
	text " ERROR."
	done

_ContCharText::
	text "<_CONT>@"
	text_end
