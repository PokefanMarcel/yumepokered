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
BulbasaurPics::
BulbasaurPicBack::           INCBIN "gfx/pokemon/back/bulbasaurb.2bpp"
BulbasaurPicBackYellow::     INCBIN "gfx/pokemon/back_y/bulbasaurb.2bpp"
BulbasaurPicBackGreen::      INCBIN "gfx/pokemon/back_rg/bulbasaurb.2bpp"
BulbasaurPicFront::          INCBIN "gfx/pokemon/front/bulbasaur.2bpp"
BulbasaurPicFrontYellow::    INCBIN "gfx/pokemon/front_y/bulbasaur.2bpp"
BulbasaurPicFrontGreen::     INCBIN "gfx/pokemon/front_rg/bulbasaur.2bpp"

SECTION "Ivysaur Sprites", ROMX
IvysaurPics::
IvysaurPicBack::             INCBIN "gfx/pokemon/back/ivysaurb.2bpp"
IvysaurPicBackYellow::       INCBIN "gfx/pokemon/back_y/ivysaurb.2bpp"
IvysaurPicBackGreen::        INCBIN "gfx/pokemon/back_rg/ivysaurb.2bpp"
IvysaurPicFront::            INCBIN "gfx/pokemon/front/ivysaur.2bpp"
IvysaurPicFrontYellow::      INCBIN "gfx/pokemon/front_y/ivysaur.2bpp"
IvysaurPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/ivysaur.2bpp"

SECTION "Venusaur Sprites", ROMX
VenusaurPics::
VenusaurPicBack::            INCBIN "gfx/pokemon/back/venusaurb.2bpp"
VenusaurPicBackYellow::      INCBIN "gfx/pokemon/back_y/venusaurb.2bpp"
VenusaurPicBackGreen::       INCBIN "gfx/pokemon/back_rg/venusaurb.2bpp"
VenusaurPicFront::           INCBIN "gfx/pokemon/front/venusaur.2bpp"
VenusaurPicFrontYellow::     INCBIN "gfx/pokemon/front_y/venusaur.2bpp"
VenusaurPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/venusaur.2bpp"

SECTION "Charmander Sprites", ROMX
CharmanderPics::
CharmanderPicBack::          INCBIN "gfx/pokemon/back/charmanderb.2bpp"
CharmanderPicBackYellow::    INCBIN "gfx/pokemon/back_y/charmanderb.2bpp"
CharmanderPicBackGreen::     INCBIN "gfx/pokemon/back_rg/charmanderb.2bpp"
CharmanderPicFront::         INCBIN "gfx/pokemon/front/charmander.2bpp"
CharmanderPicFrontYellow::   INCBIN "gfx/pokemon/front_y/charmander.2bpp"
CharmanderPicFrontGreen::    INCBIN "gfx/pokemon/front_rg/charmander.2bpp"

SECTION "Charmeleon Sprites", ROMX
CharmeleonPics::
CharmeleonPicBack::          INCBIN "gfx/pokemon/back/charmeleonb.2bpp"
CharmeleonPicBackYellow::    INCBIN "gfx/pokemon/back_y/charmeleonb.2bpp"
CharmeleonPicBackGreen::     INCBIN "gfx/pokemon/back_rg/charmeleonb.2bpp"
CharmeleonPicFront::         INCBIN "gfx/pokemon/front/charmeleon.2bpp"
CharmeleonPicFrontYellow::   INCBIN "gfx/pokemon/front_y/charmeleon.2bpp"
CharmeleonPicFrontGreen::    INCBIN "gfx/pokemon/front_rg/charmeleon.2bpp"

SECTION "Charizard Sprites", ROMX
CharizardPics::
CharizardPicBack::           INCBIN "gfx/pokemon/back/charizardb.2bpp"
CharizardPicBackYellow::     INCBIN "gfx/pokemon/back_y/charizardb.2bpp"
CharizardPicBackGreen::      INCBIN "gfx/pokemon/back_rg/charizardb.2bpp"
CharizardPicFront::          INCBIN "gfx/pokemon/front/charizard.2bpp"
CharizardPicFrontYellow::    INCBIN "gfx/pokemon/front_y/charizard.2bpp"
CharizardPicFrontGreen::     INCBIN "gfx/pokemon/front_rg/charizard.2bpp"

SECTION "Squirtle Sprites", ROMX
SquirtlePics::
SquirtlePicBack::            INCBIN "gfx/pokemon/back/squirtleb.2bpp"
SquirtlePicBackYellow::      INCBIN "gfx/pokemon/back_y/squirtleb.2bpp"
SquirtlePicBackGreen::       INCBIN "gfx/pokemon/back_rg/squirtleb.2bpp"
SquirtlePicFront::           INCBIN "gfx/pokemon/front/squirtle.2bpp"
SquirtlePicFrontYellow::     INCBIN "gfx/pokemon/front_y/squirtle.2bpp"
SquirtlePicFrontGreen::      INCBIN "gfx/pokemon/front_rg/squirtle.2bpp"

SECTION "Wartortle Sprites", ROMX
WartortlePics::
WartortlePicBack::           INCBIN "gfx/pokemon/back/wartortleb.2bpp"
WartortlePicBackYellow::     INCBIN "gfx/pokemon/back_y/wartortleb.2bpp"
WartortlePicBackGreen::      INCBIN "gfx/pokemon/back_rg/wartortleb.2bpp"
WartortlePicFront::          INCBIN "gfx/pokemon/front/wartortle.2bpp"
WartortlePicFrontYellow::    INCBIN "gfx/pokemon/front_y/wartortle.2bpp"
WartortlePicFrontGreen::     INCBIN "gfx/pokemon/front_rg/wartortle.2bpp"

SECTION "Blastoise Sprites", ROMX
BlastoisePics::
BlastoisePicBack::           INCBIN "gfx/pokemon/back/blastoiseb.2bpp"
BlastoisePicBackYellow::     INCBIN "gfx/pokemon/back_y/blastoiseb.2bpp"
BlastoisePicBackGreen::      INCBIN "gfx/pokemon/back_rg/blastoiseb.2bpp"
BlastoisePicFront::          INCBIN "gfx/pokemon/front/blastoise.2bpp"
BlastoisePicFrontYellow::    INCBIN "gfx/pokemon/front_y/blastoise.2bpp"
BlastoisePicFrontGreen::     INCBIN "gfx/pokemon/front_rg/blastoise.2bpp"

SECTION "Caterpie Sprites", ROMX
CaterpiePics::
CaterpiePicBack::            INCBIN "gfx/pokemon/back/caterpieb.2bpp"
CaterpiePicBackYellow::      INCBIN "gfx/pokemon/back_y/caterpieb.2bpp"
CaterpiePicBackGreen::       INCBIN "gfx/pokemon/back_rg/caterpieb.2bpp"
CaterpiePicFront::           INCBIN "gfx/pokemon/front/caterpie.2bpp"
CaterpiePicFrontYellow::     INCBIN "gfx/pokemon/front_y/caterpie.2bpp"
CaterpiePicFrontGreen::      INCBIN "gfx/pokemon/front_rg/caterpie.2bpp"

SECTION "Metapod Sprites", ROMX
MetapodPics::
MetapodPicBack::             INCBIN "gfx/pokemon/back/metapodb.2bpp"
MetapodPicBackYellow::       INCBIN "gfx/pokemon/back_y/metapodb.2bpp"
MetapodPicBackGreen::        INCBIN "gfx/pokemon/back_rg/metapodb.2bpp"
MetapodPicFront::            INCBIN "gfx/pokemon/front/metapod.2bpp"
MetapodPicFrontYellow::      INCBIN "gfx/pokemon/front_y/metapod.2bpp"
MetapodPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/metapod.2bpp"

SECTION "Butterfree Sprites", ROMX
ButterfreePics::
ButterfreePicBack::          INCBIN "gfx/pokemon/back/butterfreeb.2bpp"
ButterfreePicBackYellow::    INCBIN "gfx/pokemon/back_y/butterfreeb.2bpp"
ButterfreePicBackGreen::     INCBIN "gfx/pokemon/back_rg/butterfreeb.2bpp"
ButterfreePicFront::         INCBIN "gfx/pokemon/front/butterfree.2bpp"
ButterfreePicFrontYellow::   INCBIN "gfx/pokemon/front_y/butterfree.2bpp"
ButterfreePicFrontGreen::    INCBIN "gfx/pokemon/front_rg/butterfree.2bpp"

SECTION "Weedle Sprites", ROMX
WeedlePics::
WeedlePicBack::              INCBIN "gfx/pokemon/back/weedleb.2bpp"
WeedlePicBackYellow::        INCBIN "gfx/pokemon/back_y/weedleb.2bpp"
WeedlePicBackGreen::         INCBIN "gfx/pokemon/back_rg/weedleb.2bpp"
WeedlePicFront::             INCBIN "gfx/pokemon/front/weedle.2bpp"
WeedlePicFrontYellow::       INCBIN "gfx/pokemon/front_y/weedle.2bpp"
WeedlePicFrontGreen::        INCBIN "gfx/pokemon/front_rg/weedle.2bpp"

SECTION "Kakuna Sprites", ROMX
KakunaPics::
KakunaPicBack::              INCBIN "gfx/pokemon/back/kakunab.2bpp"
KakunaPicBackYellow::        INCBIN "gfx/pokemon/back_y/kakunab.2bpp"
KakunaPicBackGreen::         INCBIN "gfx/pokemon/back_rg/kakunab.2bpp"
KakunaPicFront::             INCBIN "gfx/pokemon/front/kakuna.2bpp"
KakunaPicFrontYellow::       INCBIN "gfx/pokemon/front_y/kakuna.2bpp"
KakunaPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/kakuna.2bpp"

SECTION "Beedrill Sprites", ROMX
BeedrillPics::
BeedrillPicBack::            INCBIN "gfx/pokemon/back/beedrillb.2bpp"
BeedrillPicBackYellow::      INCBIN "gfx/pokemon/back_y/beedrillb.2bpp"
BeedrillPicBackGreen::       INCBIN "gfx/pokemon/back_rg/beedrillb.2bpp"
BeedrillPicFront::           INCBIN "gfx/pokemon/front/beedrill.2bpp"
BeedrillPicFrontYellow::     INCBIN "gfx/pokemon/front_y/beedrill.2bpp"
BeedrillPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/beedrill.2bpp"

SECTION "Pidgey Sprites", ROMX
PidgeyPics::
PidgeyPicBack::              INCBIN "gfx/pokemon/back/pidgeyb.2bpp"
PidgeyPicBackYellow::        INCBIN "gfx/pokemon/back_y/pidgeyb.2bpp"
PidgeyPicBackGreen::         INCBIN "gfx/pokemon/back_rg/pidgeyb.2bpp"
PidgeyPicFront::             INCBIN "gfx/pokemon/front/pidgey.2bpp"
PidgeyPicFrontYellow::       INCBIN "gfx/pokemon/front_y/pidgey.2bpp"
PidgeyPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/pidgey.2bpp"

SECTION "Pidgeotto Sprites", ROMX
PidgeottoPics::
PidgeottoPicBack::           INCBIN "gfx/pokemon/back/pidgeottob.2bpp"
PidgeottoPicBackYellow::     INCBIN "gfx/pokemon/back_y/pidgeottob.2bpp"
PidgeottoPicBackGreen::      INCBIN "gfx/pokemon/back_rg/pidgeottob.2bpp"
PidgeottoPicFront::          INCBIN "gfx/pokemon/front/pidgeotto.2bpp"
PidgeottoPicFrontYellow::    INCBIN "gfx/pokemon/front_y/pidgeotto.2bpp"
PidgeottoPicFrontGreen::     INCBIN "gfx/pokemon/front_rg/pidgeotto.2bpp"

SECTION "Pidgeot Sprites", ROMX
PidgeotPics::
PidgeotPicBack::             INCBIN "gfx/pokemon/back/pidgeotb.2bpp"
PidgeotPicBackYellow::       INCBIN "gfx/pokemon/back_y/pidgeotb.2bpp"
PidgeotPicBackGreen::        INCBIN "gfx/pokemon/back_rg/pidgeotb.2bpp"
PidgeotPicFront::            INCBIN "gfx/pokemon/front/pidgeot.2bpp"
PidgeotPicFrontYellow::      INCBIN "gfx/pokemon/front_y/pidgeot.2bpp"
PidgeotPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/pidgeot.2bpp"

