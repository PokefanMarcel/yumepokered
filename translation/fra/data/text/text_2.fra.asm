_AIBattleWithdrawText::
	text_ram wTrainerName
	text_start
	line "rappelle..."
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	prompt

_AIBattleUseItemText::
	text_ram wTrainerName
	text " uti-"
	line "lise @"
	text_ram wNameBuffer
	text_start
	cont "sur @"
	text_ram wEnemyMonNick
	text "!"
	prompt

_TradeWentToText::
	text_ram wStringBuffer
	text " va"
	line "à @"
	text_ram wLinkEnemyTrainerName
	text "."
	done

_TradeForText::
	text "Contre @"
	text_ram wStringBuffer
	text_start
	line "de <PLAYER>,"
	done

_TradeSendsText::
	text_ram wLinkEnemyTrainerName
	text_start
	line "donne @"
	text_ram wNameBuffer
	text "."
	done

_TradeWavesFarewellText::
	text_ram wLinkEnemyTrainerName
	text ":"
	line "Au revoir,"
	done

_TradeTransferredText::
	text_ram wNameBuffer
	text "!"
	line "(sniff sniff)"
	done

_TradeTakeCareText::
	text "Prends soin de"
	line "@"
	text_ram wNameBuffer
	text "."
	done

_TradeWillTradeText::
	text_ram wLinkEnemyTrainerName
	text_start
	line "offre @"
	text_ram wNameBuffer
	text_start
	done

_TradeforText::
	text "Contre @"
	text_ram wStringBuffer
	text_start
	line "de <PLAYER>."
	done

_PlaySlotMachineText::
	text "Une machine à"
	line "sous! On joue?"
	done

_OutOfCoinsSlotMachineText::
	text "Zut de flûte!"
	line "Pas de jetons!"
	done

_BetHowManySlotMachineText::
	text "Combien de"
	line "jetons?"
	done

_StartSlotMachineText::
	text "C'est parti!"
	done

_NotEnoughCoinsSlotMachineText::
	text "Pas assez de"
	line "jetons!"
	prompt

_OneMoreGoSlotMachineText::
	text "Encore une"
	line "fois?"
	done

_LinedUpText::
	text " en ligne!"
	line "@"
	text_ram wStringBuffer
	text " jetons!"
	done

_NotThisTimeText::
	text "Oups. Perdu!"
	prompt

_YeahText::
	text "Ouaiiiis!@"
	text_end

_DexSeenOwnedText::
	text "#DEX   Vus:@"
	text_decimal wDexRatingNumMonsSeen, 1, 3
	text " "
	line "         Pris:@"
	text_decimal wDexRatingNumMonsOwned, 1, 3
	text " "
	done

_DexRatingText::
	text "Eval. #DEX:" ; marcelnote - replaced <COLON> since ":" is used everywhere else in text
	done

_GymStatueText1::
	text "ARENE #MON"
	line "de @"
	text_ram wGymCityName
	text_start
	cont "CHAMPION:"
	cont "@"
	text_ram wGymLeaderName
	text_start

	para "VAINQUEURS:"
	line "<RIVAL>"
	done

_GymStatueText2::
	text "ARENE #MON"
	line "de @"
	text_ram wGymCityName
	text_start
	cont "CHAMPION:"
	cont "@"
	text_ram wGymLeaderName
	text_start

	para "VAINQUEURS:"
	line "<RIVAL>"
	cont "<PLAYER>"
	done

_GymStatueText3::
	text "ARENE #MON"
	line "de @"
	text_ram wGymCityName
	text_start
	cont "CHAMPION:"
	cont "@"
	text_ram wGymLeaderName
	text_start

	para "VAINQUEURS:"
	line "<RIVAL>"
	cont "<PLAYER>"
	cont "YELLOW"
	done

_BookcaseText::
	text "Des bouquins sur"
	line "les #MON!"
	done

_NewBicycleText::
	text "Une BICYCLETTE"
	line "toute neuve! Top!"
	done

_NewSurfboardText::
	text "Une PLANCHE DE"
	line "SURF toute neuve!"
	done

_PushStartText::
	text "START et...paf!"
	line "V'là le MENU!"
	done

_SaveOptionText::
	text "L'option SAUVER"
	line "est sur l'écran"
	cont "du MENU."
	done

_StrengthsAndWeaknessesText::
	text "Tous les #MON"
	line "ont des points"
	cont "faibles! Ils sont"
	cont "également tous"
	cont "puissants face"
	cont "à un certain"
	cont "élément."
	done

_TimesUpText::
	text "Haut-parleur: Hé!"

	para "C'est fini!"
	prompt

_GameOverText::
	text "Haut-parleur:"
	line "Le SAFARI est"
	cont "terminé!"
	done

_CinnabarGymQuizIntroText::
	text "Quiz #MON!"

	para "Une bonne réponse"
	line "ouvrira la porte!"

	para "Une erreur et"
	line "c'est la guerre!"

	para "Pour préserver"
	line "une équipe avant"
	cont "d'affronter le"
	cont "CHAMPION..."

	para "Mieux vaut éviter"
	line "les erreurs!"
	prompt


