; function to draw various text boxes
; INPUT:
; [wTextBoxID] = text box ID
; Previous interface (unused): b, c = y, x cursor position (TWO_OPTION_MENU only)
; marcelnote - list engine refactor
; HL = caller-supplied box origin for choice definitions; cursor is derived.
; Other definitions specify their own fixed position.
DisplayTextBoxID::
	homecall_sf DisplayTextBoxID_
	ret
