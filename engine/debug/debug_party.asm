SetDebugNewGameParty: ; unreferenced except in _DEBUG
	ld de, DebugNewGameParty
.loop
	ld a, [de]
	cp -1
	ret z
	ld [wCurPartySpecies], a
	inc de
	ld a, [de]
	ld [wCurEnemyLevel], a
	inc de
	call AddPartyMon
	jr .loop

DebugNewGameParty: ; unreferenced except in _DEBUG
	; Exeggutor is the only debug party member shared with Red, Green, and Japanese Blue.
	; "Tsunekazu Ishihara: Exeggutor is my favorite. That's because I was
	; always using this character while I was debugging the program."
	; From https://web.archive.org/web/20000607152840/http://pocket.ign.com/news/14973.html
	db EXEGGUTOR, 90
	db MEW, 90 ; marcelnote - increased from 5
	db JOLTEON, 80 ; marcelnote - increased from 56
	db DUGTRIO, 66 ; marcelnote - increased from 56
	db ARTICUNO, 67 ; marcelnote - increased from 57
	db PIKACHU, 5
	db -1 ; end

PrepareNewGameDebug: ; dummy except in _DEBUG
IF DEF(_DEBUG)
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a

	; Fly anywhere.
	dec a ; $ff (all bits)
	ld [wTownVisitedFlag], a
	ld [wTownVisitedFlag + 1], a

	; Get all badges except Earth Badge.
	ld a, ~(1 << BIT_EARTHBADGE)
	ld [wObtainedBadges], a

	call SetDebugNewGameParty

	; Exeggutor gets four HM moves.
	ld hl, wPartyMon1Moves
	ld a, FLY
	ld [hli], a
	ld a, CUT
	ld [hli], a
	ld a, SURF
	ld [hli], a
	ld a, STRENGTH
	ld [hl], a
	ld hl, wPartyMon1PP
	ld a, 15
	ld [hli], a
	ld a, 25 ; marcelnote - CUT now has 25PP
	ld [hli], a
	ld a, 15
	ld [hli], a
	ld [hl], a

	; Mew gets Transform.
	ld hl, wPartyMon2Moves
	ld a, TRANSFORM
	ld [hl], a
	ld hl, wPartyMon2PP
	ld a, 15
	ld [hl], a

	; Jolteon gets Thunderbolt.
	ld hl, wPartyMon3Moves + 3
	ld a, THUNDERBOLT
	ld [hl], a
	ld hl, wPartyMon3PP + 3
	ld a, 15
	ld [hl], a

	; Articuno gets Ice Beam. ; marcelnote - added
    ld hl, wPartyMon5Moves
    ld a, ICE_BEAM
    ld [hl], a
    ld hl, wPartyMon5PP
    ld a, 10
    ld [hl], a
	; Articuno gets Fly.
	ld hl, wPartyMon5Moves + 3
	ld a, FLY
	ld [hl], a
	ld hl, wPartyMon5PP + 3
	ld a, 15
	ld [hl], a

	; Pikachu gets Surf and Flash.
	ld hl, wPartyMon6Moves + 1
	ld a, SURF
	ld [hl], a
	ld hl, wPartyMon6PP + 1
	ld a, 15
	ld [hl], a
	ld hl, wPartyMon6Moves + 2
	ld a, FLASH
	ld [hl], a
	ld hl, wPartyMon6PP + 2
	ld a, 20
	ld [hl], a

	; Dugtrio gets Dig. ; marcelnote - added
	ld hl, wPartyMon4Moves + 3
	ld a, DIG
	ld [hl], a
	ld hl, wPartyMon4PP + 3
	ld a, 15
	ld [hl], a

	; Get some debug items.
	ld hl, wNumBagItems
	ld de, DebugNewGameItemsList
.items_loop
	ld a, [de]
	cp -1
	jr z, .items_end
	ld [wCurItem], a
	inc de
	ld a, [de]
	inc de
	ld [wItemQuantity], a
	call AddItemToInventory
	jr .items_loop
.items_end

	; Get some more debug items. ; marcelnote - new for Key items pocket
	ld hl, wNumBagKeyItems
	ld de, DebugKeyItemsList
.key_items_loop
	ld a, [de]
	cp -1
	jr z, .key_items_end
	ld [wCurItem], a
	inc de
	ld a, [de]
	inc de
	ld [wItemQuantity], a
	call AddItemToInventory
	jr .key_items_loop
.key_items_end

	; Complete the Pokédex.
	ld hl, wPokedexOwned
	call DebugSetPokedexEntries
	ld hl, wPokedexSeen
	call DebugSetPokedexEntries
	SetEvent EVENT_GOT_POKEDEX

	; Rival chose Squirtle,
	; Player chose Charmander.
	ld hl, wRivalStarter
	ASSERT wRivalStarter + 2 == wPlayerStarter
	ld a, STARTER2
	ld [hli], a
	inc hl ; hl = wPlayerStarter
	ld a, STARTER1
	ld [hl], a

	ret

DebugSetPokedexEntries:
	ld b, wPokedexOwnedEnd - wPokedexOwned - 1
	ld a, %11111111
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ld [hl], %01111111
	ret

DebugNewGameItemsList: ; marcelnote - moved some to key items pocket
	;db BICYCLE, 1
	db FULL_RESTORE, 99
	db FULL_HEAL, 99
	db ESCAPE_ROPE, 99
	db RARE_CANDY, 99
	db MASTER_BALL, 99
	db MAX_ELIXIR, 99 ; marcelnote - added
	;db TOWN_MAP, 1
	;db SECRET_KEY, 1
	;db CARD_KEY, 1
	;db S_S_TICKET, 1
	;db LIFT_KEY, 1
	db TM_TELEPORT, 1
	db TM_DIG, 1
	db TM_SOFTBOILED, 1
	db -1 ; end

DebugKeyItemsList:    ; marcelnote - new for Key Items pocket
	db BICYCLE, 1
	db TOWN_MAP, 1
	db OLD_ROD, 1
	db ITEMFINDER, 1
	db POKE_FLUTE, 1
	db SECRET_KEY, 1
	db CARD_KEY, 1
	db S_S_TICKET, 1
	db LIFT_KEY, 1
	db SILPH_SCOPE, 1 ; marcelnote - added
	db CITRUS_PASS, 1 ; marcelnote - added
	;db SURFBOARD, 1 ; marcelnote - added
	db HM_CUT, 1 ; marcelnote - added
	db HM_FLY, 1 ; marcelnote - added
	db HM_SURF, 1 ; marcelnote - added
	db HM_STRENGTH, 1 ; marcelnote - added
	db HM_FLASH, 1 ; marcelnote - added
	db -1 ; end

;DebugUnusedList:
;	db -1 ; end
ELSE
	ret
ENDC
