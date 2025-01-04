DrawBadges:
; Draw 4x2 gym leader faces, with the faces replaced by
; badges if they are owned. Used in the player status screen.

; In Japanese versions, names are displayed above faces.
; Instead of removing relevant code, the name graphics were erased.

; marcelnote - this was modified to display gym leader names

; Tile ids for leader face graphics.
	ld de, wBadgeOrFaceTiles
	ld hl, .FaceBadgeTiles
	ld bc, NUM_BADGES
	call CopyData

; Tile ids for name graphics.
	ld de, wLeaderNameTiles
	ld hl, .NameTiles
	ld bc, NUM_BADGES
	call CopyData

; Move from face to badge graphics if badge is owned.
	ld hl, wBadgeOrFaceTiles
	ld a, [wObtainedBadges]
	ld b, a
	ld c, NUM_BADGES
.CheckBadge
	srl b ; sets carry if rotates out a 1
	jr nc, .KeepFaceTile
	ld a, [hl]
	add 4 ; Badge graphics are 4 tiles after each face
	ld [hl], a
.KeepFaceTile
	inc hl
	dec c
	jr nz, .CheckBadge

; Draw two rows of badges.
	ld hl, wBadgeNumberTile
	ld a, $d8 ; [1]
	ld [hli], a ; hl -> wBadgeNameTile
	ld [hl], $60 ; First name

	ld b, 8 ; total badge counter
	hlcoord 2, 11
	call .DrawBadgeRow

	hlcoord 2, 14
	; fallthrough

.DrawBadgeRow
; Draw 4 badges.

	ld c, 4
.DrawBadge
	push hl ; hl = tile coord for badge number

; Tile for badge no.
	ld a, [wBadgeNumberTile]
	ld [hli], a
	inc a
	ld [wBadgeNumberTile], a ; store next tile index for next badge

; Does this leader name use 2 or 3 tiles?
	push hl
	ld a, b ; b is the current badge number, counting downwards
	ld hl, .TwoTilesNames
	call IsInList ; returns carry if leader name uses only two tiles
	pop hl

; Names are printed using two or three tiles.
	ld a, [wBadgeNameTile]
	call c, .PlaceTwoTiles
	call nz, .PlaceThreeTiles
	ld [wBadgeNameTile], a ; store next tile index for next badge

	add hl, de ; add SCREEN_WIDTH - 1 or SCREEN_WIDTH - 2 to go to the next line
	ld a, [wBadgeOrFaceTiles]
	call .PlaceTiles
	ld de, SCREEN_WIDTH - 1 ; add SCREEN_WIDTH - 1 to go to the next line
	add hl, de
	call .PlaceTiles

; Shift badge array back one byte.
	push bc
	ld hl, wBadgeOrFaceTiles + 1
	ld de, wBadgeOrFaceTiles
	ld bc, NUM_BADGES
	call CopyData ; Copy bc bytes from hl to de.
	pop bc

	pop hl
	ld de, 4
	add hl, de ; set hl to tile for next badge number

	dec b
	dec c
	jr nz, .DrawBadge
	ret

.PlaceThreeTiles
	ld de, SCREEN_WIDTH - 2 ; if placing three tiles, one less to add to reach the next line
	ld [hli], a
	inc a
	jr .PlaceTiles
.PlaceTwoTiles
	ld de, SCREEN_WIDTH - 1
.PlaceTiles
	ld [hli], a
	inc a
	ld [hl], a
	inc a
	ret

.FaceBadgeTiles ; first tile for each leader/badge
	db $20, $28, $30, $38, $40, $48, $50, $58

.NameTiles ; first name tile for each leader
	db $60, $63, $66, $69, $6b, $6d, $70, $73

.TwoTilesNames ; counting backwards: 8 = Brock, 7 = Misty...
	db 5, 4, 1, -1 ; 5 = Erika, 4 = Koga, 1 = Giovanni

GymLeaderFaceAndBadgeTileGraphics:
	INCBIN "gfx/trainer_card/badges.2bpp"
