; Evos+moves data structure:
; - Evolution methods:
;    * db EVOLVE_LEVEL, level, species
;    * db EVOLVE_ITEM, used item, min level (1), species
;    * db EVOLVE_TRADE, min level (1), species
; - db 0 ; no more evolutions
; - Learnset (in increasing level order):
;    * db level, move
; - db 0 ; no more level-up moves

EvosMovesPointerTable:
	table_width 2, EvosMovesPointerTable
	dw RhydonEvosMoves
	dw KangaskhanEvosMoves
	dw NidoranMEvosMoves
	dw ClefairyEvosMoves
	dw SpearowEvosMoves
	dw VoltorbEvosMoves
	dw NidokingEvosMoves
	dw SlowbroEvosMoves
	dw IvysaurEvosMoves
	dw ExeggutorEvosMoves
	dw LickitungEvosMoves
	dw ExeggcuteEvosMoves
	dw GrimerEvosMoves
	dw GengarEvosMoves
	dw NidoranFEvosMoves
	dw NidoqueenEvosMoves
	dw CuboneEvosMoves
	dw RhyhornEvosMoves
	dw LaprasEvosMoves
	dw ArcanineEvosMoves
	dw MewEvosMoves
	dw GyaradosEvosMoves
	dw ShellderEvosMoves
	dw TentacoolEvosMoves
	dw GastlyEvosMoves
	dw ScytherEvosMoves
	dw StaryuEvosMoves
	dw BlastoiseEvosMoves
	dw PinsirEvosMoves
	dw TangelaEvosMoves
	dw MissingNo1FEvosMoves
	dw MissingNo20EvosMoves
	dw GrowlitheEvosMoves
	dw OnixEvosMoves
	dw FearowEvosMoves
	dw PidgeyEvosMoves
	dw SlowpokeEvosMoves
	dw KadabraEvosMoves
	dw GravelerEvosMoves
	dw ChanseyEvosMoves
	dw MachokeEvosMoves
	dw MrMimeEvosMoves
	dw HitmonleeEvosMoves
	dw HitmonchanEvosMoves
	dw ArbokEvosMoves
	dw ParasectEvosMoves
	dw PsyduckEvosMoves
	dw DrowzeeEvosMoves
	dw GolemEvosMoves
	dw MissingNo32EvosMoves
	dw MagmarEvosMoves
	dw MissingNo34EvosMoves
	dw ElectabuzzEvosMoves
	dw MagnetonEvosMoves
	dw KoffingEvosMoves
	dw MissingNo38EvosMoves
	dw MankeyEvosMoves
	dw SeelEvosMoves
	dw DiglettEvosMoves
	dw TaurosEvosMoves
	dw MissingNo3DEvosMoves
	dw MissingNo3EEvosMoves
	dw MissingNo3FEvosMoves
	dw FarfetchdEvosMoves
	dw VenonatEvosMoves
	dw DragoniteEvosMoves
	dw MissingNo43EvosMoves
	dw MissingNo44EvosMoves
	dw MissingNo45EvosMoves
	dw DoduoEvosMoves
	dw PoliwagEvosMoves
	dw JynxEvosMoves
	dw MoltresEvosMoves
	dw ArticunoEvosMoves
	dw ZapdosEvosMoves
	dw DittoEvosMoves
	dw MeowthEvosMoves
	dw KrabbyEvosMoves
	dw MissingNo4FEvosMoves
	dw MissingNo50EvosMoves
	dw MissingNo51EvosMoves
	dw VulpixEvosMoves
	dw NinetalesEvosMoves
	dw PikachuEvosMoves
	dw RaichuEvosMoves
	dw MissingNo56EvosMoves
	dw MissingNo57EvosMoves
	dw DratiniEvosMoves
	dw DragonairEvosMoves
	dw KabutoEvosMoves
	dw KabutopsEvosMoves
	dw HorseaEvosMoves
	dw SeadraEvosMoves
	dw MissingNo5EEvosMoves
	dw MissingNo5FEvosMoves
	dw SandshrewEvosMoves
	dw SandslashEvosMoves
	dw OmanyteEvosMoves
	dw OmastarEvosMoves
	dw JigglypuffEvosMoves
	dw WigglytuffEvosMoves
	dw EeveeEvosMoves
	dw FlareonEvosMoves
	dw JolteonEvosMoves
	dw VaporeonEvosMoves
	dw MachopEvosMoves
	dw ZubatEvosMoves
	dw EkansEvosMoves
	dw ParasEvosMoves
	dw PoliwhirlEvosMoves
	dw PoliwrathEvosMoves
	dw WeedleEvosMoves
	dw KakunaEvosMoves
	dw BeedrillEvosMoves
	dw MissingNo73EvosMoves
	dw DodrioEvosMoves
	dw PrimeapeEvosMoves
	dw DugtrioEvosMoves
	dw VenomothEvosMoves
	dw DewgongEvosMoves
	dw MissingNo79EvosMoves
	dw MissingNo7AEvosMoves
	dw CaterpieEvosMoves
	dw MetapodEvosMoves
	dw ButterfreeEvosMoves
	dw MachampEvosMoves
	dw MissingNo7FEvosMoves
	dw GolduckEvosMoves
	dw HypnoEvosMoves
	dw GolbatEvosMoves
	dw MewtwoEvosMoves
	dw SnorlaxEvosMoves
	dw MagikarpEvosMoves
	dw MissingNo86EvosMoves
	dw MissingNo87EvosMoves
	dw MukEvosMoves
	dw MissingNo8AEvosMoves
	dw KinglerEvosMoves
	dw CloysterEvosMoves
	dw MissingNo8CEvosMoves
	dw ElectrodeEvosMoves
	dw ClefableEvosMoves
	dw WeezingEvosMoves
	dw PersianEvosMoves
	dw MarowakEvosMoves
	dw MissingNo92EvosMoves
	dw HaunterEvosMoves
	dw AbraEvosMoves
	dw AlakazamEvosMoves
	dw PidgeottoEvosMoves
	dw PidgeotEvosMoves
	dw StarmieEvosMoves
	dw BulbasaurEvosMoves
	dw VenusaurEvosMoves
	dw TentacruelEvosMoves
	dw MissingNo9CEvosMoves
	dw GoldeenEvosMoves
	dw SeakingEvosMoves
	dw MissingNo9FEvosMoves
	dw MissingNoA0EvosMoves
	dw MissingNoA1EvosMoves
	dw MissingNoA2EvosMoves
	dw PonytaEvosMoves
	dw RapidashEvosMoves
	dw RattataEvosMoves
	dw RaticateEvosMoves
	dw NidorinoEvosMoves
	dw NidorinaEvosMoves
	dw GeodudeEvosMoves
	dw PorygonEvosMoves
	dw AerodactylEvosMoves
	dw MissingNoACEvosMoves
	dw MagnemiteEvosMoves
	dw MissingNoAEEvosMoves
	dw MissingNoAFEvosMoves
	dw CharmanderEvosMoves
	dw SquirtleEvosMoves
	dw CharmeleonEvosMoves
	dw WartortleEvosMoves
	dw CharizardEvosMoves
	dw MissingNoB5EvosMoves
	dw FossilKabutopsEvosMoves
	dw FossilAerodactylEvosMoves
	dw MonGhostEvosMoves
	dw OddishEvosMoves
	dw GloomEvosMoves
	dw VileplumeEvosMoves
	dw BellsproutEvosMoves
	dw WeepinbellEvosMoves
	dw VictreebelEvosMoves
	assert_table_length NUM_POKEMON_INDEXES

