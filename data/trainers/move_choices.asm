DEF __move_choices__ = 0

MACRO move_choices
	IF _NARG
		db \# ; all args
	ENDC
	db 0 ; end
	DEF __move_choices__ += 1
ENDM

; move choice modification methods that are applied for each trainer class
TrainerClassMoveChoiceModifications: ; marcelnote - modified for new trainer AI
	move_choices            ; YOUNGSTER
	move_choices 1          ; BUG CATCHER
	move_choices 1          ; LASS
	move_choices 1, 3       ; SAILOR
	move_choices 1          ; JR_TRAINER_M
	move_choices 1          ; JR_TRAINER_F
	move_choices 1, 2, 3    ; POKEMANIAC
	move_choices 1, 2       ; SUPER_NERD
	move_choices 1          ; HIKER
	move_choices 1          ; BIKER
	move_choices 1, 3       ; BURGLAR
	move_choices 1, 3       ; ENGINEER
;	move_choices 1, 2       ; UNUSED_JUGGLER
	move_choices 1, 3       ; FISHER
	move_choices 1, 3       ; SWIMMER
	move_choices            ; CUE_BALL
	move_choices 1          ; GAMBLER
	move_choices 1, 3       ; BEAUTY
	move_choices 1, 2, 3    ; PSYCHIC_TR
	move_choices 1, 3       ; ROCKER
	move_choices 1, 3       ; JUGGLER
	move_choices 1, 3       ; TAMER
	move_choices 1, 3       ; BIRD_KEEPER
	move_choices 1, 3       ; BLACKBELT
	move_choices 1          ; RIVAL1
	move_choices 1, 3, 4    ; PROF_OAK
	move_choices 1, 2       ; CHIEF
	move_choices 1, 2, 3    ; SCIENTIST
	move_choices 1, 3, 4    ; GIOVANNI
	move_choices 1          ; ROCKET
	move_choices 1, 3       ; COOLTRAINER_M
	move_choices 1, 3       ; COOLTRAINER_F
	move_choices 1, 3, 4    ; BRUNO
	move_choices 1          ; BROCK
	move_choices 1, 3       ; MISTY
	move_choices 1, 3       ; LT_SURGE
	move_choices 1, 3       ; ERIKA
	move_choices 1, 3, 4    ; KOGA
	move_choices 1, 3, 4    ; BLAINE
	move_choices 1, 3, 4    ; SABRINA
	move_choices 1, 2       ; GENTLEMAN
	move_choices 1, 3       ; RIVAL2
	move_choices 1, 3, 4    ; RIVAL3
	move_choices 1, 2, 3, 4 ; LORELEI
	move_choices 1, 3       ; CHANNELER
	move_choices 1, 3, 4    ; AGATHA
	move_choices 1, 3, 4    ; LANCE
	move_choices 1, 3, 4    ; YELLOW ; marcelnote - new trainer class
	move_choices 1, 3, 4    ; WILL   ; marcelnote - new trainer class
	move_choices 1, 3, 4    ; RED    ; marcelnote - new trainer class
	move_choices 1, 3, 4    ; GREEN  ; marcelnote - new trainer class
	assert __move_choices__ == NUM_TRAINERS, \
		"TrainerClassMoveChoiceModifications: expected {d:NUM_TRAINERS} entries, got {d:__move_choices__}"
