TrainerDataPointers:
	table_width 2, TrainerDataPointers
	dw YoungsterData
	dw BugCatcherData
	dw LassData
	dw SailorData
	dw JrTrainerMData
	dw JrTrainerFData
	dw PokemaniacData
	dw SuperNerdData
	dw HikerData
	dw BikerData
	dw BurglarData
	dw EngineerData
	dw FisherData
	dw SwimmerData
	dw CueBallData
	dw GamblerData
	dw BeautyData
	dw PsychicData
	dw RockerData
	dw JugglerData
	dw TamerData
	dw BirdKeeperData
	dw BlackbeltData
	dw Green1Data
	dw ProfOakData
	dw ChiefData
	dw ScientistData
	dw GiovanniData
	dw RocketData
	dw CooltrainerMData
	dw CooltrainerFData
	dw BrunoData
	dw BrockData
	dw MistyData
	dw LtSurgeData
	dw ErikaData
	dw KogaData
	dw BlaineData
	dw SabrinaData
	dw GentlemanData
	dw Green2Data
	dw Green3Data
	dw LoreleiData
	dw ChannelerData
	dw AgathaData
	dw LanceData
	dw YellowData  ; marcelnote - new trainer class
	assert_table_length NUM_TRAINERS

; if first byte != $FF, then
	; first byte is level (of all pokemon on this team)
	; all the next bytes are pokemon species
	; null-terminated
; if first byte == $FF, then
	; first byte is $FF (obviously)
	; every next two bytes are a level and species
	; null-terminated
; marcelnote - both types can have special moves (special_moves.asm)

YoungsterData:
; Route 3
	db 11, RATTATA, EKANS, 0
	db 14, SPEAROW, 0
; Mt. Moon 1F
	db 10, RATTATA, RATTATA, ZUBAT, 0
; Route 24
	db 14, RATTATA, EKANS, ZUBAT, 0
; Route 25
	db 15, RATTATA, SPEAROW, 0
	db 17, SLOWPOKE, 0
	db 14, EKANS, SANDSHREW, 0
; SS Anne 1F Rooms
	db 21, NIDORAN_M, 0
; Route 11
	db 21, EKANS, 0
	db 19, SANDSHREW, ZUBAT, 0
	db 17, RATTATA, RATTATA, RATICATE, 0
	db 18, NIDORAN_M, NIDORINO, 0
; Unused
	db 17, SPEAROW, RATTATA, RATTATA, SPEAROW, 0
; marcelnote - new trainers
; Route 11
	db 23, SANDSHREW, 0 ; based on A.J.

BugCatcherData:
; Viridian Forest
	db 6, WEEDLE, CATERPIE, 0
	db 7, WEEDLE, KAKUNA, WEEDLE, 0
	db 9, WEEDLE, 0
; Route 3
	db 10, CATERPIE, WEEDLE, CATERPIE, 0
	db 9, WEEDLE, KAKUNA, CATERPIE, METAPOD, 0
	db 11, CATERPIE, METAPOD, 0
; Mt. Moon 1F
	db 11, WEEDLE, KAKUNA, 0
	db 10, CATERPIE, METAPOD, CATERPIE, 0
; Route 24
	db 14, CATERPIE, WEEDLE, 0
; Route 6
	db 16, WEEDLE, CATERPIE, WEEDLE, 0
	db 20, BUTTERFREE, 0
; Unused
	db 18, METAPOD, CATERPIE, VENONAT, 0
; Route 9
	db 19, BEEDRILL, BEEDRILL, 0
	db 20, CATERPIE, WEEDLE, VENONAT, 0
; marcelnote - new trainers
; Viridian Forest
	db 8, METAPOD, PINSIR, 0 ; based on Samurai
; Celadon Grove
	db 24, VENONAT, BUTTERFREE, PARASECT, 0

LassData:
; Route 3
	db 9, PIDGEY, PIDGEY, 0
	db 10, RATTATA, NIDORAN_M, 0
	db 14, JIGGLYPUFF, 0
; Route 4
	db 31, PARAS, PARAS, PARASECT, 0
; Mt. Moon 1F
	db 11, ODDISH, BELLSPROUT, 0
	db 14, CLEFAIRY, 0
; Route 24
	db 16, PIDGEY, NIDORAN_F, 0
	db 14, PIDGEY, NIDORAN_F, 0
; Route 25
	db 15, NIDORAN_M, NIDORAN_F, 0
	db 13, ODDISH, PIDGEY, ODDISH, 0
; SS Anne 1F Rooms
	db 18, PIDGEY, NIDORAN_F, 0
; SS Anne 2F Rooms
	db 18, RATTATA, PIKACHU, 0
; Route 8
	db 23, NIDORAN_F, NIDORINA, 0
	db 24, MEOWTH, MEOWTH, MEOWTH, 0
	db 19, PIDGEY, RATTATA, NIDORAN_M, MEOWTH, PIKACHU, 0
	db 22, CLEFAIRY, CLEFAIRY, 0
; Celadon Gym
	db 23, BELLSPROUT, WEEPINBELL, 0
	db 23, ODDISH, GLOOM, 0
; Route 6 ; marcelnote - new trainers
	db 16, RATTATA, PARAS, POLIWAG, 0
; Orange Ferry Rooms    ; marcelnote - new location
	db 42, GLOOM, WIGGLYTUFF, 0

SailorData:
; SS Anne Stern
	db 18, MACHOP, SHELLDER, 0
	db 17, MACHOP, TENTACOOL, 0
