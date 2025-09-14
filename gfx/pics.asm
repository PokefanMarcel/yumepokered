; marcelnote - reorganized

; tentative macro to get sprite size from addresses
;MACRO INCBIN_MON
;	SECTION STRCAT(STRLWR("\1"), " Sprites"), ROMX
;
;\1PicFront:: INCBIN STRCAT("gfx/pokemon/front/", STRLWR("\2"), ".2bpp")
;\1PicBack::  INCBIN STRCAT("gfx/pokemon/back/",  STRLWR("\2"), "b.2bpp")
;
;	DEF _tiles = (\1PicBack - \1PicFront) / $10
;	ASSERT _tiles == 25 || _tiles == 36 || _tiles == 49, "\1's sprite has unexpected size"
;
;	IF _tiles == 25
;		DEF \1PicFrontDim = $55
;	ELIF _tiles == 36
;		DEF \1PicFrontDim = $66
;	ELSE
;		DEF \1PicFrontDim = $77
;	ENDC
;	EXPORT \1PicFrontDim
;ENDM


SECTION "Bulbasaur Sprites", ROMX
BulbasaurPicFront::    INCBIN "gfx/pokemon/front/bulbasaur.2bpp"
BulbasaurPicBack::     INCBIN "gfx/pokemon/back/bulbasaurb.2bpp"

SECTION "Ivysaur Sprites", ROMX
IvysaurPicFront::      INCBIN "gfx/pokemon/front/ivysaur.2bpp"
IvysaurPicBack::       INCBIN "gfx/pokemon/back/ivysaurb.2bpp"

SECTION "Venusaur Sprites", ROMX
VenusaurPicFront::     INCBIN "gfx/pokemon/front/venusaur.2bpp"
VenusaurPicBack::      INCBIN "gfx/pokemon/back/venusaurb.2bpp"

SECTION "Charmander Sprites", ROMX
CharmanderPicFront::   INCBIN "gfx/pokemon/front/charmander.2bpp"
CharmanderPicBack::    INCBIN "gfx/pokemon/back/charmanderb.2bpp"

SECTION "Charmeleon Sprites", ROMX
CharmeleonPicFront::   INCBIN "gfx/pokemon/front/charmeleon.2bpp"
CharmeleonPicBack::    INCBIN "gfx/pokemon/back/charmeleonb.2bpp"

SECTION "Charizard Sprites", ROMX
CharizardPicFront::    INCBIN "gfx/pokemon/front/charizard.2bpp"
CharizardPicBack::     INCBIN "gfx/pokemon/back/charizardb.2bpp"

SECTION "Squirtle Sprites", ROMX
SquirtlePicFront::     INCBIN "gfx/pokemon/front/squirtle.2bpp"
SquirtlePicBack::      INCBIN "gfx/pokemon/back/squirtleb.2bpp"

SECTION "Wartortle Sprites", ROMX
WartortlePicFront::    INCBIN "gfx/pokemon/front/wartortle.2bpp"
WartortlePicBack::     INCBIN "gfx/pokemon/back/wartortleb.2bpp"

SECTION "Blastoise Sprites", ROMX
BlastoisePicFront::    INCBIN "gfx/pokemon/front/blastoise.2bpp"
BlastoisePicBack::     INCBIN "gfx/pokemon/back/blastoiseb.2bpp"

SECTION "Caterpie Sprites", ROMX
CaterpiePicFront::     INCBIN "gfx/pokemon/front/caterpie.2bpp"
CaterpiePicBack::      INCBIN "gfx/pokemon/back/caterpieb.2bpp"

SECTION "Metapod Sprites", ROMX
MetapodPicFront::      INCBIN "gfx/pokemon/front/metapod.2bpp"
MetapodPicBack::       INCBIN "gfx/pokemon/back/metapodb.2bpp"

SECTION "Butterfree Sprites", ROMX
ButterfreePicFront::   INCBIN "gfx/pokemon/front/butterfree.2bpp"
ButterfreePicBack::    INCBIN "gfx/pokemon/back/butterfreeb.2bpp"

SECTION "Weedle Sprites", ROMX
WeedlePicFront::       INCBIN "gfx/pokemon/front/weedle.2bpp"
WeedlePicBack::        INCBIN "gfx/pokemon/back/weedleb.2bpp"

SECTION "Kakuna Sprites", ROMX
KakunaPicFront::       INCBIN "gfx/pokemon/front/kakuna.2bpp"
KakunaPicBack::        INCBIN "gfx/pokemon/back/kakunab.2bpp"

SECTION "Beedrill Sprites", ROMX
BeedrillPicFront::     INCBIN "gfx/pokemon/front/beedrill.2bpp"
BeedrillPicBack::      INCBIN "gfx/pokemon/back/beedrillb.2bpp"

SECTION "Pidgey Sprites", ROMX
PidgeyPicFront::       INCBIN "gfx/pokemon/front/pidgey.2bpp"
PidgeyPicBack::        INCBIN "gfx/pokemon/back/pidgeyb.2bpp"

SECTION "Pidgeotto Sprites", ROMX
PidgeottoPicFront::    INCBIN "gfx/pokemon/front/pidgeotto.2bpp"
PidgeottoPicBack::     INCBIN "gfx/pokemon/back/pidgeottob.2bpp"

