; marcelnote - merged Cerulean Pokecenter and Mart
CeruleanPokecenterMart_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

CeruleanPokecenterMart_TextPointers:
	def_text_pointers
	; Pokecenter
	dw_const CeruleanPokecenterNurseText,            TEXT_CERULEANPOKECENTER_NURSE
	dw_const CeruleanPokecenterSuperNerdText,        TEXT_CERULEANPOKECENTER_SUPER_NERD
	dw_const CeruleanPokecenterGentlemanText,        TEXT_CERULEANPOKECENTER_GENTLEMAN
	dw_const CeruleanPokecenterLinkReceptionistText, TEXT_CERULEANPOKECENTER_LINK_RECEPTIONIST
	; Mart
	dw_const CeruleanMartClerkText,        TEXT_CERULEANMART_CLERK
	dw_const CeruleanMartCooltrainerMText, TEXT_CERULEANMART_COOLTRAINER_M
	dw_const CeruleanMartCooltrainerFText, TEXT_CERULEANMART_COOLTRAINER_F

CeruleanPokecenterLinkReceptionistText:
	script_cable_club_receptionist

CeruleanPokecenterNurseText:
	script_pokecenter_nurse

CeruleanPokecenterSuperNerdText:
	text_far _CeruleanPokecenterSuperNerdText
	text_end

CeruleanPokecenterGentlemanText:
	text_far _CeruleanPokecenterGentlemanText
	text_end

CeruleanMartCooltrainerMText:
	text_far _CeruleanMartCooltrainerMText
	text_end

CeruleanMartCooltrainerFText:
	text_far _CeruleanMartCooltrainerFText
	text_end

CeruleanMartClerkText: ; marcelnote - moved Mart inventories
	script_mart POKE_BALL, POTION, REPEL, ANTIDOTE, BURN_HEAL, AWAKENING, PARLYZ_HEAL
