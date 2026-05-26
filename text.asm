SECTION "Text 1", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/data/text/text_1.fra.asm"
	INCLUDE "translation/fra/text/ViridianForest.fra.asm"
	INCLUDE "translation/fra/text/MtMoon1F.fra.asm"
	INCLUDE "translation/fra/text/MtMoonB2F.fra.asm"
	INCLUDE "translation/fra/text/MtMoonSquare.fra.asm" ; marcelnote - new location
	INCLUDE "translation/fra/text/SSAnne1F.fra.asm"
	INCLUDE "translation/fra/text/SSAnne2F.fra.asm"
	INCLUDE "translation/fra/text/SSAnne3F.fra.asm"
	INCLUDE "translation/fra/text/SSAnneB1F.fra.asm"    ; marcelnote - merged SS Anne B1F and B1FRooms
	INCLUDE "translation/fra/text/SSAnneBow.fra.asm"
	INCLUDE "translation/fra/text/SSAnneKitchen.fra.asm"
	INCLUDE "translation/fra/text/SSAnneCaptainsRoom.fra.asm"
	INCLUDE "translation/fra/text/SSAnne1FRooms.fra.asm"
	INCLUDE "translation/fra/text/SSAnne2FRooms.fra.asm"
	INCLUDE "translation/fra/text/RocketHideoutB1F.fra.asm"
	INCLUDE "translation/fra/text/RocketHideoutB2F.fra.asm"
	INCLUDE "translation/fra/text/RocketHideoutB3F.fra.asm"
	INCLUDE "translation/fra/text/RocketHideoutB4F.fra.asm"
	INCLUDE "translation/fra/text/RocketHideoutElevator.fra.asm"
	INCLUDE "translation/fra/text/SilphCo2F.fra.asm"
	INCLUDE "translation/fra/text/SilphCo3F.fra.asm"
	INCLUDE "translation/fra/text/SilphCo4F.fra.asm"
	INCLUDE "translation/fra/text/SilphCo5F.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/data/text/text_1.esp.asm"
	INCLUDE "translation/esp/text/ViridianForest.esp.asm"
	INCLUDE "translation/esp/text/MtMoon1F.esp.asm"
	INCLUDE "translation/esp/text/MtMoonB2F.esp.asm"
	INCLUDE "translation/esp/text/MtMoonSquare.esp.asm" ; marcelnote - new location
	INCLUDE "translation/esp/text/SSAnne1F.esp.asm"
	INCLUDE "translation/esp/text/SSAnne2F.esp.asm"
	INCLUDE "translation/esp/text/SSAnne3F.esp.asm"
	INCLUDE "translation/esp/text/SSAnneB1F.esp.asm"    ; marcelnote - merged SS Anne B1F and B1FRooms
	INCLUDE "translation/esp/text/SSAnneBow.esp.asm"
	INCLUDE "translation/esp/text/SSAnneKitchen.esp.asm"
	INCLUDE "translation/esp/text/SSAnneCaptainsRoom.esp.asm"
	INCLUDE "translation/esp/text/SSAnne1FRooms.esp.asm"
	INCLUDE "translation/esp/text/SSAnne2FRooms.esp.asm"
	INCLUDE "translation/esp/text/RocketHideoutB1F.esp.asm"
	INCLUDE "translation/esp/text/RocketHideoutB2F.esp.asm"
	INCLUDE "translation/esp/text/RocketHideoutB3F.esp.asm"
	INCLUDE "translation/esp/text/RocketHideoutB4F.esp.asm"
	INCLUDE "translation/esp/text/RocketHideoutElevator.esp.asm"
	INCLUDE "translation/esp/text/SilphCo2F.esp.asm"
	INCLUDE "translation/esp/text/SilphCo3F.esp.asm"
	INCLUDE "translation/esp/text/SilphCo4F.esp.asm"
	INCLUDE "translation/esp/text/SilphCo5F.esp.asm"
ELSE
	INCLUDE "data/text/text_1.asm"
	INCLUDE "text/ViridianForest.asm"
	INCLUDE "text/MtMoon1F.asm"
	INCLUDE "text/MtMoonB2F.asm"
	INCLUDE "text/MtMoonSquare.asm" ; marcelnote - new location
	INCLUDE "text/SSAnne1F.asm"
	INCLUDE "text/SSAnne2F.asm"
	INCLUDE "text/SSAnne3F.asm"
	INCLUDE "text/SSAnneB1F.asm"    ; marcelnote - merged SS Anne B1F and B1FRooms
	INCLUDE "text/SSAnneBow.asm"
	INCLUDE "text/SSAnneKitchen.asm"
	INCLUDE "text/SSAnneCaptainsRoom.asm"
	INCLUDE "text/SSAnne1FRooms.asm"
	INCLUDE "text/SSAnne2FRooms.asm"
	INCLUDE "text/RocketHideoutB1F.asm"
	INCLUDE "text/RocketHideoutB2F.asm"
	INCLUDE "text/RocketHideoutB3F.asm"
	INCLUDE "text/RocketHideoutB4F.asm"
	INCLUDE "text/RocketHideoutElevator.asm"
	INCLUDE "text/SilphCo2F.asm"
	INCLUDE "text/SilphCo3F.asm"
	INCLUDE "text/SilphCo4F.asm"
	INCLUDE "text/SilphCo5F.asm"
ENDC


SECTION "Text 2", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/text/SilphCo6F.fra.asm"
	INCLUDE "translation/fra/text/SilphCo7F.fra.asm"
	INCLUDE "translation/fra/text/SilphCo8F.fra.asm"
	INCLUDE "translation/fra/text/SilphCo9F.fra.asm"
	INCLUDE "translation/fra/text/SilphCo10F.fra.asm"
	INCLUDE "translation/fra/text/SilphCo11F.fra.asm"
	INCLUDE "translation/fra/text/PokemonMansion2F.fra.asm"
	INCLUDE "translation/fra/text/PokemonMansion3F.fra.asm"
	INCLUDE "translation/fra/text/PokemonMansionB1F.fra.asm"
	INCLUDE "translation/fra/text/CeruleanCaveB1F.fra.asm"
	INCLUDE "translation/fra/text/LancesRoom.fra.asm"
	INCLUDE "translation/fra/text/HallOfFame.fra.asm"
	INCLUDE "translation/fra/text/ChampionsRoom.fra.asm"
	INCLUDE "translation/fra/text/LoreleisRoom.fra.asm"
	INCLUDE "translation/fra/text/BrunosRoom.fra.asm"
	INCLUDE "translation/fra/text/AgathasRoom.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/SilphCo6F.esp.asm"
	INCLUDE "translation/esp/text/SilphCo7F.esp.asm"
	INCLUDE "translation/esp/text/SilphCo8F.esp.asm"
	INCLUDE "translation/esp/text/SilphCo9F.esp.asm"
	INCLUDE "translation/esp/text/SilphCo10F.esp.asm"
	INCLUDE "translation/esp/text/SilphCo11F.esp.asm"
	INCLUDE "translation/esp/text/PokemonMansion2F.esp.asm"
	INCLUDE "translation/esp/text/PokemonMansion3F.esp.asm"
	INCLUDE "translation/esp/text/PokemonMansionB1F.esp.asm"
	INCLUDE "translation/esp/text/CeruleanCaveB1F.esp.asm"
	INCLUDE "translation/esp/text/LancesRoom.esp.asm"
	INCLUDE "translation/esp/text/HallOfFame.esp.asm"
	INCLUDE "translation/esp/text/ChampionsRoom.esp.asm"
	INCLUDE "translation/esp/text/LoreleisRoom.esp.asm"
	INCLUDE "translation/esp/text/BrunosRoom.esp.asm"
	INCLUDE "translation/esp/text/AgathasRoom.esp.asm"