SECTION "Pidgeot Sprites", ROMX
PidgeotPicFront::      INCBIN "gfx/pokemon/front/pidgeot.2bpp"
PidgeotPicBack::       INCBIN "gfx/pokemon/back/pidgeotb.2bpp"

SECTION "Rattata Sprites", ROMX
RattataPicFront::      INCBIN "gfx/pokemon/front/rattata.2bpp"
RattataPicBack::       INCBIN "gfx/pokemon/back/rattatab.2bpp"

SECTION "Raticate Sprites", ROMX
RaticatePicFront::     INCBIN "gfx/pokemon/front/raticate.2bpp"
RaticatePicBack::      INCBIN "gfx/pokemon/back/raticateb.2bpp"

SECTION "Spearow Sprites", ROMX
SpearowPicFront::      INCBIN "gfx/pokemon/front/spearow.2bpp"
SpearowPicBack::       INCBIN "gfx/pokemon/back/spearowb.2bpp"

SECTION "Fearow Sprites", ROMX
FearowPicFront::       INCBIN "gfx/pokemon/front/fearow.2bpp"
FearowPicBack::        INCBIN "gfx/pokemon/back/fearowb.2bpp"

SECTION "Ekans Sprites", ROMX
EkansPicFront::        INCBIN "gfx/pokemon/front/ekans.2bpp"
EkansPicBack::         INCBIN "gfx/pokemon/back/ekansb.2bpp"

SECTION "Arbok Sprites", ROMX
ArbokPicFront::        INCBIN "gfx/pokemon/front/arbok.2bpp"
ArbokPicBack::         INCBIN "gfx/pokemon/back/arbokb.2bpp"

SECTION "Pikachu Sprites", ROMX
PikachuPicFront::      INCBIN "gfx/pokemon/front/pikachu.2bpp"
PikachuPicBack::       INCBIN "gfx/pokemon/back/pikachub.2bpp"

SECTION "Raichu Sprites", ROMX
RaichuPicFront::       INCBIN "gfx/pokemon/front/raichu.2bpp"
RaichuPicBack::        INCBIN "gfx/pokemon/back/raichub.2bpp"

SECTION "Sandshrew Sprites", ROMX
SandshrewPicFront::    INCBIN "gfx/pokemon/front/sandshrew.2bpp"
SandshrewPicBack::     INCBIN "gfx/pokemon/back/sandshrewb.2bpp"

SECTION "Sandslash Sprites", ROMX
SandslashPicFront::    INCBIN "gfx/pokemon/front/sandslash.2bpp"
SandslashPicBack::     INCBIN "gfx/pokemon/back/sandslashb.2bpp"

SECTION "NidoranF Sprites", ROMX
NidoranFPicFront::     INCBIN "gfx/pokemon/front/nidoranf.2bpp"
NidoranFPicBack::      INCBIN "gfx/pokemon/back/nidoranfb.2bpp"

SECTION "Nidorina Sprites", ROMX
NidorinaPicFront::     INCBIN "gfx/pokemon/front/nidorina.2bpp"
NidorinaPicBack::      INCBIN "gfx/pokemon/back/nidorinab.2bpp"

SECTION "Nidoqueen Sprites", ROMX
NidoqueenPicFront::    INCBIN "gfx/pokemon/front/nidoqueen.2bpp"
NidoqueenPicBack::     INCBIN "gfx/pokemon/back/nidoqueenb.2bpp"

SECTION "NidoranM Sprites", ROMX
NidoranMPicFront::     INCBIN "gfx/pokemon/front/nidoranm.2bpp"
NidoranMPicBack::      INCBIN "gfx/pokemon/back/nidoranmb.2bpp"

SECTION "Nidorino Sprites", ROMX
NidorinoPicFront::     INCBIN "gfx/pokemon/front/nidorino.2bpp"
NidorinoPicBack::      INCBIN "gfx/pokemon/back/nidorinob.2bpp"

SECTION "Nidoking Sprites", ROMX
NidokingPicFront::     INCBIN "gfx/pokemon/front/nidoking.2bpp"
NidokingPicBack::      INCBIN "gfx/pokemon/back/nidokingb.2bpp"

SECTION "Clefairy Sprites", ROMX
ClefairyPicFront::     INCBIN "gfx/pokemon/front/clefairy.2bpp"
ClefairyPicBack::      INCBIN "gfx/pokemon/back/clefairyb.2bpp"

SECTION "Clefable Sprites", ROMX
ClefablePicFront::     INCBIN "gfx/pokemon/front/clefable.2bpp"
ClefablePicBack::      INCBIN "gfx/pokemon/back/clefableb.2bpp"

SECTION "Vulpix Sprites", ROMX
VulpixPicFront::       INCBIN "gfx/pokemon/front/vulpix.2bpp"
VulpixPicBack::        INCBIN "gfx/pokemon/back/vulpixb.2bpp"

SECTION "Ninetales Sprites", ROMX
NinetalesPicFront::    INCBIN "gfx/pokemon/front/ninetales.2bpp"
NinetalesPicBack::     INCBIN "gfx/pokemon/back/ninetalesb.2bpp"

SECTION "Jigglypuff Sprites", ROMX
JigglypuffPicFront::   INCBIN "gfx/pokemon/front/jigglypuff.2bpp"
JigglypuffPicBack::    INCBIN "gfx/pokemon/back/jigglypuffb.2bpp"