; marcelnote - Learnsets have been extensively reworked; no line-by-line comments here,
;              instead there will be a guide doc for updated learnsets.
;              Evolution levels have not been modified however.

BulbasaurEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0
; Learnset
	db 7, LEECH_SEED
	db 12, VINE_WHIP
	db 17, POISONPOWDER
	db 22, GROWTH
	db 27, RAZOR_LEAF
	db 32, ACID ; marcelnote - exclusive to BULBASAUR and IVYSAUR
	db 33, SLEEP_POWDER
	db 39, BODY_SLAM
	db 46, SOLARBEAM
	db 0

IvysaurEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0
; Learnset
	db 7, LEECH_SEED
	db 13, VINE_WHIP
	db 18, POISONPOWDER
	db 24, GROWTH
	db 29, RAZOR_LEAF
	db 33, ACID ; marcelnote - exclusive to BULBASAUR and IVYSAUR
	db 36, SLEEP_POWDER
	db 42, BODY_SLAM
	db 50, SOLARBEAM
	db 0

VenusaurEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, LEECH_SEED
	db 14, VINE_WHIP
	db 19, POISONPOWDER
	db 26, GROWTH
	db 31, RAZOR_LEAF
	db 32, PETAL_DANCE ; marcelnote - exclusive to VENUSAUR
	db 39, SLEEP_POWDER
	db 46, BODY_SLAM
	db 54, SOLARBEAM
	db 0

CharmanderEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0
; Learnset
	db 8, EMBER
	db 12, LEER
	db 18, FURY_SWIPES
	db 23, SMOKESCREEN
	db 29, SLASH
	db 35, FLAMETHROWER
	db 36, SWORDS_DANCE ; marcelnote - exclusive to CHARMANDER and CHARMELEON
	db 40, SLAM
	db 47, FIRE_SPIN
	db 0

CharmeleonEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0
; Learnset
	db 8, EMBER
	db 13, LEER
	db 19, FURY_SWIPES
	db 25, SMOKESCREEN
	db 31, SLASH
	db 37, SWORDS_DANCE ; marcelnote - exclusive to CHARMANDER and CHARMELEON
	db 38, FLAMETHROWER
	db 44, SLAM
	db 51, FIRE_SPIN
	db 0

CharizardEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, EMBER
	db 14, LEER
	db 21, FURY_SWIPES
	db 27, SMOKESCREEN
	db 34, SLASH
	db 36, WING_ATTACK ; marcelnote - exclusive to CHARIZARD
	db 41, FLAMETHROWER
	db 48, SLAM
	db 56, FIRE_SPIN
	db 0

SquirtleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0
; Learnset
	db 7, BUBBLE
	db 13, WATER_GUN
	db 20, BITE
	db 25, WITHDRAW
	db 30, SKULL_BASH
	db 36, REST ; marcelnote - exclusive to SQUIRTLE and WARTORTLE
	db 37, MIST
	db 44, HYDRO_PUMP
	db 0

WartortleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0
; Learnset
	db 7, BUBBLE
	db 14, WATER_GUN
	db 22, BITE
	db 27, WITHDRAW
	db 32, SKULL_BASH
	db 37, REST ; marcelnote - exclusive to SQUIRTLE and WARTORTLE
	db 40, MIST
	db 48, HYDRO_PUMP
	db 0

BlastoiseEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, BUBBLE
	db 15, WATER_GUN
	db 24, BITE
	db 29, WITHDRAW
	db 35, SKULL_BASH
	db 36, THRASH ; marcelnote - exclusive to BLASTOISE
	db 43, MIST
	db 52, HYDRO_PUMP
	db 0

CaterpieEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 7, METAPOD
	db 0
; Learnset
	db 18, DOUBLE_EDGE
	db 0

MetapodEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0
; Learnset
	db 7, HARDEN
	db 18, DOUBLE_EDGE
	db 0

ButterfreeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, CONFUSION
	db 13, POISONPOWDER
	db 14, STUN_SPORE
	db 15, SLEEP_POWDER
	db 18, GUST
	db 21, SUPERSONIC
	db 24, WHIRLWIND
	db 28, PSYBEAM
	db 32, RAZOR_WIND
	db 37, DISABLE
	db 0

WeedleEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0
; Learnset
	db 18, DOUBLE_EDGE
	db 0

KakunaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0
; Learnset
	db 7, HARDEN
	db 18, DOUBLE_EDGE
	db 0

BeedrillEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, FURY_ATTACK
	db 14, FOCUS_ENERGY
	db 18, TWINEEDLE
	db 21, RAGE
	db 24, AGILITY
	db 28, PIN_MISSILE
	db 32, SWORDS_DANCE
	db 37, ACID
	db 0

PidgeyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0
; Learnset
	db 5, SAND_ATTACK
	db 8, GUST
	db 12, QUICK_ATTACK
	db 19, WHIRLWIND
	db 23, WING_ATTACK
	db 29, TAKE_DOWN
	db 34, AGILITY
	db 40, MIRROR_MOVE
	db 45, SKY_ATTACK
	db 0

PidgeottoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0
; Learnset
	db 5, SAND_ATTACK
	db 8, GUST
	db 13, QUICK_ATTACK
	db 19, WHIRLWIND
	db 25, WING_ATTACK
	db 31, TAKE_DOWN
	db 37, AGILITY
	db 43, MIRROR_MOVE
	db 49, SKY_ATTACK
	db 0

PidgeotEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, SAND_ATTACK
	db 8, GUST
	db 14, QUICK_ATTACK
	db 20, WHIRLWIND
	db 27, WING_ATTACK
	db 34, TAKE_DOWN
	db 40, AGILITY
	db 46, MIRROR_MOVE
	db 53, SKY_ATTACK
	db 0

RattataEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, RATICATE
	db 0
; Learnset
	db 7, QUICK_ATTACK
	db 14, HYPER_FANG
	db 21, FOCUS_ENERGY
	db 29, SUPER_FANG
	db 37, DOUBLE_EDGE
	db 0

RaticateEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, QUICK_ATTACK
	db 16, HYPER_FANG
	db 24, FOCUS_ENERGY
	db 32, SUPER_FANG
	db 41, DOUBLE_EDGE
	db 0

SpearowEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, FEAROW
	db 0
; Learnset
	db 7, LEER
	db 12, FURY_ATTACK
	db 16, FOCUS_ENERGY
	db 22, MIRROR_MOVE
	db 27, DRILL_PECK
	db 31, WHIRLWIND
	db 36, AGILITY
	db 41, SHARPEN
	db 0

FearowEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, LEER
	db 14, FURY_ATTACK
	db 18, FOCUS_ENERGY
	db 25, MIRROR_MOVE
	db 30, DRILL_PECK
	db 35, WHIRLWIND
	db 40, AGILITY
	db 46, SHARPEN
	db 0

EkansEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, ARBOK
	db 0
; Learnset
	db 14, BITE
	db 18, WRAP
	db 23, GLARE
	db 27, ACID
	db 31, SCREECH
	db 37, HYPER_FANG
	db 42, HAZE
	; SLAM (TM?), ACID_ARMOR, HYPNOSIS?
	db 0

ArbokEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, BITE
	db 20, WRAP
	db 25, GLARE
	db 30, ACID
	db 35, SCREECH
	db 41, HYPER_FANG
	db 47, HAZE
	; SLAM (TM?), ACID_ARMOR, HYPNOSIS?
	db 0

PikachuEvosMoves:
; Evolutions
	db EVOLVE_ITEM, THUNDER_STONE, 1, RAICHU
	db 0
; Learnset
	db 8, THUNDER_WAVE
	db 12, QUICK_ATTACK
	db 16, TAIL_WHIP
	db 21, DOUBLE_TEAM
	db 26, HEADBUTT
	db 31, THUNDERBOLT
	db 37, AGILITY
	db 43, THUNDER
	db 49, LIGHT_SCREEN
	db 0

RaichuEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, THUNDER_WAVE
	db 14, QUICK_ATTACK
	db 18, TAIL_WHIP
	db 24, DOUBLE_TEAM
	db 29, HEADBUTT
	db 35, THUNDERBOLT
	db 41, AGILITY
	db 48, THUNDER
	db 54, LIGHT_SCREEN
	db 0

SandshrewEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0
; Learnset
	db 14, SAND_ATTACK
	db 18, FURY_SWIPES
	db 23, DIG
	db 27, SLASH
	db 31, POISON_STING
	db 37, SWIFT
	db 42, SWORDS_DANCE
	db 0

SandslashEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, SAND_ATTACK
	db 20, FURY_SWIPES
	db 25, DIG
	db 30, SLASH
	db 35, POISON_STING
	db 41, SWIFT
	db 47, SWORDS_DANCE
	; SPIKE_CANNON ?
	db 0

NidoranFEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0
; Learnset
	db 7, SCRATCH
	db 12, DOUBLE_KICK
	db 14, POISON_STING
	db 18, TAIL_WHIP
	db 22, DIG ; marcelnote - exclusive to NIDORANF and NIDORINA
	db 27, BITE
	db 33, FURY_SWIPES
	db 40, HEADBUTT ; marcelnote - exclusive to NIDORANF and NIDORINA
	db 0

NidorinaEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, NIDOQUEEN
	db 0
; Learnset
	db 7, SCRATCH
	db 13, DOUBLE_KICK
	db 15, POISON_STING
	db 19, TAIL_WHIP
	db 24, DIG ; marcelnote - exclusive to NIDORANF and NIDORINA
	db 29, BITE
	db 36, FURY_SWIPES
	db 44, HEADBUTT ; marcelnote - exclusive to NIDORANF and NIDORINA
	db 0

NidoqueenEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, SCRATCH
	db 14, DOUBLE_KICK
	db 16, POISON_STING
	db 21, TAIL_WHIP
	db 25, BODY_SLAM ; marcelnote - exclusive to NIDOQUEEN
	db 31, BITE
	db 39, FURY_SWIPES
	db 48, EARTHQUAKE ; marcelnote - exclusive to NIDOQUEEN
	db 0

NidoranMEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0
; Learnset
	db 7, HORN_ATTACK
	db 12, DOUBLE_KICK
	db 14, POISON_STING
	db 18, FOCUS_ENERGY
	db 22, DIG ; marcelnote - exclusive to NIDORANM and NIDORINO
	db 27, FURY_ATTACK
	db 33, HORN_DRILL
	db 40, HEADBUTT ; marcelnote - exclusive to NIDORANM and NIDORINO
	db 0

NidorinoEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, NIDOKING
	db 0
; Learnset
	db 7, HORN_ATTACK
	db 13, DOUBLE_KICK
	db 15, POISON_STING
	db 19, FOCUS_ENERGY
	db 24, DIG ; marcelnote - exclusive to NIDORANM and NIDORINO
	db 29, FURY_ATTACK
	db 36, HORN_DRILL
	db 44, HEADBUTT ; marcelnote - exclusive to NIDORANM and NIDORINO
	db 0

NidokingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, HORN_ATTACK
	db 14, DOUBLE_KICK
	db 16, POISON_STING
	db 21, FOCUS_ENERGY
	db 25, THRASH ; marcelnote - exclusive to NIDOKING
	db 31, FURY_ATTACK
	db 39, HORN_DRILL
	db 48, EARTHQUAKE ; marcelnote - exclusive to NIDOKING
	db 0

ClefairyEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, CLEFABLE
	db 0
; Learnset
	db 12, DEFENSE_CURL
	db 16, DOUBLESLAP
	db 20, SING
	db 24, MINIMIZE
	db 29, METRONOME
	db 34, BODY_SLAM
	db 40, LIGHT_SCREEN
	db 48, LOVELY_KISS
	db 0

ClefableEvosMoves:
; Evolutions
	db 0
; Learnset
	db 14, DEFENSE_CURL
	db 18, DOUBLESLAP
	db 22, SING
	db 27, MINIMIZE
	db 32, METRONOME
	db 38, BODY_SLAM
	db 45, LIGHT_SCREEN
	db 53, LOVELY_KISS
	db 0

VulpixEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, NINETALES
	db 0
; Learnset
	db 7, QUICK_ATTACK
	db 12, ROAR
	db 17, CONFUSE_RAY
	db 22, WILL_O_WISP ; marcelnote - new signature move
	db 27, DISABLE
	db 32, FLAMETHROWER
	db 38, NIGHT_SHADE
	db 45, FIRE_SPIN
	db 0

NinetalesEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, QUICK_ATTACK
	db 14, ROAR
	db 19, CONFUSE_RAY
	db 25, WILL_O_WISP ; marcelnote - new signature move
	db 30, DISABLE
	db 36, FLAMETHROWER
	db 42, NIGHT_SHADE
	db 50, FIRE_SPIN
	db 0

JigglypuffEvosMoves:
; Evolutions
	db EVOLVE_ITEM, MOON_STONE, 1, WIGGLYTUFF
	db 0