_CinnabarQuizQuestionsText1::
	text "CHRYSACIER évolue" ; marcelnote - changed from CATERPIE
	line "en PAPILUSION?"
	done

_CinnabarQuizQuestionsText2:: ; marcelnote - new quiz question for 2nd trainer
	text "GOUPIX et FEUNARD"
	line "apprennent"
	cont "FEU FOLLET?"
	done

_CinnabarQuizQuestionsText3:: ; marcelnote - reindexed from 2
	text "Il existe 9"
	line "BADGES #MON?"
	done

_CinnabarQuizQuestionsText4:: ; marcelnote - reindexed from 3
	text "PTITARD évolue"
	line "3 fois?"
	done

_CinnabarQuizQuestionsText5:: ; marcelnote - reindexed from 4
	text "La foudre est"
	line "efficace contre"
	cont "les #MON du"
	cont "sol?"
	done

_CinnabarQuizQuestionsText6:: ; marcelnote - reindexed from 5
	text "Les #MON du"
	line "même type et du"
	cont "même niveau sont"
	cont "différents?"
	done

_CinnabarQuizQuestionsText7:: ; marcelnote - reindexed from 6
	text "CT28 contient"
	line "FOSSE?"
	done

_CinnabarGymQuizCorrectText::
	text "Bonne réponse!"

	para "En avant!@"
	text_end

_CinnabarGymQuizIncorrectText::
	text "N'importe quoi!"
	prompt

_MagazinesText::
	text "Des magazines"
	line "#MON!"

	para "Des cahiers"
	line "#MON!"

	para "Des dessins"
	line "#MON!"
	done

_BillsHouseMonitorText::
	text "Un TELEPORTEUR"
	line "sur le moniteur!"
	done

_BillsHouseInitiatedText::
	text "<PLAYER> enclenche"
	line "le TELEPORTEUR!@"
	text_end

_BillsHousePokemonListText1::
	text "La liste des"
	line "#MON favoris"
	cont "de LEO!"
	prompt

_BillsHousePokemonListText2::
	text "Quel #MON"
	line "voulez-vous voir?"
	done

_OakLabEmailText::
	text "Il y a un e-mail!"

	para "..."

	para "Avis à tous les"
	line "dresseurs de"
	cont "#MON!"

	para "Le CONSEIL des 4"
	line "est prêt à punir"
	cont "tout concurrent!"

	para "Présentez vos"
	line "meilleurs #MON"
	cont "et découvrez"
	cont "votre niveau"
	cont "en tant que"
	cont "dresseur!"

	para "LIGUE #MON,"
	line "PLATEAU INDIGO"

	para "PS: PROF. CHEN,"
	line "votre visite est"
	cont "attendue..."
	done

_GameCornerCoinCaseText::
	text "Vous n'avez pas"
	line "de BOITE JETON!"
	done

_GameCornerNoCoinsText::
	text "Vous n'avez pas"
	line "de jetons!"
	done

_GameCornerOutOfOrderText::
	text "EN PANNE"
	line "Machine cassée."
	done

_GameCornerOutToLunchText::
	text "PARTI MANGER"
	line "Machine réservée."
	done

_GameCornerSomeonesKeysText::
	text "Des clés!"
	line "Bah? C'est à qui?"
	done

_JustAMomentText::
	text "Patientez SVP."
	done

TMNotebookText::
	text "C'est un rapport"
	line "sur les CT."

	para "..."

	para "Il existe en tout"
	line "51 CT (Capsule" ; marcelnote - changed from 50 TMs
	cont "Technique)."

	para "5 CS (Capsule"
	line "Secrète) sont à"
	cont "utiliser à"
	cont "l'infini."

	para "SYLPHE SARL@"
	text_end

_TurnPageText::
	text "Tourner la page?"
	done

_ViridianSchoolNotebookText5::
	text "FILLE: Hé! Ne lis"
	line "pas mon journal!@"
	text_end

_ViridianSchoolNotebookText1::
	text "Vous examinez le"
	line "journal!"

	para "Première page..."

	para "Les # BALL"
	line "peuvent capturer"
	cont "les #MON."

	para "Jusqu'à 6"
	line "#MON sont"
	cont "transportables."

	para "Les personnes"
	line "s'occupant des"
	cont "#MON sont"
	cont "des dresseurs de"
	cont "#MON."
	prompt

_ViridianSchoolNotebookText2::
	text "Deuxième page..."

	para "Un #MON"
	line "sauvage et en"
	cont "pleine forme est"
	cont "difficile à"
	cont "capturer, alors"
	cont "affaiblissez-le!"

	para "Le poison, la"
	line "brûlure et les"
	cont "autres types de"
	cont "dégâts sont aussi"
	cont "efficaces!"
	prompt

