; marcelnote - merged Saffron Pokecenter and Mart
SaffronPokecenterMart_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

SaffronPokecenterMart_TextPointers:
	def_text_pointers
	; Pokecenter
	dw_const SaffronPokecenterNurseText,            TEXT_SAFFRONPOKECENTER_NURSE
	dw_const SaffronPokecenterBeautyText,           TEXT_SAFFRONPOKECENTER_BEAUTY
	dw_const SaffronPokecenterGentlemanText,        TEXT_SAFFRONPOKECENTER_GENTLEMAN
	dw_const SaffronPokecenterLinkReceptionistText, TEXT_SAFFRONPOKECENTER_LINK_RECEPTIONIST
	dw_const SaffronPokecenterBenchGuyText,         TEXT_SAFFRONPOKECENTER_BENCH_GUY ; marcelnote - BenchGuy has a sprite
	; Mart
	dw_const SaffronMartClerkText,        TEXT_SAFFRONMART_CLERK
	dw_const SaffronMartSuperNerdText,    TEXT_SAFFRONMART_SUPER_NERD
	dw_const SaffronMartCooltrainerFText, TEXT_SAFFRONMART_COOLTRAINER_F

SaffronPokecenterNurseText:
	script_pokecenter_nurse

SaffronPokecenterBeautyText:
	text_far _SaffronPokecenterBeautyText
	text_end

SaffronPokecenterGentlemanText:
	text_far _SaffronPokecenterGentlemanText
	text_end

SaffronPokecenterLinkReceptionistText:
	script_cable_club_receptionist

SaffronPokecenterBenchGuyText: ; marcelnote - BenchGuy has a sprite
	text_asm
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, .GoOutAgainText
	jr nz, .print_text
	ld hl, .WouldBeGreatText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.WouldBeGreatText:
	text_far _SaffronPokecenterBenchGuyWouldBeGreatText
	text_end

.GoOutAgainText:
	text_far _SaffronPokecenterBenchGuyGoOutAgainText
	text_end


SaffronMartSuperNerdText:
	text_far _SaffronMartSuperNerdText
	text_end

SaffronMartCooltrainerFText:
	text_far _SaffronMartCooltrainerFText
	text_end

SaffronMartClerkText: ; marcelnote - moved Mart inventories
	script_mart GREAT_BALL, HYPER_POTION, MAX_REPEL, ESCAPE_ROPE, FULL_HEAL, REVIVE