SECTION "Rattata Sprites", ROMX
RattataPics::
RattataPicBack::             INCBIN "gfx/pokemon/back/rattatab.2bpp"
RattataPicBackYellow::       INCBIN "gfx/pokemon/back_y/rattatab.2bpp"
RattataPicBackGreen::        INCBIN "gfx/pokemon/back_rg/rattatab.2bpp"
RattataPicFront::            INCBIN "gfx/pokemon/front/rattata.2bpp"
RattataPicFrontYellow::      INCBIN "gfx/pokemon/front_y/rattata.2bpp"
RattataPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/rattata.2bpp"

SECTION "Raticate Sprites", ROMX
RaticatePics::
RaticatePicBack::            INCBIN "gfx/pokemon/back/raticateb.2bpp"
RaticatePicBackYellow::      INCBIN "gfx/pokemon/back_y/raticateb.2bpp"
RaticatePicBackGreen::       INCBIN "gfx/pokemon/back_rg/raticateb.2bpp"
RaticatePicFront::           INCBIN "gfx/pokemon/front/raticate.2bpp"
RaticatePicFrontYellow::     INCBIN "gfx/pokemon/front_y/raticate.2bpp"
RaticatePicFrontGreen::      INCBIN "gfx/pokemon/front_rg/raticate.2bpp"

SECTION "Spearow Sprites", ROMX
SpearowPics::
SpearowPicBack::             INCBIN "gfx/pokemon/back/spearowb.2bpp"
SpearowPicBackYellow::       INCBIN "gfx/pokemon/back_y/spearowb.2bpp"
SpearowPicBackGreen::        INCBIN "gfx/pokemon/back_rg/spearowb.2bpp"
SpearowPicFront::            INCBIN "gfx/pokemon/front/spearow.2bpp"
SpearowPicFrontYellow::      INCBIN "gfx/pokemon/front_y/spearow.2bpp"
SpearowPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/spearow.2bpp"

SECTION "Fearow Sprites", ROMX
FearowPics::
FearowPicBack::              INCBIN "gfx/pokemon/back/fearowb.2bpp"
FearowPicBackYellow::        INCBIN "gfx/pokemon/back_y/fearowb.2bpp"
FearowPicBackGreen::         INCBIN "gfx/pokemon/back_rg/fearowb.2bpp"
FearowPicFront::             INCBIN "gfx/pokemon/front/fearow.2bpp"
FearowPicFrontYellow::       INCBIN "gfx/pokemon/front_y/fearow.2bpp"
FearowPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/fearow.2bpp"

SECTION "Ekans Sprites", ROMX
EkansPics::
EkansPicBack::               INCBIN "gfx/pokemon/back/ekansb.2bpp"
EkansPicBackYellow::         INCBIN "gfx/pokemon/back_y/ekansb.2bpp"
EkansPicBackGreen::          INCBIN "gfx/pokemon/back_rg/ekansb.2bpp"
EkansPicFront::              INCBIN "gfx/pokemon/front/ekans.2bpp"
EkansPicFrontYellow::        INCBIN "gfx/pokemon/front_y/ekans.2bpp"
EkansPicFrontGreen::         INCBIN "gfx/pokemon/front_rg/ekans.2bpp"

SECTION "Arbok Sprites", ROMX
ArbokPics::
ArbokPicBack::               INCBIN "gfx/pokemon/back/arbokb.2bpp"
ArbokPicBackYellow::         INCBIN "gfx/pokemon/back_y/arbokb.2bpp"
ArbokPicBackGreen::          INCBIN "gfx/pokemon/back_rg/arbokb.2bpp"
ArbokPicFront::              INCBIN "gfx/pokemon/front/arbok.2bpp"
ArbokPicFrontYellow::        INCBIN "gfx/pokemon/front_y/arbok.2bpp"
ArbokPicFrontGreen::         INCBIN "gfx/pokemon/front_rg/arbok.2bpp"

SECTION "Pikachu Sprites", ROMX
PikachuPics::
PikachuPicBack::             INCBIN "gfx/pokemon/back/pikachub.2bpp"
PikachuPicBackYellow::       INCBIN "gfx/pokemon/back_y/pikachub.2bpp"
PikachuPicBackGreen::        INCBIN "gfx/pokemon/back_rg/pikachub.2bpp"
PikachuPicFront::            INCBIN "gfx/pokemon/front/pikachu.2bpp"
PikachuPicFrontYellow::      INCBIN "gfx/pokemon/front_y/pikachu.2bpp"
PikachuPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/pikachu.2bpp"

SECTION "Raichu Sprites", ROMX
RaichuPics::
RaichuPicBack::              INCBIN "gfx/pokemon/back/raichub.2bpp"
RaichuPicBackYellow::        INCBIN "gfx/pokemon/back_y/raichub.2bpp"
RaichuPicBackGreen::         INCBIN "gfx/pokemon/back_rg/raichub.2bpp"
RaichuPicFront::             INCBIN "gfx/pokemon/front/raichu.2bpp"
RaichuPicFrontYellow::       INCBIN "gfx/pokemon/front_y/raichu.2bpp"
RaichuPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/raichu.2bpp"

SECTION "Sandshrew Sprites", ROMX
SandshrewPics::
SandshrewPicBack::           INCBIN "gfx/pokemon/back/sandshrewb.2bpp"
SandshrewPicBackYellow::     INCBIN "gfx/pokemon/back_y/sandshrewb.2bpp"
SandshrewPicBackGreen::      INCBIN "gfx/pokemon/back_rg/sandshrewb.2bpp"
SandshrewPicFront::          INCBIN "gfx/pokemon/front/sandshrew.2bpp"
SandshrewPicFrontYellow::    INCBIN "gfx/pokemon/front_y/sandshrew.2bpp"
SandshrewPicFrontGreen::     INCBIN "gfx/pokemon/front_rg/sandshrew.2bpp"

SECTION "Sandslash Sprites", ROMX
SandslashPics::
SandslashPicBack::           INCBIN "gfx/pokemon/back/sandslashb.2bpp"
SandslashPicBackYellow::     INCBIN "gfx/pokemon/back_y/sandslashb.2bpp"
SandslashPicBackGreen::      INCBIN "gfx/pokemon/back_rg/sandslashb.2bpp"
SandslashPicFront::          INCBIN "gfx/pokemon/front/sandslash.2bpp"
SandslashPicFrontYellow::    INCBIN "gfx/pokemon/front_y/sandslash.2bpp"
SandslashPicFrontGreen::     INCBIN "gfx/pokemon/front_rg/sandslash.2bpp"

SECTION "NidoranF Sprites", ROMX
NidoranFPics::
NidoranFPicBack::            INCBIN "gfx/pokemon/back/nidoranfb.2bpp"
NidoranFPicBackYellow::      INCBIN "gfx/pokemon/back_y/nidoranfb.2bpp"
NidoranFPicBackGreen::       INCBIN "gfx/pokemon/back_rg/nidoranfb.2bpp"
NidoranFPicFront::           INCBIN "gfx/pokemon/front/nidoranf.2bpp"
NidoranFPicFrontYellow::     INCBIN "gfx/pokemon/front_y/nidoranf.2bpp"
NidoranFPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/nidoranf.2bpp"

SECTION "Nidorina Sprites", ROMX
NidorinaPics::
NidorinaPicBack::            INCBIN "gfx/pokemon/back/nidorinab.2bpp"
NidorinaPicBackYellow::      INCBIN "gfx/pokemon/back_y/nidorinab.2bpp"
NidorinaPicBackGreen::       INCBIN "gfx/pokemon/back_rg/nidorinab.2bpp"
NidorinaPicFront::           INCBIN "gfx/pokemon/front/nidorina.2bpp"
NidorinaPicFrontYellow::     INCBIN "gfx/pokemon/front_y/nidorina.2bpp"
NidorinaPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/nidorina.2bpp"

SECTION "Nidoqueen Sprites", ROMX
NidoqueenPics::
NidoqueenPicBack::           INCBIN "gfx/pokemon/back/nidoqueenb.2bpp"
NidoqueenPicBackYellow::     INCBIN "gfx/pokemon/back_y/nidoqueenb.2bpp"
NidoqueenPicBackGreen::      INCBIN "gfx/pokemon/back_rg/nidoqueenb.2bpp"
NidoqueenPicFront::          INCBIN "gfx/pokemon/front/nidoqueen.2bpp"
NidoqueenPicFrontYellow::    INCBIN "gfx/pokemon/front_y/nidoqueen.2bpp"
NidoqueenPicFrontGreen::     INCBIN "gfx/pokemon/front_rg/nidoqueen.2bpp"

SECTION "NidoranM Sprites", ROMX
NidoranMPics::
NidoranMPicBack::            INCBIN "gfx/pokemon/back/nidoranmb.2bpp"
NidoranMPicBackYellow::      INCBIN "gfx/pokemon/back_y/nidoranmb.2bpp"
NidoranMPicBackGreen::       INCBIN "gfx/pokemon/back_rg/nidoranmb.2bpp"
NidoranMPicFront::           INCBIN "gfx/pokemon/front/nidoranm.2bpp"
NidoranMPicFrontYellow::     INCBIN "gfx/pokemon/front_y/nidoranm.2bpp"
NidoranMPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/nidoranm.2bpp"

SECTION "Nidorino Sprites", ROMX
NidorinoPics::
NidorinoPicBack::            INCBIN "gfx/pokemon/back/nidorinob.2bpp"
NidorinoPicBackYellow::      INCBIN "gfx/pokemon/back_y/nidorinob.2bpp"
NidorinoPicBackGreen::       INCBIN "gfx/pokemon/back_rg/nidorinob.2bpp"
NidorinoPicFront::           INCBIN "gfx/pokemon/front/nidorino.2bpp"
NidorinoPicFrontYellow::     INCBIN "gfx/pokemon/front_y/nidorino.2bpp"
NidorinoPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/nidorino.2bpp"

SECTION "Nidoking Sprites", ROMX
NidokingPics::
NidokingPicBack::            INCBIN "gfx/pokemon/back/nidokingb.2bpp"
NidokingPicBackYellow::      INCBIN "gfx/pokemon/back_y/nidokingb.2bpp"
NidokingPicBackGreen::       INCBIN "gfx/pokemon/back_rg/nidokingb.2bpp"
NidokingPicFront::           INCBIN "gfx/pokemon/front/nidoking.2bpp"
NidokingPicFrontYellow::     INCBIN "gfx/pokemon/front_y/nidoking.2bpp"
NidokingPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/nidoking.2bpp"

SECTION "Clefairy Sprites", ROMX
ClefairyPics::
ClefairyPicBack::            INCBIN "gfx/pokemon/back/clefairyb.2bpp"
ClefairyPicBackYellow::      INCBIN "gfx/pokemon/back_y/clefairyb.2bpp"
ClefairyPicBackGreen::       INCBIN "gfx/pokemon/back_rg/clefairyb.2bpp"
ClefairyPicFront::           INCBIN "gfx/pokemon/front/clefairy.2bpp"
ClefairyPicFrontYellow::     INCBIN "gfx/pokemon/front_y/clefairy.2bpp"
ClefairyPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/clefairy.2bpp"

SECTION "Clefable Sprites", ROMX
ClefablePics::
ClefablePicBack::            INCBIN "gfx/pokemon/back/clefableb.2bpp"
ClefablePicBackYellow::      INCBIN "gfx/pokemon/back_y/clefableb.2bpp"
ClefablePicBackGreen::       INCBIN "gfx/pokemon/back_rg/clefableb.2bpp"
ClefablePicFront::           INCBIN "gfx/pokemon/front/clefable.2bpp"
ClefablePicFrontYellow::     INCBIN "gfx/pokemon/front_y/clefable.2bpp"
ClefablePicFrontGreen::      INCBIN "gfx/pokemon/front_rg/clefable.2bpp"

SECTION "Vulpix Sprites", ROMX
VulpixPics::
VulpixPicBack::              INCBIN "gfx/pokemon/back/vulpixb.2bpp"
VulpixPicBackYellow::        INCBIN "gfx/pokemon/back_y/vulpixb.2bpp"
VulpixPicBackGreen::         INCBIN "gfx/pokemon/back_rg/vulpixb.2bpp"
VulpixPicFront::             INCBIN "gfx/pokemon/front/vulpix.2bpp"
VulpixPicFrontYellow::       INCBIN "gfx/pokemon/front_y/vulpix.2bpp"
VulpixPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/vulpix.2bpp"

SECTION "Ninetales Sprites", ROMX
NinetalesPics::
NinetalesPicBack::           INCBIN "gfx/pokemon/back/ninetalesb.2bpp"
NinetalesPicBackYellow::     INCBIN "gfx/pokemon/back_y/ninetalesb.2bpp"
NinetalesPicBackGreen::      INCBIN "gfx/pokemon/back_rg/ninetalesb.2bpp"
NinetalesPicFront::          INCBIN "gfx/pokemon/front/ninetales.2bpp"
NinetalesPicFrontYellow::    INCBIN "gfx/pokemon/front_y/ninetales.2bpp"
NinetalesPicFrontGreen::     INCBIN "gfx/pokemon/front_rg/ninetales.2bpp"