ELSE
	INCLUDE "text/SilphCo6F.asm"
	INCLUDE "text/SilphCo7F.asm"
	INCLUDE "text/SilphCo8F.asm"
	INCLUDE "text/SilphCo9F.asm"
	INCLUDE "text/SilphCo10F.asm"
	INCLUDE "text/SilphCo11F.asm"
	INCLUDE "text/PokemonMansion2F.asm"
	INCLUDE "text/PokemonMansion3F.asm"
	INCLUDE "text/PokemonMansionB1F.asm"
	INCLUDE "text/CeruleanCaveB1F.asm"
	INCLUDE "text/LancesRoom.asm"
	INCLUDE "text/HallOfFame.asm"
	INCLUDE "text/ChampionsRoom.asm"
	INCLUDE "text/LoreleisRoom.asm"
	INCLUDE "text/BrunosRoom.asm"
	INCLUDE "text/AgathasRoom.asm"
ENDC


SECTION "Text 3", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/text/SeafoamIslandsB4F.fra.asm"
	INCLUDE "translation/fra/data/text/text_2.fra.asm"
	INCLUDE "translation/fra/text/DiglettsCaveRoute2.fra.asm"
	INCLUDE "translation/fra/text/ViridianForestNorthGate.fra.asm"
	INCLUDE "translation/fra/text/Route2TradeHouse.fra.asm"
	INCLUDE "translation/fra/text/Route2Gate.fra.asm"
	INCLUDE "translation/fra/text/ViridianForestSouthGate.fra.asm"
	INCLUDE "translation/fra/text/MtMoonPokecenter.fra.asm"
	INCLUDE "translation/fra/text/SaffronGates.fra.asm"
	INCLUDE "translation/fra/text/Daycare.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/SeafoamIslandsB4F.esp.asm"
	INCLUDE "translation/esp/data/text/text_2.esp.asm"
	INCLUDE "translation/esp/text/DiglettsCaveRoute2.esp.asm"
	INCLUDE "translation/esp/text/ViridianForestNorthGate.esp.asm"
	INCLUDE "translation/esp/text/Route2TradeHouse.esp.asm"
	INCLUDE "translation/esp/text/Route2Gate.esp.asm"
	INCLUDE "translation/esp/text/ViridianForestSouthGate.esp.asm"
	INCLUDE "translation/esp/text/MtMoonPokecenter.esp.asm"
	INCLUDE "translation/esp/text/SaffronGates.esp.asm"
	INCLUDE "translation/esp/text/Daycare.esp.asm"
ELSE
	INCLUDE "text/SeafoamIslandsB4F.asm"
	INCLUDE "data/text/text_2.asm"
	INCLUDE "text/DiglettsCaveRoute2.asm"
	INCLUDE "text/ViridianForestNorthGate.asm"
	INCLUDE "text/Route2TradeHouse.asm"
	INCLUDE "text/Route2Gate.asm"
	INCLUDE "text/ViridianForestSouthGate.asm"
	INCLUDE "text/MtMoonPokecenter.asm"
	INCLUDE "text/SaffronGates.asm"
	INCLUDE "text/Daycare.asm"
ENDC


SECTION "Text 4", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/text/UndergroundPathRoute6.fra.asm"
	INCLUDE "translation/fra/text/UndergroundPathRoute7.fra.asm"
	INCLUDE "translation/fra/text/UndergroundPathRoute8.fra.asm"
	INCLUDE "translation/fra/text/PowerPlant.fra.asm"
	INCLUDE "translation/fra/text/Route11Gate.fra.asm"
	INCLUDE "translation/fra/text/DiglettsCaveRoute11.fra.asm"
	INCLUDE "translation/fra/text/Route12Gate.fra.asm" ; marcelnote - merged Route12Gate floors
	INCLUDE "translation/fra/text/Route12FishingGuideHouse.fra.asm" ; marcelnote - from Super Rod to Fishing Guide
	INCLUDE "translation/fra/text/Route15Gate.fra.asm" ; marcelnote - merged Route15Gate floors
	INCLUDE "translation/fra/text/Route16Gate.fra.asm" ; marcelnote - merged Route16Gate floors
	INCLUDE "translation/fra/text/Route16FlyHouse.fra.asm"
	INCLUDE "translation/fra/text/Route18Gate.fra.asm" ; marcelnote - merged Route18Gate floors
	INCLUDE "translation/fra/text/Route22Gate.fra.asm"
	INCLUDE "translation/fra/text/BattleHall.fra.asm"  ; marcelnote - new location
	INCLUDE "translation/fra/text/BillsHouse.fra.asm"
	INCLUDE "translation/fra/text/Route1.fra.asm"
	INCLUDE "translation/fra/text/Route2.fra.asm"
	INCLUDE "translation/fra/text/Route3.fra.asm"
	INCLUDE "translation/fra/text/Route4.fra.asm"
	INCLUDE "translation/fra/text/Route5.fra.asm"
	INCLUDE "translation/fra/text/Route5Gate.fra.asm" ; marcelnote - new, added 2nd floor
	INCLUDE "translation/fra/text/Route6.fra.asm"
	INCLUDE "translation/fra/text/Route6Gate.fra.asm" ; marcelnote - new, added 2nd floor
	INCLUDE "translation/fra/text/Route7.fra.asm"
	INCLUDE "translation/fra/text/Route7Gate.fra.asm" ; marcelnote - new, added 2nd floor
	INCLUDE "translation/fra/text/Route8.fra.asm"
	INCLUDE "translation/fra/text/Route8Gate.fra.asm" ; marcelnote - new, added 2nd floor
	INCLUDE "translation/fra/text/Route9.fra.asm"
	INCLUDE "translation/fra/text/Route10.fra.asm"
	INCLUDE "translation/fra/text/Route11.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/UndergroundPathRoute6.esp.asm"
	INCLUDE "translation/esp/text/UndergroundPathRoute7.esp.asm"
	INCLUDE "translation/esp/text/UndergroundPathRoute8.esp.asm"
	INCLUDE "translation/esp/text/PowerPlant.esp.asm"
	INCLUDE "translation/esp/text/Route11Gate.esp.asm"
	INCLUDE "translation/esp/text/DiglettsCaveRoute11.esp.asm"
	INCLUDE "translation/esp/text/Route12Gate.esp.asm" ; marcelnote - merged Route12Gate floors
	INCLUDE "translation/esp/text/Route12FishingGuideHouse.esp.asm" ; marcelnote - from Super Rod to Fishing Guide
	INCLUDE "translation/esp/text/Route15Gate.esp.asm" ; marcelnote - merged Route15Gate floors
	INCLUDE "translation/esp/text/Route16Gate.esp.asm" ; marcelnote - merged Route16Gate floors
	INCLUDE "translation/esp/text/Route16FlyHouse.esp.asm"
	INCLUDE "translation/esp/text/Route18Gate.esp.asm" ; marcelnote - merged Route18Gate floors
	INCLUDE "translation/esp/text/Route22Gate.esp.asm"
	INCLUDE "translation/esp/text/BattleHall.esp.asm"  ; marcelnote - new location
	INCLUDE "translation/esp/text/BillsHouse.esp.asm"
	INCLUDE "translation/esp/text/Route1.esp.asm"
	INCLUDE "translation/esp/text/Route2.esp.asm"
	INCLUDE "translation/esp/text/Route3.esp.asm"
	INCLUDE "translation/esp/text/Route4.esp.asm"
	INCLUDE "translation/esp/text/Route5.esp.asm"
	INCLUDE "translation/esp/text/Route5Gate.esp.asm" ; marcelnote - new, added 2nd floor
	INCLUDE "translation/esp/text/Route6.esp.asm"
	INCLUDE "translation/esp/text/Route6Gate.esp.asm" ; marcelnote - new, added 2nd floor
	INCLUDE "translation/esp/text/Route7.esp.asm"
	INCLUDE "translation/esp/text/Route7Gate.esp.asm" ; marcelnote - new, added 2nd floor
	INCLUDE "translation/esp/text/Route8.esp.asm"
	INCLUDE "translation/esp/text/Route8Gate.esp.asm" ; marcelnote - new, added 2nd floor
	INCLUDE "translation/esp/text/Route9.esp.asm"
	INCLUDE "translation/esp/text/Route10.esp.asm"
	INCLUDE "translation/esp/text/Route11.esp.asm"
