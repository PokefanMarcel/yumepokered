_CableClubNPCPleaseComeAgainText::
	text "¡Vuelve otra vez"
	line "cuando quieras!"
	done

_CableClubNPCMakingPreparationsText::
	text "Estamos haciendo"
	line "los preparativos."
	cont "Espera por favor."
	done

; TODO - Spanish translation
_CableClubNPCNewMovesNotAllowedText:: ; marcelnote - ban new moves from Cable Club
	text "I'm sorry. #MON"
	line "with the moves"
	cont "ELECTRO BALL, HEX"
	cont "or WILL-O-WISP"
	cont "cannot enter the"
	cont "Cable Club."
	prompt
	; "BOLA VOLTIO"  ; marcelnote - new move
	; "FUEGO FATUO"  ; marcelnote - new move
	; "INFORTUNIO"   ; marcelnote - new move

_UsedStrengthText::
	text_ram wNameBuffer
	text " usó"
	line "la FUERZA.@"
	text_end

_CanMoveBouldersText::
	text_ram wNameBuffer
	text_start
	line "mueve rocas."
	prompt

_CurrentTooFastText::
	text "¡La corriente es"
	line "demasiado rápida!"
	prompt

_CurrentTooFastOverworldText:: ; marcelnote - HM overworld use
	text "The current is"
	line "too fast to SURF!"
	done

_CyclingIsFunText::
	text "¡Pedalear es"
	line "genial! ¡Olvida"
	cont "el SURF!"
	prompt

_CyclingIsFunOverworldText:: ; marcelnote - HM overworld use
	text "Cycling is fun!"
	line "Forget SURFing!"
	done

_FlashLightsAreaText::
	text "¡Un cegador"
	line "DESTELLO iluminó"
	cont "la zona!"
	prompt

_WarpToLastPokemonCenterText::
	text "Vuelve al último"
	line "CENTRO #MON."
	done

_GoHomeConfirmText:: ; marcelnote - option to Go Home
	text "Are you sure you"
	line "want to go back"
	cont "to PALLET TOWN?"
	done

_CannotUseTeleportNowText::
	text_ram wNameBuffer
	text " no"
	line "puede usar ahora"
	cont "el teletransporte."
	prompt

_CannotFlyHereText::
	text_ram wNameBuffer
	text " no"
	line "puede VOLAR aquí."
	prompt

_NotHealthyEnoughText::
	text "No está lo"
	line "bastante sano."
	prompt

_NewBadgeRequiredText::
	text "¡No! ¡Se requiere"
	line "una nueva"
	cont "MEDALLA!"
	prompt

_CannotUseItemsHereText::
	text "No puedes usar"
	line "objetos aquí."
	prompt

_CannotGetOffHereText::
	text "No puedes bajarte"
	line "aquí."
	prompt

_ItemWasAssignedToSelectText:: ; marcelnote - use items with Select
	text_ram wStringBuffer
	text " was"
	line "assigned."
	prompt

_GotMonText::
	text "¡<PLAYER> obtiene"
	line "@"
	text_ram wNameBuffer
	text "!@"
	text_end

_SentToBoxText::
	text "¡No tienes sitio"
	line "para más #MON!"
	cont "¡@"
	text_ram wBoxMonNicks
	text_start
	cont "fue enviado a la"
	cont "CAJA #MON"
	cont "@"
	text_ram wStringBuffer
	text " del PC!"
	done

_BoxIsFullText::
	text "¡No tienes sitio"
	line "para más #MON!"

	para "¡La CAJA #MON"
	line "está llena y no"
	cont "caben más!"

	para "¡Cambia la CAJA"
	line "en un CENTRO"
	cont "#MON!"
	done