_ViridianSchoolNotebookText3::
	text "Troisième page..."

	para "Le but de chaque"
	line "dresseur est"
	cont "d'affronter les"
	cont "autres dresseurs"
	cont "dans des combats"
	cont "de #MON."

	para "Les combats se"
	line "tiennent en"
	cont "permanence dans"
	cont "les ARENES"
	cont "#MON."
	prompt

_ViridianSchoolNotebookText4::
	text "Quatrième page..."

	para "Le rêve de chaque"
	line "dresseur est de"
	cont "vaincre les 8"
	cont "CHAMPIONS des"
	cont "différentes"
	cont "ARENES #MON."

	para "Ces victoires"
	line "donnent le droit"
	cont "d'affronter..."

	para "Le CONSEIL des 4"
	line "de la LIGUE"
	cont "#MON!"
	prompt

_EnemiesOnEverySideText::
	text "La victoire..."
	line "C'est bien!"
	done

_WhatGoesAroundComesAroundText::
	text "La défaite..."
	line "C'est mal!"
	done

_FightingDojoText::
	text "DOJO"
	done

;_IndigoPlateauHQText:: ; marcelnote - inaccessible, removed
;	text "PLATEAU INDIGO"
;	line "Quartier général"
;	cont "de la LIGUE"
;	cont "#MON"
;	done

_Route11GateLeftBinocularsSnorlaxText::
	text "Vous regardez"
	line "dans les"
	cont "jumelles."

	para "Un énorme"
	line "#MON dort"
	cont "sur la route!"
	done

_Route11GateLeftBinocularsNoSnorlaxText::
	text "Vous regardez"
	line "dans les"
	cont "jumelles."

	para "C'est très beau!"
	line "... "
	cont "Bon! On y va?"
	done

_Route11GateRightBinocularsText::
	text "Vous regardez"
	line "dans les"
	cont "jumelles."

	para "Il n'y a qu'un"
	line "seul chemin pour"
	cont "aller de AZURIA"
	cont "à LAVANVILLE:"
	cont "la GROTTE!"
	done

_Route12GateLeftBinocularsText::
	text "Vous regardez"
	line "dans les"
	cont "jumelles."

	para "Vous voyez un"
	line "pêcheur!"
	done

_Route12GateRightBinocularsText::
	text "Vous regardez"
	line "dans les"
	cont "jumelles."

	para "Vous voyez la"
	line "TOUR #MON!"
	done

_Route15GateLeftBinocularsText::
	text "Vous regardez"
	line "dans les"
	cont "jumelles..."

	para "Un grand et bel"
	line "oiseau vole vers"
	cont "la mer."
	done

_Route15GateRightBinocularsText::
	text "Vous regardez"
	line "dans les"
	cont "jumelles."

	para "Vous voyez une"
	line "petite île!"
	done

_Route16GateLeftBinocularsText::
	text "Vous regardez"
	line "dans les"
	cont "jumelles."

	para "Vous voyez le"
	line "centre commercial"
	cont "de CELADOPOLE!"
	done

_Route16GateRightBinocularsText::
	text "Vous regardez"
	line "dans les"
	cont "jumelles."

	para "Vous voyez un"
	line "grand ponton!"
	done

_Route18GateLeftBinocularsText::
	text "Vous regardez"
	line "dans les"
	cont "jumelles."

	para "BOURG PALETTE"
	line "est à l'Ouest!"
	done

_Route18GateRightBinocularsText::
	text "Vous regardez"
	line "dans les"
	cont "jumelles."

	para "C'est plein"
	line "de nageurs!"
	done

_Route22GateLeftBinocularsText:: ; marcelnote - new
	text "Vous regardez"
	line "dans les"
	cont "jumelles."

	para "Un pic isolé"
	line "se dessine"
	cont "à l'horizon."
	done

_Route22GateRightBinocularsText:: ; marcelnote - new
	text "Vous regardez"
	line "dans les"
	cont "jumelles."

	para "Un chemin sinueux"
	line "grimpe vers la"
	cont "LIGUE #MON."
	done

_AerodactylFossilText::
	text "Le fossile du"
	line "PTERA est un"
	cont "#MON rare"
	cont "et ancien."
	done

_KabutopsFossilText::
	text "Le fossile du"
	line "KABUTOPS est un"
	cont "#MON rare"
	cont "et ancien."
	done

_LinkCableHelpText1::
	text "ASTUCE"

	para "Le Câble Link"
	prompt

_LinkCableHelpText2::
	text "Quel chapitre"
	line "voulez-vous lire?"
	done

_LinkCableInfoText1::
	text "Après avoir"
	line "connecté deux"
	cont "GAME BOY, parlez"
	cont "à l'hôtesse à"
	cont "droite dans tout"
	cont "CENTRE #MON."
	prompt

_LinkCableInfoText2::
	text "Le COLISEE permet"
	line "d'affronter un"
	cont "ami."
	prompt

_LinkCableInfoText3::
	text "Le CENTRE TROC"
	line "permet d'échanger"
	cont "vos #MON."
	prompt

_ViridianSchoolBlackboardText1::
	text "Le tableau décrit"
	line "les changements"
	cont "de STATUT des"
	cont "#MON pendant"
	cont "un combat."
	prompt

