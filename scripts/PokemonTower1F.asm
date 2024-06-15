PokemonTower1F_Script:
	jp EnableAutoTextBoxDrawing

PokemonTower1F_TextPointers:
	def_text_pointers
	dw_const PokemonTower1FReceptionistText,    TEXT_POKEMONTOWER1F_RECEPTIONIST
	dw_const PokemonTower1FMiddleAgedWomanText, TEXT_POKEMONTOWER1F_MIDDLE_AGED_WOMAN
	dw_const PokemonTower1FBaldingGuyText,      TEXT_POKEMONTOWER1F_BALDING_GUY
	dw_const PokemonTower1FGirlText,            TEXT_POKEMONTOWER1F_GIRL
	dw_const PokemonTower1FChannelerText,       TEXT_POKEMONTOWER1F_CHANNELER
	dw_const PokemonTower1FLittleBoyText,       TEXT_POKEMONTOWER1F_LITTLE_BOY   ; marcelnote - added 7FChanneler
	dw_const PokemonTower1FAgathaText,          TEXT_POKEMONTOWER1F_AGATHA       ; marcelnote - postgame Agatha
	dw_const PickUpItemText,                    TEXT_POKEMONTOWER1F_TM_HEX       ; marcelnote - testing

PokemonTower1FReceptionistText:
	text_far _PokemonTower1FReceptionistText
	text_end

PokemonTower1FMiddleAgedWomanText:
	text_far _PokemonTower1FMiddleAgedWomanText
	text_end

PokemonTower1FBaldingGuyText:
	text_far _PokemonTower1FBaldingGuyText
	text_end

PokemonTower1FGirlText:
	text_far _PokemonTower1FGirlText
	text_end

PokemonTower1FChannelerText:
	text_far _PokemonTower1FChannelerText
	text_end

PokemonTower1FLittleBoyText:   ; marcelnote - added 7FChanneler
	text_far _PokemonTower1FLittleBoyText
	text_end

PokemonTower1FAgathaText: ; marcelnote - postgame Agatha
	text_asm
	ld hl, .text
	call PrintText
	call GBFadeOutToBlack
	ld a, HS_POKEMON_TOWER_1F_AGATHA
	ld [wMissableObjectIndex], a
	predef HideObject
	call UpdateSprites
	call Delay3
	SetEvent EVENT_POSTGAME_AGATHA
	CheckBothEventsSet EVENT_POSTGAME_LORELEI, EVENT_POSTGAME_BRUNO ; sets Z flag when events are set
	jr nz, .end
	CheckBothEventsSet EVENT_POSTGAME_LANCE, EVENT_POSTGAME_RIVAL
	jr nz, .end
	ld a, HS_INDIGO_PLATEAU_LOBBY_GIRL1 ; marcelnote - remove girl from E4 entrance
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_INDIGO_PLATEAU_LOBBY_GIRL2 ; marcelnote - remove girl from E4 entrance
	ld [wMissableObjectIndex], a
	predef HideObject
.end
	call GBFadeInFromBlack
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.text
	text_far _PokemonTower1FAgathaText
	text_end