; SS Anne B1F Rooms
	db 21, SHELLDER, 0
	db 17, HORSEA, SHELLDER, TENTACOOL, 0
	db 18, TENTACOOL, STARYU, 0
	db 17, HORSEA, HORSEA, HORSEA, 0
	db 20, MACHOP, 0
; Vermilion Gym
	db 21, PIKACHU, PIKACHU, 0
; Orange Ferry Outside ; marcelnote - new trainers
	db 43, SEADRA, MAGNETON, 0

JrTrainerMData:
; Pewter Gym
	db 11, DIGLETT, SANDSHREW, 0
; Route 24/Route 25
	db 14, RATTATA, EKANS, 0
; Route 24
	db 18, MANKEY, 0
; Route 6
	db 20, SQUIRTLE, 0
	db 16, SPEAROW, RATICATE, 0
; Unused
	db 18, DIGLETT, DIGLETT, SANDSHREW, 0
; Route 9
	db 21, GROWLITHE, CHARMANDER, 0
	db 19, RATTATA, DIGLETT, EKANS, SANDSHREW, 0
; Route 12
	db 29, NIDORAN_M, NIDORINO, 0

JrTrainerFData:
; Cerulean Gym
	db 19, POLIWAG, 0 ; marcelnote - changed from GOLDEEN since Misty now has it
; Route 6
	db 16, RATTATA, PIKACHU, 0
	db 16, PIDGEY, PIDGEY, PIDGEY, 0
; Unused
	db 22, BULBASAUR, 0
; Route 9
	db 18, ODDISH, BELLSPROUT, ODDISH, BELLSPROUT, 0
	db 23, MEOWTH, 0
; Route 10
	db 20, PIKACHU, CLEFAIRY, 0
	db 21, PIDGEY, PIDGEOTTO, 0
; Rock Tunnel B1F
	db 21, JIGGLYPUFF, PIDGEY, MEOWTH, 0
	db 22, ODDISH, BULBASAUR, 0
; Celadon Gym
	db 24, BULBASAUR, IVYSAUR, 0
; Route 13
	db 24, PIDGEY, MEOWTH, RATTATA, PIKACHU, MEOWTH, 0
	db 30, POLIWAG, POLIWAG, 0
	db 27, PIDGEY, MEOWTH, PIDGEY, PIDGEOTTO, 0
	db 28, GOLDEEN, POLIWAG, HORSEA, 0
; Route 20
	db 31, GOLDEEN, SEAKING, 0
; Rock Tunnel 1F
	db 22, BELLSPROUT, CLEFAIRY, 0
	db 20, MEOWTH, ODDISH, PIDGEY, 0
	db 19, PIDGEY, RATTATA, RATTATA, BELLSPROUT, 0
; Route 15
	db 28, GLOOM, ODDISH, ODDISH, 0
	db 29, PIKACHU, RAICHU, 0
	db 33, CLEFAIRY, 0
	db 29, BELLSPROUT, ODDISH, TANGELA, 0
; Route 20
	db 30, TENTACOOL, HORSEA, SEEL, 0

PokemaniacData:
; Route 10
	db 30, RHYHORN, LICKITUNG, 0
	db 20, CUBONE, SLOWPOKE, 0
; Rock Tunnel B1F
	db 20, SLOWPOKE, SLOWPOKE, SLOWPOKE, 0
	db 22, CHARMANDER, CUBONE, 0
	db 25, SLOWPOKE, 0
; Victory Road 2F
	db 40, CHARMELEON, LAPRAS, LICKITUNG, 0
; Rock Tunnel 1F
	db 23, CUBONE, SLOWPOKE, 0
; Celadon Grove   ; marcelnote - new location
	db 25, TANGELA, WARTORTLE, 0

SuperNerdData:
; Mt. Moon 1F
	db 11, MAGNEMITE, VOLTORB, 0
; Mt. Moon B2F
	db 12, GRIMER, VOLTORB, KOFFING, 0
; Route 8
	db 20, VOLTORB, KOFFING, VOLTORB, MAGNEMITE, 0
	db 22, GRIMER, MUK, GRIMER, 0
	db 26, KOFFING, 0
; Unused
	db 22, KOFFING, MAGNEMITE, WEEZING, 0
	db 20, MAGNEMITE, MAGNEMITE, KOFFING, MAGNEMITE, 0
	db 24, MAGNEMITE, VOLTORB, 0
; Cinnabar Gym
	;db 36, VULPIX, VULPIX, NINETALES, 0
	db 36, CHARMANDER, VULPIX, CHARMELEON, 0 ; marcelnote - replaces above for diversity
	db 34, PONYTA, CHARMANDER, VULPIX, GROWLITHE, 0
	db 41, RAPIDASH, 0
	db 37, GROWLITHE, VULPIX, 0

HikerData:
; Mt. Moon 1F
	db 10, GEODUDE, GEODUDE, ONIX, 0
; Route 25
	db 15, MACHOP, GEODUDE, 0
	db 13, GEODUDE, GEODUDE, MACHOP, GEODUDE, 0
	db 17, ONIX, 0
; Route 9
	db 21, GEODUDE, ONIX, 0
	db 20, GEODUDE, MACHOP, GEODUDE, 0
; Route 10
	db 21, GEODUDE, ONIX, 0
	db 19, ONIX, GRAVELER, 0
; Rock Tunnel B1F
	db 21, GEODUDE, GEODUDE, GRAVELER, 0
	db 25, GEODUDE, 0
