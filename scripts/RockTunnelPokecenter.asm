RockTunnelPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

RockTunnelPokecenter_TextPointers:
	def_text_pointers
	dw_const RockTunnelPokecenterNurseText,            TEXT_ROCKTUNNELPOKECENTER_NURSE
	dw_const RockTunnelPokecenterGentlemanText,        TEXT_ROCKTUNNELPOKECENTER_GENTLEMAN
	dw_const RockTunnelPokecenterFisherText,           TEXT_ROCKTUNNELPOKECENTER_FISHER
	dw_const RockTunnelPokecenterLinkReceptionistText, TEXT_ROCKTUNNELPOKECENTER_LINK_RECEPTIONIST
	dw_const RockTunnelPokecenterBenchGuyText,         TEXT_ROCKTUNNELPOKECENTER_BENCH_GUY ; marcelnote - BenchGuy has a sprite

RockTunnelPokecenterNurseText:
	script_pokecenter_nurse

RockTunnelPokecenterGentlemanText:
	text_far _RockTunnelPokecenterGentlemanText
	text_end

RockTunnelPokecenterFisherText:
	text_far _RockTunnelPokecenterFisherText
	text_end

RockTunnelPokecenterLinkReceptionistText:
	script_cable_club_receptionist

RockTunnelPokecenterBenchGuyText: ; marcelnote - BenchGuy has a sprite
	text_far _RockTunnelPokecenterBenchGuyText
	text_end