_ViridianSchoolBlackboardText2::
	text "Quel chapitre"
	line "voulez-vous lire?"
	done

_ViridianBlackboardSleepText::
	text "Un #MON ne"
	line "peut attaquer"
	cont "s'il est endormi!"

	para "Un #MON reste"
	line "endormi même"
	cont "après un combat."

	para "Un REVEIL peut"
	line "le réveiller!"
	prompt

_ViridianBlackboardPoisonText::
	text "Un #MON"
	line "empoisonné voit"
	cont "son énergie se"
	cont "vider doucement."

	para "Le poison ne"
	line "disparaît pas"
	cont "après un combat."

	para "L'ANTIDOTE soigne"
	line "le poison!"
	prompt

_ViridianBlackboardPrlzText::
	text "La paralysie peut"
	line "annuler certaines"
	cont "attaques!"
	cont "Elle réduit aussi" ; marcelnote - added
	cont "la vitesse."

	para "La paralysie ne"
	line "disparaît pas"
	cont "après un combat."

	para "L'ANTI-PARA"
	line "soigne toute"
	cont "paralysie!"
	prompt

_ViridianBlackboardBurnText::
	text "La BRULURE réduit"
	line "la puissance et"
;	cont "la vitesse. Elle" ; marcelnote - mistake, removed
	cont "inflige aussi des"
	cont "dégâts continus."

	para "La brûlure ne"
	line "disparaît pas"
	cont "après un combat."

	para "L'ANTI-BRULE"
	line "soigne les grands"
	cont "brûlés!"
	prompt

_ViridianBlackboardFrozenText::
	text "Un #MON"
	line "prisonnier des"
	cont "glaces reste"
	cont "immobile!"

	para "Il reste gelé"
	line "même après la"
	cont "fin du combat."

	para "Un ANTIGEL peut"
	line "réchauffer un"
	cont "#MON!"
	prompt

_VermilionGymTrashText::
	text "Mmmm!"
	line "Un joli tas"
	cont "d'ordures...miam!"
	done

_VermilionGymTrashSuccessText1::
	text "Oh! Un bouton"
	line "dans la poubelle!"
	cont "Dingue!"

	para "Le premier"
	line "verrouillage est"
	cont "levé!@"
	text_end

_VermilionGymTrashSuccessText2::
	text "Hé! Un autre"
	line "bouton dans la"
	cont "poubelle! Délire!"
	cont "On appuie!"
	prompt

_VermilionGymTrashSuccessText3::
	text "Le deuxième"
	line "verrouillage est"
	cont "levé!"

	para "La porte s'ouvre!@"
	text_end

_VermilionGymTrashFailText::
	text "Une poubelle bien"
	line "dégueulasse!"
	cont "Oups... Les"
	cont "verrouillages"
	cont "sont en place!@"
	text_end

_FoundHiddenItemText::
	text "<PLAYER> trouve:"
	line "@"
	text_ram wNameBuffer
	text "!@"
	text_end

_HiddenItemBagFullText::
	text "Zut! Plus de"
	line "place dans"
	cont "l'inventaire!"
	done

_FoundHiddenCoinsText::
	text "<PLAYER> trouve"
	line "@"
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " jetons!@"
	text_end

_FoundHiddenCoins2Text::
	text "<PLAYER> trouve"
	line "@"
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " jetons!@"
	text_end

_DroppedHiddenCoinsText::
	text_start
	para "Oups! Des jetons"
	line "sont tombés!"
	done

_IndigoPlateauStatuesText1::
	text "PLATEAU INDIGO"
	prompt

_IndigoPlateauStatuesText2::
	text "Le rêve de tout"
	line "dresseur!"
	cont "Quartier général"
	cont "de la LIGUE"
	cont "#MON."
	done

_IndigoPlateauStatuesText3::
	text "La plus haute"
	line "instance #MON."
	cont "Quartier général"
	cont "de la LIGUE"
	cont "#MON."
	done

_PokemonBooksText::
	text "Des bouquins sur"
	line "les #MON!"
	done

_DiglettSculptureText:: ; marcelnote - modified
;	text "Une sculpture de" ; original Rouge/Bleue
;	line "TAUPIQUEUR."
;	text "It's a statue of" ; translation from shinpokered of original Japanese
;	line "a fat Buddha."
	text "Un autel avec" ; new version
	line "une petite statue."
;	text "An altar with a" ; variant
;	line "peaceful statue."
	done

_ElevatorText::
	text "Un ascenseur."
	done

_TownMapText::
	text "Une CARTE.@"
	text_end

_PokemonStuffText::
	text "Cool! Plein de"
	line "machins sur les"
	cont "#MON!"
	done

_HotSnacksText:: ; marcelnote - new for Marts
	text "Encas chauds"
	line "en promo! Miam!"
	done

_ColdDrinksText:: ; marcelnote - new for Marts
	text "Des bouteilles"
	line "bien rangées!"
	done

