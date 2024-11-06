; marcelnote - merged Vermilion Pokecenter and Mart
VermilionPokecenterMart_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

VermilionPokecenterMart_TextPointers:
	def_text_pointers
	; Pokecenter
	dw_const VermilionPokecenterNurseText,            TEXT_VERMILIONPOKECENTER_NURSE
	dw_const VermilionPokecenterFishingGuruText,      TEXT_VERMILIONPOKECENTER_FISHING_GURU
	dw_const VermilionPokecenterSailorText,           TEXT_VERMILIONPOKECENTER_SAILOR
	dw_const VermilionPokecenterLinkReceptionistText, TEXT_VERMILIONPOKECENTER_LINK_RECEPTIONIST
	; Mart
	dw_const VermilionMartClerkText,        TEXT_VERMILIONMART_CLERK
	dw_const VermilionMartCooltrainerMText, TEXT_VERMILIONMART_COOLTRAINER_M
	dw_const VermilionMartCooltrainerFText, TEXT_VERMILIONMART_COOLTRAINER_F

VermilionPokecenterNurseText:
	script_pokecenter_nurse

VermilionPokecenterFishingGuruText:
	text_far _VermilionPokecenterFishingGuruText
	text_end

VermilionPokecenterSailorText:
	text_far _VermilionPokecenterSailorText
	text_end

VermilionPokecenterLinkReceptionistText:
	script_cable_club_receptionist

VermilionMartCooltrainerMText:
	text_far _VermilionMartCooltrainerMText
	text_end

VermilionMartCooltrainerFText:
	text_far _VermilionMartCooltrainerFText
	text_end

VermilionMartClerkText: ; marcelnote - moved Mart inventories
	script_mart POKE_BALL, SUPER_POTION, ICE_HEAL, AWAKENING, PARLYZ_HEAL, REPEL