; Learnset
	db 7, POUND
	db 11, DISABLE
	db 16, DEFENSE_CURL
	db 21, DOUBLESLAP
	db 26, REST
	db 32, BODY_SLAM
	db 38, DOUBLE_EDGE
	db 44, LOVELY_KISS
	db 0

WigglytuffEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, POUND
	db 13, DISABLE
	db 18, DEFENSE_CURL
	db 24, DOUBLESLAP
	db 29, REST
	db 36, BODY_SLAM
	db 42, DOUBLE_EDGE
	db 49, LOVELY_KISS
	db 0

ZubatEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0
; Learnset
	db 10, GUST
	db 15, BITE
	db 21, CONFUSE_RAY
	db 24, SCREECH
	db 28, WING_ATTACK
	db 33, ACID
	db 37, HAZE
	db 41, HYPER_FANG
	db 0

GolbatEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, GUST
	db 17, BITE
	db 21, CONFUSE_RAY
	db 27, SCREECH
	db 31, WING_ATTACK
	db 37, ACID
	db 41, HAZE
	db 45, HYPER_FANG
	db 0

OddishEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 21, GLOOM
	db 0
; Learnset
	db 11, LEECH_SEED
	db 14, POISONPOWDER
	db 17, STUN_SPORE
	db 20, SLEEP_POWDER
	db 24, ACID
	db 28, GROWTH
	db 33, PETAL_DANCE
	db 39, MEGA_DRAIN
	db 46, SOLARBEAM
	db 0

GloomEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, VILEPLUME
	db 0
; Learnset
	db 12, LEECH_SEED
	db 15, POISONPOWDER
	db 18, STUN_SPORE
	db 20, SLEEP_POWDER
	db 26, ACID
	db 30, GROWTH
	db 36, PETAL_DANCE
	db 42, MEGA_DRAIN
	db 50, SOLARBEAM
	db 0

VileplumeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, LEECH_SEED
	db 16, POISONPOWDER
	db 17, STUN_SPORE
	db 20, SLEEP_POWDER
	db 28, ACID
	db 32, GROWTH
	db 38, PETAL_DANCE
	db 46, MEGA_DRAIN
	db 54, SOLARBEAM
	db 0

ParasEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 24, PARASECT
	db 0
; Learnset
	db 9, ABSORB
	db 13, STUN_SPORE
	db 17, LEECH_LIFE
	db 22, FURY_SWIPES
	db 27, SPORE
	db 34, SLASH
	db 41, GROWTH
	; MEGA_DRAIN?
	db 0

ParasectEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, ABSORB
	db 15, STUN_SPORE
	db 19, LEECH_LIFE
	db 23, FURY_SWIPES
	db 30, SPORE
	db 38, SLASH
	db 46, GROWTH
	; MEGA_DRAIN?
	db 0

VenonatEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0
; Learnset
	db 9, SUPERSONIC
	db 13, CONFUSION
	db 18, POISONPOWDER
	db 23, LEECH_LIFE
	db 28, STUN_SPORE
	db 33, PSYBEAM
	db 38, SLEEP_POWDER
	db 43, PSYCHIC_M
	db 0

VenomothEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, SUPERSONIC
	db 15, CONFUSION
	db 20, POISONPOWDER
	db 26, LEECH_LIFE
	db 30, STUN_SPORE
	db 31, GUST
	db 37, PSYBEAM
	db 42, SLEEP_POWDER
	db 48, PSYCHIC_M
	db 0

DiglettEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0
; Learnset
	db 10, SAND_ATTACK
	db 15, DIG
	db 20, FURY_SWIPES
	db 25, HEADBUTT
	db 30, SLASH
	db 35, MINIMIZE
	db 40, EARTHQUAKE
	db 47, FISSURE
	; WITHDRAW?
	db 0

DugtrioEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, SAND_ATTACK
	db 17, DIG
	db 23, FURY_SWIPES
	db 25, HEADBUTT
	db 34, SLASH
	db 39, MINIMIZE
	db 45, EARTHQUAKE
	db 52, FISSURE
	; WITHDRAW?
	db 0

MeowthEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0
; Learnset
	db 8, TAIL_WHIP
	db 12, BITE
	db 16, PAY_DAY
	db 20, FURY_SWIPES
	db 24, SCREECH
	db 29, LICK
	db 34, SLASH
	db 40, AGILITY
	db 0

PersianEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, TAIL_WHIP
	db 14, BITE
	db 18, PAY_DAY
	db 23, FURY_SWIPES
	db 27, SCREECH
	db 32, LICK
	db 38, SLASH
	db 45, AGILITY
	db 0

PsyduckEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0
; Learnset
	db 10, DISABLE
	db 14, CONFUSION
	db 19, WATER_GUN
	db 25, FURY_SWIPES
	db 34, PSYBEAM
	db 39, AMNESIA
	db 47, HYDRO_PUMP
	db 0

GolduckEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, DISABLE
	db 16, CONFUSION
	db 21, WATER_GUN
	db 28, FURY_SWIPES
	db 36, PSYBEAM
	db 44, AMNESIA
	db 52, HYDRO_PUMP
	db 0

MankeyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0
; Learnset
	db 9, LOW_KICK
	db 15, KARATE_CHOP
	db 21, FURY_SWIPES
	db 27, FOCUS_ENERGY
	db 33, SEISMIC_TOSS
	db 39, THRASH
	db 45, SCREECH
	db 0

PrimeapeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, LOW_KICK
	db 17, KARATE_CHOP
	db 24, FURY_SWIPES
	db 27, FOCUS_ENERGY
	db 37, SEISMIC_TOSS
	db 43, THRASH
	db 50, SCREECH
	db 0

GrowlitheEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, ARCANINE
	db 0
; Learnset
	db 9, ROAR
	db 13, BITE
	db 17, EMBER
	db 22, LEER
	db 27, TAKE_DOWN
	db 33, AGILITY
	db 40, FLAMETHROWER
	db 0

ArcanineEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, ROAR
	db 15, BITE
	db 19, EMBER
	db 25, LEER
	db 30, TAKE_DOWN
	db 37, AGILITY
	db 45, FLAMETHROWER
	db 0

PoliwagEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0
; Learnset
	db 6, BUBBLE
	db 11, DOUBLESLAP
	db 16, WATER_GUN
	db 21, HYPNOSIS
	db 25, BUBBLEBEAM
	db 31, BODY_SLAM
	db 38, PSYBEAM  ; marcelnote - exclusive to POLIWAG
	db 45, HYDRO_PUMP
	db 0

PoliwhirlEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, POLIWRATH
	db 0
; Learnset
	db 6, BUBBLE
	db 12, DOUBLESLAP
	db 17, WATER_GUN
	db 23, HYPNOSIS
	db 27, BUBBLEBEAM
	db 33, BODY_SLAM
	db 41, KARATE_CHOP  ; marcelnote - exclusive to POLIWHIRL and POLIWRATH
	db 49, HYDRO_PUMP
	db 0