SECTION "Wigglytuff Sprites", ROMX
WigglytuffPicFront::   INCBIN "gfx/pokemon/front/wigglytuff.2bpp"
WigglytuffPicBack::    INCBIN "gfx/pokemon/back/wigglytuffb.2bpp"

SECTION "Zubat Sprites", ROMX
ZubatPicFront::        INCBIN "gfx/pokemon/front/zubat.2bpp"
ZubatPicBack::         INCBIN "gfx/pokemon/back/zubatb.2bpp"

SECTION "Golbat Sprites", ROMX
GolbatPicFront::       INCBIN "gfx/pokemon/front/golbat.2bpp"
GolbatPicBack::        INCBIN "gfx/pokemon/back/golbatb.2bpp"

SECTION "Oddish Sprites", ROMX
OddishPicFront::       INCBIN "gfx/pokemon/front/oddish.2bpp"
OddishPicBack::        INCBIN "gfx/pokemon/back/oddishb.2bpp"

SECTION "Gloom Sprites", ROMX
GloomPicFront::        INCBIN "gfx/pokemon/front/gloom.2bpp"
GloomPicBack::         INCBIN "gfx/pokemon/back/gloomb.2bpp"

SECTION "Vileplume Sprites", ROMX
VileplumePicFront::    INCBIN "gfx/pokemon/front/vileplume.2bpp"
VileplumePicBack::     INCBIN "gfx/pokemon/back/vileplumeb.2bpp"

SECTION "Paras Sprites", ROMX
ParasPicFront::        INCBIN "gfx/pokemon/front/paras.2bpp"
ParasPicBack::         INCBIN "gfx/pokemon/back/parasb.2bpp"

SECTION "Parasect Sprites", ROMX
ParasectPicFront::     INCBIN "gfx/pokemon/front/parasect.2bpp"
ParasectPicBack::      INCBIN "gfx/pokemon/back/parasectb.2bpp"

SECTION "Venonat Sprites", ROMX
VenonatPicFront::      INCBIN "gfx/pokemon/front/venonat.2bpp"
VenonatPicBack::       INCBIN "gfx/pokemon/back/venonatb.2bpp"

SECTION "Venomoth Sprites", ROMX
VenomothPicFront::     INCBIN "gfx/pokemon/front/venomoth.2bpp"
VenomothPicBack::      INCBIN "gfx/pokemon/back/venomothb.2bpp"

SECTION "Diglett Sprites", ROMX
DiglettPicFront::      INCBIN "gfx/pokemon/front/diglett.2bpp"
DiglettPicBack::       INCBIN "gfx/pokemon/back/diglettb.2bpp"

SECTION "Dugtrio Sprites", ROMX
DugtrioPicFront::      INCBIN "gfx/pokemon/front/dugtrio.2bpp"
DugtrioPicBack::       INCBIN "gfx/pokemon/back/dugtriob.2bpp"

SECTION "Meowth Sprites", ROMX
MeowthPicFront::       INCBIN "gfx/pokemon/front/meowth.2bpp"
MeowthPicBack::        INCBIN "gfx/pokemon/back/meowthb.2bpp"

SECTION "Persian Sprites", ROMX
PersianPicFront::      INCBIN "gfx/pokemon/front/persian.2bpp"
PersianPicBack::       INCBIN "gfx/pokemon/back/persianb.2bpp"

SECTION "Psyduck Sprites", ROMX
PsyduckPicFront::      INCBIN "gfx/pokemon/front/psyduck.2bpp"
PsyduckPicBack::       INCBIN "gfx/pokemon/back/psyduckb.2bpp"

SECTION "Golduck Sprites", ROMX
GolduckPicFront::      INCBIN "gfx/pokemon/front/golduck.2bpp"
GolduckPicBack::       INCBIN "gfx/pokemon/back/golduckb.2bpp"

SECTION "Mankey Sprites", ROMX
MankeyPicFront::       INCBIN "gfx/pokemon/front/mankey.2bpp"
MankeyPicBack::        INCBIN "gfx/pokemon/back/mankeyb.2bpp"

SECTION "Primeape Sprites", ROMX
PrimeapePicFront::     INCBIN "gfx/pokemon/front/primeape.2bpp"
PrimeapePicBack::      INCBIN "gfx/pokemon/back/primeapeb.2bpp"

SECTION "Growlithe Sprites", ROMX
GrowlithePicFront::    INCBIN "gfx/pokemon/front/growlithe.2bpp"
GrowlithePicBack::     INCBIN "gfx/pokemon/back/growlitheb.2bpp"

SECTION "Arcanine Sprites", ROMX
ArcaninePicFront::     INCBIN "gfx/pokemon/front/arcanine.2bpp"
ArcaninePicBack::      INCBIN "gfx/pokemon/back/arcanineb.2bpp"

SECTION "Poliwag Sprites", ROMX
PoliwagPicFront::      INCBIN "gfx/pokemon/front/poliwag.2bpp"
PoliwagPicBack::       INCBIN "gfx/pokemon/back/poliwagb.2bpp"

SECTION "Poliwhirl Sprites", ROMX
PoliwhirlPicFront::    INCBIN "gfx/pokemon/front/poliwhirl.2bpp"
PoliwhirlPicBack::     INCBIN "gfx/pokemon/back/poliwhirlb.2bpp"

SECTION "Poliwrath Sprites", ROMX
PoliwrathPicFront::    INCBIN "gfx/pokemon/front/poliwrath.2bpp"
PoliwrathPicBack::     INCBIN "gfx/pokemon/back/poliwrathb.2bpp"

