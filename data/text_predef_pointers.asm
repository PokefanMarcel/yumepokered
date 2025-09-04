MACRO add_tx_pre
\1_id::
	dw \1
ENDM

TextPredefs::
	; marcelnote - removed Pokecenter bench guys who now have sprites
	add_tx_pre CardKeySuccessText                   ; 01
	add_tx_pre CardKeyFailText                      ; 02
	add_tx_pre CardKeyNeedsUpdateText               ; 02bis ; marcelnote - added for SilphFactory2F
	add_tx_pre RedBedroomPCText                     ; 03
;	add_tx_pre RedBedroomSNESText                   ; 04
	add_tx_pre PushStartText                        ; 05
	add_tx_pre SaveOptionText                       ; 06
	add_tx_pre StrengthsAndWeaknessesText           ; 07
	add_tx_pre OakLabEmailText                      ; 08
	add_tx_pre AerodactylFossilText                 ; 09
	add_tx_pre Route11GateLeftBinocularsSnorlaxText   ; 0A ; marcelnote - binoculars now hidden objects
	add_tx_pre Route11GateLeftBinocularsNoSnorlaxText ; 0A ; marcelnote - binoculars now hidden objects
	add_tx_pre Route11GateRightBinocularsText       ; 0A ; marcelnote - binoculars now hidden objects
	add_tx_pre Route12GateLeftBinocularsText        ; 0A ; marcelnote - binoculars now hidden objects
	add_tx_pre Route12GateRightBinocularsText       ; 0A ; marcelnote - binoculars now hidden objects
	add_tx_pre Route15GateLeftBinocularsText        ; 0A
	add_tx_pre Route15GateRightBinocularsText       ; 0A ; marcelnote - binoculars now hidden objects
	add_tx_pre Route16GateLeftBinocularsText        ; 0A ; marcelnote - binoculars now hidden objects
	add_tx_pre Route16GateRightBinocularsText       ; 0A ; marcelnote - binoculars now hidden objects
	add_tx_pre Route18GateLeftBinocularsText        ; 0A ; marcelnote - binoculars now hidden objects
	add_tx_pre Route18GateRightBinocularsText       ; 0A ; marcelnote - binoculars now hidden objects
	add_tx_pre Route22GateLeftBinocularsText        ; 0A ; marcelnote - binoculars now hidden objects
	add_tx_pre Route22GateRightBinocularsText       ; 0A ; marcelnote - binoculars now hidden objects
	add_tx_pre KabutopsFossilText                   ; 0B
	add_tx_pre GymStatueText1                       ; 0C
	add_tx_pre GymStatueText2                       ; 0D
	add_tx_pre GymStatueText3                       ; 0E ; marcelnote - added for Yellow
;	add_tx_pre BookcaseText                         ; 0E ; marcelnote - already handled by BookOrSculptureText
;	add_tx_pre UnusedPredefText                     ; 1E XXX unused ; marcelnote - commented out
	add_tx_pre PokemonCenterPCText                  ; 1F
	add_tx_pre ViridianSchoolNotebook               ; 20
	add_tx_pre ViridianSchoolBlackboard             ; 21
	add_tx_pre JustAMomentText                      ; 22
	add_tx_pre OpenBillsPCText                      ; 23
	add_tx_pre FoundHiddenItemText                  ; 24
	add_tx_pre HiddenItemBagFullText                ; 25 XXX unused
	add_tx_pre VermilionGymTrashText                ; 26
;	add_tx_pre IndigoPlateauHQText                  ; 27
	add_tx_pre GameCornerOutOfOrderText             ; 28
	add_tx_pre GameCornerOutToLunchText             ; 29
	add_tx_pre GameCornerSomeonesKeysText           ; 2A
	add_tx_pre FoundHiddenCoinsText                 ; 2B
	add_tx_pre DroppedHiddenCoinsText               ; 2C
	add_tx_pre BillsHouseMonitorText                ; 2D
	add_tx_pre BillsHouseInitiatedText              ; 2E
	add_tx_pre BillsHousePokemonList                ; 2F
	add_tx_pre MagazinesText                        ; 30
	add_tx_pre CinnabarGymQuiz                      ; 31
	add_tx_pre GameCornerNoCoinsText                ; 32
	add_tx_pre GameCornerCoinCaseText               ; 33
	add_tx_pre LinkCableHelp                        ; 34
	add_tx_pre TMNotebook                           ; 35
	add_tx_pre FightingDojoText                     ; 36
	add_tx_pre EnemiesOnEverySideText               ; 37
	add_tx_pre WhatGoesAroundComesAroundText        ; 38
	add_tx_pre NewBicycleText                       ; 39
	add_tx_pre NewSurfboardText                     ; 39bis ; marcelnote - new for Mandarin Surf Shop
	add_tx_pre IndigoPlateauStatues                 ; 3A
	add_tx_pre VermilionGymTrashSuccessText1        ; 3B
	add_tx_pre VermilionGymTrashSuccessText2        ; 3C XXX unused
	add_tx_pre VermilionGymTrashSuccessText3        ; 3D
	add_tx_pre VermilionGymTrashFailText            ; 3E
	add_tx_pre TownMapText                          ; 3F
	add_tx_pre BookOrSculptureText                  ; 40
	add_tx_pre ElevatorText                         ; 41
	add_tx_pre PokemonStuffText                     ; 42
	add_tx_pre HotSnacksText                        ; marcelnote - new for Marts
	add_tx_pre ColdDrinksText                       ; marcelnote - new for Marts
	add_tx_pre HolidayBrochuresText                 ; marcelnote - new for Safari Rest houses
	add_tx_pre LiveWaterText                        ; marcelnote - new for Power Plant
	add_tx_pre CeladonMart3FRPGText                 ; marcelnote - new for Celadon Mart 3F
	add_tx_pre CeladonMart3FSportsGameText          ; marcelnote - new for Celadon Mart 3F
	add_tx_pre CeladonMart3FPuzzleGameText          ; marcelnote - new for Celadon Mart 3F
	add_tx_pre CeladonMart3FFightingGameText        ; marcelnote - new for Celadon Mart 3F
	add_tx_pre MonCouldSurfText                     ; 43 ; marcelnote - HM overworld use
	add_tx_pre WantToSurfText                       ; 44 ; marcelnote - HM overworld use
	add_tx_pre CyclingIsFunOverworldText            ; 45 ; marcelnote - HM overworld use
	add_tx_pre CurrentTooFastOverworldText          ; 46 ; marcelnote - HM overworld use
	add_tx_pre TreeCanBeCutText                     ; 47 ; marcelnote - HM overworld use
	add_tx_pre WantToCutText                        ; 48 ; marcelnote - HM overworld use
	add_tx_pre UsedCutText                          ; 49 : marcelnote - HM overworld use
	add_tx_pre UsedFlashText                        ; 50 : marcelnote - HM overworld use
	add_tx_pre ThisRequiresStrengthText             ; 51 ; marcelnote - HM overworld use
	add_tx_pre WantToStrengthText                   ; 51 ; marcelnote - HM overworld use
	add_tx_pre CanMoveBouldersText                  ; 52 ; marcelnote - HM overworld use

