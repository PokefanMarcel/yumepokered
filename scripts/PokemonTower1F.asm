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
