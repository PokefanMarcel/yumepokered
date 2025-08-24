TrainerInfoTextBoxTileGraphics:  INCBIN "gfx/trainer_card/trainer_info.2bpp"
TrainerInfoTextBoxTileGraphicsEnd:

; marcelnote - for printing leader names in Trainer card`
IF DEF(_FRA)
	LeaderNumbersNamesGraphics:  INCBIN "translation/fra/gfx/leader_numbers_names.2bpp"
ELSE
	LeaderNumbersNamesGraphics:  INCBIN "gfx/trainer_card/leader_numbers_names.2bpp"
ENDC
