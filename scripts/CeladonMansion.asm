CeladonMansion_Script:
	jp EnableAutoTextBoxDrawing

CeladonMansion_TextPointers:
	def_text_pointers
	; objects
	; 1F
	dw_const CeladonMansion1FMeowthText,            TEXT_CELADONMANSION1F_MEOWTH
	dw_const CeladonMansion1FGrannyText,            TEXT_CELADONMANSION1F_GRANNY
	dw_const CeladonMansion1FClefairyText,          TEXT_CELADONMANSION1F_CLEFAIRY
	dw_const CeladonMansion1FNidoranFText,          TEXT_CELADONMANSION1F_NIDORANF
	; 2F
	; nothing
	; 3F
	dw_const CeladonMansion3FProgrammerText,     TEXT_CELADONMANSION3F_PROGRAMMER
	dw_const CeladonMansion3FGraphicArtistText,  TEXT_CELADONMANSION3F_GRAPHIC_ARTIST
	dw_const CeladonMansion3FWriterText,         TEXT_CELADONMANSION3F_WRITER
	dw_const CeladonMansion3FGameDesignerText,   TEXT_CELADONMANSION3F_GAME_DESIGNER
	; 4F
	; nothing
	; bg
	; 1F
	dw_const CeladonMansion1FManagersSuiteSignText, TEXT_CELADONMANSION1F_MANAGERS_SUITE_SIGN
	; 2F
	dw_const CeladonMansion2FMeetingRoomSignText, TEXT_CELADONMANSION2F_MEETING_ROOM_SIGN
	; 3F
	dw_const CeladonMansion3FGameProgramPCText,  TEXT_CELADONMANSION3F_GAME_PROGRAM_PC
	dw_const CeladonMansion3FPlayingGamePCText,  TEXT_CELADONMANSION3F_PLAYING_GAME_PC
	dw_const CeladonMansion3FGameScriptPCText,   TEXT_CELADONMANSION3F_GAME_SCRIPT_PC
	dw_const CeladonMansion3FDevRoomSignText,    TEXT_CELADONMANSION3F_DEV_ROOM_SIGN
	; 4F
	; nothing


CeladonMansion_PlayCryScript:
	call PlayCry
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CeladonMansion1FMeowthText:
	text_far _CeladonMansion1FMeowthText
	text_asm
	ld a, MEOWTH
	jp CeladonMansion_PlayCryScript

CeladonMansion1FGrannyText:
	text_far _CeladonMansion1FGrannyText
	text_end

CeladonMansion1FClefairyText:
	text_far _CeladonMansion1FClefairyText
	text_asm
	ld a, CLEFAIRY
	jp CeladonMansion_PlayCryScript

CeladonMansion1FNidoranFText:
	text_far _CeladonMansion1FNidoranFText
	text_asm
	ld a, NIDORAN_F
	jp CeladonMansion_PlayCryScript

CeladonMansion1FManagersSuiteSignText:
	text_far _CeladonMansion1FManagersSuiteSignText
	text_end


CeladonMansion2FMeetingRoomSignText:
	text_far _CeladonMansion2FMeetingRoomSignText
	text_end


CeladonMansion3FProgrammerText:
	text_far _CeladonMansion3FProgrammerText
	text_end

CeladonMansion3FGraphicArtistText:
	text_far _CeladonMansion3FGraphicArtistText
	text_end

CeladonMansion3FWriterText:
	text_far _CeladonMansion3FWriterText
	text_end

CeladonMansion3FGameDesignerText:
	text_asm
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	cp NUM_POKEMON - 1 ; discount Mew
	jr nc, .completed_dex
	ld hl, .Text
	jr .done
.completed_dex
	ld hl, .CompletedDexText
.done
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.Text:
	text_far _CeladonMansion3FGameDesignerText
	text_end

.CompletedDexText:
	text_far _CeladonMansion3FGameDesignerCompletedDexText
	text_promptbutton
	text_asm
	callfar DisplayDiploma
	ld a, TRUE
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

CeladonMansion3FGameProgramPCText:
	text_far _CeladonMansion3FGameProgramPCText
	text_end

CeladonMansion3FPlayingGamePCText:
	text_far _CeladonMansion3FPlayingGamePCText
	text_end

CeladonMansion3FGameScriptPCText:
	text_far _CeladonMansion3FGameScriptPCText
	text_end

CeladonMansion3FDevRoomSignText:
	text_far _CeladonMansion3FDevRoomSignText
	text_end