; Route 9/Rock Tunnel B1F
	db 20, MACHOP, ONIX, 0
; Rock Tunnel 1F
	db 19, GEODUDE, MACHOP, GEODUDE, GEODUDE, 0
	db 20, ONIX, ONIX, GEODUDE, 0
	db 21, GEODUDE, GRAVELER, 0
; Cinnabar Volcano B1F   ; marcelnote - new location
	db 42, ONIX, MACHOKE, GOLEM, 0
; Orange Ferry Rooms    ; marcelnote - new location
	db 40, RHYHORN, PARASECT, GRAVELER, 0

BikerData:
; Route 13
	db 28, KOFFING, KOFFING, KOFFING, 0
; Route 14
	db 29, KOFFING, GRIMER, 0
; Route 15
	db 25, KOFFING, KOFFING, WEEZING, KOFFING, GRIMER, 0
	db 28, KOFFING, GRIMER, WEEZING, 0
; Route 16
	db 29, GRIMER, KOFFING, 0
	db 33, WEEZING, 0
	db 26, GRIMER, GRIMER, GRIMER, GRIMER, 0
; Route 17
	; From https://www.smogon.com/smog/issue27/glitch:
	; 0E:5FC2 is offset of the ending 0 for this first Biker on Route 17.
	; BaseStats + (BASE_DATA_SIZE) * (000 - 1) = $5FC2;
	; that's the formula from GetMonHeader for the base stats of mon #000.
	; (BaseStats = $43DE and BANK(BaseStats) = $0E.)
	; Finally, PokedexOrder lists 0 as the dex ID for every MissingNo.
	; The result is that this data gets interpreted as the base stats
	; for MissingNo: 0, 33, MUK, 0, 29, VOLTORB, VOLTORB, 0, ..., 28, GRIMER, GRIMER.
	db 28, WEEZING, KOFFING, WEEZING, 0
	db 33, MUK, 0
	db 29, VOLTORB, VOLTORB, 0
	db 29, WEEZING, MUK, 0
	db 25, KOFFING, WEEZING, KOFFING, KOFFING, WEEZING, 0
; Route 14
	db 26, KOFFING, KOFFING, GRIMER, KOFFING, 0
	db 28, GRIMER, GRIMER, KOFFING, 0
	db 29, KOFFING, MUK, 0

BurglarData:
; Unused
	db 29, GROWLITHE, VULPIX, 0
	db 33, GROWLITHE, 0
	db 28, VULPIX, CHARMANDER, PONYTA, 0
; Cinnabar Gym
	db 36, GROWLITHE, VULPIX, NINETALES, 0
	db 41, PONYTA, 0
	db 37, VULPIX, GROWLITHE, 0
; Mansion 2F
	db 34, CHARMANDER, CHARMELEON, 0
; Mansion 3F
	db 38, NINETALES, 0
; Mansion B1F
	db 34, GROWLITHE, PONYTA, 0
; Cinnabar Volcano 1F   ; marcelnote - new location
	db 39, CHARMELEON, RAPIDASH, 0

EngineerData:
; Unused
	db 21, VOLTORB, MAGNEMITE, 0
; Route 11
	db 21, MAGNEMITE, 0
	db 18, MAGNEMITE, MAGNEMITE, MAGNETON, 0
; marcelnote - new trainers
; Orange Ferry Outside
	db 41, VOLTORB, DUGTRIO, ELECTRODE, 0

FisherData:
; SS Anne 2F Rooms
	db 17, GOLDEEN, TENTACOOL, GOLDEEN, 0
; SS Anne B1F Rooms
	db 17, TENTACOOL, STARYU, SHELLDER, 0
; Route 12
	db 22, GOLDEEN, POLIWAG, GOLDEEN, 0
	db 24, TENTACOOL, GOLDEEN, 0
	db 27, GOLDEEN, 0
	db 21, POLIWAG, SHELLDER, GOLDEEN, HORSEA, 0
; Route 21
	db 28, SEAKING, GOLDEEN, SEAKING, SEAKING, 0
	db 31, SHELLDER, CLOYSTER, 0
	db 27, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP, 0
	db 33, SEAKING, GOLDEEN, 0
; Route 12
	db 24, MAGIKARP, MAGIKARP, 0
; marcelnote - new trainers
; Route 19
	db 31, SHELLDER, TENTACRUEL, 0
; Mandarin Hotel
	db 42, SEAKING, SEADRA, 0

SwimmerData:
; Cerulean Gym
	db 16, HORSEA, SHELLDER, 0
; Route 19
	db 30, TENTACOOL, SHELLDER, 0
	db 29, GOLDEEN, HORSEA, STARYU, 0
	db 30, POLIWAG, POLIWHIRL, 0
	db 27, HORSEA, TENTACOOL, TENTACOOL, GOLDEEN, 0
	db 29, GOLDEEN, SHELLDER, SEAKING, 0
	db 30, HORSEA, HORSEA, 0
	db 27, TENTACOOL, TENTACOOL, STARYU, HORSEA, TENTACRUEL, 0
; Route 20
	db 31, SHELLDER, CLOYSTER, 0
	db 35, STARYU, 0
	db 28, HORSEA, HORSEA, SEADRA, HORSEA, 0
; Route 21
	db 33, SEADRA, TENTACRUEL, 0
	db 37, STARMIE, 0
	db 33, STARYU, WARTORTLE, 0
	db 32, POLIWHIRL, TENTACOOL, SEADRA, 0

