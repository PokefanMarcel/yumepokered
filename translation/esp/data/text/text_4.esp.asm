_PokemartGreetingText::
	text "¡Hola! ¿Puedo"
	next "ayudarte en algo?"
	done

_PokemonFaintedText::
	text "¡@"
	text_ram wNameBuffer
	text_start
	line "debilitado!"
	done

_PlayerBlackedOutText::
	text "¡<PLAYER> no"
	line "tiene más #MON"
	cont "que poder usar!"

	para "¡<PLAYER> se"
	line "desmayó!"
	prompt

_RepelWoreOffText::
	text "El efecto del"
	line "REPELENTE"
	cont "se agotó."
	done

_RepelUseAnotherText:: ; marcelnote - added prompt to reuse repel
	text "Use another?"
	done

; TODO - Spanish translation
_PokeBeeperAlertText:: ; marcelnote - new for PokéBeeper
	text "A message on the"
	line "# BEEPER!"

	para "The BOX has space"
	line "for just @"
	text_decimal wStringBuffer, 1, 2
	text " more"
	cont "#MON."

	para "Change it soon at"
	line "a #MON CENTER!"
	done

; TODO - Spanish translation
_PokeBeeperAlertFullText:: ; marcelnote - new for PokéBeeper
	text "A message on the"
	line "# BEEPER."

	para "The BOX is full!"
	line "Better find a"
	cont "PC fast!"
	done

_PokemartBuyingGreetingText::
	text "No hay prisa."
	done

_PokemartTellBuyPriceText::
	text "¿@"
	text_ram wStringBuffer
	text "?"
	line "Eso te costará"
	cont "@"
	text_bcd hMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "¥. ¿OK?"
	done

_PokemartBoughtItemText::
	text "¡Aquí tienes!"
	line "¡Gracias!"
	prompt

_PokemartNotEnoughMoneyText::
	text "No tienes"
	line "tanto dinero."
	prompt

_PokemartItemBagFullText::
	text "No puedes llevar"
	line "más objetos."
	prompt

_PokemonSellingGreetingText::
	text "¿Qué te gustaría"
	line "vender?"
	done

_PokemartTellSellPriceText::
	text "Puedo pagarte"
	line "@"
	text_bcd hMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "¥ por eso."
	done

_PokemartItemBagEmptyText::
	text "No tienes nada"
	line "que vender."
	prompt

_PokemartUnsellableItemText::
	text "No puedo ponerle"
	line "precio a eso."
	prompt

_PokemartThankYouText::
	text "¡Gracias!"
	done

_PokemartAnythingElseText::
	text "¿Necesitas"
	line "algo más?"
	done

_LearnedMove1Text::
	text "¡@"
	text_ram wLearnMoveMonName
	text_start
	line "aprendió"
	cont "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_CanUseMoveText:: ; marcelnote - for temporary field moves
	text_ram wLearnMoveMonName
	text " can use"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_WhichMoveToForgetText::
	text "¿Qué ataque"
	next "debería olvidar?"
	done

_AbandonLearningText::
	text "¿Anular aprender"
	line "@"
	text_ram wStringBuffer
	text "?"
	done

_DidNotLearnText::
	text "¡@"
	text_ram wLearnMoveMonName
	text_start
	line "no aprendió"
	cont "@"
	text_ram wStringBuffer
	text "!"
	prompt

_TryingToLearnText::
	text "¡@"
	text_ram wLearnMoveMonName
	text_start
	line "intenta aprender"
	cont "@"
	text_ram wStringBuffer
	text "!"

	para "¡Pero @"
	text_ram wLearnMoveMonName
	text_start
	line "no puede aprender"
	cont "más de 4 ataques!"

	para "¿Borrar un ataque"
	line "anterior para"
	cont "hacer sitio a"
	cont "@"
	text_ram wStringBuffer
	text "?"
	done

_OneTwoAndText::
	text "1, 2 y...@"
	text_end

_PoofText::
	text " ¡Puf!@"
	text_end

_ForgotAndText::
	text_start

	para "¡@"
	text_ram wLearnMoveMonName
	text " olvidó"
	line "@"
	text_ram wNameBuffer
	text "!"

	para "Y..."
	prompt

_HMCantDeleteText::
	text "¡Los ataques de"
	line "la MO no pueden"
	cont "ser borrados!"
	prompt

_PokemonCenterWelcomeText::
	text "¡Bienvenido a"
	line "nuestro CENTRO"
	cont "#MON!"

	para "¡Nosotros curamos"
	line "a tus #MON!"
	prompt

_PokemonCenterPerfectHealthText:: ; marcelnote - broke down WelcomeText to skip this
	text "We heal your"
	line "#MON back to"
	cont "perfect health!"
	prompt

_ShallWeHealYourPokemonText::
	text "¿Quieres que"
	line "curemos a tus"
	cont "#MON?"
	done

_NeedYourPokemonText::
	text "MUY BIEN. Déjame"
	line "tus #MON."
	done

_PokemonFightingFitText::
	text "¡Gracias! ¡Tus"
	line "#MON están"
	cont "en plena forma!"
	prompt

_PokemonCenterFarewellText::
	text "¡Vuelve siempre"
	line "que quieras!"
	done

_CableClubNPCAreaReservedFor2FriendsLinkedByCableText::
	text "Esta zona está"
	line "reservada para 2"
	cont "amigos conectados"
	cont "por cable."
	done

_CableClubNPCWelcomeText::
	text "¡Bienvenidos al"
	line "Club del Cable!"
	done

_CableClubNPCPleaseApplyHereHaveToSaveText::
	text "Por favor rellena"
	line "el formulario."

	para "Antes de abrir el"
	line "enlace hay que"
	cont "guardar el juego."
	done

_CableClubNPCPleaseWaitText::
	text "Por favor espera.@"
	text_end

_CableClubNPCLinkClosedBecauseOfInactivityText::
	vc_patch Change_link_closed_inactivity_message
IF DEF(_RED_VC) || DEF(_BLUE_VC)
	text "¡Vuelve otra vez"
	line "cuando quieras!"
	done
	db "<NULL>tividad."
ELSE
	text "El enlace ha sido"
	line "cerrado por"
	cont "inactividad."
ENDC
	vc_patch_end

	para "¡Habla con tu"
	line "amigo y vuelve"
	cont "otra vez!"
	done
