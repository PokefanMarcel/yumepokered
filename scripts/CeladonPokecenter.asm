CeladonPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

CeladonPokecenter_TextPointers:
	def_text_pointers
	dw_const CeladonPokecenterNurseText,            TEXT_CELADONPOKECENTER_NURSE
	dw_const CeladonPokecenterGentlemanText,        TEXT_CELADONPOKECENTER_GENTLEMAN
	dw_const CeladonPokecenterBeautyText,           TEXT_CELADONPOKECENTER_BEAUTY
	dw_const CeladonPokecenterLinkReceptionistText, TEXT_CELADONPOKECENTER_LINK_RECEPTIONIST
	dw_const CeladonPokecenterBenchGuyText,         TEXT_CELADONPOKECENTER_BENCH_GUY ; marcelnote - BenchGuy has a sprite

CeladonPokecenterLinkReceptionistText:
	script_cable_club_receptionist

CeladonPokecenterNurseText:
	script_pokecenter_nurse

CeladonPokecenterGentlemanText:
	text_far _CeladonPokecenterGentlemanText
	text_end

CeladonPokecenterBeautyText:
	text_far _CeladonPokecenterBeautyText
	text_end

CeladonPokecenterBenchGuyText: ; marcelnote - BenchGuy has a sprite
	text_far _CeladonPokecenterBenchGuyText
	text_end