SECTION "Jigglypuff Sprites", ROMX
JigglypuffPics::
JigglypuffPicBack::          INCBIN "gfx/pokemon/back/jigglypuffb.2bpp"
JigglypuffPicBackYellow::    INCBIN "gfx/pokemon/back_y/jigglypuffb.2bpp"
JigglypuffPicBackGreen::     INCBIN "gfx/pokemon/back_rg/jigglypuffb.2bpp"
JigglypuffPicFront::         INCBIN "gfx/pokemon/front/jigglypuff.2bpp"
JigglypuffPicFrontYellow::   INCBIN "gfx/pokemon/front_y/jigglypuff.2bpp"
JigglypuffPicFrontGreen::    INCBIN "gfx/pokemon/front_rg/jigglypuff.2bpp"

SECTION "Wigglytuff Sprites", ROMX
WigglytuffPics::
WigglytuffPicBack::          INCBIN "gfx/pokemon/back/wigglytuffb.2bpp"
WigglytuffPicBackYellow::    INCBIN "gfx/pokemon/back_y/wigglytuffb.2bpp"
WigglytuffPicBackGreen::     INCBIN "gfx/pokemon/back_rg/wigglytuffb.2bpp"
WigglytuffPicFront::         INCBIN "gfx/pokemon/front/wigglytuff.2bpp"
WigglytuffPicFrontYellow::   INCBIN "gfx/pokemon/front_y/wigglytuff.2bpp"
WigglytuffPicFrontGreen::    INCBIN "gfx/pokemon/front_rg/wigglytuff.2bpp"

SECTION "Zubat Sprites", ROMX
ZubatPics::
ZubatPicBack::               INCBIN "gfx/pokemon/back/zubatb.2bpp"
ZubatPicBackYellow::         INCBIN "gfx/pokemon/back_y/zubatb.2bpp"
ZubatPicBackGreen::          INCBIN "gfx/pokemon/back_rg/zubatb.2bpp"
ZubatPicFront::              INCBIN "gfx/pokemon/front/zubat.2bpp"
ZubatPicFrontYellow::        INCBIN "gfx/pokemon/front_y/zubat.2bpp"
ZubatPicFrontGreen::         INCBIN "gfx/pokemon/front_rg/zubat.2bpp"

SECTION "Golbat Sprites", ROMX
GolbatPics::
GolbatPicBack::              INCBIN "gfx/pokemon/back/golbatb.2bpp"
GolbatPicBackYellow::        INCBIN "gfx/pokemon/back_y/golbatb.2bpp"
GolbatPicBackGreen::         INCBIN "gfx/pokemon/back_rg/golbatb.2bpp"
GolbatPicFront::             INCBIN "gfx/pokemon/front/golbat.2bpp"
GolbatPicFrontYellow::       INCBIN "gfx/pokemon/front_y/golbat.2bpp"
GolbatPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/golbat.2bpp"

SECTION "Oddish Sprites", ROMX
OddishPics::
OddishPicBack::              INCBIN "gfx/pokemon/back/oddishb.2bpp"
OddishPicBackYellow::        INCBIN "gfx/pokemon/back_y/oddishb.2bpp"
OddishPicBackGreen::         INCBIN "gfx/pokemon/back_rg/oddishb.2bpp"
OddishPicFront::             INCBIN "gfx/pokemon/front/oddish.2bpp"
OddishPicFrontYellow::       INCBIN "gfx/pokemon/front_y/oddish.2bpp"
OddishPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/oddish.2bpp"

SECTION "Gloom Sprites", ROMX
GloomPics::
GloomPicBack::               INCBIN "gfx/pokemon/back/gloomb.2bpp"
GloomPicBackYellow::         INCBIN "gfx/pokemon/back_y/gloomb.2bpp"
GloomPicBackGreen::          INCBIN "gfx/pokemon/back_rg/gloomb.2bpp"
GloomPicFront::              INCBIN "gfx/pokemon/front/gloom.2bpp"
GloomPicFrontYellow::        INCBIN "gfx/pokemon/front_y/gloom.2bpp"
GloomPicFrontGreen::         INCBIN "gfx/pokemon/front_rg/gloom.2bpp"

SECTION "Vileplume Sprites", ROMX
VileplumePics::
VileplumePicBack::           INCBIN "gfx/pokemon/back/vileplumeb.2bpp"
VileplumePicBackYellow::     INCBIN "gfx/pokemon/back_y/vileplumeb.2bpp"
VileplumePicBackGreen::      INCBIN "gfx/pokemon/back_rg/vileplumeb.2bpp"
VileplumePicFront::          INCBIN "gfx/pokemon/front/vileplume.2bpp"
VileplumePicFrontYellow::    INCBIN "gfx/pokemon/front_y/vileplume.2bpp"
VileplumePicFrontGreen::     INCBIN "gfx/pokemon/front_rg/vileplume.2bpp"

SECTION "Paras Sprites", ROMX
ParasPics::
ParasPicBack::               INCBIN "gfx/pokemon/back/parasb.2bpp"
ParasPicBackYellow::         INCBIN "gfx/pokemon/back_y/parasb.2bpp"
ParasPicBackGreen::          INCBIN "gfx/pokemon/back_rg/parasb.2bpp"
ParasPicFront::              INCBIN "gfx/pokemon/front/paras.2bpp"
ParasPicFrontYellow::        INCBIN "gfx/pokemon/front_y/paras.2bpp"
ParasPicFrontGreen::         INCBIN "gfx/pokemon/front_rg/paras.2bpp"

SECTION "Parasect Sprites", ROMX
ParasectPics::
ParasectPicBack::            INCBIN "gfx/pokemon/back/parasectb.2bpp"
ParasectPicBackYellow::      INCBIN "gfx/pokemon/back_y/parasectb.2bpp"
ParasectPicBackGreen::       INCBIN "gfx/pokemon/back_rg/parasectb.2bpp"
ParasectPicFront::           INCBIN "gfx/pokemon/front/parasect.2bpp"
ParasectPicFrontYellow::     INCBIN "gfx/pokemon/front_y/parasect.2bpp"
ParasectPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/parasect.2bpp"

SECTION "Venonat Sprites", ROMX
VenonatPics::
VenonatPicBack::             INCBIN "gfx/pokemon/back/venonatb.2bpp"
VenonatPicBackYellow::       INCBIN "gfx/pokemon/back_y/venonatb.2bpp"
VenonatPicBackGreen::        INCBIN "gfx/pokemon/back_rg/venonatb.2bpp"
VenonatPicFront::            INCBIN "gfx/pokemon/front/venonat.2bpp"
VenonatPicFrontYellow::      INCBIN "gfx/pokemon/front_y/venonat.2bpp"
VenonatPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/venonat.2bpp"

SECTION "Venomoth Sprites", ROMX
VenomothPics::
VenomothPicBack::            INCBIN "gfx/pokemon/back/venomothb.2bpp"
VenomothPicBackYellow::      INCBIN "gfx/pokemon/back_y/venomothb.2bpp"
VenomothPicBackGreen::       INCBIN "gfx/pokemon/back_rg/venomothb.2bpp"
VenomothPicFront::           INCBIN "gfx/pokemon/front/venomoth.2bpp"
VenomothPicFrontYellow::     INCBIN "gfx/pokemon/front_y/venomoth.2bpp"
VenomothPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/venomoth.2bpp"

SECTION "Diglett Sprites", ROMX
DiglettPics::
DiglettPicBack::             INCBIN "gfx/pokemon/back/diglettb.2bpp"
DiglettPicBackYellow::       INCBIN "gfx/pokemon/back_y/diglettb.2bpp"
DiglettPicBackGreen::        INCBIN "gfx/pokemon/back_rg/diglettb.2bpp"
DiglettPicFront::            INCBIN "gfx/pokemon/front/diglett.2bpp"
DiglettPicFrontYellow::      INCBIN "gfx/pokemon/front_y/diglett.2bpp"
DiglettPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/diglett.2bpp"

SECTION "Dugtrio Sprites", ROMX
DugtrioPics::
DugtrioPicBack::             INCBIN "gfx/pokemon/back/dugtriob.2bpp"
DugtrioPicBackYellow::       INCBIN "gfx/pokemon/back_y/dugtriob.2bpp"
DugtrioPicBackGreen::        INCBIN "gfx/pokemon/back_rg/dugtriob.2bpp"
DugtrioPicFront::            INCBIN "gfx/pokemon/front/dugtrio.2bpp"
DugtrioPicFrontYellow::      INCBIN "gfx/pokemon/front_y/dugtrio.2bpp"
DugtrioPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/dugtrio.2bpp"

SECTION "Meowth Sprites", ROMX
MeowthPics::
MeowthPicBack::              INCBIN "gfx/pokemon/back/meowthb.2bpp"
MeowthPicBackYellow::        INCBIN "gfx/pokemon/back_y/meowthb.2bpp"
MeowthPicBackGreen::         INCBIN "gfx/pokemon/back_rg/meowthb.2bpp"
MeowthPicFront::             INCBIN "gfx/pokemon/front/meowth.2bpp"
MeowthPicFrontYellow::       INCBIN "gfx/pokemon/front_y/meowth.2bpp"
MeowthPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/meowth.2bpp"

SECTION "Persian Sprites", ROMX
PersianPics::
PersianPicBack::             INCBIN "gfx/pokemon/back/persianb.2bpp"
PersianPicBackYellow::       INCBIN "gfx/pokemon/back_y/persianb.2bpp"
PersianPicBackGreen::        INCBIN "gfx/pokemon/back_rg/persianb.2bpp"
PersianPicFront::            INCBIN "gfx/pokemon/front/persian.2bpp"
PersianPicFrontYellow::      INCBIN "gfx/pokemon/front_y/persian.2bpp"
PersianPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/persian.2bpp"

SECTION "Psyduck Sprites", ROMX
PsyduckPics::
PsyduckPicBack::             INCBIN "gfx/pokemon/back/psyduckb.2bpp"
PsyduckPicBackYellow::       INCBIN "gfx/pokemon/back_y/psyduckb.2bpp"
PsyduckPicBackGreen::        INCBIN "gfx/pokemon/back_rg/psyduckb.2bpp"
PsyduckPicFront::            INCBIN "gfx/pokemon/front/psyduck.2bpp"
PsyduckPicFrontYellow::      INCBIN "gfx/pokemon/front_y/psyduck.2bpp"
PsyduckPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/psyduck.2bpp"

SECTION "Golduck Sprites", ROMX
GolduckPics::
GolduckPicBack::             INCBIN "gfx/pokemon/back/golduckb.2bpp"
GolduckPicBackYellow::       INCBIN "gfx/pokemon/back_y/golduckb.2bpp"
GolduckPicBackGreen::        INCBIN "gfx/pokemon/back_rg/golduckb.2bpp"
GolduckPicFront::            INCBIN "gfx/pokemon/front/golduck.2bpp"
GolduckPicFrontYellow::      INCBIN "gfx/pokemon/front_y/golduck.2bpp"
GolduckPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/golduck.2bpp"

SECTION "Mankey Sprites", ROMX
MankeyPics::
MankeyPicBack::              INCBIN "gfx/pokemon/back/mankeyb.2bpp"
MankeyPicBackYellow::        INCBIN "gfx/pokemon/back_y/mankeyb.2bpp"
MankeyPicBackGreen::         INCBIN "gfx/pokemon/back_rg/mankeyb.2bpp"
MankeyPicFront::             INCBIN "gfx/pokemon/front/mankey.2bpp"
MankeyPicFrontYellow::       INCBIN "gfx/pokemon/front_y/mankey.2bpp"
MankeyPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/mankey.2bpp"

SECTION "Primeape Sprites", ROMX
PrimeapePics::
PrimeapePicBack::            INCBIN "gfx/pokemon/back/primeapeb.2bpp"
PrimeapePicBackYellow::      INCBIN "gfx/pokemon/back_y/primeapeb.2bpp"
PrimeapePicBackGreen::       INCBIN "gfx/pokemon/back_rg/primeapeb.2bpp"
PrimeapePicFront::           INCBIN "gfx/pokemon/front/primeape.2bpp"
PrimeapePicFrontYellow::     INCBIN "gfx/pokemon/front_y/primeape.2bpp"
PrimeapePicFrontGreen::      INCBIN "gfx/pokemon/front_rg/primeape.2bpp"