ELSE
	INCLUDE "text/UndergroundPathRoute6.asm"
	INCLUDE "text/UndergroundPathRoute7.asm"
	INCLUDE "text/UndergroundPathRoute8.asm"
	INCLUDE "text/PowerPlant.asm"
	INCLUDE "text/Route11Gate.asm"
	INCLUDE "text/DiglettsCaveRoute11.asm"
	INCLUDE "text/Route12Gate.asm" ; marcelnote - merged Route12Gate floors
	INCLUDE "text/Route12FishingGuideHouse.asm" ; marcelnote - from Super Rod to Fishing Guide
	INCLUDE "text/Route15Gate.asm" ; marcelnote - merged Route15Gate floors
	INCLUDE "text/Route16Gate.asm" ; marcelnote - merged Route16Gate floors
	INCLUDE "text/Route16FlyHouse.asm"
	INCLUDE "text/Route18Gate.asm" ; marcelnote - merged Route18Gate floors
	INCLUDE "text/Route22Gate.asm"
	INCLUDE "text/BattleHall.asm"  ; marcelnote - new location
	INCLUDE "text/BillsHouse.asm"
	INCLUDE "text/Route1.asm"
	INCLUDE "text/Route2.asm"
	INCLUDE "text/Route3.asm"
	INCLUDE "text/Route4.asm"
	INCLUDE "text/Route5.asm"
	INCLUDE "text/Route5Gate.asm" ; marcelnote - new, added 2nd floor
	INCLUDE "text/Route6.asm"
	INCLUDE "text/Route6Gate.asm" ; marcelnote - new, added 2nd floor
	INCLUDE "text/Route7.asm"
	INCLUDE "text/Route7Gate.asm" ; marcelnote - new, added 2nd floor
	INCLUDE "text/Route8.asm"
	INCLUDE "text/Route8Gate.asm" ; marcelnote - new, added 2nd floor
	INCLUDE "text/Route9.asm"
	INCLUDE "text/Route10.asm"
	INCLUDE "text/Route11.asm"
ENDC


SECTION "Text 5", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/text/Route12.fra.asm"
	INCLUDE "translation/fra/text/Route13.fra.asm"
	INCLUDE "translation/fra/text/Route14.fra.asm"
	INCLUDE "translation/fra/text/Route15.fra.asm"
	INCLUDE "translation/fra/text/Route16.fra.asm"
	INCLUDE "translation/fra/text/Route17.fra.asm"
	INCLUDE "translation/fra/text/Route18.fra.asm"
	INCLUDE "translation/fra/text/Route19.fra.asm"
	INCLUDE "translation/fra/text/Route20.fra.asm"
	INCLUDE "translation/fra/text/Route21.fra.asm"
	INCLUDE "translation/fra/text/Route22.fra.asm"
	INCLUDE "translation/fra/text/Route23.fra.asm"
	INCLUDE "translation/fra/text/Route24.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/Route12.esp.asm"
	INCLUDE "translation/esp/text/Route13.esp.asm"
	INCLUDE "translation/esp/text/Route14.esp.asm"
	INCLUDE "translation/esp/text/Route15.esp.asm"
	INCLUDE "translation/esp/text/Route16.esp.asm"
	INCLUDE "translation/esp/text/Route17.esp.asm"
	INCLUDE "translation/esp/text/Route18.esp.asm"
	INCLUDE "translation/esp/text/Route19.esp.asm"
	INCLUDE "translation/esp/text/Route20.esp.asm"
	INCLUDE "translation/esp/text/Route21.esp.asm"
	INCLUDE "translation/esp/text/Route22.esp.asm"
	INCLUDE "translation/esp/text/Route23.esp.asm"
	INCLUDE "translation/esp/text/Route24.esp.asm"
ELSE
	INCLUDE "text/Route12.asm"
	INCLUDE "text/Route13.asm"
	INCLUDE "text/Route14.asm"
	INCLUDE "text/Route15.asm"
	INCLUDE "text/Route16.asm"
	INCLUDE "text/Route17.asm"
	INCLUDE "text/Route18.asm"
	INCLUDE "text/Route19.asm"
	INCLUDE "text/Route20.asm"
	INCLUDE "text/Route21.asm"
	INCLUDE "text/Route22.asm"
	INCLUDE "text/Route23.asm"
	INCLUDE "text/Route24.asm"