SECTION "Abra Sprites", ROMX
AbraPicFront::         INCBIN "gfx/pokemon/front/abra.2bpp"
AbraPicBack::          INCBIN "gfx/pokemon/back/abrab.2bpp"

SECTION "Kadabra Sprites", ROMX
KadabraPicFront::      INCBIN "gfx/pokemon/front/kadabra.2bpp"
KadabraPicBack::       INCBIN "gfx/pokemon/back/kadabrab.2bpp"

SECTION "Alakazam Sprites", ROMX
AlakazamPicFront::     INCBIN "gfx/pokemon/front/alakazam.2bpp"
AlakazamPicBack::      INCBIN "gfx/pokemon/back/alakazamb.2bpp"

SECTION "Machop Sprites", ROMX
MachopPicFront::       INCBIN "gfx/pokemon/front/machop.2bpp"
MachopPicBack::        INCBIN "gfx/pokemon/back/machopb.2bpp"

SECTION "Machoke Sprites", ROMX
MachokePicFront::      INCBIN "gfx/pokemon/front/machoke.2bpp"
MachokePicBack::       INCBIN "gfx/pokemon/back/machokeb.2bpp"

SECTION "Machamp Sprites", ROMX
MachampPicFront::      INCBIN "gfx/pokemon/front/machamp.2bpp"
MachampPicBack::       INCBIN "gfx/pokemon/back/machampb.2bpp"

SECTION "Bellsprout Sprites", ROMX
BellsproutPicFront::   INCBIN "gfx/pokemon/front/bellsprout.2bpp"
BellsproutPicBack::    INCBIN "gfx/pokemon/back/bellsproutb.2bpp"

SECTION "Weepinbell Sprites", ROMX
WeepinbellPicFront::   INCBIN "gfx/pokemon/front/weepinbell.2bpp"
WeepinbellPicBack::    INCBIN "gfx/pokemon/back/weepinbellb.2bpp"

SECTION "Victreebel Sprites", ROMX
VictreebelPicFront::   INCBIN "gfx/pokemon/front/victreebel.2bpp"
VictreebelPicBack::    INCBIN "gfx/pokemon/back/victreebelb.2bpp"

SECTION "Tentacool Sprites", ROMX
TentacoolPicFront::    INCBIN "gfx/pokemon/front/tentacool.2bpp"
TentacoolPicBack::     INCBIN "gfx/pokemon/back/tentacoolb.2bpp"

SECTION "Tentacruel Sprites", ROMX
TentacruelPicFront::   INCBIN "gfx/pokemon/front/tentacruel.2bpp"
TentacruelPicBack::    INCBIN "gfx/pokemon/back/tentacruelb.2bpp"

SECTION "Geodude Sprites", ROMX
GeodudePicFront::      INCBIN "gfx/pokemon/front/geodude.2bpp"
GeodudePicBack::       INCBIN "gfx/pokemon/back/geodudeb.2bpp"

SECTION "Graveler Sprites", ROMX
GravelerPicFront::     INCBIN "gfx/pokemon/front/graveler.2bpp"
GravelerPicBack::      INCBIN "gfx/pokemon/back/gravelerb.2bpp"

SECTION "Golem Sprites", ROMX
GolemPicFront::        INCBIN "gfx/pokemon/front/golem.2bpp"
GolemPicBack::         INCBIN "gfx/pokemon/back/golemb.2bpp"

SECTION "Ponyta Sprites", ROMX
PonytaPicFront::       INCBIN "gfx/pokemon/front/ponyta.2bpp"
PonytaPicBack::        INCBIN "gfx/pokemon/back/ponytab.2bpp"

SECTION "Rapidash Sprites", ROMX
RapidashPicFront::     INCBIN "gfx/pokemon/front/rapidash.2bpp"
RapidashPicBack::      INCBIN "gfx/pokemon/back/rapidashb.2bpp"

SECTION "Slowpoke Sprites", ROMX
SlowpokePicFront::     INCBIN "gfx/pokemon/front/slowpoke.2bpp"
SlowpokePicBack::      INCBIN "gfx/pokemon/back/slowpokeb.2bpp"

SECTION "Slowbro Sprites", ROMX
SlowbroPicFront::      INCBIN "gfx/pokemon/front/slowbro.2bpp"
SlowbroPicBack::       INCBIN "gfx/pokemon/back/slowbrob.2bpp"

SECTION "Magnemite Sprites", ROMX
MagnemitePicFront::    INCBIN "gfx/pokemon/front/magnemite.2bpp"
MagnemitePicBack::     INCBIN "gfx/pokemon/back/magnemiteb.2bpp"

SECTION "Magneton Sprites", ROMX
MagnetonPicFront::     INCBIN "gfx/pokemon/front/magneton.2bpp"
MagnetonPicBack::      INCBIN "gfx/pokemon/back/magnetonb.2bpp"

SECTION "Farfetchd Sprites", ROMX
FarfetchdPicFront::    INCBIN "gfx/pokemon/front/farfetchd.2bpp"
FarfetchdPicBack::     INCBIN "gfx/pokemon/back/farfetchdb.2bpp"

SECTION "Doduo Sprites", ROMX
DoduoPicFront::        INCBIN "gfx/pokemon/front/doduo.2bpp"
DoduoPicBack::         INCBIN "gfx/pokemon/back/doduob.2bpp"

