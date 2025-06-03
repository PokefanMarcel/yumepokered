DrawBadges:
; Draw 4x2 gym leader faces, with the faces replaced by
; badges if they are owned. Used in the player status screen.

; In Japanese versions, names are displayed above faces.
; Instead of removing relevant code, the name graphics were erased.

; marcelnote - modified to display gym leader names and for different tileset layout

; Draw two rows of badges.
	ld hl, wBadgeNumberTile
	ld a, $51 ; [1]
	ld [hli], a ; hl -> wBadgeOrFaceTile
	ld [hl], $31 ; First badge or face

	ld b, NUM_BADGES ; total badge counter
	hlcoord 2, 11
	call .DrawBadgeRow

	hlcoord 2, 14
	; fallthrough

.DrawBadgeRow
; Draw 4 badges.

	ld c, NUM_BADGES / 2

.DrawBadge
; Does this leader name use 2 or 3 tiles?
	push hl ; save hl = tile coord for next badge number
	ld a, b ; b is the current badge number, counting downwards
	ld hl, .TwoTilesNames
	call IsInList ; returns carry if leader name uses only two tiles
	pop hl  ; restore hl = tile coord for next badge number

; Place tiles for badge no. and leader name
	ld a, [wBadgeNumberTile]
	ld [hli], a
	inc a
	ld de, SCREEN_WIDTH - 1
	jr c, .placeTwoTiles
	; place three tiles
	ld [hli], a
	inc a
	dec de ; one less tile to add to reach the next line
.placeTwoTiles
	call .PlaceTiles
	ld [wBadgeNumberTile], a ; save next tile index for next badge no.

	add hl, de ; go to the next line
	ld a, [wBadgeOrFaceTile]
	call .PlaceTiles
	ld de, SCREEN_WIDTH - 1
	add hl, de ; go to the next line
	call .PlaceTiles
	ld [wBadgeOrFaceTile], a

	ld de, - 2 * SCREEN_WIDTH + 2
	add hl, de ; set hl to tile for next badge number

	dec b
	dec c
	jr nz, .DrawBadge
	ret

.PlaceTiles
	ld [hli], a
	inc a
	ld [hl], a
	inc a
	ret

.TwoTilesNames ; counting backwards: 8 = Brock, 7 = Misty...
	db 5, 4, 1, -1 ; 5 = Erika, 4 = Koga, 1 = Giovanni

GymLeaderFaceAndBadgeTileGraphics:
	INCBIN "gfx/trainer_card/badges.2bpp"