ENDC


SECTION "Text 6", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/text/Route25.fra.asm"
	INCLUDE "translation/fra/text/Route28.fra.asm"           ; marcelnote - new location
	INCLUDE "translation/fra/data/text/text_3.fra.asm"
	INCLUDE "translation/fra/text/pokedex_ratings.fra.asm"
	INCLUDE "translation/fra/text/ViridianPokecenterMart.fra.asm" ; marcelnote - merged Viridian Pokecenter and Mart
	INCLUDE "translation/fra/text/ViridianSchoolHouse.fra.asm"
	INCLUDE "translation/fra/text/ViridianNicknameHouse.fra.asm"
	INCLUDE "translation/fra/text/ViridianGym.fra.asm"
	INCLUDE "translation/fra/text/Route22OldRodHouse.fra.asm" ; marcelnote - new location
	INCLUDE "translation/fra/text/PewterMuseum.fra.asm"       ; marcelnote - merged Pewter Museum floors
	INCLUDE "translation/fra/text/PewterGym.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/Route25.esp.asm"
	INCLUDE "translation/esp/text/Route28.esp.asm"           ; marcelnote - new location
	INCLUDE "translation/esp/data/text/text_3.esp.asm"
	INCLUDE "translation/esp/text/pokedex_ratings.esp.asm"
	INCLUDE "translation/esp/text/ViridianPokecenterMart.esp.asm" ; marcelnote - merged Viridian Pokecenter and Mart
	INCLUDE "translation/esp/text/ViridianSchoolHouse.esp.asm"
	INCLUDE "translation/esp/text/ViridianNicknameHouse.esp.asm"
	INCLUDE "translation/esp/text/ViridianGym.esp.asm"
	INCLUDE "translation/esp/text/Route22OldRodHouse.esp.asm" ; marcelnote - new location
	INCLUDE "translation/esp/text/PewterMuseum.esp.asm"       ; marcelnote - merged Pewter Museum floors
	INCLUDE "translation/esp/text/PewterGym.esp.asm"
ELSE
	INCLUDE "text/Route25.asm"
	INCLUDE "text/Route28.asm"           ; marcelnote - new location
	INCLUDE "data/text/text_3.asm"
	INCLUDE "text/pokedex_ratings.asm"
	INCLUDE "text/ViridianPokecenterMart.asm" ; marcelnote - merged Viridian Pokecenter and Mart
	INCLUDE "text/ViridianSchoolHouse.asm"
	INCLUDE "text/ViridianNicknameHouse.asm"
	INCLUDE "text/ViridianGym.asm"
	INCLUDE "text/Route22OldRodHouse.asm" ; marcelnote - new location
	INCLUDE "text/PewterMuseum.asm"       ; marcelnote - merged Pewter Museum floors
	INCLUDE "text/PewterGym.asm"
ENDC


SECTION "Text 7", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/text/PewterNidoranHouse.fra.asm"
	INCLUDE "translation/fra/text/PewterSpeechHouse.fra.asm"
	INCLUDE "translation/fra/text/PewterPokecenterMart.fra.asm"   ; marcelnote - merged Pewter Pokecenter and Mart
	INCLUDE "translation/fra/text/CeruleanTrashedHouse.fra.asm"
	INCLUDE "translation/fra/text/CeruleanTradeHouse.fra.asm"
	INCLUDE "translation/fra/text/CeruleanPokecenterMart.fra.asm" ; marcelnote - merged Cerulean Pokecenter and Mart
	INCLUDE "translation/fra/text/CeruleanGym.fra.asm"
	INCLUDE "translation/fra/text/BikeShop.fra.asm"
	INCLUDE "translation/fra/text/CeruleanBadgeHouse.fra.asm"
	INCLUDE "translation/fra/text/LavenderPokecenterMart.fra.asm" ; marcelnote - merged Lavender Pokecenter and Mart
	INCLUDE "translation/fra/text/PokemonTower1F.fra.asm"
	INCLUDE "translation/fra/text/PokemonTower2F.fra.asm"
	INCLUDE "translation/fra/text/PokemonTower3F.fra.asm"
	INCLUDE "translation/fra/text/PokemonTower4F.fra.asm"
	INCLUDE "translation/fra/text/PokemonTower5F.fra.asm"
	INCLUDE "translation/fra/text/PokemonTower6F.fra.asm"
	INCLUDE "translation/fra/text/PokemonTower7F.fra.asm"
	INCLUDE "translation/fra/text/MrFujisHouse.fra.asm"
	INCLUDE "translation/fra/text/LavenderCuboneHouse.fra.asm"
	INCLUDE "translation/fra/text/NameRatersHouse.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/PewterNidoranHouse.esp.asm"
	INCLUDE "translation/esp/text/PewterSpeechHouse.esp.asm"
	INCLUDE "translation/esp/text/PewterPokecenterMart.esp.asm"   ; marcelnote - merged Pewter Pokecenter and Mart
	INCLUDE "translation/esp/text/CeruleanTrashedHouse.esp.asm"
	INCLUDE "translation/esp/text/CeruleanTradeHouse.esp.asm"
	INCLUDE "translation/esp/text/CeruleanPokecenterMart.esp.asm" ; marcelnote - merged Cerulean Pokecenter and Mart
	INCLUDE "translation/esp/text/CeruleanGym.esp.asm"
	INCLUDE "translation/esp/text/BikeShop.esp.asm"
	INCLUDE "translation/esp/text/CeruleanBadgeHouse.esp.asm"
	INCLUDE "translation/esp/text/LavenderPokecenterMart.esp.asm" ; marcelnote - merged Lavender Pokecenter and Mart
	INCLUDE "translation/esp/text/PokemonTower1F.esp.asm"
	INCLUDE "translation/esp/text/PokemonTower2F.esp.asm"
	INCLUDE "translation/esp/text/PokemonTower3F.esp.asm"
	INCLUDE "translation/esp/text/PokemonTower4F.esp.asm"
	INCLUDE "translation/esp/text/PokemonTower5F.esp.asm"
	INCLUDE "translation/esp/text/PokemonTower6F.esp.asm"
	INCLUDE "translation/esp/text/PokemonTower7F.esp.asm"
	INCLUDE "translation/esp/text/MrFujisHouse.esp.asm"
	INCLUDE "translation/esp/text/LavenderCuboneHouse.esp.asm"
	INCLUDE "translation/esp/text/NameRatersHouse.esp.asm"