PoliwrathEvosMoves:
; Evolutions
	db 0
; Learnset
	db 6, BUBBLE
	db 13, DOUBLESLAP
	db 18, WATER_GUN
	db 25, HYPNOSIS
	db 29, BUBBLEBEAM
	db 36, BODY_SLAM
	db 45, KARATE_CHOP  ; marcelnote - exclusive to POLIWHIRL and POLIWRATH
	db 54, HYDRO_PUMP
	db 0

AbraEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 16, KADABRA
	db 0
; Learnset
	db 0

KadabraEvosMoves:
; Evolutions
	db EVOLVE_TRADE, 1, ALAKAZAM
	db 0
; Learnset
	db 16, CONFUSION
	db 19, KINESIS
	db 23, DISABLE
	db 27, PSYBEAM
	db 31, RECOVER
	db 38, PSYCHIC_M
	db 45, REFLECT
	db 0

AlakazamEvosMoves:
; Evolutions
	db 0
; Learnset
	db 18, CONFUSION
	db 21, KINESIS
	db 26, DISABLE
	db 30, PSYBEAM
	db 35, RECOVER
	db 42, PSYCHIC_M
	db 50, REFLECT
	; PSY_WAVE
	db 0

MachopEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0
; Learnset
	db 14, FOCUS_ENERGY
	db 20, SEISMIC_TOSS
	db 26, KARATE_CHOP
	db 32, COUNTER
	db 38, THRASH
	db 44, SUBMISSION
	db 0

MachokeEvosMoves:
; Evolutions
	db EVOLVE_TRADE, 1, MACHAMP
	db 0
; Learnset
	db 15, FOCUS_ENERGY
	db 22, SEISMIC_TOSS
	db 27, KARATE_CHOP
	db 35, COUNTER
	db 41, THRASH
	db 48, SUBMISSION
	db 0

MachampEvosMoves:
; Evolutions
	db 0
; Learnset
	db 17, FOCUS_ENERGY
	db 25, SEISMIC_TOSS
	db 31, KARATE_CHOP
	db 39, COUNTER
	db 46, THRASH
	db 53, SUBMISSION
	db 0

BellsproutEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0
; Learnset
	db 11, CONSTRICT
	db 14, STUN_SPORE
	db 17, POISONPOWDER
	db 21, ACID
	db 25, WRAP
	db 29, RAZOR_LEAF
	db 36, SLEEP_POWDER
	db 43, SLAM
	db 0

WeepinbellEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, VICTREEBEL
	db 0
; Learnset
	db 12, CONSTRICT
	db 15, STUN_SPORE
	db 18, POISONPOWDER
	db 23, ACID
	db 27, WRAP
	db 31, RAZOR_LEAF
	db 39, SLEEP_POWDER
	db 47, SLAM
	db 0

VictreebelEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, CONSTRICT
	db 16, STUN_SPORE
	db 19, POISONPOWDER
	db 25, ACID
	db 29, WRAP
	db 34, RAZOR_LEAF
	db 42, SLEEP_POWDER
	db 51, SLAM
	db 0

TentacoolEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0
; Learnset
	db 6, SUPERSONIC
	db 11, CONSTRICT
	db 16, WATER_GUN
	db 22, ACID
	db 28, WRAP
	db 34, BARRIER
	db 40, SCREECH
	db 47, HYDRO_PUMP
	db 0

TentacruelEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, SUPERSONIC
	db 13, CONSTRICT
	db 18, WATER_GUN
	db 25, ACID
	db 29, WRAP
	db 38, BARRIER
	db 44, SCREECH
	db 52, HYDRO_PUMP
	db 0

GeodudeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0
; Learnset
	db 9, DEFENSE_CURL
	db 14, ROCK_THROW
	db 17, LEER
	db 21, SELFDESTRUCT
	db 26, FOCUS_ENERGY
	db 31, ROCK_SLIDE
	db 36, EARTHQUAKE
	db 41, EXPLOSION
	db 0

GravelerEvosMoves:
; Evolutions
	db EVOLVE_TRADE, 1, GOLEM
	db 0
; Learnset
	db 9, DEFENSE_CURL
	db 15, ROCK_THROW
	db 18, LEER
	db 23, SELFDESTRUCT
	db 29, FOCUS_ENERGY
	db 34, ROCK_SLIDE
	db 39, EARTHQUAKE
	db 45, EXPLOSION
	db 0

GolemEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, DEFENSE_CURL
	db 17, ROCK_THROW
	db 20, LEER
	db 26, SELFDESTRUCT
	db 32, FOCUS_ENERGY
	db 38, ROCK_SLIDE
	db 43, EARTHQUAKE
	db 50, EXPLOSION
	db 0

PonytaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0
; Learnset
	db 16, GROWL
	db 22, STOMP
	db 26, DOUBLE_KICK
	db 30, FIRE_SPIN
	db 34, TAKE_DOWN
	db 39, FLAMETHROWER ; marcelnote - exclusive to PONYTA
	db 45, AGILITY
	db 0

RapidashEvosMoves:
; Evolutions
	db 0
; Learnset
	db 18, GROWL
	db 25, STOMP
	db 29, DOUBLE_KICK
	db 33, FIRE_SPIN
	db 38, TAKE_DOWN
	db 43, HORN_DRILL ; marcelnote - exclusive to RAPIDASH
	db 50, AGILITY
	db 0

SlowpokeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 37, SLOWBRO
	db 0
; Learnset
	db 8, CONFUSION
	db 12, DISABLE
	db 18, WATER_GUN
	db 24, HEADBUTT
	db 32, BIDE
	db 40, AMNESIA
	db 48, PSYCHIC_M
	db 0

SlowbroEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, CONFUSION
	db 14, DISABLE
	db 20, WATER_GUN
	db 27, HEADBUTT
	db 36, BIDE
	db 37, WITHDRAW ; marcelnote - exclusive to SLOWBRO in vanilla
	db 44, AMNESIA
	db 53, PSYCHIC_M
	db 0

MagnemiteEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0
; Learnset
	db 6, THUNDERSHOCK
	db 12, SUPERSONIC
	db 18, SONICBOOM
	db 24, THUNDER_WAVE
	db 30, SWIFT
	db 36, SCREECH
	db 42, TRI_ATTACK
	db 48, THUNDER
	db 0

MagnetonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, THUNDERSHOCK
	db 14, SUPERSONIC
	db 20, SONICBOOM
	db 27, THUNDER_WAVE
	db 33, SWIFT
	db 40, SCREECH
	db 47, TRI_ATTACK
	db 53, THUNDER
	db 0

FarfetchdEvosMoves:
; Evolutions
	db 0
; Learnset
	db 9, LEER
	db 14, FURY_ATTACK
	db 19, WING_ATTACK
	db 24, SWORDS_DANCE
	db 30, AGILITY
	db 37, SLASH
	db 45, FOCUS_ENERGY
	db 0

DoduoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 31, DODRIO
	db 0
; Learnset
	db 15, FURY_ATTACK
	db 20, RAGE
	db 25, HI_JUMP_KICK
	db 29, DRILL_PECK
	db 34, TRI_ATTACK
	db 40, MEGA_KICK
	db 46, AGILITY
	db 0

DodrioEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, FURY_ATTACK
	db 22, RAGE
	db 28, HI_JUMP_KICK
	db 32, DRILL_PECK
	db 38, TRI_ATTACK
	db 45, MEGA_KICK
	db 51, AGILITY
	db 0

SeelEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0
; Learnset
	db 13, WATER_GUN
	db 17, HEADBUTT
	db 22, REST
	db 28, AURORA_BEAM
	db 35, TAKE_DOWN
	db 42, ICE_BEAM
	db 49, HYDRO_PUMP
	db 0

DewgongEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, WATER_GUN
	db 19, HEADBUTT
	db 25, REST
	db 31, AURORA_BEAM
	db 39, TAKE_DOWN
	db 47, ICE_BEAM
	db 54, HYDRO_PUMP
	db 0

GrimerEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 38, MUK
	db 0
; Learnset
	db 11, POISON_GAS
	db 16, ACID
	db 21, SCREECH
	db 26, BIND
	db 31, MINIMIZE
	db 36, TOXIC
	db 41, SLUDGE
	db 46, ACID_ARMOR
	db 0

MukEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, POISON_GAS
	db 18, ACID
	db 24, SCREECH
	db 29, BIND
	db 35, MINIMIZE
	db 40, TOXIC
	db 46, SLUDGE
	db 51, ACID_ARMOR
	db 0

ShellderEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, CLOYSTER
	db 0
; Learnset
	db 12, SUPERSONIC
	db 17, WATER_GUN
	db 22, LEER
	db 27, AURORA_BEAM
	db 32, SPIKE_CANNON
	db 37, CLAMP
	db 43, ICE_BEAM
	db 49, HYDRO_PUMP
	db 0

CloysterEvosMoves:
; Evolutions
	db 0
; Learnset
	db 14, SUPERSONIC
	db 19, WATER_GUN
	db 25, LEER
	db 30, AURORA_BEAM
	db 36, SPIKE_CANNON
	db 41, CLAMP
	db 48, ICE_BEAM
	db 54, HYDRO_PUMP
	db 0

GastlyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0
; Learnset
	db 14, SMOG
	db 19, NIGHT_SHADE
	db 24, CONFUSE_RAY
	db 29, HYPNOSIS
	db 34, DREAM_EATER
	db 39, HEX  ; marcelnote - new move
	db 44, ACID_ARMOR
	db 0

HaunterEvosMoves:
; Evolutions
	db EVOLVE_TRADE, 1, GENGAR
	db 0
; Learnset
	db 15, SMOG
	db 20, NIGHT_SHADE
	db 26, CONFUSE_RAY
	db 31, HYPNOSIS
	db 37, DREAM_EATER
	db 42, HEX  ; marcelnote - new move
	db 48, ACID_ARMOR
	db 0

GengarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 17, SMOG
	db 23, NIGHT_SHADE
	db 29, CONFUSE_RAY
	db 35, HYPNOSIS
	db 41, DREAM_EATER
	db 47, HEX  ; marcelnote - new move
	db 53, ACID_ARMOR
	db 0

OnixEvosMoves:
; Evolutions
	db 0
; Learnset
	db 14, ROCK_THROW
	db 18, RAGE
	db 22, HARDEN
	db 26, DIG
	db 30, SHARPEN
	db 34, BIND
	db 38, SLAM
	db 42, ROCK_SLIDE
	db 44, AGILITY
	db 0

DrowzeeEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 26, HYPNO
	db 0
; Learnset
	db 11, DISABLE
	db 16, CONFUSION
	db 23, HEADBUTT
	db 28, POISON_GAS
	db 32, DREAM_EATER
	db 37, MEDITATE
	db 42, PSYCHIC_M
	db 0

HypnoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, DISABLE
	db 18, CONFUSION
	db 26, HEADBUTT
	db 31, POISON_GAS
	db 36, DREAM_EATER
	db 41, MEDITATE
	db 47, PSYCHIC_M
	db 0

KrabbyEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, KINGLER
	db 0
; Learnset
	db 12, VICEGRIP
	db 18, WITHDRAW
	db 24, STOMP
	db 29, CRABHAMMER
	db 35, SHARPEN
	db 40, CLAMP
	db 45, GUILLOTINE
	db 0

KinglerEvosMoves:
; Evolutions
	db 0
; Learnset
	db 14, VICEGRIP
	db 20, WITHDRAW
	db 27, STOMP
	db 32, CRABHAMMER
	db 39, SHARPEN
	db 44, CLAMP
	db 50, GUILLOTINE
	db 0

VoltorbEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0
; Learnset
	db 17, SONICBOOM
	db 21, SELFDESTRUCT
	db 25, THUNDERSHOCK
	db 29, LIGHT_SCREEN
	db 33, SWIFT
	db 38, ELECTRO_BALL  ; new signature move for VOLTORB and ELECTRODE
	db 43, EXPLOSION
	db 0

ElectrodeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 19, SONICBOOM
	db 24, SELFDESTRUCT
	db 28, THUNDERSHOCK
	db 32, LIGHT_SCREEN
	db 37, SWIFT
	db 42, ELECTRO_BALL  ; new signature move for VOLTORB and ELECTRODE
	db 48, EXPLOSION
	db 0

ExeggcuteEvosMoves:
; Evolutions
	db EVOLVE_ITEM, LEAF_STONE, 1, EXEGGUTOR
	db 0
; Learnset
	db 12, POISONPOWDER
	db 14, CONFUSION
	db 16, STUN_SPORE
	db 18, BARRAGE
	db 20, LEECH_SEED
	db 25, REFLECT
	db 31, EGG_BOMB
	db 36, PSYBEAM
	db 42, SOLARBEAM
	db 48, SLEEP_POWDER
	db 0

ExeggutorEvosMoves:
; Evolutions
	db 0
; Learnset
	db 14, POISONPOWDER
	db 16, CONFUSION
	db 18, STUN_SPORE
	db 20, BARRAGE
	db 23, LEECH_SEED
	db 27, REFLECT
	db 28, STOMP
	db 34, EGG_BOMB
	db 40, PSYBEAM
	db 47, SOLARBEAM
	db 53, SLEEP_POWDER
	db 0

CuboneEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0
; Learnset
	db 18, LEER
	db 23, SKULL_BASH
	db 28, FOCUS_ENERGY
	db 33, HEADBUTT
	db 38, THRASH
	db 43, BONEMERANG
	db 0

MarowakEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, LEER
	db 26, SKULL_BASH
	db 31, FOCUS_ENERGY
	db 36, HEADBUTT
	db 42, THRASH
	db 48, BONEMERANG
	db 0

HitmonleeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 23, LOW_KICK
	db 28, FOCUS_ENERGY
	db 33, ROLLING_KICK
	db 38, JUMP_KICK
	db 43, COUNTER
	db 48, HI_JUMP_KICK
	db 53, MEGA_KICK
	db 0

HitmonchanEvosMoves:
; Evolutions
	db 0
; Learnset
	db 23, MEGA_PUNCH
	db 28, FOCUS_ENERGY
	db 33, FIRE_PUNCH
	db 38, ICE_PUNCH
	db 43, THUNDERPUNCH
	db 48, DIZZY_PUNCH
	db 53, COUNTER
	db 0

LickitungEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, STOMP
	db 14, DISABLE
	db 21, DEFENSE_CURL
	db 28, BODY_SLAM
	db 36, SCREECH
	db 44, WRAP
	db 0

KoffingEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 35, WEEZING
	db 0
; Learnset
	db 20, SMOG
	db 24, SMOKESCREEN
	db 28, ACID
	db 32, SELFDESTRUCT
	db 36, SLUDGE
	db 40, HAZE
	db 45, EXPLOSION
	db 0

WeezingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 22, SMOG
	db 27, SMOKESCREEN
	db 31, ACID
	db 36, SELFDESTRUCT
	db 40, SLUDGE
	db 44, HAZE
	db 50, EXPLOSION
	db 0

RhyhornEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 42, RHYDON
	db 0
; Learnset
	db 13, STOMP
	db 19, FURY_ATTACK
	db 28, ROCK_THROW
	db 33, TAKE_DOWN
	db 38, ROCK_SLIDE
	db 44, HORN_DRILL
	db 50, EARTHQUAKE
	db 0

RhydonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, STOMP
	db 21, FURY_ATTACK
	db 31, ROCK_THROW
	db 37, TAKE_DOWN
	db 42, ROCK_SLIDE
	db 48, HORN_DRILL
	db 55, EARTHQUAKE
	db 0

ChanseyEvosMoves:
; Evolutions
	db 0
; Learnset
	db 5, GROWL
	db 9, TAIL_WHIP
	db 13, SOFTBOILED
	db 17, DOUBLESLAP
	db 23, MINIMIZE
	db 29, SING
	db 35, EGG_BOMB
	db 41, DEFENSE_CURL
	db 47, LIGHT_SCREEN
	db 54, DOUBLE_EDGE
	db 0

TangelaEvosMoves:
; Evolutions
	db 0
; Learnset
	db 14, ABSORB
	db 18, BIND
	db 23, VINE_WHIP
	db 28, POISONPOWDER
	db 30, STUN_SPORE
	db 35, GROWTH
	db 40, SLEEP_POWDER
	db 45, BODY_SLAM
	db 0

KangaskhanEvosMoves:
; Evolutions
	db 0
; Learnset
	db 14, LEER
	db 20, BITE
	db 26, MEGA_PUNCH
	db 32, DIZZY_PUNCH
	db 38, THRASH
	db 44, SLAM
	db 50, DOUBLE_EDGE
	db 0

HorseaEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 32, SEADRA
	db 0
; Learnset
	db 9, SMOKESCREEN
	db 15, LEER
	db 20, WATER_GUN
	db 26, FOCUS_ENERGY
	db 33, SLAM
	db 37, AGILITY
	db 46, HYDRO_PUMP
	db 0

SeadraEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, SMOKESCREEN
	db 17, LEER
	db 23, WATER_GUN
	db 29, FOCUS_ENERGY
	db 37, SLAM
	db 41, AGILITY
	db 51, HYDRO_PUMP
	db 0

GoldeenEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 33, SEAKING
	db 0
; Learnset
	db 9, BUBBLE
	db 12, SUPERSONIC
	db 16, FURY_ATTACK
	db 20, WATER_GUN
	db 24, HORN_ATTACK
	db 29, WATERFALL
	db 34, HORN_DRILL
	db 40, AGILITY
	db 0

SeakingEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, BUBBLE
	db 14, SUPERSONIC
	db 18, FURY_ATTACK
	db 23, WATER_GUN
	db 27, HORN_ATTACK
	db 32, WATERFALL
	db 38, HORN_DRILL
	db 44, AGILITY
	db 0

StaryuEvosMoves:
; Evolutions
	db EVOLVE_ITEM, WATER_STONE, 1, STARMIE
	db 0
; Learnset
	db 10, HARDEN
	db 15, WATER_GUN
	db 20, RECOVER
	db 25, SWIFT
	db 30, PSYBEAM
	db 35, MINIMIZE
	db 41, LIGHT_SCREEN
	db 47, HYDRO_PUMP
	db 0

StarmieEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, HARDEN
	db 17, WATER_GUN
	db 23, RECOVER
	db 28, SWIFT
	db 33, PSYBEAM
	db 39, MINIMIZE
	db 46, LIGHT_SCREEN
	db 52, HYDRO_PUMP
	db 0

MrMimeEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, CONFUSION
	db 18, LIGHT_SCREEN
	db 24, DOUBLESLAP
	db 29, REFLECT
	db 34, PSYBEAM
	db 39, MEDITATE
	db 45, SUBSTITUTE
	db 0

ScytherEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, WING_ATTACK
	db 20, FOCUS_ENERGY
	db 24, SHARPEN
	db 29, SLASH
	db 34, RAZOR_WIND
	db 39, AGILITY
	db 44, DOUBLE_TEAM
	db 49, SWORDS_DANCE
	db 0

JynxEvosMoves:
; Evolutions
	db 0
; Learnset
	db 8, LICK
	db 13, CONFUSION
	db 19, DOUBLESLAP
	db 25, LOVELY_KISS
	db 31, ICE_PUNCH
	db 38, BODY_SLAM
	db 46, THRASH
	db 54, BLIZZARD
	db 0

ElectabuzzEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, LEER
	db 21, SWIFT
	db 27, THUNDER_WAVE
	db 33, THUNDERPUNCH
	db 39, SCREECH
	db 45, LIGHT_SCREEN
	db 52, THUNDER
	db 0

MagmarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 15, LEER
	db 21, SMOG
	db 27, SMOKESCREEN
	db 33, FIRE_PUNCH
	db 39, CONFUSE_RAY
	db 45, FLAMETHROWER
	db 52, FIRE_BLAST
	db 0

PinsirEvosMoves:
; Evolutions
	db 0
; Learnset
	db 16, HARDEN
	db 20, FOCUS_ENERGY
	db 24, SEISMIC_TOSS
	db 29, GUILLOTINE
	db 34, SLASH
	db 39, PIN_MISSILE
	db 44, SUBMISSION
	db 49, SWORDS_DANCE
	db 0

TaurosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 7, TAIL_WHIP
	db 14, HORN_ATTACK
	db 21, STOMP
	db 28, RAGE
	db 35, REST
	db 43, THRASH
	db 51, DOUBLE_EDGE
	db 0

MagikarpEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0
; Learnset
	db 15, TACKLE
	db 0

GyaradosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, BITE
	db 25, DRAGON_RAGE
	db 30, LEER
	db 35, THRASH
	db 40, HYDRO_PUMP
	db 46, SLAM
	db 52, HYPER_BEAM
	db 0

LaprasEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, MIST
	db 16, SING
	db 20, AURORA_BEAM
	db 25, BODY_SLAM
	db 31, CONFUSE_RAY
	db 38, ICE_BEAM
	db 46, HYDRO_PUMP
	db 55, BLIZZARD
	db 0

DittoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

EeveeEvosMoves:
; Evolutions
	db EVOLVE_ITEM, FIRE_STONE, 1, FLAREON
	db EVOLVE_ITEM, THUNDER_STONE, 1, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, 1, VAPOREON
	db 0
; Learnset
	db 10, QUICK_ATTACK
	db 15, TAIL_WHIP
	db 25, BITE
	db 31, FOCUS_ENERGY
	db 37, HEADBUTT
	db 43, TAKE_DOWN
	db 49, TRI_ATTACK
	db 0

VaporeonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, QUICK_ATTACK
	db 17, TAIL_WHIP
	db 27, WATER_GUN
	db 32, HAZE
	db 37, AURORA_BEAM
	db 42, ACID_ARMOR
	db 47, MIST
	db 52, HYDRO_PUMP
	db 0

JolteonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, QUICK_ATTACK
	db 17, TAIL_WHIP
	db 27, THUNDERSHOCK
	db 32, DOUBLE_KICK
	db 37, THUNDER_WAVE
	db 42, PIN_MISSILE
	db 47, AGILITY
	db 52, THUNDER
	db 0

FlareonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, QUICK_ATTACK
	db 17, TAIL_WHIP
	db 27, EMBER
	db 32, GROWTH
	db 37, FLAMETHROWER
	db 42, BARRIER
	db 47, TAKE_DOWN
	db 52, FIRE_SPIN
	db 0

PorygonEvosMoves:
; Evolutions
	db 0
; Learnset
	db 13, SHARPEN
	db 18, THUNDERSHOCK
	db 23, PSYBEAM
	db 28, RECOVER
	db 35, AGILITY
	db 42, TRI_ATTACK
	db 49, REFLECT
	db 0

OmanyteEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0
; Learnset
	db 19, WATER_GUN
	db 25, ROCK_THROW
	db 31, LEER
	db 35, HEADBUTT
	db 41, SPIKE_CANNON
	db 41, CLAMP
	db 45, HYDRO_PUMP
	db 0

OmastarEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, WATER_GUN
	db 27, ROCK_THROW
	db 34, LEER
	db 38, HEADBUTT
	db 40, SPIKE_CANNON
	db 45, CLAMP
	db 49, HYDRO_PUMP
	db 0

KabutoEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 40, KABUTOPS
	db 0
; Learnset
	db 19, WATER_GUN
	db 25, ABSORB
	db 31, LEER
	db 35, SLASH
	db 41, SWORDS_DANCE
	db 41, ROCK_SLIDE
	db 45, HYDRO_PUMP
	db 0

KabutopsEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, WATER_GUN
	db 27, ABSORB
	db 34, LEER
	db 38, SLASH
	db 40, SWORDS_DANCE
	db 45, ROCK_SLIDE
	db 49, HYDRO_PUMP
	db 0

AerodactylEvosMoves:
; Evolutions
	db 0
; Learnset
	db 20, SUPERSONIC
	db 27, BITE
	db 33, SCREECH
	db 39, TAKE_DOWN
	db 45, ROCK_SLIDE
	db 52, HYPER_BEAM
	db 0

SnorlaxEvosMoves:
; Evolutions
	db 0
; Learnset
	db 31, DEFENSE_CURL
	db 35, BODY_SLAM
	db 40, LICK
	db 46, DOUBLE_EDGE
	db 53, HYPER_BEAM
	db 0

ArticunoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 25, MIST
	db 51, BLIZZARD
	db 55, AGILITY
	db 60, REFLECT
	db 65, DOUBLE_TEAM
	db 0

ZapdosEvosMoves:
; Evolutions
	db 0
; Learnset
	db 25, THUNDER_WAVE
	db 51, THUNDER
	db 55, AGILITY
	db 60, LIGHT_SCREEN
	db 65, DOUBLE_TEAM
	db 0

MoltresEvosMoves:
; Evolutions
	db 0
; Learnset
	db 25, SCREECH
	db 51, SKY_ATTACK
	db 55, AGILITY
	db 60, FLAMETHROWER
	db 65, DOUBLE_TEAM
	db 0

DratiniEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0
; Learnset
	db 10, THUNDER_WAVE
	db 20, AGILITY
	db 27, DRAGON_RAGE
	db 34, SLAM
	db 42, BARRIER
	db 50, HYPER_BEAM
	db 0

DragonairEvosMoves:
; Evolutions
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0
; Learnset
	db 11, THUNDER_WAVE
	db 22, AGILITY
	db 29, DRAGON_RAGE
	db 37, SLAM
	db 46, BARRIER
	db 55, HYPER_BEAM
	db 0

DragoniteEvosMoves:
; Evolutions
	db 0
; Learnset
	db 12, THUNDER_WAVE
	db 24, AGILITY
	db 31, DRAGON_RAGE
	db 40, SLAM
	db 50, BARRIER
	db 55, WING_ATTACK
	db 60, HYPER_BEAM
	db 0

MewtwoEvosMoves:
; Evolutions
	db 0
; Learnset
	db 11, DISABLE
	db 22, PSYBEAM
	db 33, SWIFT
	db 44, BARRIER
	db 55, PSYCHIC_M
	db 66, RECOVER
	db 75, MIST
	db 81, AMNESIA
	db 0

MewEvosMoves:
; Evolutions
	db 0
; Learnset
	db 10, TRANSFORM
	db 20, MEGA_PUNCH
	db 30, METRONOME
	db 40, PSYCHIC_M
	db 50, BARRIER
	db 60, AMNESIA
	db 0

FossilKabutopsEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

FossilAerodactylEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MonGhostEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo1FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo20EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo32EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo34EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo38EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo3DEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo3EEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo3FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo43EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo44EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo45EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo4FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo50EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo51EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo56EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo57EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo5EEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo5FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo73EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo79EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo7AEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo7FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo86EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo87EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo8AEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo8CEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo92EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo9CEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNo9FEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoA0EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoA1EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoA2EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoACEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoAEEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoAFEvosMoves:
; Evolutions
	db 0
; Learnset
	db 0

MissingNoB5EvosMoves:
; Evolutions
	db 0
; Learnset
	db 0