_HolidayBrochuresText:: ; marcelnote - new for Safari Rest houses
	text "Des brochures de"
	line "vacances!"

	para "Séjours plage sur"
	line "l'ILE MANDARINE,"
	cont "randonnées au"
	cont "MONT SELENITE,"
	cont "journées shopping"
	cont "à CELADOPOLE..."
	done

_OutOfSafariBallsText::
	text "Haut-parleur: Hé!"

	para "Vous n'avez plus"
	line "de SAFARI BALL!"
	prompt

_WildRanText::
	text_ram wEnemyMonNick
	text_start
	line "sauvage s'enfuit!"
	prompt

_EnemyRanText::
	text "Le @"
	text_ram wEnemyMonNick
	text_start
	line "ennemi s'enfuit!"
	prompt

_HurtByPoisonText::
	text "<USER>"
	line "souffre du"
	cont "poison!"
	prompt

_HurtByBurnText::
	text "<USER>"
	line "brûle!"
	prompt

_HurtByLeechSeedText::
	text "<USER>"
	line "perd son énergie!"
	prompt

_EnemyMonFaintedText::
	text "Le @"
	text_ram wEnemyMonNick
	text_start
	line "ennemi est K.O.!"
	prompt

_MoneyForWinningText::
	text "<PLAYER> gagne"
	line "@"
	text_bcd wAmountMoneyWon, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "¥!"
	prompt

_TrainerDefeatedText::
	text "<PLAYER> a vaincu"
	line "@"
	text_ram wTrainerName
	text "!"
	prompt

_PlayerMonFaintedText::
	text_ram wBattleMonNick
	text_start
	line "est K.O.!"
	prompt

_UseNextMonText::
	text "Appeler un autre"
	line "#MON?"
	done

_Rival1WinText::
	text "<RIVAL>: Ouaiiis!"
	line "J'suis trop bon,"
	cont "ou bien?"
	prompt

_PlayerBlackedOutText2::
	text "<PLAYER> n'a plus"
	line "de #MON!"

	para "<PLAYER> est"
	line "hors-jeu!"
	prompt

_LinkBattleLostText::
	text_ram wTrainerName
	text " a"
	line "vaincu <PLAYER>!"
	prompt

_TrainerAboutToUseText::
	text_ram wTrainerName
	text_start
	line "va appeler..."
	cont"@"
	text_ram wEnemyMonNick
	text "!"

	para "<PLAYER> va-t-il"
	line "changer de"
	cont "#MON?"
	done

_TrainerSentOutText::
	text_ram wTrainerName
	text_start
	line "fait appel à... "
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	done

_NoWillText::
	text "Il ne veut pas"
	line "combattre!"
	prompt

_CantEscapeText::
	text "Fuite impossible!"
	prompt

_NoRunningText::
	text "On ne peut s'en-"
	line "fuir d'un combat"
	cont "de dresseurs!"
	prompt

_GotAwayText::
	text "Vous prenez la"
	line "fuite!"
	prompt

_ItemsCantBeUsedHereText::
	text "Les objets sont"
	line "inutilisables."
	prompt

_AlreadyOutText::
	text_ram wBattleMonNick
	text " est"
	line "déjà au combat!"
	prompt

_MoveNoPPText::
	text "Plus de Points de"
	line "Pouvoir!"
	prompt

_MoveDisabledText::
	text "Cette attaque est"
	line "annulée!"
	prompt

_NoMovesLeftText::
	text_ram wBattleMonNick
	text " n'a"
	line "plus d'attaques!"
	done

_MultiHitText::
	text "L'ennemi est"
	line "touché @"
	text_decimal wPlayerNumHits,1,1
	text " fois!"
	prompt

_ScaredText::
	text_ram wBattleMonNick
	text " a peur"
	line "de bouger!"
	prompt

_GetOutText::
	text "SPECTRE: Va-t'en..."
	line "Dehors..."
	prompt

_FastAsleepText::
	text "<USER>"
	line "fait un somme!"
	prompt

_WokeUpText::
	text "<USER>"
	line "se réveille!"
	prompt

_IsFrozenText::
	text "<USER>"
	line "est congelé!"
	prompt

_FullyParalyzedText::
	text "<USER>"
	line "est paralysé!"
	prompt

_FlinchedText::
	text "<USER>"
	line "a la trouille!"
	prompt

_MustRechargeText::
	text "<USER>"
	line "est à plat!"
	prompt

_DisabledNoMoreText::
	text "<USER>"
	line "peut attaquer!"
	prompt

_IsConfusedText::
	text "<USER>"
	line "devient dingue..."
	prompt

_HurtItselfText::
	text "Sa folie lui in-"
	line "flige des dégâts!"
	prompt

_ConfusedNoMoreText::
	text "<USER>"
	line "se sent mieux!"
	prompt

_SavingEnergyText::
	text "<USER>"
	line "se concentre!"
	prompt

_UnleashedEnergyText::
	text "<USER>"
	line "envoie la sauce!"
	prompt

_ThrashingAboutText::
	text "<USER>"
	line "cogne à fond!"
	done