CueBallData:
; Route 16
	db 28, MACHOP, MANKEY, MACHOP, 0
	db 29, MANKEY, MACHOP, 0
	db 33, MACHOP, 0
; Route 17
	db 29, MANKEY, PRIMEAPE, 0
	db 29, MACHOP, MACHOKE, 0
	db 33, MACHOKE, 0
	db 26, MANKEY, MANKEY, MACHOKE, MACHOP, 0
	db 29, PRIMEAPE, MACHOKE, 0
; Route 21
	db 31, TENTACOOL, TENTACOOL, TENTACRUEL, 0

GamblerData:
; Route 11
	db 18, POLIWAG, HORSEA, 0
	db 18, BELLSPROUT, ODDISH, 0
	db 18, VOLTORB, MAGNEMITE, 0
	db 18, GROWLITHE, VULPIX, 0
; Route 8
	db 22, POLIWAG, POLIWAG, POLIWHIRL, 0
; Unused
	db 22, ONIX, GEODUDE, GRAVELER, 0
; Route 8
	db 24, GROWLITHE, VULPIX, 0
; marcelnote - new trainers
; Mandarin Hotel
	db 41, VULPIX, MAGNETON, WARTORTLE, 0

BeautyData:
; Celadon Gym
	db 21, ODDISH, BELLSPROUT, ODDISH, BELLSPROUT, 0
	db 24, BELLSPROUT, BELLSPROUT, 0
	db 26, EXEGGCUTE, 0
; Route 13
	db 27, RATTATA, PIKACHU, RATTATA, 0
	db 29, CLEFAIRY, MEOWTH, 0
; Route 20
	db 35, SEAKING, 0
	db 30, SHELLDER, SHELLDER, CLOYSTER, 0
	db 31, POLIWAG, SEAKING, 0
; Route 15
	db 29, PIDGEOTTO, WIGGLYTUFF, 0
	db 29, BULBASAUR, IVYSAUR, 0
; Unused
	db 33, WEEPINBELL, BELLSPROUT, WEEPINBELL, 0
; Route 19
	db 27, POLIWAG, GOLDEEN, SEAKING, GOLDEEN, POLIWAG, 0
	db 30, GOLDEEN, SEAKING, 0
	db 29, STARYU, STARYU, STARYU, 0
; Route 20
	db 30, SEADRA, HORSEA, SEADRA, 0
; marcelnote - new trainers
; Cinnabar Volcano 1F
	db 39, POLIWHIRL, WIGGLYTUFF, STARMIE, 0
; Route 19
	db 31, STARYU, SEEL, STARMIE, 0
; Orange Ferry Outside
	db 39, CLEFAIRY, WEEPINBELL, SEAKING, VILEPLUME, 0

PsychicData:
; Saffron Gym
	db 31, KADABRA, SLOWPOKE, MR_MIME, KADABRA, 0
	db 34, MR_MIME, KADABRA, 0
	db 33, SLOWPOKE, SLOWPOKE, SLOWBRO, 0
	db 38, SLOWBRO, 0
; marcelnote - new trainers
	db $FF, 54, SLOWBRO, 52, MR_MIME, 55, JYNX, 54, HYPNO, 56, EXEGGUTOR, 0 ; marcelnote - postgame Will

RockerData:
; Vermilion Gym
	db 20, VOLTORB, MAGNEMITE, VOLTORB, 0
; Route 12
	db 29, VOLTORB, ELECTRODE, 0

JugglerData:
; Silph Co. 5F
	db 29, KADABRA, MR_MIME, 0
; Victory Road 2F
	db 41, DROWZEE, HYPNO, KADABRA, KADABRA, 0
; Fuchsia Gym
	db 31, DROWZEE, DROWZEE, KADABRA, DROWZEE, 0
	db 34, DROWZEE, HYPNO, 0
; Victory Road 2F
	db 48, MR_MIME, 0
; Unused
	db 33, HYPNO, 0
; Fuchsia Gym
	db 38, HYPNO, 0
	db 34, DROWZEE, KADABRA, 0

TamerData:
; Fuchsia Gym
	db 34, SANDSLASH, ARBOK, 0
	db 33, ARBOK, SANDSLASH, ARBOK, 0
; Viridian Gym
	db 43, RHYHORN, 0
	db 39, ARBOK, TAUROS, 0
; Victory Road 2F
	db 44, PERSIAN, GOLDUCK, 0
; Unused
	db 42, RHYHORN, PRIMEAPE, ARBOK, TAUROS, 0

BirdKeeperData:
; Route 13
	db 29, PIDGEY, PIDGEOTTO, 0
	db 25, SPEAROW, PIDGEY, PIDGEY, SPEAROW, SPEAROW, 0
	db 26, PIDGEY, PIDGEOTTO, SPEAROW, FEAROW, 0
; Route 14
	db 33, FARFETCHD, 0
	db 29, SPEAROW, FEAROW, 0
; Route 15
	db 26, PIDGEOTTO, FARFETCHD, DODUO, PIDGEY, 0
	db 28, DODRIO, DODUO, DODUO, 0
; Route 18
	db 29, SPEAROW, FEAROW, 0
	db 34, DODRIO, 0
	db 26, SPEAROW, SPEAROW, FEAROW, SPEAROW, 0
; Route 20
	db 30, FEAROW, FEAROW, PIDGEOTTO, 0
; Unused
	db 39, PIDGEOTTO, PIDGEOTTO, PIDGEY, PIDGEOTTO, 0
	db 42, FARFETCHD, FEAROW, 0