SECTION "Growlithe Sprites", ROMX
GrowlithePics::
GrowlithePicBack::           INCBIN "gfx/pokemon/back/growlitheb.2bpp"
GrowlithePicBackYellow::     INCBIN "gfx/pokemon/back_y/growlitheb.2bpp"
GrowlithePicBackGreen::      INCBIN "gfx/pokemon/back_rg/growlitheb.2bpp"
GrowlithePicFront::          INCBIN "gfx/pokemon/front/growlithe.2bpp"
GrowlithePicFrontYellow::    INCBIN "gfx/pokemon/front_y/growlithe.2bpp"
GrowlithePicFrontGreen::     INCBIN "gfx/pokemon/front_rg/growlithe.2bpp"

SECTION "Arcanine Sprites", ROMX
ArcaninePics::
ArcaninePicBack::            INCBIN "gfx/pokemon/back/arcanineb.2bpp"
ArcaninePicBackYellow::      INCBIN "gfx/pokemon/back_y/arcanineb.2bpp"
ArcaninePicBackGreen::       INCBIN "gfx/pokemon/back_rg/arcanineb.2bpp"
ArcaninePicFront::           INCBIN "gfx/pokemon/front/arcanine.2bpp"
ArcaninePicFrontYellow::     INCBIN "gfx/pokemon/front_y/arcanine.2bpp"
ArcaninePicFrontGreen::      INCBIN "gfx/pokemon/front_rg/arcanine.2bpp"

SECTION "Poliwag Sprites", ROMX
PoliwagPics::
PoliwagPicBack::             INCBIN "gfx/pokemon/back/poliwagb.2bpp"
PoliwagPicBackYellow::       INCBIN "gfx/pokemon/back_y/poliwagb.2bpp"
PoliwagPicBackGreen::        INCBIN "gfx/pokemon/back_rg/poliwagb.2bpp"
PoliwagPicFront::            INCBIN "gfx/pokemon/front/poliwag.2bpp"
PoliwagPicFrontYellow::      INCBIN "gfx/pokemon/front_y/poliwag.2bpp"
PoliwagPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/poliwag.2bpp"

SECTION "Poliwhirl Sprites", ROMX
PoliwhirlPics::
PoliwhirlPicBack::           INCBIN "gfx/pokemon/back/poliwhirlb.2bpp"
PoliwhirlPicBackYellow::     INCBIN "gfx/pokemon/back_y/poliwhirlb.2bpp"
PoliwhirlPicBackGreen::      INCBIN "gfx/pokemon/back_rg/poliwhirlb.2bpp"
PoliwhirlPicFront::          INCBIN "gfx/pokemon/front/poliwhirl.2bpp"
PoliwhirlPicFrontYellow::    INCBIN "gfx/pokemon/front_y/poliwhirl.2bpp"
PoliwhirlPicFrontGreen::     INCBIN "gfx/pokemon/front_rg/poliwhirl.2bpp"

SECTION "Poliwrath Sprites", ROMX
PoliwrathPics::
PoliwrathPicBack::           INCBIN "gfx/pokemon/back/poliwrathb.2bpp"
PoliwrathPicBackYellow::     INCBIN "gfx/pokemon/back_y/poliwrathb.2bpp"
PoliwrathPicBackGreen::      INCBIN "gfx/pokemon/back_rg/poliwrathb.2bpp"
PoliwrathPicFront::          INCBIN "gfx/pokemon/front/poliwrath.2bpp"
PoliwrathPicFrontYellow::    INCBIN "gfx/pokemon/front_y/poliwrath.2bpp"
PoliwrathPicFrontGreen::     INCBIN "gfx/pokemon/front_rg/poliwrath.2bpp"

SECTION "Abra Sprites", ROMX
AbraPics::
AbraPicBack::                INCBIN "gfx/pokemon/back/abrab.2bpp"
AbraPicBackYellow::          INCBIN "gfx/pokemon/back_y/abrab.2bpp"
AbraPicBackGreen::           INCBIN "gfx/pokemon/back_rg/abrab.2bpp"
AbraPicFront::               INCBIN "gfx/pokemon/front/abra.2bpp"
AbraPicFrontYellow::         INCBIN "gfx/pokemon/front_y/abra.2bpp"
AbraPicFrontGreen::          INCBIN "gfx/pokemon/front_rg/abra.2bpp"

SECTION "Kadabra Sprites", ROMX
KadabraPics::
KadabraPicBack::             INCBIN "gfx/pokemon/back/kadabrab.2bpp"
KadabraPicBackYellow::       INCBIN "gfx/pokemon/back_y/kadabrab.2bpp"
KadabraPicBackGreen::        INCBIN "gfx/pokemon/back_rg/kadabrab.2bpp"
KadabraPicFront::            INCBIN "gfx/pokemon/front/kadabra.2bpp"
KadabraPicFrontYellow::      INCBIN "gfx/pokemon/front_y/kadabra.2bpp"
KadabraPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/kadabra.2bpp"

SECTION "Alakazam Sprites", ROMX
AlakazamPics::
AlakazamPicBack::            INCBIN "gfx/pokemon/back/alakazamb.2bpp"
AlakazamPicBackYellow::      INCBIN "gfx/pokemon/back_y/alakazamb.2bpp"
AlakazamPicBackGreen::       INCBIN "gfx/pokemon/back_rg/alakazamb.2bpp"
AlakazamPicFront::           INCBIN "gfx/pokemon/front/alakazam.2bpp"
AlakazamPicFrontYellow::     INCBIN "gfx/pokemon/front_y/alakazam.2bpp"
AlakazamPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/alakazam.2bpp"

SECTION "Machop Sprites", ROMX
MachopPics::
MachopPicBack::              INCBIN "gfx/pokemon/back/machopb.2bpp"
MachopPicBackYellow::        INCBIN "gfx/pokemon/back_y/machopb.2bpp"
MachopPicBackGreen::         INCBIN "gfx/pokemon/back_rg/machopb.2bpp"
MachopPicFront::             INCBIN "gfx/pokemon/front/machop.2bpp"
MachopPicFrontYellow::       INCBIN "gfx/pokemon/front_y/machop.2bpp"
MachopPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/machop.2bpp"

SECTION "Machoke Sprites", ROMX
MachokePics::
MachokePicBack::             INCBIN "gfx/pokemon/back/machokeb.2bpp"
MachokePicBackYellow::       INCBIN "gfx/pokemon/back_y/machokeb.2bpp"
MachokePicBackGreen::        INCBIN "gfx/pokemon/back_rg/machokeb.2bpp"
MachokePicFront::            INCBIN "gfx/pokemon/front/machoke.2bpp"
MachokePicFrontYellow::      INCBIN "gfx/pokemon/front_y/machoke.2bpp"
MachokePicFrontGreen::       INCBIN "gfx/pokemon/front_rg/machoke.2bpp"

SECTION "Machamp Sprites", ROMX
MachampPics::
MachampPicBack::             INCBIN "gfx/pokemon/back/machampb.2bpp"
MachampPicBackYellow::       INCBIN "gfx/pokemon/back_y/machampb.2bpp"
MachampPicBackGreen::        INCBIN "gfx/pokemon/back_rg/machampb.2bpp"
MachampPicFront::            INCBIN "gfx/pokemon/front/machamp.2bpp"
MachampPicFrontYellow::      INCBIN "gfx/pokemon/front_y/machamp.2bpp"
MachampPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/machamp.2bpp"

SECTION "Bellsprout Sprites", ROMX
BellsproutPics::
BellsproutPicBack::          INCBIN "gfx/pokemon/back/bellsproutb.2bpp"
BellsproutPicBackYellow::    INCBIN "gfx/pokemon/back_y/bellsproutb.2bpp"
BellsproutPicBackGreen::     INCBIN "gfx/pokemon/back_rg/bellsproutb.2bpp"
BellsproutPicFront::         INCBIN "gfx/pokemon/front/bellsprout.2bpp"
BellsproutPicFrontYellow::   INCBIN "gfx/pokemon/front_y/bellsprout.2bpp"
BellsproutPicFrontGreen::    INCBIN "gfx/pokemon/front_rg/bellsprout.2bpp"

SECTION "Weepinbell Sprites", ROMX
WeepinbellPics::
WeepinbellPicBack::          INCBIN "gfx/pokemon/back/weepinbellb.2bpp"
WeepinbellPicBackYellow::    INCBIN "gfx/pokemon/back_y/weepinbellb.2bpp"
WeepinbellPicBackGreen::     INCBIN "gfx/pokemon/back_rg/weepinbellb.2bpp"
WeepinbellPicFront::         INCBIN "gfx/pokemon/front/weepinbell.2bpp"
WeepinbellPicFrontYellow::   INCBIN "gfx/pokemon/front_y/weepinbell.2bpp"
WeepinbellPicFrontGreen::    INCBIN "gfx/pokemon/front_rg/weepinbell.2bpp"

SECTION "Victreebel Sprites", ROMX
VictreebelPics::
VictreebelPicBack::          INCBIN "gfx/pokemon/back/victreebelb.2bpp"
VictreebelPicBackYellow::    INCBIN "gfx/pokemon/back_y/victreebelb.2bpp"
VictreebelPicBackGreen::     INCBIN "gfx/pokemon/back_rg/victreebelb.2bpp"
VictreebelPicFront::         INCBIN "gfx/pokemon/front/victreebel.2bpp"
VictreebelPicFrontYellow::   INCBIN "gfx/pokemon/front_y/victreebel.2bpp"
VictreebelPicFrontGreen::    INCBIN "gfx/pokemon/front_rg/victreebel.2bpp"

SECTION "Tentacool Sprites", ROMX
TentacoolPics::
TentacoolPicBack::           INCBIN "gfx/pokemon/back/tentacoolb.2bpp"
TentacoolPicBackYellow::     INCBIN "gfx/pokemon/back_y/tentacoolb.2bpp"
TentacoolPicBackGreen::      INCBIN "gfx/pokemon/back_rg/tentacoolb.2bpp"
TentacoolPicFront::          INCBIN "gfx/pokemon/front/tentacool.2bpp"
TentacoolPicFrontYellow::    INCBIN "gfx/pokemon/front_y/tentacool.2bpp"
TentacoolPicFrontGreen::     INCBIN "gfx/pokemon/front_rg/tentacool.2bpp"

SECTION "Tentacruel Sprites", ROMX
TentacruelPics::
TentacruelPicBack::          INCBIN "gfx/pokemon/back/tentacruelb.2bpp"
TentacruelPicBackYellow::    INCBIN "gfx/pokemon/back_y/tentacruelb.2bpp"
TentacruelPicBackGreen::     INCBIN "gfx/pokemon/back_rg/tentacruelb.2bpp"
TentacruelPicFront::         INCBIN "gfx/pokemon/front/tentacruel.2bpp"
TentacruelPicFrontYellow::   INCBIN "gfx/pokemon/front_y/tentacruel.2bpp"
TentacruelPicFrontGreen::    INCBIN "gfx/pokemon/front_rg/tentacruel.2bpp"

SECTION "Geodude Sprites", ROMX
GeodudePics::
GeodudePicBack::             INCBIN "gfx/pokemon/back/geodudeb.2bpp"
GeodudePicBackYellow::       INCBIN "gfx/pokemon/back_y/geodudeb.2bpp"
GeodudePicBackGreen::        INCBIN "gfx/pokemon/back_rg/geodudeb.2bpp"
GeodudePicFront::            INCBIN "gfx/pokemon/front/geodude.2bpp"
GeodudePicFrontYellow::      INCBIN "gfx/pokemon/front_y/geodude.2bpp"
GeodudePicFrontGreen::       INCBIN "gfx/pokemon/front_rg/geodude.2bpp"

SECTION "Graveler Sprites", ROMX
GravelerPics::
GravelerPicBack::            INCBIN "gfx/pokemon/back/gravelerb.2bpp"
GravelerPicBackYellow::      INCBIN "gfx/pokemon/back_y/gravelerb.2bpp"
GravelerPicBackGreen::       INCBIN "gfx/pokemon/back_rg/gravelerb.2bpp"
GravelerPicFront::           INCBIN "gfx/pokemon/front/graveler.2bpp"
GravelerPicFrontYellow::     INCBIN "gfx/pokemon/front_y/graveler.2bpp"
GravelerPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/graveler.2bpp"

SECTION "Golem Sprites", ROMX
GolemPics::
GolemPicBack::               INCBIN "gfx/pokemon/back/golemb.2bpp"
GolemPicBackYellow::         INCBIN "gfx/pokemon/back_y/golemb.2bpp"
GolemPicBackGreen::          INCBIN "gfx/pokemon/back_rg/golemb.2bpp"
GolemPicFront::              INCBIN "gfx/pokemon/front/golem.2bpp"
GolemPicFrontYellow::        INCBIN "gfx/pokemon/front_y/golem.2bpp"
GolemPicFrontGreen::         INCBIN "gfx/pokemon/front_rg/golem.2bpp"