SECTION "Dodrio Sprites", ROMX
DodrioPicFront::       INCBIN "gfx/pokemon/front/dodrio.2bpp"
DodrioPicBack::        INCBIN "gfx/pokemon/back/dodriob.2bpp"

SECTION "Seel Sprites", ROMX
SeelPicFront::         INCBIN "gfx/pokemon/front/seel.2bpp"
SeelPicBack::          INCBIN "gfx/pokemon/back/seelb.2bpp"

SECTION "Dewgong Sprites", ROMX
DewgongPicFront::      INCBIN "gfx/pokemon/front/dewgong.2bpp"
DewgongPicBack::       INCBIN "gfx/pokemon/back/dewgongb.2bpp"

SECTION "Grimer Sprites", ROMX
GrimerPicFront::       INCBIN "gfx/pokemon/front/grimer.2bpp"
GrimerPicBack::        INCBIN "gfx/pokemon/back/grimerb.2bpp"

SECTION "Muk Sprites", ROMX
MukPicFront::          INCBIN "gfx/pokemon/front/muk.2bpp"
MukPicBack::           INCBIN "gfx/pokemon/back/mukb.2bpp"

SECTION "Shellder Sprites", ROMX
ShellderPicFront::     INCBIN "gfx/pokemon/front/shellder.2bpp"
ShellderPicBack::      INCBIN "gfx/pokemon/back/shellderb.2bpp"

SECTION "Cloyster Sprites", ROMX
CloysterPicFront::     INCBIN "gfx/pokemon/front/cloyster.2bpp"
CloysterPicBack::      INCBIN "gfx/pokemon/back/cloysterb.2bpp"

SECTION "Gastly Sprites", ROMX
GastlyPicFront::       INCBIN "gfx/pokemon/front/gastly.2bpp"
GastlyPicBack::        INCBIN "gfx/pokemon/back/gastlyb.2bpp"

SECTION "Haunter Sprites", ROMX
HaunterPicFront::      INCBIN "gfx/pokemon/front/haunter.2bpp"
HaunterPicBack::       INCBIN "gfx/pokemon/back/haunterb.2bpp"

SECTION "Gengar Sprites", ROMX
GengarPicFront::       INCBIN "gfx/pokemon/front/gengar.2bpp"
GengarPicBack::        INCBIN "gfx/pokemon/back/gengarb.2bpp"

SECTION "Onix Sprites", ROMX
OnixPicFront::         INCBIN "gfx/pokemon/front/onix.2bpp"
OnixPicBack::          INCBIN "gfx/pokemon/back/onixb.2bpp"

SECTION "Drowzee Sprites", ROMX
DrowzeePicFront::      INCBIN "gfx/pokemon/front/drowzee.2bpp"
DrowzeePicBack::       INCBIN "gfx/pokemon/back/drowzeeb.2bpp"

SECTION "Hypno Sprites", ROMX
HypnoPicFront::        INCBIN "gfx/pokemon/front/hypno.2bpp"
HypnoPicBack::         INCBIN "gfx/pokemon/back/hypnob.2bpp"

SECTION "Krabby Sprites", ROMX
KrabbyPicFront::       INCBIN "gfx/pokemon/front/krabby.2bpp"
KrabbyPicBack::        INCBIN "gfx/pokemon/back/krabbyb.2bpp"

SECTION "Kingler Sprites", ROMX
KinglerPicFront::      INCBIN "gfx/pokemon/front/kingler.2bpp"
KinglerPicBack::       INCBIN "gfx/pokemon/back/kinglerb.2bpp"

SECTION "Voltorb Sprites", ROMX
VoltorbPicFront::      INCBIN "gfx/pokemon/front/voltorb.2bpp"
VoltorbPicBack::       INCBIN "gfx/pokemon/back/voltorbb.2bpp"

SECTION "Electrode Sprites", ROMX
ElectrodePicFront::    INCBIN "gfx/pokemon/front/electrode.2bpp"
ElectrodePicBack::     INCBIN "gfx/pokemon/back/electrodeb.2bpp"

SECTION "Exeggcute Sprites", ROMX
ExeggcutePicFront::    INCBIN "gfx/pokemon/front/exeggcute.2bpp"
ExeggcutePicBack::     INCBIN "gfx/pokemon/back/exeggcuteb.2bpp"

SECTION "Exeggutor Sprites", ROMX
ExeggutorPicFront::    INCBIN "gfx/pokemon/front/exeggutor.2bpp"
ExeggutorPicBack::     INCBIN "gfx/pokemon/back/exeggutorb.2bpp"

SECTION "Cubone Sprites", ROMX
CubonePicFront::       INCBIN "gfx/pokemon/front/cubone.2bpp"
CubonePicBack::        INCBIN "gfx/pokemon/back/cuboneb.2bpp"

SECTION "Marowak Sprites", ROMX
MarowakPicFront::      INCBIN "gfx/pokemon/front/marowak.2bpp"
MarowakPicBack::       INCBIN "gfx/pokemon/back/marowakb.2bpp"

SECTION "Hitmonlee Sprites", ROMX
HitmonleePicFront::    INCBIN "gfx/pokemon/front/hitmonlee.2bpp"
HitmonleePicBack::     INCBIN "gfx/pokemon/back/hitmonleeb.2bpp"