; Route 14
	db 28, PIDGEY, DODUO, PIDGEOTTO, 0
	db 26, PIDGEY, SPEAROW, PIDGEY, FEAROW, 0
	db 29, PIDGEOTTO, FEAROW, 0
	db 28, SPEAROW, DODUO, FEAROW, 0
; marcelnote - new trainers
; Route 18
	db 30, FARFETCHD, DODUO, FEAROW, 0

BlackbeltData:
; Fighting Dojo
	db 37, HITMONLEE, HITMONCHAN, 0
	db 31, MANKEY, MANKEY, PRIMEAPE, 0
	db 32, MACHOP, MACHOKE, 0
	db 36, PRIMEAPE, 0
	db 31, MACHOP, MANKEY, PRIMEAPE, 0
; Viridian Gym
	db 40, MACHOP, MACHOKE, 0
	db 43, MACHOKE, 0
	db 38, MACHOKE, MACHOP, MACHOKE, 0
; Victory Road 2F
	db 43, MACHOKE, MACHOP, MACHOKE, 0
; marcelnote - new trainers
; Route 19
	db 30, MACHOP, PRIMEAPE, 0
	db 30, MANKEY, MACHOKE, 0

ChiefData:
; none

ScientistData:
; Unused
	db 34, KOFFING, VOLTORB, 0
; Silph Co. 2F
	db 26, GRIMER, WEEZING, KOFFING, WEEZING, 0
	db 28, MAGNEMITE, VOLTORB, MAGNETON, 0
; Silph Co. 3F/Mansion 1F
	db 29, ELECTRODE, WEEZING, 0
; Silph Co. 4F
	db 33, ELECTRODE, 0
; Silph Co. 5F
	db 26, MAGNETON, KOFFING, WEEZING, MAGNEMITE, 0
; Silph Co. 6F
	db 25, VOLTORB, KOFFING, MAGNETON, MAGNEMITE, KOFFING, 0
; Silph Co. 7F
	db 29, ELECTRODE, MUK, 0
; Silph Co. 8F
	db 29, GRIMER, ELECTRODE, 0
; Silph Co. 9F
	db 28, VOLTORB, KOFFING, MAGNETON, 0
; Silph Co. 10F
	db 29, MAGNEMITE, KOFFING, 0
; Mansion 3F
	db 33, MAGNEMITE, MAGNETON, VOLTORB, 0
; Mansion B1F
	db 34, MAGNEMITE, ELECTRODE, 0
; Cinnabar Volcano B1F   ; marcelnote - new location
	db 38, KOFFING, ELECTRODE, WEEZING, 0

RocketData:
; Mt. Moon B2F
	db 13, RATTATA, ZUBAT, 0
	db 11, SANDSHREW, RATTATA, ZUBAT, 0
	db 12, ZUBAT, EKANS, 0
	db 16, RATICATE, 0
; Cerulean City
	db 17, MACHOP, DROWZEE, 0
; Route 24
	db 15, EKANS, ZUBAT, 0
; Game Corner
	db 20, RATICATE, ZUBAT, 0
; Rocket Hideout B1F
	db 21, DROWZEE, MACHOP, 0
	db 21, RATICATE, RATICATE, 0
	db 20, GRIMER, KOFFING, KOFFING, 0
	db 19, RATTATA, RATICATE, RATICATE, RATTATA, 0
	db 22, GRIMER, KOFFING, 0
; Rocket Hideout B2F
	db 17, ZUBAT, KOFFING, GRIMER, ZUBAT, RATICATE, 0
; Rocket Hideout B3F
	db 20, RATTATA, RATICATE, DROWZEE, 0
	db 21, MACHOP, MACHOP, 0
; Rocket Hideout B4F
	db 23, SANDSHREW, EKANS, SANDSLASH, 0
	db 23, EKANS, SANDSHREW, ARBOK, 0
	db 21, KOFFING, ZUBAT, 0
; Pokémon Tower 7F
	db 25, ZUBAT, ZUBAT, GOLBAT, 0
	db 26, KOFFING, DROWZEE, 0
	db 23, ZUBAT, RATTATA, RATICATE, ZUBAT, 0
; Unused
	db 26, DROWZEE, KOFFING, 0
; Silph Co. 2F
	db 29, CUBONE, ZUBAT, 0
	db 25, GOLBAT, ZUBAT, ZUBAT, RATICATE, ZUBAT, 0
; Silph Co. 3F
	db 28, RATICATE, HYPNO, RATICATE, 0
; Silph Co. 4F
	db 29, MACHOP, DROWZEE, 0
	db 28, EKANS, ZUBAT, CUBONE, 0
; Silph Co. 5F
	db 33, ARBOK, 0
	db 33, HYPNO, 0
; Silph Co. 6F
	db 29, MACHOP, MACHOKE, 0
	db 28, ZUBAT, ZUBAT, GOLBAT, 0
; Silph Co. 7F
	db 26, RATICATE, ARBOK, KOFFING, GOLBAT, 0
	db 29, CUBONE, CUBONE, 0
	db 29, SANDSHREW, SANDSLASH, 0
; Silph Co. 8F
	db 26, RATICATE, ZUBAT, GOLBAT, RATTATA, 0
	db 28, WEEZING, GOLBAT, KOFFING, 0
; Silph Co. 9F
	db 28, DROWZEE, GRIMER, MACHOP, 0
	db 28, GOLBAT, DROWZEE, HYPNO, 0