_AttackContinuesText::
	text "<USER>"
	line "attaque encore!"
	done

_CantMoveText::
	text "<USER>"
	line "est immobilisé!"
	prompt

_MoveIsDisabledText::
	text_ram wNameBuffer
	text " de"
	line "<USER>"
	cont "a disparu!"
	prompt

_MonName1Text::
	text "<USER>@"
	text_end

_UsedText::
	text_start
	line "lance @"
	text_end

_InsteadText::
	text "à la place:"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer
	text "@"

_ExclamationPoint1Text::
;	text_start
;	done
	text "!"
	done

_ExclamationPoint2Text::
;	text_start
;	done
	text "!"
	done

_ExclamationPoint3Text::
;	text_start
;	done
	text "!"
	done

_ExclamationPoint4Text::
;	text_start
;	done
	text "!"
	done

_ExclamationPoint5Text::
;	text_start
;	done
	text "!"
	done

_AttackMissedText::
	text "L'attaque de"
	line "<USER>"
	cont "a échoué!"
	prompt

_KeptGoingAndCrashedText::
	text "<USER>"
	line "tombe par terre!"
	prompt

_UnaffectedText::
	text "<TARGET>"
	line "n'a rien senti!"
	prompt

_DoesntAffectMonText::
	text "Pas d'effet sur"
	line "<TARGET>!"
	prompt

_CriticalHitText::
	text "Coup critique!"
	prompt

_OHKOText::
	text "Super patate!"
	prompt

_LoafingAroundText::
	text_ram wBattleMonNick
	text_start
	line "se balade..."
	prompt

_BeganToNapText::
	text_ram wBattleMonNick
	text_start
	line "fait une sieste!"
	prompt

_WontObeyText::
	text_ram wBattleMonNick
	text_start
	line "n'obéit pas!"
	prompt

_TurnedAwayText::
	text_ram wBattleMonNick
	text_start
	line "s'en va!"
	prompt

_IgnoredOrdersText::
	text_ram wBattleMonNick
	text_start
	line "ignore les ordres!"
	prompt

_SubstituteTookDamageText::
	text "Le CLONE a pris"
	line "les dégâts pour"
	cont "<TARGET>!"
	prompt

_SubstituteBrokeText::
	text "Le CLONE de"
	line "<TARGET>"
	cont "est détruit!"
	prompt

_BuildingRageText::
	text "La FRENESIE de"
	line "<USER>"
	cont "s'intensifie!"
	prompt

_MirrorMoveFailedText::
	text "La MIMIQUE a"
	next "échoué!"
	prompt

_HitXTimesText::
	text "Touché @"
	text_decimal wEnemyNumHits, 1, 1
	text " fois!"
	prompt

_GainedText::
	text_ram wNameBuffer
	text " gagne"
	line "@"
	text_end

;_WithExpAllText:: ; marcelnote - shortened ExpAll messages
;	text "with EXP.ALL,"
;	cont "@"
;	text_end

_ExpAllIsOnText:: ; marcelnote - shortened ExpAll messages
	text "Le MULTI. EXP"
	line "est allumé!"
	prompt

_BoostedText::
	text "un bonus de"
	cont "@"
	text_end

_ExpPointsText::
	text_decimal wExpAmountGained, 2, 4
	text " points d'EXP!"
	prompt

_GrewLevelText::
	text_ram wNameBuffer
	text " monte"
	line "au niveau @"
	text_decimal wCurEnemyLevel, 1, 3
	text "!@"
	text_end

_WildMonAppearedText::
	text "Un @"
	text_ram wEnemyMonNick
	text_start
	line "sauvage apparaît!"
	prompt

_HookedMonAttackedText::
	text "Le @"
	text_ram wEnemyMonNick
	text_start
	line "pêché attaque!"
	prompt

_EnemyAppearedText::
	text "Un @"
	text_ram wEnemyMonNick
	text_start
	line "apparaît!"
	prompt

_TrainerWantsToFightText::
	text_ram wTrainerName
	text " veut"
	line "se battre!"
	prompt

_UnveiledGhostText::
	text "Le SCOPE SYLPHE"
	line "révèle l'identité"
	cont "du SPECTRE!"
	prompt

_GhostCantBeIDdText::
	text "Fichtre! Le"
	line "SPECTRE ne peut"
	cont "être identifié!"
	prompt

_GoText::
	text "En avant!"
	line "@"
	text_end

_DoItText::
	text "Attaque,"
	line "@"
	text_end

_GetmText::
	text "A toi,"
	line "@"
	text_end

_EnemysWeakText::
	text "Il est à toi,"
	line "@"
	text_end

_PlayerMon1Text::
	text_ram wBattleMonNick
	text "!"
	done

_PlayerMon2Text::
	text_ram wBattleMonNick
	text "!@"
	text_end

_EnoughText::
	text "!@"
	text_end

_OKExclamationText::
	text "!@"
	text_end

_GoodText::
	text "!@"
	text_end

_ComeBackText::
	text_start
	line "Reviens!@"
	text_end