ELSE
	INCLUDE "text/PewterNidoranHouse.asm"
	INCLUDE "text/PewterSpeechHouse.asm"
	INCLUDE "text/PewterPokecenterMart.asm"   ; marcelnote - merged Pewter Pokecenter and Mart
	INCLUDE "text/CeruleanTrashedHouse.asm"
	INCLUDE "text/CeruleanTradeHouse.asm"
	INCLUDE "text/CeruleanPokecenterMart.asm" ; marcelnote - merged Cerulean Pokecenter and Mart
	INCLUDE "text/CeruleanGym.asm"
	INCLUDE "text/BikeShop.asm"
	INCLUDE "text/CeruleanBadgeHouse.asm"
	INCLUDE "text/LavenderPokecenterMart.asm" ; marcelnote - merged Lavender Pokecenter and Mart
	INCLUDE "text/PokemonTower1F.asm"
	INCLUDE "text/PokemonTower2F.asm"
	INCLUDE "text/PokemonTower3F.asm"
	INCLUDE "text/PokemonTower4F.asm"
	INCLUDE "text/PokemonTower5F.asm"
	INCLUDE "text/PokemonTower6F.asm"
	INCLUDE "text/PokemonTower7F.asm"
	INCLUDE "text/MrFujisHouse.asm"
	INCLUDE "text/LavenderCuboneHouse.asm"
	INCLUDE "text/NameRatersHouse.asm"
ENDC


SECTION "Text Pallet", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/text/RedsYellowsHouses.fra.asm" ; marcelnote - merged RedsHouse floors, added YellowsHouse
	INCLUDE "translation/fra/text/BluesAidesHouses.fra.asm"  ; marcelnote - merged Blue's house with new Aide's house
	INCLUDE "translation/fra/text/OaksLab.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/RedsYellowsHouses.esp.asm" ; marcelnote - merged RedsHouse floors, added YellowsHouse
	INCLUDE "translation/esp/text/BluesAidesHouses.esp.asm"  ; marcelnote - merged Blue's house with new Aide's house
	INCLUDE "translation/esp/text/OaksLab.esp.asm"
ELSE
	INCLUDE "text/RedsYellowsHouses.asm" ; marcelnote - merged RedsHouse floors, added YellowsHouse
	INCLUDE "text/BluesAidesHouses.asm"  ; marcelnote - merged Blue's house with new Aide's house
	INCLUDE "text/OaksLab.asm"
ENDC


SECTION "Text Vermilion", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/text/VermilionGym.fra.asm"
	INCLUDE "translation/fra/text/VermilionPokecenterMart.fra.asm" ; marcelnote - merged Vermilion Pokecenter and Mart
	INCLUDE "translation/fra/text/PokemonFanClub.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/VermilionGym.esp.asm"
	INCLUDE "translation/esp/text/VermilionPokecenterMart.esp.asm" ; marcelnote - merged Vermilion Pokecenter and Mart
	INCLUDE "translation/esp/text/PokemonFanClub.esp.asm"
ELSE
	INCLUDE "text/VermilionGym.asm"
	INCLUDE "text/VermilionPokecenterMart.asm" ; marcelnote - merged Vermilion Pokecenter and Mart
	INCLUDE "text/PokemonFanClub.asm"
ENDC


SECTION "Text 8", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/text/VermilionPidgeyHouse.fra.asm"
	INCLUDE "translation/fra/text/VermilionDock.fra.asm"
	INCLUDE "translation/fra/text/VermilionGoodRodHouse.fra.asm" ; marcelnote - from Old to Good Rod
	INCLUDE "translation/fra/text/CeladonMart1F2F3F.fra.asm"     ; marcelnote - merged 1F 2F 3F
	INCLUDE "translation/fra/text/CeladonMart4F5F6F.fra.asm"     ; marcelnote - merged 4F 5F + new 6F
	INCLUDE "translation/fra/text/CeladonMartRoof.fra.asm"
	INCLUDE "translation/fra/text/CeladonMansion.fra.asm"        ; marcelnote - merged Celadon Mansion floors
	INCLUDE "translation/fra/text/CeladonMansionRoof.fra.asm"
	INCLUDE "translation/fra/text/CeladonMansionRoofHouse.fra.asm"
	INCLUDE "translation/fra/text/CeladonPokecenter.fra.asm"
	INCLUDE "translation/fra/text/CeladonGym.fra.asm"
	INCLUDE "translation/fra/text/GameCorner.fra.asm"
	INCLUDE "translation/fra/text/GameCornerPrizeRoom.fra.asm"
	INCLUDE "translation/fra/text/CeladonDiner.fra.asm"
	INCLUDE "translation/fra/text/CeladonChiefHouse.fra.asm"
	INCLUDE "translation/fra/text/CeladonHotel.fra.asm"
	INCLUDE "translation/fra/text/FuchsiaBillsGrandpasHouse.fra.asm"
	INCLUDE "translation/fra/text/FuchsiaPokecenterMart.fra.asm" ; marcelnote - merged Fuchsia Pokecenter and Mart
	INCLUDE "translation/fra/text/WardensHouse.fra.asm"
	INCLUDE "translation/fra/text/SafariZoneGate.fra.asm"
	INCLUDE "translation/fra/text/FuchsiaGym.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/VermilionPidgeyHouse.esp.asm"
	INCLUDE "translation/esp/text/VermilionDock.esp.asm"
	INCLUDE "translation/esp/text/VermilionGoodRodHouse.esp.asm" ; marcelnote - from Old to Good Rod
	INCLUDE "translation/esp/text/CeladonMart1F2F3F.esp.asm"     ; marcelnote - merged 1F 2F 3F
	INCLUDE "translation/esp/text/CeladonMart4F5F6F.esp.asm"     ; marcelnote - merged 4F 5F + new 6F
	INCLUDE "translation/esp/text/CeladonMartRoof.esp.asm"
	INCLUDE "translation/esp/text/CeladonMansion.esp.asm"        ; marcelnote - merged Celadon Mansion floors
	INCLUDE "translation/esp/text/CeladonMansionRoof.esp.asm"
	INCLUDE "translation/esp/text/CeladonMansionRoofHouse.esp.asm"
	INCLUDE "translation/esp/text/CeladonPokecenter.esp.asm"
	INCLUDE "translation/esp/text/CeladonGym.esp.asm"
	INCLUDE "translation/esp/text/GameCorner.esp.asm"
	INCLUDE "translation/esp/text/GameCornerPrizeRoom.esp.asm"
	INCLUDE "translation/esp/text/CeladonDiner.esp.asm"
	INCLUDE "translation/esp/text/CeladonChiefHouse.esp.asm"
	INCLUDE "translation/esp/text/CeladonHotel.esp.asm"
	INCLUDE "translation/esp/text/FuchsiaBillsGrandpasHouse.esp.asm"
	INCLUDE "translation/esp/text/FuchsiaPokecenterMart.esp.asm" ; marcelnote - merged Fuchsia Pokecenter and Mart
	INCLUDE "translation/esp/text/WardensHouse.esp.asm"
	INCLUDE "translation/esp/text/SafariZoneGate.esp.asm"
	INCLUDE "translation/esp/text/FuchsiaGym.esp.asm"
