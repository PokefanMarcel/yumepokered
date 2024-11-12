GymStatues:
; if in a gym and have the corresponding badge, a = GymStatueText2_id and jp PrintPredefTextID
; if in a gym and don't have the corresponding badge, a = GymStatueText1_id and jp PrintPredefTextID
; else ret
	call EnableAutoTextBoxDrawing
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	ld hl, MapBadgeFlags
	ld a, [wCurMap]
	ld b, a
.loop
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr z, .match
	inc hl
	jr .loop
.match
	ld b, [hl]
	ld a, [wObtainedBadges] ; marcelnote - removed redundant wBeatGymFlags
	and b
	cp b
;;;;;; marcelnote - modified this part to add Yellow
	tx_pre_id GymStatueText1
	jr nz, .print
	CheckEvent EVENT_BECAME_CHAMPION ; if became champion...
	tx_pre_id GymStatueText2
	jr z, .print
	ld a, [wCurMap]
	cp VIRIDIAN_GYM                  ; and not in Viridian Gym...
	tx_pre_id GymStatueText2
	jr z, .print
	tx_pre_id GymStatueText3         ; then also print YELLOW
.print
;;;;;;
	jp PrintPredefTextID

INCLUDE "data/maps/badge_maps.asm"

GymStatueText1::
	text_far _GymStatueText1
	text_end

GymStatueText2::
	text_far _GymStatueText2
	text_end

GymStatueText3:: ; marcelnote - added for Yellow
	text_far _GymStatueText3
	text_end
