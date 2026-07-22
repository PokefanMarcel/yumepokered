BookOrSculptureText::
	text_asm
	ld hl, PokemonBooksText
	ld a, [wCurMapTileset]
	cp MANSION ; Celadon Mansion tileset
	ret nz
	lda_coord 8, 6
	cp $38
	ret nz
	ld hl, DiglettSculptureText
	ret

PokemonBooksText:
	text_far _PokemonBooksText
	text_end

DiglettSculptureText:
	text_far _DiglettSculptureText
	text_end