SECTION "Hitmonchan Sprites", ROMX
HitmonchanPicFront::   INCBIN "gfx/pokemon/front/hitmonchan.2bpp"
HitmonchanPicBack::    INCBIN "gfx/pokemon/back/hitmonchanb.2bpp"

SECTION "Lickitung Sprites", ROMX
LickitungPicFront::    INCBIN "gfx/pokemon/front/lickitung.2bpp"
LickitungPicBack::     INCBIN "gfx/pokemon/back/lickitungb.2bpp"

SECTION "Koffing Sprites", ROMX
KoffingPicFront::      INCBIN "gfx/pokemon/front/koffing.2bpp"
KoffingPicBack::       INCBIN "gfx/pokemon/back/koffingb.2bpp"

SECTION "Weezing Sprites", ROMX
WeezingPicFront::      INCBIN "gfx/pokemon/front/weezing.2bpp"
WeezingPicBack::       INCBIN "gfx/pokemon/back/weezingb.2bpp"

SECTION "Rhyhorn Sprites", ROMX
RhyhornPicFront::      INCBIN "gfx/pokemon/front/rhyhorn.2bpp"
RhyhornPicBack::       INCBIN "gfx/pokemon/back/rhyhornb.2bpp"

SECTION "Rhydon Sprites", ROMX
RhydonPicFront::       INCBIN "gfx/pokemon/front/rhydon.2bpp"
RhydonPicBack::        INCBIN "gfx/pokemon/back/rhydonb.2bpp"

SECTION "Chansey Sprites", ROMX
ChanseyPicFront::      INCBIN "gfx/pokemon/front/chansey.2bpp"
ChanseyPicBack::       INCBIN "gfx/pokemon/back/chanseyb.2bpp"

SECTION "Tangela Sprites", ROMX
TangelaPicFront::      INCBIN "gfx/pokemon/front/tangela.2bpp"
TangelaPicBack::       INCBIN "gfx/pokemon/back/tangelab.2bpp"

SECTION "Kangaskhan Sprites", ROMX
KangaskhanPicFront::   INCBIN "gfx/pokemon/front/kangaskhan.2bpp"
KangaskhanPicBack::    INCBIN "gfx/pokemon/back/kangaskhanb.2bpp"

SECTION "Horsea Sprites", ROMX
HorseaPicFront::       INCBIN "gfx/pokemon/front/horsea.2bpp"
HorseaPicBack::        INCBIN "gfx/pokemon/back/horseab.2bpp"

SECTION "Seadra Sprites", ROMX
SeadraPicFront::       INCBIN "gfx/pokemon/front/seadra.2bpp"
SeadraPicBack::        INCBIN "gfx/pokemon/back/seadrab.2bpp"

SECTION "Goldeen Sprites", ROMX
GoldeenPicFront::      INCBIN "gfx/pokemon/front/goldeen.2bpp"
GoldeenPicBack::       INCBIN "gfx/pokemon/back/goldeenb.2bpp"

SECTION "Seaking Sprites", ROMX
SeakingPicFront::      INCBIN "gfx/pokemon/front/seaking.2bpp"
SeakingPicBack::       INCBIN "gfx/pokemon/back/seakingb.2bpp"

SECTION "Staryu Sprites", ROMX
StaryuPicFront::       INCBIN "gfx/pokemon/front/staryu.2bpp"
StaryuPicBack::        INCBIN "gfx/pokemon/back/staryub.2bpp"

SECTION "Starmie Sprites", ROMX
StarmiePicFront::      INCBIN "gfx/pokemon/front/starmie.2bpp"
StarmiePicBack::       INCBIN "gfx/pokemon/back/starmieb.2bpp"

SECTION "MrMime Sprites", ROMX
MrMimePicFront::       INCBIN "gfx/pokemon/front/mr.mime.2bpp"
MrMimePicBack::        INCBIN "gfx/pokemon/back/mr.mimeb.2bpp"

SECTION "Scyther Sprites", ROMX
ScytherPicFront::      INCBIN "gfx/pokemon/front/scyther.2bpp"
ScytherPicBack::       INCBIN "gfx/pokemon/back/scytherb.2bpp"

SECTION "Jynx Sprites", ROMX
JynxPicFront::         INCBIN "gfx/pokemon/front/jynx.2bpp"
JynxPicBack::          INCBIN "gfx/pokemon/back/jynxb.2bpp"

SECTION "Electabuzz Sprites", ROMX
ElectabuzzPicFront::   INCBIN "gfx/pokemon/front/electabuzz.2bpp"
ElectabuzzPicBack::    INCBIN "gfx/pokemon/back/electabuzzb.2bpp"

SECTION "Magmar Sprites", ROMX
MagmarPicFront::       INCBIN "gfx/pokemon/front/magmar.2bpp"
MagmarPicBack::        INCBIN "gfx/pokemon/back/magmarb.2bpp"

SECTION "Pinsir Sprites", ROMX
PinsirPicFront::       INCBIN "gfx/pokemon/front/pinsir.2bpp"
PinsirPicBack::        INCBIN "gfx/pokemon/back/pinsirb.2bpp"

SECTION "Tauros Sprites", ROMX
TaurosPicFront::       INCBIN "gfx/pokemon/front/tauros.2bpp"
TaurosPicBack::        INCBIN "gfx/pokemon/back/taurosb.2bpp"