SECTION "Ponyta Sprites", ROMX
PonytaPics::
PonytaPicBack::              INCBIN "gfx/pokemon/back/ponytab.2bpp"
PonytaPicBackYellow::        INCBIN "gfx/pokemon/back_y/ponytab.2bpp"
PonytaPicBackGreen::         INCBIN "gfx/pokemon/back_rg/ponytab.2bpp"
PonytaPicFront::             INCBIN "gfx/pokemon/front/ponyta.2bpp"
PonytaPicFrontYellow::       INCBIN "gfx/pokemon/front_y/ponyta.2bpp"
PonytaPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/ponyta.2bpp"

SECTION "Rapidash Sprites", ROMX
RapidashPics::
RapidashPicBack::            INCBIN "gfx/pokemon/back/rapidashb.2bpp"
RapidashPicBackYellow::      INCBIN "gfx/pokemon/back_y/rapidashb.2bpp"
RapidashPicBackGreen::       INCBIN "gfx/pokemon/back_rg/rapidashb.2bpp"
RapidashPicFront::           INCBIN "gfx/pokemon/front/rapidash.2bpp"
RapidashPicFrontYellow::     INCBIN "gfx/pokemon/front_y/rapidash.2bpp"
RapidashPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/rapidash.2bpp"

SECTION "Slowpoke Sprites", ROMX
SlowpokePics::
SlowpokePicBack::            INCBIN "gfx/pokemon/back/slowpokeb.2bpp"
SlowpokePicBackYellow::      INCBIN "gfx/pokemon/back_y/slowpokeb.2bpp"
SlowpokePicBackGreen::       INCBIN "gfx/pokemon/back_rg/slowpokeb.2bpp"
SlowpokePicFront::           INCBIN "gfx/pokemon/front/slowpoke.2bpp"
SlowpokePicFrontYellow::     INCBIN "gfx/pokemon/front_y/slowpoke.2bpp"
SlowpokePicFrontGreen::      INCBIN "gfx/pokemon/front_rg/slowpoke.2bpp"

SECTION "Slowbro Sprites", ROMX
SlowbroPics::
SlowbroPicBack::             INCBIN "gfx/pokemon/back/slowbrob.2bpp"
SlowbroPicBackYellow::       INCBIN "gfx/pokemon/back_y/slowbrob.2bpp"
SlowbroPicBackGreen::        INCBIN "gfx/pokemon/back_rg/slowbrob.2bpp"
SlowbroPicFront::            INCBIN "gfx/pokemon/front/slowbro.2bpp"
SlowbroPicFrontYellow::      INCBIN "gfx/pokemon/front_y/slowbro.2bpp"
SlowbroPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/slowbro.2bpp"

SECTION "Magnemite Sprites", ROMX
MagnemitePics::
MagnemitePicBack::           INCBIN "gfx/pokemon/back/magnemiteb.2bpp"
MagnemitePicBackYellow::     INCBIN "gfx/pokemon/back_y/magnemiteb.2bpp"
MagnemitePicBackGreen::      INCBIN "gfx/pokemon/back_rg/magnemiteb.2bpp"
MagnemitePicFront::          INCBIN "gfx/pokemon/front/magnemite.2bpp"
MagnemitePicFrontYellow::    INCBIN "gfx/pokemon/front_y/magnemite.2bpp"
MagnemitePicFrontGreen::     INCBIN "gfx/pokemon/front_rg/magnemite.2bpp"

SECTION "Magneton Sprites", ROMX
MagnetonPics::
MagnetonPicBack::            INCBIN "gfx/pokemon/back/magnetonb.2bpp"
MagnetonPicBackYellow::      INCBIN "gfx/pokemon/back_y/magnetonb.2bpp"
MagnetonPicBackGreen::       INCBIN "gfx/pokemon/back_rg/magnetonb.2bpp"
MagnetonPicFront::           INCBIN "gfx/pokemon/front/magneton.2bpp"
MagnetonPicFrontYellow::     INCBIN "gfx/pokemon/front_y/magneton.2bpp"
MagnetonPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/magneton.2bpp"

SECTION "Farfetchd Sprites", ROMX
FarfetchdPics::
FarfetchdPicBack::           INCBIN "gfx/pokemon/back/farfetchdb.2bpp"
FarfetchdPicBackYellow::     INCBIN "gfx/pokemon/back_y/farfetchdb.2bpp"
FarfetchdPicBackGreen::      INCBIN "gfx/pokemon/back_rg/farfetchdb.2bpp"
FarfetchdPicFront::          INCBIN "gfx/pokemon/front/farfetchd.2bpp"
FarfetchdPicFrontYellow::    INCBIN "gfx/pokemon/front_y/farfetchd.2bpp"
FarfetchdPicFrontGreen::     INCBIN "gfx/pokemon/front_rg/farfetchd.2bpp"

SECTION "Doduo Sprites", ROMX
DoduoPics::
DoduoPicBack::               INCBIN "gfx/pokemon/back/doduob.2bpp"
DoduoPicBackYellow::         INCBIN "gfx/pokemon/back_y/doduob.2bpp"
DoduoPicBackGreen::          INCBIN "gfx/pokemon/back_rg/doduob.2bpp"
DoduoPicFront::              INCBIN "gfx/pokemon/front/doduo.2bpp"
DoduoPicFrontYellow::        INCBIN "gfx/pokemon/front_y/doduo.2bpp"
DoduoPicFrontGreen::         INCBIN "gfx/pokemon/front_rg/doduo.2bpp"

SECTION "Dodrio Sprites", ROMX
DodrioPics::
DodrioPicBack::              INCBIN "gfx/pokemon/back/dodriob.2bpp"
DodrioPicBackYellow::        INCBIN "gfx/pokemon/back_y/dodriob.2bpp"
DodrioPicBackGreen::         INCBIN "gfx/pokemon/back_rg/dodriob.2bpp"
DodrioPicFront::             INCBIN "gfx/pokemon/front/dodrio.2bpp"
DodrioPicFrontYellow::       INCBIN "gfx/pokemon/front_y/dodrio.2bpp"
DodrioPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/dodrio.2bpp"

SECTION "Seel Sprites", ROMX
SeelPics::
SeelPicBack::                INCBIN "gfx/pokemon/back/seelb.2bpp"
SeelPicBackYellow::          INCBIN "gfx/pokemon/back_y/seelb.2bpp"
SeelPicBackGreen::           INCBIN "gfx/pokemon/back_rg/seelb.2bpp"
SeelPicFront::               INCBIN "gfx/pokemon/front/seel.2bpp"
SeelPicFrontYellow::         INCBIN "gfx/pokemon/front_y/seel.2bpp"
SeelPicFrontGreen::          INCBIN "gfx/pokemon/front_rg/seel.2bpp"

SECTION "Dewgong Sprites", ROMX
DewgongPics::
DewgongPicBack::             INCBIN "gfx/pokemon/back/dewgongb.2bpp"
DewgongPicBackYellow::       INCBIN "gfx/pokemon/back_y/dewgongb.2bpp"
DewgongPicBackGreen::        INCBIN "gfx/pokemon/back_rg/dewgongb.2bpp"
DewgongPicFront::            INCBIN "gfx/pokemon/front/dewgong.2bpp"
DewgongPicFrontYellow::      INCBIN "gfx/pokemon/front_y/dewgong.2bpp"
DewgongPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/dewgong.2bpp"

SECTION "Grimer Sprites", ROMX
GrimerPics::
GrimerPicBack::              INCBIN "gfx/pokemon/back/grimerb.2bpp"
GrimerPicBackYellow::        INCBIN "gfx/pokemon/back_y/grimerb.2bpp"
GrimerPicBackGreen::         INCBIN "gfx/pokemon/back_rg/grimerb.2bpp"
GrimerPicFront::             INCBIN "gfx/pokemon/front/grimer.2bpp"
GrimerPicFrontYellow::       INCBIN "gfx/pokemon/front_y/grimer.2bpp"
GrimerPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/grimer.2bpp"

SECTION "Muk Sprites", ROMX
MukPics::
MukPicBack::                 INCBIN "gfx/pokemon/back/mukb.2bpp"
MukPicBackYellow::           INCBIN "gfx/pokemon/back_y/mukb.2bpp"
MukPicBackGreen::            INCBIN "gfx/pokemon/back_rg/mukb.2bpp"
MukPicFront::                INCBIN "gfx/pokemon/front/muk.2bpp"
MukPicFrontYellow::          INCBIN "gfx/pokemon/front_y/muk.2bpp"
MukPicFrontGreen::           INCBIN "gfx/pokemon/front_rg/muk.2bpp"

SECTION "Shellder Sprites", ROMX
ShellderPics::
ShellderPicBack::            INCBIN "gfx/pokemon/back/shellderb.2bpp"
ShellderPicBackYellow::      INCBIN "gfx/pokemon/back_y/shellderb.2bpp"
ShellderPicBackGreen::       INCBIN "gfx/pokemon/back_rg/shellderb.2bpp"
ShellderPicFront::           INCBIN "gfx/pokemon/front/shellder.2bpp"
ShellderPicFrontYellow::     INCBIN "gfx/pokemon/front_y/shellder.2bpp"
ShellderPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/shellder.2bpp"

SECTION "Cloyster Sprites", ROMX
CloysterPics::
CloysterPicBack::            INCBIN "gfx/pokemon/back/cloysterb.2bpp"
CloysterPicBackYellow::      INCBIN "gfx/pokemon/back_y/cloysterb.2bpp"
CloysterPicBackGreen::       INCBIN "gfx/pokemon/back_rg/cloysterb.2bpp"
CloysterPicFront::           INCBIN "gfx/pokemon/front/cloyster.2bpp"
CloysterPicFrontYellow::     INCBIN "gfx/pokemon/front_y/cloyster.2bpp"
CloysterPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/cloyster.2bpp"

SECTION "Gastly Sprites", ROMX
GastlyPics::
GastlyPicBack::              INCBIN "gfx/pokemon/back/gastlyb.2bpp"
GastlyPicBackYellow::        INCBIN "gfx/pokemon/back_y/gastlyb.2bpp"
GastlyPicBackGreen::         INCBIN "gfx/pokemon/back_rg/gastlyb.2bpp"
GastlyPicFront::             INCBIN "gfx/pokemon/front/gastly.2bpp"
GastlyPicFrontYellow::       INCBIN "gfx/pokemon/front_y/gastly.2bpp"
GastlyPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/gastly.2bpp"

SECTION "Haunter Sprites", ROMX
HaunterPics::
HaunterPicBack::             INCBIN "gfx/pokemon/back/haunterb.2bpp"
HaunterPicBackYellow::       INCBIN "gfx/pokemon/back_y/haunterb.2bpp"
HaunterPicBackGreen::        INCBIN "gfx/pokemon/back_rg/haunterb.2bpp"
HaunterPicFront::            INCBIN "gfx/pokemon/front/haunter.2bpp"
HaunterPicFrontYellow::      INCBIN "gfx/pokemon/front_y/haunter.2bpp"
HaunterPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/haunter.2bpp"

SECTION "Gengar Sprites", ROMX
GengarPics::
GengarPicBack::              INCBIN "gfx/pokemon/back/gengarb.2bpp"
GengarPicBackYellow::        INCBIN "gfx/pokemon/back_y/gengarb.2bpp"
GengarPicBackGreen::         INCBIN "gfx/pokemon/back_rg/gengarb.2bpp"
GengarPicFront::             INCBIN "gfx/pokemon/front/gengar.2bpp"
GengarPicFrontYellow::       INCBIN "gfx/pokemon/front_y/gengar.2bpp"
GengarPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/gengar.2bpp"

SECTION "Onix Sprites", ROMX
OnixPics::
OnixPicBack::                INCBIN "gfx/pokemon/back/onixb.2bpp"
OnixPicBackYellow::          INCBIN "gfx/pokemon/back_y/onixb.2bpp"
OnixPicBackGreen::           INCBIN "gfx/pokemon/back_rg/onixb.2bpp"
OnixPicFront::               INCBIN "gfx/pokemon/front/onix.2bpp"
OnixPicFrontYellow::         INCBIN "gfx/pokemon/front_y/onix.2bpp"
OnixPicFrontGreen::          INCBIN "gfx/pokemon/front_rg/onix.2bpp"