_SuperEffectiveText::
	text "C'est très"
	line "efficace!"
	prompt

_NotVeryEffectiveText::
	text "Ce n'est pas très"
	line "efficace..."
	prompt

_SafariZoneEatingText::
	text "Le @"
	text_ram wEnemyMonNick
	text_start
	line "sauvage mange!"
	prompt

_SafariZoneAngryText::
	text "Le @"
	text_ram wEnemyMonNick
	text_start
	line "sauvage se fâche!"
	prompt

; money related
_PickUpPayDayMoneyText::
	text "<PLAYER> ramasse:"
	line "¥@"
	text_bcd wTotalPayDayMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "!"
	prompt

_ClearSaveDataText::
	text "Effacer toutes"
	line "les données?"
	done

_WhichFloorText::
	text "Quel étage?"
	done

_PartyMenuNormalText::
	text "Sélectionnez un"
	line "#MON."
	done

_PartyMenuItemUseText::
	text "Sur quel #MON?"
	done

_PartyMenuBattleText::
	text "Faire combattre"
	line "quel #MON?"
	done

_PartyMenuUseTMText::
	text "Capsule sur quel"
	line "#MON?"
	done

_PartyMenuSwapMonText::
	text "Nouvelle position"
	line "du #MON..."
	done

_PotionText::
	text_ram wNameBuffer
	text_start
	line "gagne @"
	text_decimal wHPBarHPDifference, 2, 3
	text " PV!"
	done

_AntidoteText::
	text_ram wNameBuffer
	text " est"
	line "guéri du poison!"
	done

_ParlyzHealText::
	text_ram wNameBuffer
	text_start
	line "peut bouger!"
	done

_BurnHealText::
	text_ram wNameBuffer
	text_start
	line "ne brûle plus!"
	done

_IceHealText::
	text_ram wNameBuffer
	text_start
	line "est dégelé!"
	done

_AwakeningText::
	text_ram wNameBuffer
	text_start
	line "se réveille!"
	done

_FullHealText::
	text_ram wNameBuffer
	text_start
	line "est soigné!"
	done

_ReviveText::
	text_ram wNameBuffer
	text_start
	line "revient à lui!"
	done

_RareCandyText::
	text_ram wNameBuffer
	text " monte"
	line "au niveau @"
	text_decimal wCurEnemyLevel, $1,$3
	text "!@"
	text_end

_TurnedOnPC1Text::
	text "<PLAYER> allume"
	line "le PC."
	prompt

_AccessedBillsPCText::
	text "Connexion au PC"
	line "de LEO."

	para "Accès au système"
	line "de stockage des"
	cont "#MON."
	prompt

_AccessedSomeonesPCText::
	text "Connexion au PC"
	line "inconnu."

	para "Accès au système"
	line "de stockage des"
	cont "#MON."
	prompt

_AccessedMyPCText::
	text "PC personnel"
	line "connecté."

	para "Accès au système"
	line "de stockage des"
	cont "objets."
	prompt

_TurnedOnPC2Text::
	text "<PLAYER> allume"
	line "le PC."
	prompt

_WhatDoYouWantText::
	text "Exécuter quelle"
	line "application?"
	done

_WhatToDepositText::
	text "Que désirez-vous"
	line "stocker?"
	done

_DepositHowManyText::
	text "Combien?"
	done

_ItemWasStoredText::
	text "L'objet"
	line "@"
	text_ram wNameBuffer
	text " a"
	cont "été stocké."
	prompt

_NothingToDepositText::
	text "Vous n'avez rien"
	line "à stocker."
	prompt

_NoRoomToStoreText::
	text "Plus de place"
	line "pour stocker."
	prompt

_WhatToWithdrawText::
	text "Que voulez-vous"
	line "retirer?"
	done

_WithdrawHowManyText::
	text "Combien?"
	done

_WithdrewItemText::
	text "Retrait de:"
	line "@"
	text_ram wNameBuffer
	text "."
	prompt

_NothingStoredText::
	text "Rien n'est"
	line "stocké."
	prompt

_CantCarryMoreText::
	text "Votre inventaire"
	line "est plein."
	prompt

_WhatToTossText::
	text "Que désirez-vous"
	line "jeter?"
	done

_TossHowManyText::
	text "Combien?"
	done

_AccessedHoFPCText::
	text "Connexion au site"
	line "de la LIGUE"
	cont "#MON."

	para "Accès à la liste"
	line "des CELEBRITES."
	prompt

_SwitchOnText::
	text "Branché!"
	prompt

_WhatText::
	text "Que faire?"
	done

_DepositWhichMonText::
	text "Stocker quel"
	line "#MON?"
	done

_MonWasStoredText::
	text_ram wStringBuffer
	text " est"
	line "stocké dans la"
	cont "boîte @"
	text_ram wBoxNumString
	text "."
	prompt

_CantDepositLastMonText::
	text "Vous ne pouvez"
	line "stocker votre"
	cont "dernier #MON!"
	prompt

_BoxFullText::
	text "Oups! Cette boîte"
	line "est pleine!"
	prompt