; Silph Co. 10F
	db 33, MACHOKE, 0
; Silph Co. 11F
	db 25, RATTATA, RATTATA, ZUBAT, RATTATA, EKANS, 0
	db 32, CUBONE, DROWZEE, MAROWAK, 0
; marcelnote - new trainers
; Silph Factory 2F
	db $FF, 40, GOLBAT, 42, MAGMAR, 44, ELECTRODE, 45, WEEZING, 0 ; Archer
; Silph Factory 1F
	db 38, RATICATE, GRIMER, RATICATE, GOLBAT, RATICATE, 0
	db 42, WEEZING, GOLBAT, 0
	db 44, MACHOKE, HYPNO, 0
	db 40, CUBONE, MAGNETON, MAROWAK, 0
	db 42, RATICATE, KOFFING, SANDSLASH, 0
	db 42, RATICATE, DIGLETT, ARBOK, 0

CooltrainerMData:
; Viridian Gym
	db 39, NIDORINO, NIDOKING, 0
; Victory Road 3F
	db 43, EXEGGUTOR, CLOYSTER, ARCANINE, 0
	db 43, KINGLER, TENTACRUEL, BLASTOISE, 0
; Unused
	db 45, KINGLER, STARMIE, 0
; Victory Road 1F
	db 42, IVYSAUR, WARTORTLE, CHARMELEON, CHARIZARD, 0
; Unused
	db 44, IVYSAUR, WARTORTLE, CHARMELEON, 0
	db 49, NIDOKING, 0
	db 44, KINGLER, CLOYSTER, 0
; Viridian Gym
	db 39, SANDSLASH, DUGTRIO, 0
	db 43, RHYHORN, 0
; Cinnabar Volcano 1F   ; marcelnote - new location
	db 39, GLOOM, TANGELA, VICTREEBEL, 0

CooltrainerFData:
; Celadon Gym
	db 24, WEEPINBELL, GLOOM, IVYSAUR, 0
; Victory Road 3F
	db 43, BELLSPROUT, WEEPINBELL, VICTREEBEL, 0
	db 43, PARASECT, DEWGONG, CHANSEY, 0
; Unused
	db 46, VILEPLUME, BUTTERFREE, 0
; Victory Road 1F
	db 44, PERSIAN, NINETALES, 0
; Unused
	db 45, IVYSAUR, VENUSAUR, 0
	db 45, NIDORINA, NIDOQUEEN, 0
	db 43, PERSIAN, NINETALES, RAICHU, 0
; marcelnote - new trainers
; Cinnabar Volcano B1F
	db 39, GROWLITHE, NINETALES, NIDOQUEEN, 0
; Orange Ferry Outside
	db 41, IVYSAUR, NIDORINA, VENUSAUR, 0

GentlemanData:
; SS Anne 1F Rooms
	db 18, GROWLITHE, GROWLITHE, 0
	db 19, NIDORAN_M, NIDORAN_F, 0
; SS Anne 2F Rooms/Vermilion Gym
	db 23, PIKACHU, 0
; Unused
	db 48, PRIMEAPE, 0
; SS Anne 2F Rooms
	db 17, GROWLITHE, PONYTA, 0
; SS Anne 2F Rooms
	db 17, GROWLITHE, PONYTA, 0
; Cinnabar Volcano 1F   ; marcelnote - new location
	db 38, NIDORINO, RAICHU, POLIWRATH, 0
; Mandarin Hotel        ; marcelnote - new location
	db 40, GROWLITHE, PRIMEAPE, SCYTHER, 0
; Orange Ferry Rooms    ; marcelnote - new location
	db 39, NIDORINA, PONYTA, VICTREEBEL, 0

ChannelerData:
; Unused ; marcelnote - now repurposed for Celadon Grove
	db 23, GASTLY, HAUNTER, GASTLY, 0 ; marcelnote - modified
	db 24, GASTLY, 0
	db 23, GASTLY, GASTLY, 0
	db 24, GASTLY, 0
; Pokémon Tower 3F
	db 23, GASTLY, 0
	db 24, GASTLY, 0
; Unused
	db 24, HAUNTER, 0
; Pokémon Tower 3F
	db 22, GASTLY, 0
; Pokémon Tower 4F
	db 24, GASTLY, 0
	db 23, GASTLY, GASTLY, 0
; Unused
	db 24, GASTLY, 0
; Pokémon Tower 4F
	db 22, GASTLY, 0
; Unused
	db 24, GASTLY, 0
; Pokémon Tower 5F
	db 23, HAUNTER, 0
; Unused
	db 24, GASTLY, 0
; Pokémon Tower 5F
	db 22, GASTLY, 0
	db 24, GASTLY, 0
	db 22, HAUNTER, 0
; Pokémon Tower 6F
	db 22, GASTLY, GASTLY, GASTLY, 0
	db 24, GASTLY, 0
	db 24, GASTLY, 0
; Saffron Gym
	db 34, GASTLY, HAUNTER, 0
	db 38, HAUNTER, 0
	db 33, GASTLY, GASTLY, HAUNTER, 0

BrockData:
	db $FF, 12, GEODUDE, 14, ONIX, 0
	db $FF, 56, AERODACTYL, 60, RHYDON, 58, OMASTAR, 60, GOLEM, 58, KABUTOPS, 68, ONIX, 0 ; marcelnote - new rematch team

