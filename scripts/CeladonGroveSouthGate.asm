; marcelnote - new location
CeladonGroveSouthGate_Script:
	jp EnableAutoTextBoxDrawing

CeladonGroveSouthGate_TextPointers:
	def_text_pointers
	dw_const CeladonGroveSouthGateRocketText,    TEXT_CELADONGROVESOUTHGATE_ROCKET
	dw_const CeladonGroveSouthGateChannelerText, TEXT_CELADONGROVESOUTHGATE_CHANNELER

CeladonGroveSouthGateRocketText:
	text_far _CeladonGroveSouthGateRocketText
	text_end

CeladonGroveSouthGateChannelerText:
	text_far _CeladonGroveSouthGateChannelerText
	text_end