SECTION "Drowzee Sprites", ROMX
DrowzeePics::
DrowzeePicBack::             INCBIN "gfx/pokemon/back/drowzeeb.2bpp"
DrowzeePicBackYellow::       INCBIN "gfx/pokemon/back_y/drowzeeb.2bpp"
DrowzeePicBackGreen::        INCBIN "gfx/pokemon/back_rg/drowzeeb.2bpp"
DrowzeePicFront::            INCBIN "gfx/pokemon/front/drowzee.2bpp"
DrowzeePicFrontYellow::      INCBIN "gfx/pokemon/front_y/drowzee.2bpp"
DrowzeePicFrontGreen::       INCBIN "gfx/pokemon/front_rg/drowzee.2bpp"

SECTION "Hypno Sprites", ROMX
HypnoPics::
HypnoPicBack::               INCBIN "gfx/pokemon/back/hypnob.2bpp"
HypnoPicBackYellow::         INCBIN "gfx/pokemon/back_y/hypnob.2bpp"
HypnoPicBackGreen::          INCBIN "gfx/pokemon/back_rg/hypnob.2bpp"
HypnoPicFront::              INCBIN "gfx/pokemon/front/hypno.2bpp"
HypnoPicFrontYellow::        INCBIN "gfx/pokemon/front_y/hypno.2bpp"
HypnoPicFrontGreen::         INCBIN "gfx/pokemon/front_rg/hypno.2bpp"

SECTION "Krabby Sprites", ROMX
KrabbyPics::
KrabbyPicBack::              INCBIN "gfx/pokemon/back/krabbyb.2bpp"
KrabbyPicBackYellow::        INCBIN "gfx/pokemon/back_y/krabbyb.2bpp"
KrabbyPicBackGreen::         INCBIN "gfx/pokemon/back_rg/krabbyb.2bpp"
KrabbyPicFront::             INCBIN "gfx/pokemon/front/krabby.2bpp"
KrabbyPicFrontYellow::       INCBIN "gfx/pokemon/front_y/krabby.2bpp"
KrabbyPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/krabby.2bpp"

SECTION "Kingler Sprites", ROMX
KinglerPics::
KinglerPicBack::             INCBIN "gfx/pokemon/back/kinglerb.2bpp"
KinglerPicBackYellow::       INCBIN "gfx/pokemon/back_y/kinglerb.2bpp"
KinglerPicBackGreen::        INCBIN "gfx/pokemon/back_rg/kinglerb.2bpp"
KinglerPicFront::            INCBIN "gfx/pokemon/front/kingler.2bpp"
KinglerPicFrontYellow::      INCBIN "gfx/pokemon/front_y/kingler.2bpp"
KinglerPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/kingler.2bpp"

SECTION "Voltorb Sprites", ROMX
VoltorbPics::
VoltorbPicBack::             INCBIN "gfx/pokemon/back/voltorbb.2bpp"
VoltorbPicBackYellow::       INCBIN "gfx/pokemon/back_y/voltorbb.2bpp"
VoltorbPicBackGreen::        INCBIN "gfx/pokemon/back_rg/voltorbb.2bpp"
VoltorbPicFront::            INCBIN "gfx/pokemon/front/voltorb.2bpp"
VoltorbPicFrontYellow::      INCBIN "gfx/pokemon/front_y/voltorb.2bpp"
VoltorbPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/voltorb.2bpp"

SECTION "Electrode Sprites", ROMX
ElectrodePics::
ElectrodePicBack::           INCBIN "gfx/pokemon/back/electrodeb.2bpp"
ElectrodePicBackYellow::     INCBIN "gfx/pokemon/back_y/electrodeb.2bpp"
ElectrodePicBackGreen::      INCBIN "gfx/pokemon/back_rg/electrodeb.2bpp"
ElectrodePicFront::          INCBIN "gfx/pokemon/front/electrode.2bpp"
ElectrodePicFrontYellow::    INCBIN "gfx/pokemon/front_y/electrode.2bpp"
ElectrodePicFrontGreen::     INCBIN "gfx/pokemon/front_rg/electrode.2bpp"

SECTION "Exeggcute Sprites", ROMX
ExeggcutePics::
ExeggcutePicBack::           INCBIN "gfx/pokemon/back/exeggcuteb.2bpp"
ExeggcutePicBackYellow::     INCBIN "gfx/pokemon/back_y/exeggcuteb.2bpp"
ExeggcutePicBackGreen::      INCBIN "gfx/pokemon/back_rg/exeggcuteb.2bpp"
ExeggcutePicFront::          INCBIN "gfx/pokemon/front/exeggcute.2bpp"
ExeggcutePicFrontYellow::    INCBIN "gfx/pokemon/front_y/exeggcute.2bpp"
ExeggcutePicFrontGreen::     INCBIN "gfx/pokemon/front_rg/exeggcute.2bpp"

SECTION "Exeggutor Sprites", ROMX
ExeggutorPics::
ExeggutorPicBack::           INCBIN "gfx/pokemon/back/exeggutorb.2bpp"
ExeggutorPicBackYellow::     INCBIN "gfx/pokemon/back_y/exeggutorb.2bpp"
ExeggutorPicBackGreen::      INCBIN "gfx/pokemon/back_rg/exeggutorb.2bpp"
ExeggutorPicFront::          INCBIN "gfx/pokemon/front/exeggutor.2bpp"
ExeggutorPicFrontYellow::    INCBIN "gfx/pokemon/front_y/exeggutor.2bpp"
ExeggutorPicFrontGreen::     INCBIN "gfx/pokemon/front_rg/exeggutor.2bpp"

SECTION "Cubone Sprites", ROMX
CubonePics::
CubonePicBack::              INCBIN "gfx/pokemon/back/cuboneb.2bpp"
CubonePicBackYellow::        INCBIN "gfx/pokemon/back_y/cuboneb.2bpp"
CubonePicBackGreen::         INCBIN "gfx/pokemon/back_rg/cuboneb.2bpp"
CubonePicFront::             INCBIN "gfx/pokemon/front/cubone.2bpp"
CubonePicFrontYellow::       INCBIN "gfx/pokemon/front_y/cubone.2bpp"
CubonePicFrontGreen::        INCBIN "gfx/pokemon/front_rg/cubone.2bpp"

SECTION "Marowak Sprites", ROMX
MarowakPics::
MarowakPicBack::             INCBIN "gfx/pokemon/back/marowakb.2bpp"
MarowakPicBackYellow::       INCBIN "gfx/pokemon/back_y/marowakb.2bpp"
MarowakPicBackGreen::        INCBIN "gfx/pokemon/back_rg/marowakb.2bpp"
MarowakPicFront::            INCBIN "gfx/pokemon/front/marowak.2bpp"
MarowakPicFrontYellow::      INCBIN "gfx/pokemon/front_y/marowak.2bpp"
MarowakPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/marowak.2bpp"

SECTION "Hitmonlee Sprites", ROMX
HitmonleePics::
HitmonleePicBack::           INCBIN "gfx/pokemon/back/hitmonleeb.2bpp"
HitmonleePicBackYellow::     INCBIN "gfx/pokemon/back_y/hitmonleeb.2bpp"
HitmonleePicBackGreen::      INCBIN "gfx/pokemon/back_rg/hitmonleeb.2bpp"
HitmonleePicFront::          INCBIN "gfx/pokemon/front/hitmonlee.2bpp"
HitmonleePicFrontYellow::    INCBIN "gfx/pokemon/front_y/hitmonlee.2bpp"
HitmonleePicFrontGreen::     INCBIN "gfx/pokemon/front_rg/hitmonlee.2bpp"

SECTION "Hitmonchan Sprites", ROMX
HitmonchanPics::
HitmonchanPicBack::          INCBIN "gfx/pokemon/back/hitmonchanb.2bpp"
HitmonchanPicBackYellow::    INCBIN "gfx/pokemon/back_y/hitmonchanb.2bpp"
HitmonchanPicBackGreen::     INCBIN "gfx/pokemon/back_rg/hitmonchanb.2bpp"
HitmonchanPicFront::         INCBIN "gfx/pokemon/front/hitmonchan.2bpp"
HitmonchanPicFrontYellow::   INCBIN "gfx/pokemon/front_y/hitmonchan.2bpp"
HitmonchanPicFrontGreen::    INCBIN "gfx/pokemon/front_rg/hitmonchan.2bpp"

SECTION "Lickitung Sprites", ROMX
LickitungPics::
LickitungPicBack::           INCBIN "gfx/pokemon/back/lickitungb.2bpp"
LickitungPicBackYellow::     INCBIN "gfx/pokemon/back_y/lickitungb.2bpp"
LickitungPicBackGreen::      INCBIN "gfx/pokemon/back_rg/lickitungb.2bpp"
LickitungPicFront::          INCBIN "gfx/pokemon/front/lickitung.2bpp"
LickitungPicFrontYellow::    INCBIN "gfx/pokemon/front_y/lickitung.2bpp"
LickitungPicFrontGreen::     INCBIN "gfx/pokemon/front_rg/lickitung.2bpp"

SECTION "Koffing Sprites", ROMX
KoffingPics::
KoffingPicBack::             INCBIN "gfx/pokemon/back/koffingb.2bpp"
KoffingPicBackYellow::       INCBIN "gfx/pokemon/back_y/koffingb.2bpp"
KoffingPicBackGreen::        INCBIN "gfx/pokemon/back_rg/koffingb.2bpp"
KoffingPicFront::            INCBIN "gfx/pokemon/front/koffing.2bpp"
KoffingPicFrontYellow::      INCBIN "gfx/pokemon/front_y/koffing.2bpp"
KoffingPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/koffing.2bpp"

SECTION "Weezing Sprites", ROMX
WeezingPics::
WeezingPicBack::             INCBIN "gfx/pokemon/back/weezingb.2bpp"
WeezingPicBackYellow::       INCBIN "gfx/pokemon/back_y/weezingb.2bpp"
WeezingPicBackGreen::        INCBIN "gfx/pokemon/back_rg/weezingb.2bpp"
WeezingPicFront::            INCBIN "gfx/pokemon/front/weezing.2bpp"
WeezingPicFrontYellow::      INCBIN "gfx/pokemon/front_y/weezing.2bpp"
WeezingPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/weezing.2bpp"

SECTION "Rhyhorn Sprites", ROMX
RhyhornPics::
RhyhornPicBack::             INCBIN "gfx/pokemon/back/rhyhornb.2bpp"
RhyhornPicBackYellow::       INCBIN "gfx/pokemon/back_y/rhyhornb.2bpp"
RhyhornPicBackGreen::        INCBIN "gfx/pokemon/back_rg/rhyhornb.2bpp"
RhyhornPicFront::            INCBIN "gfx/pokemon/front/rhyhorn.2bpp"
RhyhornPicFrontYellow::      INCBIN "gfx/pokemon/front_y/rhyhorn.2bpp"
RhyhornPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/rhyhorn.2bpp"

SECTION "Rhydon Sprites", ROMX
RhydonPics::
RhydonPicBack::              INCBIN "gfx/pokemon/back/rhydonb.2bpp"
RhydonPicBackYellow::        INCBIN "gfx/pokemon/back_y/rhydonb.2bpp"
RhydonPicBackGreen::         INCBIN "gfx/pokemon/back_rg/rhydonb.2bpp"
RhydonPicFront::             INCBIN "gfx/pokemon/front/rhydon.2bpp"
RhydonPicFrontYellow::       INCBIN "gfx/pokemon/front_y/rhydon.2bpp"
RhydonPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/rhydon.2bpp"

SECTION "Chansey Sprites", ROMX
ChanseyPics::
ChanseyPicBack::             INCBIN "gfx/pokemon/back/chanseyb.2bpp"
ChanseyPicBackYellow::       INCBIN "gfx/pokemon/back_y/chanseyb.2bpp"
ChanseyPicBackGreen::        INCBIN "gfx/pokemon/back_rg/chanseyb.2bpp"
ChanseyPicFront::            INCBIN "gfx/pokemon/front/chansey.2bpp"
ChanseyPicFrontYellow::      INCBIN "gfx/pokemon/front_y/chansey.2bpp"
ChanseyPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/chansey.2bpp"

SECTION "Tangela Sprites", ROMX
TangelaPics::
TangelaPicBack::             INCBIN "gfx/pokemon/back/tangelab.2bpp"
TangelaPicBackYellow::       INCBIN "gfx/pokemon/back_y/tangelab.2bpp"
TangelaPicBackGreen::        INCBIN "gfx/pokemon/back_rg/tangelab.2bpp"
TangelaPicFront::            INCBIN "gfx/pokemon/front/tangela.2bpp"
TangelaPicFrontYellow::      INCBIN "gfx/pokemon/front_y/tangela.2bpp"
TangelaPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/tangela.2bpp"