ELSE
	INCLUDE "text/VermilionPidgeyHouse.asm"
	INCLUDE "text/VermilionDock.asm"
	INCLUDE "text/VermilionGoodRodHouse.asm" ; marcelnote - from Old to Good Rod
	INCLUDE "text/CeladonMart1F2F3F.asm"     ; marcelnote - merged 1F 2F 3F
	INCLUDE "text/CeladonMart4F5F6F.asm"     ; marcelnote - merged 4F 5F + new 6F
	INCLUDE "text/CeladonMartRoof.asm"
	INCLUDE "text/CeladonMansion.asm"        ; marcelnote - merged Celadon Mansion floors
	INCLUDE "text/CeladonMansionRoof.asm"
	INCLUDE "text/CeladonMansionRoofHouse.asm"
	INCLUDE "text/CeladonPokecenter.asm"
	INCLUDE "text/CeladonGym.asm"
	INCLUDE "text/GameCorner.asm"
	INCLUDE "text/GameCornerPrizeRoom.asm"
	INCLUDE "text/CeladonDiner.asm"
	INCLUDE "text/CeladonChiefHouse.asm"
	INCLUDE "text/CeladonHotel.asm"
	INCLUDE "text/FuchsiaBillsGrandpasHouse.asm"
	INCLUDE "text/FuchsiaPokecenterMart.asm" ; marcelnote - merged Fuchsia Pokecenter and Mart
	INCLUDE "text/WardensHouse.asm"
	INCLUDE "text/SafariZoneGate.asm"
	INCLUDE "text/FuchsiaGym.asm"
ENDC


SECTION "Text 9", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/text/IndigoPlateauLobby.fra.asm"
	INCLUDE "translation/fra/text/CopycatsHouse.fra.asm"          ; marcelnote - merged Copycat's house floors
	INCLUDE "translation/fra/text/FightingDojo.fra.asm"
	INCLUDE "translation/fra/text/SaffronGym.fra.asm"
	INCLUDE "translation/fra/text/SaffronPidgeyHouse.fra.asm"
	INCLUDE "translation/fra/text/SilphCo1F.fra.asm"
	INCLUDE "translation/fra/text/SaffronPokecenterMart.fra.asm"  ; marcelnote - merged Saffron Pokecenter and Mart
	INCLUDE "translation/fra/text/MrPsychicsHouse.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/IndigoPlateauLobby.esp.asm"
	INCLUDE "translation/esp/text/CopycatsHouse.esp.asm"          ; marcelnote - merged Copycat's house floors
	INCLUDE "translation/esp/text/FightingDojo.esp.asm"
	INCLUDE "translation/esp/text/SaffronGym.esp.asm"
	INCLUDE "translation/esp/text/SaffronPidgeyHouse.esp.asm"
	INCLUDE "translation/esp/text/SilphCo1F.esp.asm"
	INCLUDE "translation/esp/text/SaffronPokecenterMart.esp.asm"  ; marcelnote - merged Saffron Pokecenter and Mart
	INCLUDE "translation/esp/text/MrPsychicsHouse.esp.asm"
ELSE
	INCLUDE "text/IndigoPlateauLobby.asm"
	INCLUDE "text/CopycatsHouse.asm"          ; marcelnote - merged Copycat's house floors
	INCLUDE "text/FightingDojo.asm"
	INCLUDE "text/SaffronGym.asm"
	INCLUDE "text/SaffronPidgeyHouse.asm"
	INCLUDE "text/SilphCo1F.asm"
	INCLUDE "text/SaffronPokecenterMart.asm"  ; marcelnote - merged Saffron Pokecenter and Mart
	INCLUDE "text/MrPsychicsHouse.asm"
ENDC


SECTION "Text 10", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/data/text/text_5.fra.asm"
	INCLUDE "translation/fra/text/PalletTown.fra.asm"
	INCLUDE "translation/fra/text/ViridianCity.fra.asm"
	INCLUDE "translation/fra/text/PewterCity.fra.asm"
	INCLUDE "translation/fra/text/CeruleanCity.fra.asm"
	INCLUDE "translation/fra/text/LavenderTown.fra.asm"
	INCLUDE "translation/fra/text/VermilionCity.fra.asm"
	INCLUDE "translation/fra/text/CeladonCity.fra.asm"
	INCLUDE "translation/fra/text/FuchsiaCity.fra.asm"
	INCLUDE "translation/fra/text/CinnabarIsland.fra.asm"
	INCLUDE "translation/fra/text/SaffronCity.fra.asm"
	INCLUDE "translation/fra/data/text/text_4.fra.asm" ; marcelnote - moved from Text 9
	INCLUDE "translation/fra/data/text/text_6.fra.asm"
	INCLUDE "translation/fra/data/text/text_7.fra.asm" ; marcelnote - moved from Text 11
ELIF DEF(_ESP)
	INCLUDE "translation/esp/data/text/text_5.esp.asm"
	INCLUDE "translation/esp/text/PalletTown.esp.asm"
	INCLUDE "translation/esp/text/ViridianCity.esp.asm"
	INCLUDE "translation/esp/text/PewterCity.esp.asm"
	INCLUDE "translation/esp/text/CeruleanCity.esp.asm"
	INCLUDE "translation/esp/text/LavenderTown.esp.asm"
	INCLUDE "translation/esp/text/VermilionCity.esp.asm"
	INCLUDE "translation/esp/text/CeladonCity.esp.asm"
	INCLUDE "translation/esp/text/FuchsiaCity.esp.asm"
	INCLUDE "translation/esp/text/CinnabarIsland.esp.asm"
	INCLUDE "translation/esp/text/SaffronCity.esp.asm"
	INCLUDE "translation/esp/data/text/text_4.esp.asm" ; marcelnote - moved from Text 9
	INCLUDE "translation/esp/data/text/text_6.esp.asm"
	INCLUDE "translation/esp/data/text/text_7.esp.asm" ; marcelnote - moved from Text 11
ELSE
	INCLUDE "data/text/text_5.asm"
	INCLUDE "text/PalletTown.asm"
	INCLUDE "text/ViridianCity.asm"
	INCLUDE "text/PewterCity.asm"
	INCLUDE "text/CeruleanCity.asm"
	INCLUDE "text/LavenderTown.asm"
	INCLUDE "text/VermilionCity.asm"
	INCLUDE "text/CeladonCity.asm"
	INCLUDE "text/FuchsiaCity.asm"
	INCLUDE "text/CinnabarIsland.asm"
	INCLUDE "text/SaffronCity.asm"
	INCLUDE "data/text/text_4.asm" ; marcelnote - moved from Text 9
	INCLUDE "data/text/text_6.asm"
	INCLUDE "data/text/text_7.asm" ; marcelnote - moved from Text 11
