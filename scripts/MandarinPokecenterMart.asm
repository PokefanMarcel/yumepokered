; marcelnote - new location
MandarinPokecenterMart_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

MandarinPokecenterMart_TextPointers:
	def_text_pointers
	dw_const MandarinPokecenterNurseText,            TEXT_MANDARINPOKECENTER_NURSE
	dw_const MandarinPokecenterLinkReceptionistText, TEXT_MANDARINPOKECENTER_LINK_RECEPTIONIST
	dw_const MandarinPokecenterSuperNerdText,        TEXT_MANDARINPOKECENTER_SUPER_NERD
	dw_const MandarinPokecenterCooltrainerFText,     TEXT_MANDARINPOKECENTER_COOLTRAINER_F
	dw_const MandarinMartClerkText,                  TEXT_MANDARINMART_CLERK
	dw_const MandarinMartCookText,                   TEXT_MANDARINMART_COOK
	dw_const MandarinMartCooltrainerFText,           TEXT_MANDARINMART_COOLTRAINER_F

MandarinPokecenterNurseText:
	script_pokecenter_nurse

MandarinPokecenterSuperNerdText:
	text_far _MandarinPokecenterSuperNerdText
	text_end

MandarinPokecenterCooltrainerFText:
	text_far _MandarinPokecenterCooltrainerFText
	text_end

MandarinPokecenterLinkReceptionistText:
	script_cable_club_receptionist


MandarinMartCookText:
	text_far _MandarinMartCookText
	text_end

MandarinMartCooltrainerFText:
	text_far _MandarinMartCooltrainerFText
	text_end

MandarinMartClerkText: ; marcelnote - same as Cinnabar for now
	script_mart ULTRA_BALL, GREAT_BALL, HYPER_POTION, MAX_REPEL, ESCAPE_ROPE, FULL_HEAL, REVIVE
