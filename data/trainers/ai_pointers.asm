TrainerAIPointers:
	table_width 3
	; one entry per trainer class
	; first byte, number of times (per Pokémon) it can occur
	; next two bytes, pointer to AI subroutine for trainer class
	; subroutines are defined in engine/battle/trainer_ai.asm
	; marcelnote - this is just for Item use, for moves check TrainerClassMoveChoiceModifications
	dbw 3, GenericAI      ; YOUNGSTER
	dbw 3, GenericAI      ; BUG_CATCHER
	dbw 3, GenericAI      ; LASS
	dbw 3, GenericAI      ; SAILOR
	dbw 1, JrTrainerAI    ; JR_TRAINER_M     ; 25% chance of Potion if HP < 1/5 HPMax
	dbw 1, JrTrainerAI    ; JR_TRAINER_F     ; 25% chance of Potion if HP < 1/5 HPMax
	dbw 3, GenericAI      ; POKEMANIAC
	dbw 3, GenericAI      ; SUPER_NERD
	dbw 3, GenericAI      ; HIKER
	dbw 1, BikerAI        ; BIKER      ; 13% chance of XSpeed
	dbw 3, GenericAI      ; BURGLAR
	dbw 1, EngineerAI     ; ENGINEER   ; 13% chance of XDefend
	dbw 3, GenericAI      ; FISHER
	dbw 3, GenericAI      ; SWIMMER
	dbw 3, GenericAI      ; CUE_BALL
	dbw 3, GenericAI      ; GAMBLER
	dbw 3, GenericAI      ; BEAUTY
	dbw 1, PsychicAI      ; PSYCHIC_TR ; 13% chance of XSpecial
	dbw 3, GenericAI      ; ROCKER
	dbw 3, JugglerAI      ; JUGGLER    ; 25% chance to switch Mon
	dbw 1, TamerAI        ; TAMER      ; 13% chance of XAccuracy
	dbw 3, GenericAI      ; BIRD_KEEPER
	dbw 1, BlackbeltAI    ; BLACKBELT  ; 13% chance of XAttack, was 2
	dbw 3, GenericAI      ; RIVAL1
	dbw 1, Rival3AI       ; PROF_OAK   ; marcelnote - was 3, GenericAI
	dbw 1, GenericAI      ; CHIEF
	dbw 3, GenericAI      ; SCIENTIST
	dbw 1, GiovanniAI     ; GIOVANNI  ; 25% chance of GuardSpec and 13% chance of XSpecial
	dbw 3, GenericAI      ; ROCKET
	dbw 2, CooltrainerMAI ; COOLTRAINER_M ; 25% chance of XAttack
	dbw 1, CooltrainerFAI ; COOLTRAINER_F ; 25% chance of Hyper Potion if HP<1/10HPMax, else 25% chance to switch if HP<1/5HPMax
	dbw 2, BrunoAI        ; BRUNO     ; 50% chance of Hyper Potion if HP < 1/3 HPMax, else 25% of Dire Hit
	dbw 5, BrockAI        ; BROCK     ; Full Heal if status condition
	dbw 1, MistyAI        ; MISTY     ; 25% chance of XDefend
	dbw 1, LtSurgeAI      ; LT_SURGE  ; 25% chance of XSpeed
	dbw 1, ErikaAI        ; ERIKA     ; 50% chance of Super Potion if HP < 1/5 HPMax
	dbw 2, KogaAI         ; KOGA      ; 25% chance of XAttack
	dbw 1, BlaineAI       ; BLAINE    ; 50% chance of Hyper Potion if HP < 1/5 HPMax
	dbw 1, SabrinaAI      ; SABRINA   ; 50% chance of Hyper Potion if HP < 1/5 HPMax
	dbw 3, GenericAI      ; GENTLEMAN
	dbw 1, Rival2AI       ; RIVAL2    ; 25% chance of Potion if HP < 1/5 HPMax
	dbw 1, Rival3AI       ; RIVAL3    ; 50% chance of Full Restore if HP < 1/3 HPMax, otherwise 25% if status condition
	dbw 1, LoreleiAI      ; LORELEI   ; 50% chance of Hyper Potion if HP < 1/3 HPMax
	dbw 3, GenericAI      ; CHANNELER
	dbw 1, AgathaAI       ; AGATHA    ; 8% chance to switch, 42% chance of Hyper Potion if HP < 1/4 HPMax
	dbw 1, LanceAI        ; LANCE     ; 50% chance of Hyper Potion if HP < 1/3 HPMax, otherwise 25% of Full Heal if status condition
	dbw 1, Rival3AI       ; YELLOW ; marcelnote - new trainer class
	dbw 1, LoreleiAI      ; WILL   ; marcelnote - new trainer class
	dbw 3, GenericAI      ; RED    ; marcelnote - new trainer class
	dbw 3, GenericAI      ; GREEN  ; marcelnote - new trainer class
	assert_table_length NUM_TRAINERS