_MonIsTakenOutText::
	text "Retrait de"
	line "@"
	text_ram wStringBuffer
	text_start
	cont "terminé."
	prompt

_NoMonText::
	text "Hein? Il n'y a"
	line "aucun #MON!"
	prompt

_CantTakeMonText::
	text "Vous ne pouvez"
	line "retirer un"
	cont "#MON."

	para "Stockez d'abord"
	line "un #MON."
	prompt

_ReleaseWhichMonText::
	text "Relâcher quel"
	line "#MON?"
	done

_OnceReleasedText::
	text_ram wStringBuffer
	text " sera"
	line "à jamais perdu."
	cont "Continuer?"
	done

_MonWasReleasedText::
	text_ram wStringBuffer
	text " est"
	line "relâché. Adieu,"
	cont "@"

_CF50ExclamationText::
	text_ram wStringBuffer
	text "!"
	prompt

_RequireCoinCaseText::
	text "Vous n'avez pas"
	line "de BOITE JETON!@"
	text_end

_ExchangeCoinsForPrizesText::
	text "Nous échangeons"
	line "des prix contre"
	cont "des jetons."
	prompt

_WhichPrizeText::
	text "Quel prix"
	line "désirez-vous?"
	done

_HereYouGoText::
	text "Et voilà!@"
	text_end

_SoYouWantPrizeText::
	text_ram wNameBuffer
	text "?"
	done

_SorryNeedMoreCoinsText::
	text "Vous n'avez pas"
	line "assez de jetons.@"
	text_end

_OopsYouDontHaveEnoughRoomText::
	text "Votre inventaire"
	line "est plein.@"
	text_end

_OhFineThenText::
	text "Bon. Très bien.@"
	text_end

_GetDexRatedText::
	text "Voulez-vous faire"
	line "évaluer votre"
	cont "#DEX?"
	done

_ClosedOaksPCText::
	text "PC du PROF. CHEN,"
	line "Déconnexion...@"
	text_end

_AccessedOaksPCText::
	text "Connexion au PC"
	line "du PROF. CHEN."

	para "Accès au système"
	line "d'évaluation du"
	cont "#DEX."
	prompt

_WhereWouldYouLikeText::
	text "Où désirez-vous"
	line "aller?"
	done

_PleaseWaitText::
	text "Un instant,"
	line "s'il vous plaît."
	done

_LinkCanceledText::
	text "La connexion a"
	line "échoué."
	done

_OakSpeechText1::
	text "Bien le bonjour!"
	line "Bienvenue dans le"
	cont "monde magique des"
	cont "#MON!"

	para "Mon nom est CHEN!"
	line "Les gens souvent"
	cont "m'appellent le"
	cont "PROF #MON!"
	prompt

_OakSpeechText2A::
	text "Ce monde est"
	line "peuplé de"
	cont "créatures du nom"
	cont "de #MON!@"
	text_end

_OakSpeechText2B::
	text_start

	para "Pour certains,"
	line "les #MON sont"
	cont "des animaux"
	cont "domestiques, pour"
	cont "d'autres, ils"
	cont "sont un moyen de"
	cont "combattre."

	para "Pour ma part..."

	para "L'étude des"
	line "#MON est"
	cont "ma profession."
	prompt

_IntroducePlayerText::
	text "Tout d'abord,"
	line "quel est ton nom?"
	prompt

_IntroduceRivalText::
	text "Voici mon petit-"
	line "fils. Il est ton"
	cont "rival depuis sa"
	cont "toute jeunesse."

	para "...Heu..."
	line "C'est quoi donc"
	cont "son nom déjà?"
	prompt

_OakSpeechText3::
	text "<PLAYER>!"

	para "Ta quête des"
	line "#MON est sur"
	cont "le point de"
	cont "commencer!"

	para "Un tout nouveau"
	line "monde de rêves,"
	cont "d'aventures et"
	cont "de #MON"
	cont "t'attend! Dingue!"
	done

_BoyGirlText:: ; joenote - add female player
	text "Es-tu un garçon"
	line "ou une fille?"
	done

_DoYouWantToNicknameText::
	text "Voulez-vous"
	line "donner un surnom"
	cont "à @"
	text_ram wNameBuffer
	text "?"
	done

_YourNameIsText::
	text "OK! Ton nom est"
	line "donc <PLAYER>!"
	prompt

_HisNameIsText::
	text "Ah oui! Je me"
	line "souviens! Son nom"
	cont "est <RIVAL>!"
	prompt

_WillBeTradedText::
	text_ram wNameOfPlayerMonToBeTraded
	text " et"
	line "@"
	text_ram wNameBuffer
	text " seront"
	cont "échangés."
	done

_TextIDErrorText::
	text_decimal hTextID,1,2
	text " ERREUR."
	done

_ContCharText::
	text "<_CONT>@"
	text_end

_TMItContainsText:: ; marcelnote - new for TM printing
	text "Elle contient:"
	line "@"
	text_ram wStringBuffer
	text "."
	done