SECTION "Kangaskhan Sprites", ROMX
KangaskhanPics::
KangaskhanPicBack::          INCBIN "gfx/pokemon/back/kangaskhanb.2bpp"
KangaskhanPicBackYellow::    INCBIN "gfx/pokemon/back_y/kangaskhanb.2bpp"
KangaskhanPicBackGreen::     INCBIN "gfx/pokemon/back_rg/kangaskhanb.2bpp"
KangaskhanPicFront::         INCBIN "gfx/pokemon/front/kangaskhan.2bpp"
KangaskhanPicFrontYellow::   INCBIN "gfx/pokemon/front_y/kangaskhan.2bpp"
KangaskhanPicFrontGreen::    INCBIN "gfx/pokemon/front_rg/kangaskhan.2bpp"

SECTION "Horsea Sprites", ROMX
HorseaPics::
HorseaPicBack::              INCBIN "gfx/pokemon/back/horseab.2bpp"
HorseaPicBackYellow::        INCBIN "gfx/pokemon/back_y/horseab.2bpp"
HorseaPicBackGreen::         INCBIN "gfx/pokemon/back_rg/horseab.2bpp"
HorseaPicFront::             INCBIN "gfx/pokemon/front/horsea.2bpp"
HorseaPicFrontYellow::       INCBIN "gfx/pokemon/front_y/horsea.2bpp"
HorseaPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/horsea.2bpp"

SECTION "Seadra Sprites", ROMX
SeadraPics::
SeadraPicBack::              INCBIN "gfx/pokemon/back/seadrab.2bpp"
SeadraPicBackYellow::        INCBIN "gfx/pokemon/back_y/seadrab.2bpp"
SeadraPicBackGreen::         INCBIN "gfx/pokemon/back_rg/seadrab.2bpp"
SeadraPicFront::             INCBIN "gfx/pokemon/front/seadra.2bpp"
SeadraPicFrontYellow::       INCBIN "gfx/pokemon/front_y/seadra.2bpp"
SeadraPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/seadra.2bpp"

SECTION "Goldeen Sprites", ROMX
GoldeenPics::
GoldeenPicBack::             INCBIN "gfx/pokemon/back/goldeenb.2bpp"
GoldeenPicBackYellow::       INCBIN "gfx/pokemon/back_y/goldeenb.2bpp"
GoldeenPicBackGreen::        INCBIN "gfx/pokemon/back_rg/goldeenb.2bpp"
GoldeenPicFront::            INCBIN "gfx/pokemon/front/goldeen.2bpp"
GoldeenPicFrontYellow::      INCBIN "gfx/pokemon/front_y/goldeen.2bpp"
GoldeenPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/goldeen.2bpp"

SECTION "Seaking Sprites", ROMX
SeakingPics::
SeakingPicBack::             INCBIN "gfx/pokemon/back/seakingb.2bpp"
SeakingPicBackYellow::       INCBIN "gfx/pokemon/back_y/seakingb.2bpp"
SeakingPicBackGreen::        INCBIN "gfx/pokemon/back_rg/seakingb.2bpp"
SeakingPicFront::            INCBIN "gfx/pokemon/front/seaking.2bpp"
SeakingPicFrontYellow::      INCBIN "gfx/pokemon/front_y/seaking.2bpp"
SeakingPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/seaking.2bpp"

SECTION "Staryu Sprites", ROMX
StaryuPics::
StaryuPicBack::              INCBIN "gfx/pokemon/back/staryub.2bpp"
StaryuPicBackYellow::        INCBIN "gfx/pokemon/back_y/staryub.2bpp"
StaryuPicBackGreen::         INCBIN "gfx/pokemon/back_rg/staryub.2bpp"
StaryuPicFront::             INCBIN "gfx/pokemon/front/staryu.2bpp"
StaryuPicFrontYellow::       INCBIN "gfx/pokemon/front_y/staryu.2bpp"
StaryuPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/staryu.2bpp"

SECTION "Starmie Sprites", ROMX
StarmiePics::
StarmiePicBack::             INCBIN "gfx/pokemon/back/starmieb.2bpp"
StarmiePicBackYellow::       INCBIN "gfx/pokemon/back_y/starmieb.2bpp"
StarmiePicBackGreen::        INCBIN "gfx/pokemon/back_rg/starmieb.2bpp"
StarmiePicFront::            INCBIN "gfx/pokemon/front/starmie.2bpp"
StarmiePicFrontYellow::      INCBIN "gfx/pokemon/front_y/starmie.2bpp"
StarmiePicFrontGreen::       INCBIN "gfx/pokemon/front_rg/starmie.2bpp"

SECTION "MrMime Sprites", ROMX
MrMimePics::
MrMimePicBack::              INCBIN "gfx/pokemon/back/mr.mimeb.2bpp"
MrMimePicBackYellow::        INCBIN "gfx/pokemon/back_y/mr.mimeb.2bpp"
MrMimePicBackGreen::         INCBIN "gfx/pokemon/back_rg/mr.mimeb.2bpp"
MrMimePicFront::             INCBIN "gfx/pokemon/front/mr.mime.2bpp"
MrMimePicFrontYellow::       INCBIN "gfx/pokemon/front_y/mr.mime.2bpp"
MrMimePicFrontGreen::        INCBIN "gfx/pokemon/front_rg/mr.mime.2bpp"

SECTION "Scyther Sprites", ROMX
ScytherPics::
ScytherPicBack::             INCBIN "gfx/pokemon/back/scytherb.2bpp"
ScytherPicBackYellow::       INCBIN "gfx/pokemon/back_y/scytherb.2bpp"
ScytherPicBackGreen::        INCBIN "gfx/pokemon/back_rg/scytherb.2bpp"
ScytherPicFront::            INCBIN "gfx/pokemon/front/scyther.2bpp"
ScytherPicFrontYellow::      INCBIN "gfx/pokemon/front_y/scyther.2bpp"
ScytherPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/scyther.2bpp"

SECTION "Jynx Sprites", ROMX
JynxPics::
JynxPicBack::                INCBIN "gfx/pokemon/back/jynxb.2bpp"
JynxPicBackYellow::          INCBIN "gfx/pokemon/back_y/jynxb.2bpp"
JynxPicBackGreen::           INCBIN "gfx/pokemon/back_rg/jynxb.2bpp"
JynxPicFront::               INCBIN "gfx/pokemon/front/jynx.2bpp"
JynxPicFrontYellow::         INCBIN "gfx/pokemon/front_y/jynx.2bpp"
JynxPicFrontGreen::          INCBIN "gfx/pokemon/front_rg/jynx.2bpp"

SECTION "Electabuzz Sprites", ROMX
ElectabuzzPics::
ElectabuzzPicBack::          INCBIN "gfx/pokemon/back/electabuzzb.2bpp"
ElectabuzzPicBackYellow::    INCBIN "gfx/pokemon/back_y/electabuzzb.2bpp"
ElectabuzzPicBackGreen::     INCBIN "gfx/pokemon/back_rg/electabuzzb.2bpp"
ElectabuzzPicFront::         INCBIN "gfx/pokemon/front/electabuzz.2bpp"
ElectabuzzPicFrontYellow::   INCBIN "gfx/pokemon/front_y/electabuzz.2bpp"
ElectabuzzPicFrontGreen::    INCBIN "gfx/pokemon/front_rg/electabuzz.2bpp"

SECTION "Magmar Sprites", ROMX
MagmarPics::
MagmarPicBack::              INCBIN "gfx/pokemon/back/magmarb.2bpp"
MagmarPicBackYellow::        INCBIN "gfx/pokemon/back_y/magmarb.2bpp"
MagmarPicBackGreen::         INCBIN "gfx/pokemon/back_rg/magmarb.2bpp"
MagmarPicFront::             INCBIN "gfx/pokemon/front/magmar.2bpp"
MagmarPicFrontYellow::       INCBIN "gfx/pokemon/front_y/magmar.2bpp"
MagmarPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/magmar.2bpp"

SECTION "Pinsir Sprites", ROMX
PinsirPics::
PinsirPicBack::              INCBIN "gfx/pokemon/back/pinsirb.2bpp"
PinsirPicBackYellow::        INCBIN "gfx/pokemon/back_y/pinsirb.2bpp"
PinsirPicBackGreen::         INCBIN "gfx/pokemon/back_rg/pinsirb.2bpp"
PinsirPicFront::             INCBIN "gfx/pokemon/front/pinsir.2bpp"
PinsirPicFrontYellow::       INCBIN "gfx/pokemon/front_y/pinsir.2bpp"
PinsirPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/pinsir.2bpp"

SECTION "Tauros Sprites", ROMX
TaurosPics::
TaurosPicBack::              INCBIN "gfx/pokemon/back/taurosb.2bpp"
TaurosPicBackYellow::        INCBIN "gfx/pokemon/back_y/taurosb.2bpp"
TaurosPicBackGreen::         INCBIN "gfx/pokemon/back_rg/taurosb.2bpp"
TaurosPicFront::             INCBIN "gfx/pokemon/front/tauros.2bpp"
TaurosPicFrontYellow::       INCBIN "gfx/pokemon/front_y/tauros.2bpp"
TaurosPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/tauros.2bpp"

SECTION "Magikarp Sprites", ROMX
MagikarpPics::
MagikarpPicBack::            INCBIN "gfx/pokemon/back/magikarpb.2bpp"
MagikarpPicBackYellow::      INCBIN "gfx/pokemon/back_y/magikarpb.2bpp"
MagikarpPicBackGreen::       INCBIN "gfx/pokemon/back_rg/magikarpb.2bpp"
MagikarpPicFront::           INCBIN "gfx/pokemon/front/magikarp.2bpp"
MagikarpPicFrontYellow::     INCBIN "gfx/pokemon/front_y/magikarp.2bpp"
MagikarpPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/magikarp.2bpp"

SECTION "Gyarados Sprites", ROMX
GyaradosPics::
GyaradosPicBack::            INCBIN "gfx/pokemon/back/gyaradosb.2bpp"
GyaradosPicBackYellow::      INCBIN "gfx/pokemon/back_y/gyaradosb.2bpp"
GyaradosPicBackGreen::       INCBIN "gfx/pokemon/back_rg/gyaradosb.2bpp"
GyaradosPicFront::           INCBIN "gfx/pokemon/front/gyarados.2bpp"
GyaradosPicFrontYellow::     INCBIN "gfx/pokemon/front_y/gyarados.2bpp"
GyaradosPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/gyarados.2bpp"

SECTION "Lapras Sprites", ROMX
LaprasPics::
LaprasPicBack::              INCBIN "gfx/pokemon/back/laprasb.2bpp"
LaprasPicBackYellow::        INCBIN "gfx/pokemon/back_y/laprasb.2bpp"
LaprasPicBackGreen::         INCBIN "gfx/pokemon/back_rg/laprasb.2bpp"
LaprasPicFront::             INCBIN "gfx/pokemon/front/lapras.2bpp"
LaprasPicFrontYellow::       INCBIN "gfx/pokemon/front_y/lapras.2bpp"
LaprasPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/lapras.2bpp"

SECTION "Ditto Sprites", ROMX
DittoPics::
DittoPicBack::               INCBIN "gfx/pokemon/back/dittob.2bpp"
DittoPicBackYellow::         INCBIN "gfx/pokemon/back_y/dittob.2bpp"
DittoPicBackGreen::          INCBIN "gfx/pokemon/back_rg/dittob.2bpp"
DittoPicFront::              INCBIN "gfx/pokemon/front/ditto.2bpp"
DittoPicFrontYellow::        INCBIN "gfx/pokemon/front_y/ditto.2bpp"
DittoPicFrontGreen::         INCBIN "gfx/pokemon/front_rg/ditto.2bpp"

SECTION "Eevee Sprites", ROMX
EeveePics::
EeveePicBack::               INCBIN "gfx/pokemon/back/eeveeb.2bpp"
EeveePicBackYellow::         INCBIN "gfx/pokemon/back_y/eeveeb.2bpp"
EeveePicBackGreen::          INCBIN "gfx/pokemon/back_rg/eeveeb.2bpp"
EeveePicFront::              INCBIN "gfx/pokemon/front/eevee.2bpp"
EeveePicFrontYellow::        INCBIN "gfx/pokemon/front_y/eevee.2bpp"
EeveePicFrontGreen::         INCBIN "gfx/pokemon/front_rg/eevee.2bpp"

