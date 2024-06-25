; marcelnote - new location
MandarinPokecenterMart_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

MandarinPokecenterMart_TextPointers:
	def_text_pointers
	dw_const MandarinPokecenterNurseText,            TEXT_MANDARINPOKECENTER_NURSE
	;dw_const MandarinPokecenterGentlemanText,       TEXT_MANDARINPOKECENTER_GENTLEMAN
	dw_const MandarinPokecenterLinkReceptionistText, TEXT_MANDARINPOKECENTER_LINK_RECEPTIONIST
	dw_const MandarinMartClerkText,                  TEXT_MANDARINMART_CLERK

MandarinPokecenterNurseText:
	script_pokecenter_nurse

;MandarinPokecenterGentlemanText:
;	text_far _MandarinPokecenterGentlemanText
;	text_end

MandarinPokecenterLinkReceptionistText:
	script_cable_club_receptionist

MandarinMartClerkText: ; marcelnote - same as Cinnabar for now
	script_mart ULTRA_BALL, GREAT_BALL, HYPER_POTION, MAX_REPEL, ESCAPE_ROPE, FULL_HEAL, REVIVE