SECTION "Magikarp Sprites", ROMX
MagikarpPicFront::     INCBIN "gfx/pokemon/front/magikarp.2bpp"
MagikarpPicBack::      INCBIN "gfx/pokemon/back/magikarpb.2bpp"

SECTION "Gyarados Sprites", ROMX
GyaradosPicFront::     INCBIN "gfx/pokemon/front/gyarados.2bpp"
GyaradosPicBack::      INCBIN "gfx/pokemon/back/gyaradosb.2bpp"

SECTION "Lapras Sprites", ROMX
LaprasPicFront::       INCBIN "gfx/pokemon/front/lapras.2bpp"
LaprasPicBack::        INCBIN "gfx/pokemon/back/laprasb.2bpp"

SECTION "Ditto Sprites", ROMX
DittoPicFront::        INCBIN "gfx/pokemon/front/ditto.2bpp"
DittoPicBack::         INCBIN "gfx/pokemon/back/dittob.2bpp"

SECTION "Eevee Sprites", ROMX
EeveePicFront::        INCBIN "gfx/pokemon/front/eevee.2bpp"
EeveePicBack::         INCBIN "gfx/pokemon/back/eeveeb.2bpp"

SECTION "Vaporeon Sprites", ROMX
VaporeonPicFront::     INCBIN "gfx/pokemon/front/vaporeon.2bpp"
VaporeonPicBack::      INCBIN "gfx/pokemon/back/vaporeonb.2bpp"

SECTION "Jolteon Sprites", ROMX
JolteonPicFront::      INCBIN "gfx/pokemon/front/jolteon.2bpp"
JolteonPicBack::       INCBIN "gfx/pokemon/back/jolteonb.2bpp"

SECTION "Flareon Sprites", ROMX
FlareonPicFront::      INCBIN "gfx/pokemon/front/flareon.2bpp"
FlareonPicBack::       INCBIN "gfx/pokemon/back/flareonb.2bpp"

SECTION "Porygon Sprites", ROMX
PorygonPicFront::      INCBIN "gfx/pokemon/front/porygon.2bpp"
PorygonPicBack::       INCBIN "gfx/pokemon/back/porygonb.2bpp"

SECTION "Omanyte Sprites", ROMX
OmanytePicFront::      INCBIN "gfx/pokemon/front/omanyte.2bpp"
OmanytePicBack::       INCBIN "gfx/pokemon/back/omanyteb.2bpp"

SECTION "Omastar Sprites", ROMX
OmastarPicFront::      INCBIN "gfx/pokemon/front/omastar.2bpp"
OmastarPicBack::       INCBIN "gfx/pokemon/back/omastarb.2bpp"

SECTION "Kabuto Sprites", ROMX
KabutoPicFront::       INCBIN "gfx/pokemon/front/kabuto.2bpp"
KabutoPicBack::        INCBIN "gfx/pokemon/back/kabutob.2bpp"

SECTION "Kabutops Sprites", ROMX
KabutopsPicFront::     INCBIN "gfx/pokemon/front/kabutops.2bpp"
KabutopsPicBack::      INCBIN "gfx/pokemon/back/kabutopsb.2bpp"

SECTION "Aerodactyl Sprites", ROMX
AerodactylPicFront::   INCBIN "gfx/pokemon/front/aerodactyl.2bpp"
AerodactylPicBack::    INCBIN "gfx/pokemon/back/aerodactylb.2bpp"

SECTION "Snorlax Sprites", ROMX
SnorlaxPicFront::      INCBIN "gfx/pokemon/front/snorlax.2bpp"
SnorlaxPicBack::       INCBIN "gfx/pokemon/back/snorlaxb.2bpp"

SECTION "Articuno Sprites", ROMX
ArticunoPicFront::     INCBIN "gfx/pokemon/front/articuno.2bpp"
ArticunoPicBack::      INCBIN "gfx/pokemon/back/articunob.2bpp"

SECTION "Zapdos Sprites", ROMX
ZapdosPicFront::       INCBIN "gfx/pokemon/front/zapdos.2bpp"
ZapdosPicBack::        INCBIN "gfx/pokemon/back/zapdosb.2bpp"

SECTION "Moltres Sprites", ROMX
MoltresPicFront::     INCBIN "gfx/pokemon/front/moltres.2bpp"
MoltresPicBack::      INCBIN "gfx/pokemon/back/moltresb.2bpp"

SECTION "Dratini Sprites", ROMX
DratiniPicFront::     INCBIN "gfx/pokemon/front/dratini.2bpp"
DratiniPicBack::      INCBIN "gfx/pokemon/back/dratinib.2bpp"

SECTION "Dragonair Sprites", ROMX
DragonairPicFront::   INCBIN "gfx/pokemon/front/dragonair.2bpp"
DragonairPicBack::    INCBIN "gfx/pokemon/back/dragonairb.2bpp"

SECTION "Dragonite Sprites", ROMX
DragonitePicFront::   INCBIN "gfx/pokemon/front/dragonite.2bpp"
DragonitePicBack::    INCBIN "gfx/pokemon/back/dragoniteb.2bpp"

SECTION "Mewtwo Sprites", ROMX
MewtwoPicFront::       INCBIN "gfx/pokemon/front/mewtwo.2bpp"
MewtwoPicBack::        INCBIN "gfx/pokemon/back/mewtwob.2bpp"