ENDC



SECTION "Text 11", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/text/MandarinIsland.fra.asm"         ; marcelnote - new location
	INCLUDE "translation/fra/text/MandarinPokecenterMart.fra.asm" ; marcelnote - new location
	INCLUDE "translation/fra/text/MandarinSurfShop.fra.asm"       ; marcelnote - new location
	INCLUDE "translation/fra/text/MandarinHotel.fra.asm"          ; marcelnote - new location
	INCLUDE "translation/fra/text/MandarinSilphCo.fra.asm"        ; marcelnote - new location
	INCLUDE "translation/fra/text/SilphFactory1F.fra.asm"         ; marcelnote - new location
	INCLUDE "translation/fra/text/SilphFactory2F.fra.asm"         ; marcelnote - new location
	INCLUDE "translation/fra/text/OrangeRoute1.fra.asm"           ; marcelnote - new location
	INCLUDE "translation/fra/text/DrJabarasLab.fra.asm"           ; marcelnote - new location
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/MandarinIsland.esp.asm"         ; marcelnote - new location
	INCLUDE "translation/esp/text/MandarinPokecenterMart.esp.asm" ; marcelnote - new location
	INCLUDE "translation/esp/text/MandarinSurfShop.esp.asm"       ; marcelnote - new location
	INCLUDE "translation/esp/text/MandarinHotel.esp.asm"          ; marcelnote - new location
	INCLUDE "translation/esp/text/MandarinSilphCo.esp.asm"        ; marcelnote - new location
	INCLUDE "translation/esp/text/SilphFactory1F.esp.asm"         ; marcelnote - new location
	INCLUDE "translation/esp/text/SilphFactory2F.esp.asm"         ; marcelnote - new location
	INCLUDE "translation/esp/text/OrangeRoute1.esp.asm"           ; marcelnote - new location
	INCLUDE "translation/esp/text/DrJabarasLab.esp.asm"           ; marcelnote - new location
ELSE
	INCLUDE "text/MandarinIsland.asm"           ; marcelnote - new location
	INCLUDE "text/MandarinPokecenterMart.asm"   ; marcelnote - new location
	INCLUDE "text/MandarinSurfShop.asm"         ; marcelnote - new location
	INCLUDE "text/MandarinHotel.asm"            ; marcelnote - new location
	INCLUDE "text/MandarinSilphCo.asm"          ; marcelnote - new location
	INCLUDE "text/SilphFactory1F.asm"           ; marcelnote - new location
	INCLUDE "text/SilphFactory2F.asm"           ; marcelnote - new location
	INCLUDE "text/OrangeRoute1.asm"             ; marcelnote - new location
	INCLUDE "text/DrJabarasLab.asm"             ; marcelnote - new location
ENDC


SECTION "Text 12", ROMX ; marcelnote - new

IF DEF(_FRA)
	INCLUDE "translation/fra/text/PokemonAcademy1F2F.fra.asm"       ; marcelnote - new location
	INCLUDE "translation/fra/text/PokemonAcademy3F4F.fra.asm"       ; marcelnote - new location
	INCLUDE "translation/fra/text/CeladonGrove.fra.asm"             ; marcelnote - new location
	INCLUDE "translation/fra/text/CeladonGroveSouthGate.fra.asm"    ; marcelnote - new location
	INCLUDE "translation/fra/text/CeladonGroveNorthGate.fra.asm"    ; marcelnote - new location
	INCLUDE "translation/fra/text/FuchsiaMoveDeleterHouse.fra.asm"  ; marcelnote - new location
	INCLUDE "translation/fra/text/MtSilver3F.fra.asm"               ; marcelnote - new location
	INCLUDE "translation/fra/text/SummerBeachHouse.fra.asm"         ; marcelnote - new location from pokeyellow
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/PokemonAcademy1F2F.esp.asm"       ; marcelnote - new location
	INCLUDE "translation/esp/text/PokemonAcademy3F4F.esp.asm"       ; marcelnote - new location
	INCLUDE "translation/esp/text/CeladonGrove.esp.asm"             ; marcelnote - new location
	INCLUDE "translation/esp/text/CeladonGroveSouthGate.esp.asm"    ; marcelnote - new location
	INCLUDE "translation/esp/text/CeladonGroveNorthGate.esp.asm"    ; marcelnote - new location
	INCLUDE "translation/esp/text/FuchsiaMoveDeleterHouse.esp.asm"  ; marcelnote - new location
	INCLUDE "translation/esp/text/MtSilver3F.esp.asm"               ; marcelnote - new location
	INCLUDE "translation/esp/text/SummerBeachHouse.esp.asm"         ; marcelnote - new location from pokeyellow
ELSE
	INCLUDE "text/PokemonAcademy1F2F.asm"       ; marcelnote - new location
	INCLUDE "text/PokemonAcademy3F4F.asm"       ; marcelnote - new location
	INCLUDE "text/CeladonGrove.asm"             ; marcelnote - new location
	INCLUDE "text/CeladonGroveSouthGate.asm"    ; marcelnote - new location
	INCLUDE "text/CeladonGroveNorthGate.asm"    ; marcelnote - new location
	INCLUDE "text/FuchsiaMoveDeleterHouse.asm"  ; marcelnote - new location
	INCLUDE "text/MtSilver3F.asm"               ; marcelnote - new location
	INCLUDE "text/SummerBeachHouse.asm"         ; marcelnote - new location from pokeyellow
ENDC


SECTION "Text Fuchsia", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/text/FuchsiaMeetingRoom.fra.asm"
	INCLUDE "translation/fra/text/FuchsiaSuperRodHouse.fra.asm"   ; marcelnote - from Good to Super Rod
	INCLUDE "translation/fra/text/SafariZoneEast.fra.asm"
	INCLUDE "translation/fra/text/SafariZoneNorth.fra.asm"
	INCLUDE "translation/fra/text/SafariZoneWest.fra.asm"
	INCLUDE "translation/fra/text/SafariZoneCenter.fra.asm"
	INCLUDE "translation/fra/text/SafariZoneCenterRestHouse.fra.asm"
	INCLUDE "translation/fra/text/SafariZoneSecretHouse.fra.asm"
	INCLUDE "translation/fra/text/SafariZoneWestRestHouse.fra.asm"
	INCLUDE "translation/fra/text/SafariZoneEastRestHouse.fra.asm"
	INCLUDE "translation/fra/text/SafariZoneNorthRestHouse.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/FuchsiaMeetingRoom.esp.asm"
	INCLUDE "translation/esp/text/FuchsiaSuperRodHouse.esp.asm"   ; marcelnote - from Good to Super Rod
	INCLUDE "translation/esp/text/SafariZoneEast.esp.asm"
	INCLUDE "translation/esp/text/SafariZoneNorth.esp.asm"
	INCLUDE "translation/esp/text/SafariZoneWest.esp.asm"
	INCLUDE "translation/esp/text/SafariZoneCenter.esp.asm"
	INCLUDE "translation/esp/text/SafariZoneCenterRestHouse.esp.asm"
	INCLUDE "translation/esp/text/SafariZoneSecretHouse.esp.asm"
	INCLUDE "translation/esp/text/SafariZoneWestRestHouse.esp.asm"
	INCLUDE "translation/esp/text/SafariZoneEastRestHouse.esp.asm"
	INCLUDE "translation/esp/text/SafariZoneNorthRestHouse.esp.asm"
