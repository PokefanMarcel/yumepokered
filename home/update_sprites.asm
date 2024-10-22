UpdateSprites::
	ld a, [wUpdateSpritesEnabled]
	dec a
	ret nz
	ld hl, hSkipOAMUpdates   ; marcelnote - OAM updates can be interrupted by V-Blank (pokered Wiki)
	set 0, [hl]              ; fix cont'd
	homecall _UpdateSprites
	ld hl, hSkipOAMUpdates   ; fix cont'd
	res 0, [hl]              ; fix cont'd
	ret
