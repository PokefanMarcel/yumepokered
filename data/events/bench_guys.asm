MACRO bench_guy_text
	db \1, \2
	db_tx_pre \3
ENDM

BenchGuyTextPointers:
	; map id, player facing direction, predef text
	bench_guy_text VIRIDIAN_POKECENTER,      SPRITE_FACING_LEFT, ViridianCityPokecenterBenchGuyText
	bench_guy_text PEWTER_POKECENTER,        SPRITE_FACING_LEFT, PewterCityPokecenterBenchGuyText
	bench_guy_text CERULEAN_POKECENTER,      SPRITE_FACING_LEFT, CeruleanCityPokecenterBenchGuyText
	bench_guy_text LAVENDER_POKECENTER_MART, SPRITE_FACING_LEFT, LavenderCityPokecenterBenchGuyText   ; marcelnote - merged Lavender Pokecenter and Mart
	bench_guy_text VERMILION_POKECENTER,     SPRITE_FACING_LEFT, VermilionCityPokecenterBenchGuyText
	bench_guy_text CELADON_POKECENTER,       SPRITE_FACING_LEFT, CeladonCityPokecenterBenchGuyText
	bench_guy_text CELADON_HOTEL,            SPRITE_FACING_LEFT, CeladonCityHotelText
	bench_guy_text FUCHSIA_POKECENTER,       SPRITE_FACING_LEFT, FuchsiaCityPokecenterBenchGuyText
	bench_guy_text CINNABAR_POKECENTER_MART, SPRITE_FACING_LEFT, CinnabarIslandPokecenterBenchGuyText ; marcelnote - merged Cinnabar Pokecenter and Mart
	bench_guy_text SAFFRON_POKECENTER_MART,  SPRITE_FACING_LEFT, SaffronCityPokecenterBenchGuyText    ; marcelnote - merged Saffron Pokecenter and Mart
	bench_guy_text MT_MOON_POKECENTER,       SPRITE_FACING_LEFT, MtMoonPokecenterBenchGuyText
	bench_guy_text ROCK_TUNNEL_POKECENTER,   SPRITE_FACING_LEFT, RockTunnelPokecenterBenchGuyText
	bench_guy_text MANDARIN_POKECENTER_MART, SPRITE_FACING_LEFT, MandarinIslandPokecenterBenchGuyText ; marcelnote - new
	db -1 ; end