MistyData:  ; marcelnote - adjusted
	;db $FF, 18, STARYU, 21, STARMIE, 0 ; original
	db $FF, 18, STARYU, 17, GOLDEEN, 21, STARMIE, 0 ; new, PSYDUCK?
	db $FF, 58, SEAKING, 56, GOLDUCK, 58, DRAGONAIR, 56, SEADRA, 58, DEWGONG, 62, STARMIE, 0 ; new rematch team ; VAPOREON if removed from Lorelei, BLASTOISE?

LtSurgeData:
	db $FF, 21, VOLTORB, 18, PIKACHU, 24, RAICHU, 0
	db $FF, 57, MAGNETON, 55, ELECTABUZZ, 59, PORYGON, 57, ELECTRODE, 59, JOLTEON, 63, RAICHU, 0 ; new rematch team

ErikaData:  ; marcelnote - adjusted
	;db $FF, 29, VICTREEBEL, 24, TANGELA, 29, VILEPLUME, 0 ; original
	db $FF, 31, VICTREEBEL, 29, TANGELA, 33, VILEPLUME, 0 ; new
	db $FF, 56, VICTREEBEL, 58, PARASECT, 56, EXEGGUTOR, 60, TANGELA, 58, VENUSAUR, 62, VILEPLUME, 0 ; new rematch team

KogaData:  ; marcelnote - adjusted
	;db $FF, 37, KOFFING, 39, MUK, 37, KOFFING, 43, WEEZING, 0 ; original
	db $FF, 41, WEEZING, 37, GOLBAT, 39, MUK, 43, VENOMOTH, 0 ; new
	db $FF, 57, WEEZING, 59, GOLBAT, 59, MUK, 61, PINSIR, 57, TENTACRUEL, 63, VENOMOTH, 0 ; new rematch team

SabrinaData:  ; marcelnote - adjusted
	;db $FF, 38, KADABRA, 37, MR_MIME, 38, VENOMOTH, 43, ALAKAZAM, 0 ; original
	db $FF, 40, KADABRA, 39, MR_MIME, 42, BUTTERFREE, 45, ALAKAZAM, 0 ; new
	db $FF, 58, KADABRA, 58, WIGGLYTUFF, 60, MR_MIME, 58, GENGAR, 66, BUTTERFREE, 62, ALAKAZAM, 0 ; new rematch team ; STARMIE?

BlaineData:  ; marcelnote - adjusted
	;db $FF, 42, GROWLITHE, 40, PONYTA, 42, RAPIDASH, 47, ARCANINE, 0 ; original
	db $FF, 44, GROWLITHE, 42, FLAREON, 44, RAPIDASH, 47, MAGMAR, 49, ARCANINE, 0 ; new
	db $FF, 57, FLAREON, 59, NINETALES, 57, RAPIDASH, 59, GYARADOS, 61, MAGMAR, 63, ARCANINE, 0 ; new rematch team

GiovanniData:  ; marcelnote - adjusted
; Rocket Hideout B4F
	;db $FF, 25, ONIX, 24, RHYHORN, 29, KANGASKHAN, 0 ; original
	db $FF, 26, ONIX, 28, RHYHORN, 29, KANGASKHAN, 31, PERSIAN, 0 ; new
; Silph Co. 11F
	;db $FF, 37, NIDORINO, 35, KANGASKHAN, 37, RHYHORN, 41, NIDOQUEEN, 0 ; original
	db $FF, 39, NIDORINO, 41, RHYHORN, 39, KANGASKHAN, 41, NIDOQUEEN, 43, PERSIAN, 0 ; new
; Viridian Gym
	;db $FF, 45, RHYHORN, 42, DUGTRIO, 44, NIDOQUEEN, 45, NIDOKING, 50, RHYDON, 0 ; original
	db $FF, 47, DUGTRIO, 49, NIDOQUEEN, 50, PERSIAN, 49, NIDOKING, 52, RHYDON, 0 ; new

LoreleiData:
	db $FF, 54, DEWGONG, 53, CLOYSTER, 54, SLOWBRO, 56, JYNX, 56, LAPRAS, 0
	; marcelnote - new rematch team
	db $FF, 64, DEWGONG, 66, JYNX, 64, VAPOREON, 63, CLOYSTER, 65, CLEFABLE, 66, LAPRAS, 0

BrunoData:
	db $FF, 53, ONIX, 55, HITMONCHAN, 55, HITMONLEE, 56, ONIX, 58, MACHAMP, 0
	; put Poliwrath in original team as in Let's Go Pikachu?
	; marcelnote - new rematch team
	db $FF, 65, HITMONCHAN, 66, ONIX, 65, HITMONLEE, 66, POLIWRATH, 67, GOLEM, 68, MACHAMP, 0

AgathaData:
	db $FF, 56, GENGAR, 56, GOLBAT, 55, HAUNTER, 58, ARBOK, 60, GENGAR, 0
	; marcelnote - new rematch team
	db $FF, 66, HAUNTER, 66, GOLBAT, 65, MAROWAK, 68, ARBOK, 67, NINETALES, 70, GENGAR, 0

LanceData:
	db $FF, 58, GYARADOS, 56, DRAGONAIR, 56, DRAGONAIR, 60, AERODACTYL, 62, DRAGONITE, 0
	; marcelnote - new rematch team
	db $FF, 66, DRAGONITE, 68, GYARADOS, 70, KANGASKHAN, 68, CHARIZARD, 70, AERODACTYL, 72, DRAGONITE, 0

