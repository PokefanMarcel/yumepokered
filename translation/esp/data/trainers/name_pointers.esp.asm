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

.YoungsterName:     db "JOVEN@@"
.BugCatcherName:    db "CAZABICHOS@@"
.LassName:          db "CHICA@@"
.JrTrainerMName:    db "ENTRENAD.JR♂@@"
.JrTrainerFName:    db "ENTRENAD.JR♀@@"
.PokemaniacName:    db "POKéMANÍACO@@"
.SuperNerdName:     db "SÚPER NECIO@@"
.BurglarName:       db "LADRÓN@@"
.EngineerName:      db "MECÁNICO@@"
.SwimmerName:       db "NADADOR@@"
.BeautyName:        db "BELLA@@"
.RockerName:        db "ROCKERO@@"
.JugglerName:       db "MALABARISTA@@"
.BlackbeltName:     db "KARATEKA@@"
.ProfOakName:       db "PROF. OAK@@"
.ChiefName:         db "CHIEF@@"
.ScientistName:     db "CIENTÍFICO@@"
.RocketName:        db "ROCKET@@"
.CooltrainerMName:  db "ENTREN.GUAY♂@@"
.CooltrainerFName:  db "ENTREN.GUAY♀@@"