SECTION "Mew Sprites", ROMX
MewPicFront::          INCBIN "gfx/pokemon/front/mew.2bpp"
MewPicBack::           INCBIN "gfx/pokemon/back/mewb.2bpp"


SECTION "Trainer Pics 1", ROMX

YoungsterPic::     INCBIN "gfx/trainers/youngster.2bpp"
BugCatcherPic::    INCBIN "gfx/trainers/bugcatcher.2bpp"
LassPic::          INCBIN "gfx/trainers/lass.2bpp"
SailorPic::        INCBIN "gfx/trainers/sailor.2bpp"
JrTrainerMPic::    INCBIN "gfx/trainers/jr.trainerm.2bpp"
JrTrainerFPic::    INCBIN "gfx/trainers/jr.trainerf.2bpp"
PokemaniacPic::    INCBIN "gfx/trainers/pokemaniac.2bpp"
SuperNerdPic::     INCBIN "gfx/trainers/supernerd.2bpp"
HikerPic::         INCBIN "gfx/trainers/hiker.2bpp"
BikerPic::         INCBIN "gfx/trainers/biker.2bpp"
BurglarPic::       INCBIN "gfx/trainers/burglar.2bpp"
EngineerPic::      INCBIN "gfx/trainers/engineer.2bpp"


SECTION "Trainer Pics 2", ROMX

FisherPic::        INCBIN "gfx/trainers/fisher.2bpp"
SwimmerPic::       INCBIN "gfx/trainers/swimmer.2bpp"
CueBallPic::       INCBIN "gfx/trainers/cueball.2bpp"
GamblerPic::       INCBIN "gfx/trainers/gambler.2bpp"
BeautyPic::        INCBIN "gfx/trainers/beauty.2bpp"
PsychicPic::       INCBIN "gfx/trainers/psychic.2bpp"
RockerPic::        INCBIN "gfx/trainers/rocker.2bpp"
JugglerPic::       INCBIN "gfx/trainers/juggler.2bpp"
TamerPic::         INCBIN "gfx/trainers/tamer.2bpp"
BirdKeeperPic::    INCBIN "gfx/trainers/birdkeeper.2bpp"
BlackbeltPic::     INCBIN "gfx/trainers/blackbelt.2bpp"
Rival1Pic::        INCBIN "gfx/trainers/rival1.2bpp"
ProfOakPic::       INCBIN "gfx/trainers/prof.oak.2bpp"
ChiefPic::
ScientistPic::     INCBIN "gfx/trainers/scientist.2bpp"
GiovanniPic::      INCBIN "gfx/trainers/giovanni.2bpp"
RocketPic::        INCBIN "gfx/trainers/rocket.2bpp"


SECTION "Trainer Pics 3", ROMX

CooltrainerMPic::  INCBIN "gfx/trainers/cooltrainerm.2bpp"
CooltrainerFPic::  INCBIN "gfx/trainers/cooltrainerf.2bpp"
BrunoPic::         INCBIN "gfx/trainers/bruno.2bpp"
BrockPic::         INCBIN "gfx/trainers/brock.2bpp"
MistyPic::         INCBIN "gfx/trainers/misty.2bpp"
LtSurgePic::       INCBIN "gfx/trainers/lt.surge.2bpp"
ErikaPic::         INCBIN "gfx/trainers/erika.2bpp"
KogaPic::          INCBIN "gfx/trainers/koga.2bpp"
BlainePic::        INCBIN "gfx/trainers/blaine.2bpp"
SabrinaPic::       INCBIN "gfx/trainers/sabrina.2bpp"
GentlemanPic::     INCBIN "gfx/trainers/gentleman.2bpp"
Rival2Pic::        INCBIN "gfx/trainers/rival2.2bpp"
Rival3Pic::        INCBIN "gfx/trainers/rival3.2bpp"
LoreleiPic::       INCBIN "gfx/trainers/lorelei.2bpp"
ChannelerPic::     INCBIN "gfx/trainers/channeler.2bpp"
AgathaPic::        INCBIN "gfx/trainers/agatha.2bpp"
LancePic::         INCBIN "gfx/trainers/lance.2bpp"
YellowPic::        INCBIN "gfx/trainers/yellow.2bpp" ; marcelnote - new trainer class
WillPic::          INCBIN "gfx/trainers/will.2bpp"   ; marcelnote - new trainer class


SECTION "Player Back Sprites", ROMX ; marcelnote - new section

; these three must stay in the same section
RedPicBack::       INCBIN "gfx/player/redb.2bpp"
GreenPicBack::     INCBIN "gfx/player/greenb.2bpp"
OldManPicBack::    INCBIN "gfx/battle/oldmanb.2bpp"


SECTION "Player Front Sprites", ROMX ; marcelnote - new section

RedPicFront::      INCBIN "gfx/player/red.2bpp"
GreenPicFront::    INCBIN "gfx/player/green.2bpp"
ShrinkPic1::       INCBIN "gfx/player/shrink1.2bpp"
ShrinkPic2::       INCBIN "gfx/player/shrink2.2bpp"


SECTION "Fossils Pics", ROMX ; marcelnote - new section

; these three must stay in the same section
FossilKabutopsPic::    INCBIN "gfx/pokemon/front/fossilkabutops.2bpp"
FossilAerodactylPic::  INCBIN "gfx/pokemon/front/fossilaerodactyl.2bpp"
GhostPic::             INCBIN "gfx/battle/ghost.2bpp"