Green1Data:
	db 5, SQUIRTLE, 0
	db 5, BULBASAUR, 0
	db 5, CHARMANDER, 0
; Route 22
	db $FF, 9, PIDGEY, 8, SQUIRTLE, 0
	db $FF, 9, PIDGEY, 8, BULBASAUR, 0
	db $FF, 9, PIDGEY, 8, CHARMANDER, 0
; Cerulean City
	db $FF, 18, PIDGEOTTO, 15, ABRA, 15, RATTATA, 17, SQUIRTLE, 0
	db $FF, 18, PIDGEOTTO, 15, ABRA, 15, RATTATA, 17, BULBASAUR, 0
	db $FF, 18, PIDGEOTTO, 15, ABRA, 15, RATTATA, 17, CHARMANDER, 0

Green2Data:
; SS Anne 2F
	db $FF, 19, PIDGEOTTO, 16, RATICATE, 18, KADABRA, 20, WARTORTLE, 0
	db $FF, 19, PIDGEOTTO, 16, RATICATE, 18, KADABRA, 20, IVYSAUR, 0
	db $FF, 19, PIDGEOTTO, 16, RATICATE, 18, KADABRA, 20, CHARMELEON, 0
; Pokémon Tower 2F
	db $FF, 25, PIDGEOTTO, 23, GROWLITHE, 22, EXEGGCUTE, 20, KADABRA, 25, WARTORTLE, 0
	db $FF, 25, PIDGEOTTO, 23, GYARADOS, 22, GROWLITHE, 20, KADABRA, 25, IVYSAUR, 0
	db $FF, 25, PIDGEOTTO, 23, EXEGGCUTE, 22, GYARADOS, 20, KADABRA, 25, CHARMELEON, 0
; Silph Co. 7F
	db $FF, 37, PIDGEOT, 38, GROWLITHE, 35, EXEGGCUTE, 35, ALAKAZAM, 40, BLASTOISE, 0
	db $FF, 37, PIDGEOT, 38, GYARADOS, 35, GROWLITHE, 35, ALAKAZAM, 40, VENUSAUR, 0
	db $FF, 37, PIDGEOT, 38, EXEGGCUTE, 35, GYARADOS, 35, ALAKAZAM, 40, CHARIZARD, 0
; Route 22
	db $FF, 47, PIDGEOT, 45, RHYHORN, 45, GROWLITHE, 47, EXEGGCUTE, 50, ALAKAZAM, 53, BLASTOISE, 0
	db $FF, 47, PIDGEOT, 45, RHYHORN, 45, GYARADOS, 47, GROWLITHE, 50, ALAKAZAM, 53, VENUSAUR, 0
	db $FF, 47, PIDGEOT, 45, RHYHORN, 45, EXEGGCUTE, 47, GYARADOS, 50, ALAKAZAM, 53, CHARIZARD, 0

Green3Data:
	db $FF, 61, PIDGEOT, 59, ALAKAZAM, 61, RHYDON, 61, ARCANINE, 63, EXEGGUTOR, 65, BLASTOISE, 0
	db $FF, 61, PIDGEOT, 59, ALAKAZAM, 61, RHYDON, 61, GYARADOS, 63, ARCANINE, 65, VENUSAUR, 0
	db $FF, 61, PIDGEOT, 59, ALAKAZAM, 61, RHYDON, 61, EXEGGUTOR, 63, GYARADOS, 65, CHARIZARD, 0
	; marcelnote - new rematch teams
	db $FF, 71, PIDGEOT, 69, ALAKAZAM, 71, RHYDON, 71, ARCANINE, 73, EXEGGUTOR, 75, BLASTOISE, 0
	db $FF, 71, PIDGEOT, 69, ALAKAZAM, 71, RHYDON, 71, GYARADOS, 73, ARCANINE, 75, VENUSAUR, 0
	db $FF, 71, PIDGEOT, 69, ALAKAZAM, 71, RHYDON, 71, EXEGGUTOR, 73, GYARADOS, 75, CHARIZARD, 0

ProfOakData: ; marcelnote - adapted unused teams for postgame Oak battle
; Unused
	;db $FF, 66, TAUROS, 67, EXEGGUTOR, 68, ARCANINE, 69, BLASTOISE, 70, GYARADOS, 0
	;db $FF, 66, TAUROS, 67, EXEGGUTOR, 68, ARCANINE, 69, VENUSAUR, 70, GYARADOS, 0
	;db $FF, 66, TAUROS, 67, EXEGGUTOR, 68, ARCANINE, 69, CHARIZARD, 70, GYARADOS, 0
	db $FF, 66, TAUROS, 67, ELECTRODE, 68, KINGLER, 69, RAPIDASH, 70, VENUSAUR, 72, NIDOKING, 0
	db $FF, 66, TAUROS, 67, ELECTRODE, 68, VICTREEBEL, 69, KINGLER, 70, CHARIZARD, 72, NIDOKING, 0
	db $FF, 66, TAUROS, 67, ELECTRODE, 68, RAPIDASH, 69, VICTREEBEL, 70, BLASTOISE, 72, NIDOKING, 0
	; ideas: MUK, PRIMEAPE, SCYTHER, PINSIR, ELECTABUZZ, JOLTEON

YellowData:  ; marcelnote - new postgame battle
	db $FF, 78, DODRIO, 80, CHANSEY, 88, BUTTERFREE, 78, OMASTAR, 78, NINETALES, 94, PIKACHU, 0
	db $FF, 5, CATERPIE, 5, PIKACHU, 0 ; testing
