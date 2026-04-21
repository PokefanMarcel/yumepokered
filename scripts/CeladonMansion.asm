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
	dw_const CeladonMansion4FHackerText,         TEXT_CELADONMANSION4F_HACKER
	; bg
	; 1F
	; nothing
	; 2F
	; nothing
	; 3F
	dw_const CeladonMansion3FGameProgramPCText,  TEXT_CELADONMANSION3F_GAME_PROGRAM_PC
	dw_const CeladonMansion3FPlayingGamePCText,  TEXT_CELADONMANSION3F_PLAYING_GAME_PC
	dw_const CeladonMansion3FGameScriptPCText,   TEXT_CELADONMANSION3F_GAME_SCRIPT_PC
	; 4F
	dw_const CeladonMansion4FExeggutorSurfPCText, TEXT_CELADONMANSION4F_EXEGGUTOR_SURF_PC


CeladonMansion_PlayCryScript:
	call PlayCry
	rst TextScriptEnd

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
	ld hl, .CompletedDexText
	jr nc, .print_text
	ld hl, .GameDesignerText
.print_text
	call PrintText
	rst TextScriptEnd

.GameDesignerText:
	text_far _CeladonMansion3FGameDesignerText
	text_end

.CompletedDexText:
	text_far _CeladonMansion3FGameDesignerCompletedDexText
	text_promptbutton
	text_asm
	callfar DisplayDiploma
	ld a, TRUE
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	rst TextScriptEnd

CeladonMansion3FGameProgramPCText:
	text_far _CeladonMansion3FGameProgramPCText
	text_end

CeladonMansion3FPlayingGamePCText:
	text_far _CeladonMansion3FPlayingGamePCText
	text_end

CeladonMansion3FGameScriptPCText:
	text_far _CeladonMansion3FGameScriptPCText
	text_end


CeladonMansion4FHackerText:
	text_far _CeladonMansion4FHackerText
	text_end

CeladonMansion4FExeggutorSurfPCText:
	text_far _CeladonMansion4FExeggutorSurfPCText
	text_end
