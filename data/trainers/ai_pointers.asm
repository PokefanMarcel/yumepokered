TrainerAIPointers:
	table_width 3, TrainerAIPointers
	; one entry per trainer class
	; first byte, number of times (per Pokémon) it can occur
	; next two bytes, pointer to AI subroutine for trainer class
	; subroutines are defined in engine/battle/trainer_ai.asm
	; marcelnote - this is just for Item use, for moves check TrainerClassMoveChoiceModifications
	dbw 3, GenericAI      ; Youngster
	dbw 3, GenericAI      ; Bug Catcher
	dbw 3, GenericAI      ; Lass
	dbw 3, GenericAI      ; Sailor
	dbw 3, JrTrainerAI    ; JrTrainerM     ; 25% chance of Potion if HP < 1/5 HPMax
	dbw 3, JrTrainerAI    ; JrTrainerF     ; 25% chance of Potion if HP < 1/5 HPMax
	dbw 3, GenericAI      ; Pokemaniac
	dbw 3, GenericAI      ; Supernerd
	dbw 3, GenericAI      ; Hiker
	dbw 3, BikerAI        ; Biker     ; 13% chance of XSpeed
	dbw 3, GenericAI      ; Burglar
	dbw 3, EngineerAI     ; Engineer  ; 13% chance of XDefend
	dbw 3, GenericAI      ; Fisher
	dbw 3, GenericAI      ; Swimmer
	dbw 3, GenericAI      ; Cue Ball
	dbw 3, GenericAI      ; Gambler
	dbw 3, GenericAI      ; Beauty
	dbw 3, PsychicAI      ; Psychic   ; 13% chance of XSpecial
	dbw 3, GenericAI      ; Rocker
	dbw 3, JugglerAI      ; Juggler   ; 25% chance to switch Mon
	dbw 3, TamerAI        ; Tamer     ; 13% chance of XAccuracy
	dbw 3, GenericAI      ; Bird Keeper
	dbw 2, BlackbeltAI    ; Blackbelt ; 13% chance of XAttack
	dbw 3, GenericAI      ; Rival1
	dbw 1, Rival3AI       ; Prof.Oak  ; marcelnote - was 3, GenericAI
	dbw 1, GenericAI      ; Chief
	dbw 3, GenericAI      ; Scientist
	dbw 1, GiovanniAI     ; Giovanni  ; 25% chance of GuardSpec and 13% chance of XSpecial
	dbw 3, GenericAI      ; Rocket
	dbw 2, CooltrainerMAI ; CooltrainerM  ; 25% chance of XAttack
	dbw 1, CooltrainerFAI ; CooltrainerF  ; 25% chance of Hyper Potion if HP<1/10HPMax, else 25% chance to switch if HP<1/5HPMax
	dbw 2, BrunoAI        ; Bruno     ; 50% chance of Hyper Potion if HP < 1/3 HPMax, else 25% of Dire Hit
	dbw 5, BrockAI        ; Brock     ; Full Heal if status condition
	dbw 1, MistyAI        ; Misty     ; 25% chance of XDefend
	dbw 1, LtSurgeAI      ; Lt.Surge  ; 25% chance of XSpeed
	dbw 1, ErikaAI        ; Erika     ; 50% chance of Super Potion if HP < 1/5 HPMax
	dbw 2, KogaAI         ; Koga      ; 25% chance of XAttack
	dbw 1, BlaineAI       ; Blaine    ; 50% chance of Hyper Potion if HP < 1/5 HPMax
	dbw 1, SabrinaAI      ; Sabrina   ; 50% chance of Hyper Potion if HP < 1/5 HPMax
	dbw 3, GenericAI      ; Gentleman
	dbw 1, Rival2AI       ; Rival2    ; 25% chance of Potion if HP < 1/5 HPMax
	dbw 1, Rival3AI       ; Rival3    ; 50% chance of Full Restore if HP < 1/3 HPMax, otherwise 25% if status condition
	dbw 1, LoreleiAI      ; Lorelei   ; 50% chance of Hyper Potion if HP < 1/3 HPMax
	dbw 3, GenericAI      ; Channeler
	dbw 2, AgathaAI       ; Agatha    ; 8% chance to switch, 42% chance of Hyper Potion if HP < 1/4 HPMax
	dbw 1, LanceAI        ; Lance     ; 50% chance of Hyper Potion if HP < 1/3 HPMax, otherwise 25% of Full Heal if status condition
	dbw 1, Rival3AI       ; Yellow ; marcelnote - new trainer class
	dbw 2, LoreleiAI      ; Will   ; marcelnote - new trainer class
	dbw 3, GenericAI      ; Red    ; marcelnote - new trainer class
	dbw 3, GenericAI      ; Green  ; marcelnote - new trainer class
	assert_table_length NUM_TRAINERS
