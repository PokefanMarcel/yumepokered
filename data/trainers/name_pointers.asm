TrainerNamePointers:
; These are only used for trainers' defeat speeches.
; They were originally shortened variants of the trainer class names
; in the Japanese versions, but are now redundant with TrainerNames.
	table_width 2
	dw .YoungsterName
	dw .BugCatcherName
	dw .LassName
	dw wTrainerName
	dw .JrTrainerMName
	dw .JrTrainerFName
	dw .PokemaniacName
	dw .SuperNerdName
	dw wTrainerName
	dw wTrainerName
	dw .BurglarName
	dw .EngineerName
	dw wTrainerName
	dw .SwimmerName
	dw wTrainerName
	dw wTrainerName
	dw .BeautyName
	dw wTrainerName
	dw .RockerName
	dw .JugglerName
	dw wTrainerName
	dw wTrainerName
	dw .BlackbeltName
	dw wTrainerName
	dw .ProfOakName ; marcelnote - could this be replaced by wTrainerName?
	dw .ChiefName
	dw .ScientistName
	dw wTrainerName
	dw .RocketName
	dw .CooltrainerMName
	dw .CooltrainerFName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName ; Yellow ; marcelnote - new trainer class
	dw wTrainerName ; Will   ; marcelnote - new trainer class
	dw wTrainerName ; Red    ; marcelnote - new trainer class
	dw wTrainerName ; Green  ; marcelnote - new trainer class
	assert_table_length NUM_TRAINERS

.YoungsterName:     db "YOUNGSTER@"
.BugCatcherName:    db "BUG CATCHER@"
.LassName:          db "LASS@"
.JrTrainerMName:    db "JR.TRAINER♂@"
.JrTrainerFName:    db "JR.TRAINER♀@"
.PokemaniacName:    db "POKéMANIAC@"
.SuperNerdName:     db "SUPER NERD@"
.BurglarName:       db "BURGLAR@"
.EngineerName:      db "ENGINEER@"
.SwimmerName:       db "SWIMMER@"
.BeautyName:        db "BEAUTY@"
.RockerName:        db "ROCKER@"
.JugglerName:       db "JUGGLER@"
.BlackbeltName:     db "BLACKBELT@"
.ProfOakName:       db "PROF.OAK@"
.ChiefName:         db "CHIEF@"
.ScientistName:     db "SCIENTIST@"
.RocketName:        db "ROCKET@"
.CooltrainerMName:  db "COOLTRAINER♂@"
.CooltrainerFName:  db "COOLTRAINER♀@"