ELSE
	INCLUDE "text/FuchsiaMeetingRoom.asm"
	INCLUDE "text/FuchsiaSuperRodHouse.asm"   ; marcelnote - from Good to Super Rod
	INCLUDE "text/SafariZoneEast.asm"
	INCLUDE "text/SafariZoneNorth.asm"
	INCLUDE "text/SafariZoneWest.asm"
	INCLUDE "text/SafariZoneCenter.asm"
	INCLUDE "text/SafariZoneCenterRestHouse.asm"
	INCLUDE "text/SafariZoneSecretHouse.asm"
	INCLUDE "text/SafariZoneWestRestHouse.asm"
	INCLUDE "text/SafariZoneEastRestHouse.asm"
	INCLUDE "text/SafariZoneNorthRestHouse.asm"
ENDC


SECTION "Rock Tunnel Text", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/text/RockTunnelPokecenter.fra.asm"
	INCLUDE "translation/fra/text/RockTunnel1F.fra.asm"
	INCLUDE "translation/fra/text/RockTunnelB1F.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/RockTunnelPokecenter.esp.asm"
	INCLUDE "translation/esp/text/RockTunnel1F.esp.asm"
	INCLUDE "translation/esp/text/RockTunnelB1F.esp.asm"
ELSE
	INCLUDE "text/RockTunnelPokecenter.asm"
	INCLUDE "text/RockTunnel1F.asm"
	INCLUDE "text/RockTunnelB1F.asm"
ENDC


SECTION "Cinnabar Island Text", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/text/PokemonMansion1F.fra.asm"
	INCLUDE "translation/fra/text/CinnabarGym.fra.asm"
	INCLUDE "translation/fra/text/CinnabarLab.fra.asm"            ; marcelnote - merged Cinnabar Lab maps
	INCLUDE "translation/fra/text/CinnabarPokecenterMart.fra.asm" ; marcelnote - merged Cinnabar Pokecenter and Mart
	INCLUDE "translation/fra/text/CinnabarVolcano1FB1F.fra.asm"   ; marcelnote - new location
	INCLUDE "translation/fra/text/CinnabarVolcano2F.fra.asm"      ; marcelnote - new location
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/PokemonMansion1F.esp.asm"
	INCLUDE "translation/esp/text/CinnabarGym.esp.asm"
	INCLUDE "translation/esp/text/CinnabarLab.esp.asm"            ; marcelnote - merged Cinnabar Lab maps
	INCLUDE "translation/esp/text/CinnabarPokecenterMart.esp.asm" ; marcelnote - merged Cinnabar Pokecenter and Mart
	INCLUDE "translation/esp/text/CinnabarVolcano1FB1F.esp.asm"   ; marcelnote - new location
	INCLUDE "translation/esp/text/CinnabarVolcano2F.esp.asm"      ; marcelnote - new location
ELSE
	INCLUDE "text/PokemonMansion1F.asm"
	INCLUDE "text/CinnabarGym.asm"
	INCLUDE "text/CinnabarLab.asm"            ; marcelnote - merged Cinnabar Lab maps
	INCLUDE "text/CinnabarPokecenterMart.asm" ; marcelnote - merged Cinnabar Pokecenter and Mart
	INCLUDE "text/CinnabarVolcano1FB1F.asm"   ; marcelnote - new location
	INCLUDE "text/CinnabarVolcano2F.asm"      ; marcelnote - new location
ENDC


SECTION "Mandarin Island Text", ROMX ; marcelnote - new

IF DEF(_FRA)
	INCLUDE "translation/fra/text/MandarinDock.fra.asm"             ; marcelnote - new location
	INCLUDE "translation/fra/text/CitrusFerryDeck.fra.asm"          ; marcelnote - new location
	INCLUDE "translation/fra/text/CitrusFerryOutside.fra.asm"       ; marcelnote - new location
	INCLUDE "translation/fra/text/CitrusFerryRooms.fra.asm"         ; marcelnote - new location
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/MandarinDock.esp.asm"             ; marcelnote - new location
	INCLUDE "translation/esp/text/CitrusFerryDeck.esp.asm"          ; marcelnote - new location
	INCLUDE "translation/esp/text/CitrusFerryOutside.esp.asm"       ; marcelnote - new location
	INCLUDE "translation/esp/text/CitrusFerryRooms.esp.asm"         ; marcelnote - new location
ELSE
	INCLUDE "text/MandarinDock.asm"             ; marcelnote - new location
	INCLUDE "text/CitrusFerryDeck.asm"          ; marcelnote - new location
	INCLUDE "text/CitrusFerryOutside.asm"       ; marcelnote - new location
	INCLUDE "text/CitrusFerryRooms.asm"         ; marcelnote - new location
ENDC


SECTION "Victory Road Text", ROMX ; marcelnote - new

IF DEF(_FRA)
	INCLUDE "translation/fra/text/VictoryRoad1F.fra.asm"
	INCLUDE "translation/fra/text/VictoryRoad2F.fra.asm"
	INCLUDE "translation/fra/text/VictoryRoad3F.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/text/VictoryRoad1F.esp.asm"
	INCLUDE "translation/esp/text/VictoryRoad2F.esp.asm"
	INCLUDE "translation/esp/text/VictoryRoad3F.esp.asm"
ELSE
	INCLUDE "text/VictoryRoad1F.asm"
	INCLUDE "text/VictoryRoad2F.asm"
	INCLUDE "text/VictoryRoad3F.asm"
ENDC


SECTION "Pokédex Text", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/data/pokemon/dex_text.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/data/pokemon/dex_text.esp.asm"
ELSE
	INCLUDE "data/pokemon/dex_text.asm"
ENDC


SECTION "Move Names", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/data/moves/names.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/data/moves/names.esp.asm"
ELSE
	INCLUDE "data/moves/names.asm"
ENDC


SECTION "Pay Phone Text", ROMX

IF DEF(_FRA)
	INCLUDE "translation/fra/data/text/pay_phone.fra.asm"
ELIF DEF(_ESP)
	INCLUDE "translation/esp/data/text/pay_phone.esp.asm"
ELSE
	INCLUDE "data/text/pay_phone.asm"
ENDC