SECTION "Vaporeon Sprites", ROMX
VaporeonPics::
VaporeonPicBack::            INCBIN "gfx/pokemon/back/vaporeonb.2bpp"
VaporeonPicBackYellow::      INCBIN "gfx/pokemon/back_y/vaporeonb.2bpp"
VaporeonPicBackGreen::       INCBIN "gfx/pokemon/back_rg/vaporeonb.2bpp"
VaporeonPicFront::           INCBIN "gfx/pokemon/front/vaporeon.2bpp"
VaporeonPicFrontYellow::     INCBIN "gfx/pokemon/front_y/vaporeon.2bpp"
VaporeonPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/vaporeon.2bpp"

SECTION "Jolteon Sprites", ROMX
JolteonPics::
JolteonPicBack::             INCBIN "gfx/pokemon/back/jolteonb.2bpp"
JolteonPicBackYellow::       INCBIN "gfx/pokemon/back_y/jolteonb.2bpp"
JolteonPicBackGreen::        INCBIN "gfx/pokemon/back_rg/jolteonb.2bpp"
JolteonPicFront::            INCBIN "gfx/pokemon/front/jolteon.2bpp"
JolteonPicFrontYellow::      INCBIN "gfx/pokemon/front_y/jolteon.2bpp"
JolteonPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/jolteon.2bpp"

SECTION "Flareon Sprites", ROMX
FlareonPics::
FlareonPicBack::             INCBIN "gfx/pokemon/back/flareonb.2bpp"
FlareonPicBackYellow::       INCBIN "gfx/pokemon/back_y/flareonb.2bpp"
FlareonPicBackGreen::        INCBIN "gfx/pokemon/back_rg/flareonb.2bpp"
FlareonPicFront::            INCBIN "gfx/pokemon/front/flareon.2bpp"
FlareonPicFrontYellow::      INCBIN "gfx/pokemon/front_y/flareon.2bpp"
FlareonPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/flareon.2bpp"

SECTION "Porygon Sprites", ROMX
PorygonPics::
PorygonPicBack::             INCBIN "gfx/pokemon/back/porygonb.2bpp"
PorygonPicBackYellow::       INCBIN "gfx/pokemon/back_y/porygonb.2bpp"
PorygonPicBackGreen::        INCBIN "gfx/pokemon/back_rg/porygonb.2bpp"
PorygonPicFront::            INCBIN "gfx/pokemon/front/porygon.2bpp"
PorygonPicFrontYellow::      INCBIN "gfx/pokemon/front_y/porygon.2bpp"
PorygonPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/porygon.2bpp"

SECTION "Omanyte Sprites", ROMX
OmanytePics::
OmanytePicBack::             INCBIN "gfx/pokemon/back/omanyteb.2bpp"
OmanytePicBackYellow::       INCBIN "gfx/pokemon/back_y/omanyteb.2bpp"
OmanytePicBackGreen::        INCBIN "gfx/pokemon/back_rg/omanyteb.2bpp"
OmanytePicFront::            INCBIN "gfx/pokemon/front/omanyte.2bpp"
OmanytePicFrontYellow::      INCBIN "gfx/pokemon/front_y/omanyte.2bpp"
OmanytePicFrontGreen::       INCBIN "gfx/pokemon/front_rg/omanyte.2bpp"

SECTION "Omastar Sprites", ROMX
OmastarPics::
OmastarPicBack::             INCBIN "gfx/pokemon/back/omastarb.2bpp"
OmastarPicBackYellow::       INCBIN "gfx/pokemon/back_y/omastarb.2bpp"
OmastarPicBackGreen::        INCBIN "gfx/pokemon/back_rg/omastarb.2bpp"
OmastarPicFront::            INCBIN "gfx/pokemon/front/omastar.2bpp"
OmastarPicFrontYellow::      INCBIN "gfx/pokemon/front_y/omastar.2bpp"
OmastarPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/omastar.2bpp"

SECTION "Kabuto Sprites", ROMX
KabutoPics::
KabutoPicBack::              INCBIN "gfx/pokemon/back/kabutob.2bpp"
KabutoPicBackYellow::        INCBIN "gfx/pokemon/back_y/kabutob.2bpp"
KabutoPicBackGreen::         INCBIN "gfx/pokemon/back_rg/kabutob.2bpp"
KabutoPicFront::             INCBIN "gfx/pokemon/front/kabuto.2bpp"
KabutoPicFrontYellow::       INCBIN "gfx/pokemon/front_y/kabuto.2bpp"
KabutoPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/kabuto.2bpp"

SECTION "Kabutops Sprites", ROMX
KabutopsPics::
KabutopsPicBack::            INCBIN "gfx/pokemon/back/kabutopsb.2bpp"
KabutopsPicBackYellow::      INCBIN "gfx/pokemon/back_y/kabutopsb.2bpp"
KabutopsPicBackGreen::       INCBIN "gfx/pokemon/back_rg/kabutopsb.2bpp"
KabutopsPicFront::           INCBIN "gfx/pokemon/front/kabutops.2bpp"
KabutopsPicFrontYellow::     INCBIN "gfx/pokemon/front_y/kabutops.2bpp"
KabutopsPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/kabutops.2bpp"

SECTION "Aerodactyl Sprites", ROMX
AerodactylPics::
AerodactylPicBack::          INCBIN "gfx/pokemon/back/aerodactylb.2bpp"
AerodactylPicBackYellow::    INCBIN "gfx/pokemon/back_y/aerodactylb.2bpp"
AerodactylPicBackGreen::     INCBIN "gfx/pokemon/back_rg/aerodactylb.2bpp"
AerodactylPicFront::         INCBIN "gfx/pokemon/front/aerodactyl.2bpp"
AerodactylPicFrontYellow::   INCBIN "gfx/pokemon/front_y/aerodactyl.2bpp"
AerodactylPicFrontGreen::    INCBIN "gfx/pokemon/front_rg/aerodactyl.2bpp"

SECTION "Snorlax Sprites", ROMX
SnorlaxPics::
SnorlaxPicBack::             INCBIN "gfx/pokemon/back/snorlaxb.2bpp"
SnorlaxPicBackYellow::       INCBIN "gfx/pokemon/back_y/snorlaxb.2bpp"
SnorlaxPicBackGreen::        INCBIN "gfx/pokemon/back_rg/snorlaxb.2bpp"
SnorlaxPicFront::            INCBIN "gfx/pokemon/front/snorlax.2bpp"
SnorlaxPicFrontYellow::      INCBIN "gfx/pokemon/front_y/snorlax.2bpp"
SnorlaxPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/snorlax.2bpp"

SECTION "Articuno Sprites", ROMX
ArticunoPics::
ArticunoPicBack::            INCBIN "gfx/pokemon/back/articunob.2bpp"
ArticunoPicBackYellow::      INCBIN "gfx/pokemon/back_y/articunob.2bpp"
ArticunoPicBackGreen::       INCBIN "gfx/pokemon/back_rg/articunob.2bpp"
ArticunoPicFront::           INCBIN "gfx/pokemon/front/articuno.2bpp"
ArticunoPicFrontYellow::     INCBIN "gfx/pokemon/front_y/articuno.2bpp"
ArticunoPicFrontGreen::      INCBIN "gfx/pokemon/front_rg/articuno.2bpp"

SECTION "Zapdos Sprites", ROMX
ZapdosPics::
ZapdosPicBack::              INCBIN "gfx/pokemon/back/zapdosb.2bpp"
ZapdosPicBackYellow::        INCBIN "gfx/pokemon/back_y/zapdosb.2bpp"
ZapdosPicBackGreen::         INCBIN "gfx/pokemon/back_rg/zapdosb.2bpp"
ZapdosPicFront::             INCBIN "gfx/pokemon/front/zapdos.2bpp"
ZapdosPicFrontYellow::       INCBIN "gfx/pokemon/front_y/zapdos.2bpp"
ZapdosPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/zapdos.2bpp"

SECTION "Moltres Sprites", ROMX
MoltresPics::
MoltresPicBack::             INCBIN "gfx/pokemon/back/moltresb.2bpp"
MoltresPicBackYellow::       INCBIN "gfx/pokemon/back_y/moltresb.2bpp"
MoltresPicBackGreen::        INCBIN "gfx/pokemon/back_rg/moltresb.2bpp"
MoltresPicFront::            INCBIN "gfx/pokemon/front/moltres.2bpp"
MoltresPicFrontYellow::      INCBIN "gfx/pokemon/front_y/moltres.2bpp"
MoltresPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/moltres.2bpp"

SECTION "Dratini Sprites", ROMX
DratiniPics::
DratiniPicBack::             INCBIN "gfx/pokemon/back/dratinib.2bpp"
DratiniPicBackYellow::       INCBIN "gfx/pokemon/back_y/dratinib.2bpp"
DratiniPicBackGreen::        INCBIN "gfx/pokemon/back_rg/dratinib.2bpp"
DratiniPicFront::            INCBIN "gfx/pokemon/front/dratini.2bpp"
DratiniPicFrontYellow::      INCBIN "gfx/pokemon/front_y/dratini.2bpp"
DratiniPicFrontGreen::       INCBIN "gfx/pokemon/front_rg/dratini.2bpp"

SECTION "Dragonair Sprites", ROMX
DragonairPics::
DragonairPicBack::           INCBIN "gfx/pokemon/back/dragonairb.2bpp"
DragonairPicBackYellow::     INCBIN "gfx/pokemon/back_y/dragonairb.2bpp"
DragonairPicBackGreen::      INCBIN "gfx/pokemon/back_rg/dragonairb.2bpp"
DragonairPicFront::          INCBIN "gfx/pokemon/front/dragonair.2bpp"
DragonairPicFrontYellow::    INCBIN "gfx/pokemon/front_y/dragonair.2bpp"
DragonairPicFrontGreen::     INCBIN "gfx/pokemon/front_rg/dragonair.2bpp"

SECTION "Dragonite Sprites", ROMX
DragonitePics::
DragonitePicBack::           INCBIN "gfx/pokemon/back/dragoniteb.2bpp"
DragonitePicBackYellow::     INCBIN "gfx/pokemon/back_y/dragoniteb.2bpp"
DragonitePicBackGreen::      INCBIN "gfx/pokemon/back_rg/dragoniteb.2bpp"
DragonitePicFront::          INCBIN "gfx/pokemon/front/dragonite.2bpp"
DragonitePicFrontYellow::    INCBIN "gfx/pokemon/front_y/dragonite.2bpp"
DragonitePicFrontGreen::     INCBIN "gfx/pokemon/front_rg/dragonite.2bpp"

SECTION "Mewtwo Sprites", ROMX
MewtwoPics::
MewtwoPicBack::              INCBIN "gfx/pokemon/back/mewtwob.2bpp"
MewtwoPicBackYellow::        INCBIN "gfx/pokemon/back_y/mewtwob.2bpp"
MewtwoPicBackGreen::         INCBIN "gfx/pokemon/back_rg/mewtwob.2bpp"
MewtwoPicFront::             INCBIN "gfx/pokemon/front/mewtwo.2bpp"
MewtwoPicFrontYellow::       INCBIN "gfx/pokemon/front_y/mewtwo.2bpp"
MewtwoPicFrontGreen::        INCBIN "gfx/pokemon/front_rg/mewtwo.2bpp"

SECTION "Mew Sprites", ROMX
MewPics::
MewPicBack::                 INCBIN "gfx/pokemon/back/mewb.2bpp"
MewPicBackYellow::           INCBIN "gfx/pokemon/back_y/mewb.2bpp"
MewPicBackGreen::            INCBIN "gfx/pokemon/back_rg/mewb.2bpp"
MewPicFront::                INCBIN "gfx/pokemon/front/mew.2bpp"
MewPicFrontYellow::          INCBIN "gfx/pokemon/front_y/mew.2bpp"
MewPicFrontGreen::           INCBIN "gfx/pokemon/front_rg/mew.2bpp"

SECTION "Fossils Pics", ROMX ; marcelnote - new section
; these must stay in the same section
FossilKabutopsPic::          INCBIN "gfx/pokemon/front/fossilkabutops.2bpp"
FossilKabutopsPicYellow::    INCBIN "gfx/pokemon/front_y/fossilkabutops.2bpp"
FossilKabutopsPicGreen::     INCBIN "gfx/pokemon/front_rg/fossilkabutops.2bpp"
FossilAerodactylPic::        INCBIN "gfx/pokemon/front/fossilaerodactyl.2bpp"
FossilAerodactylPicYellow::  INCBIN "gfx/pokemon/front_y/fossilaerodactyl.2bpp"
FossilAerodactylPicGreen::   INCBIN "gfx/pokemon/front_rg/fossilaerodactyl.2bpp"
GhostPic::                   INCBIN "gfx/battle/ghost.2bpp" ; copy as easy solution for RG
GhostPicYellow::             INCBIN "gfx/battle/ghost.2bpp"
GhostPicGreen::              INCBIN "gfx/battle/ghost.2bpp"


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
