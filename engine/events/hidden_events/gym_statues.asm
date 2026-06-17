GymStatues:
; if in a gym and have the corresponding badge, a = GymStatueText2_id and jp PrintPredefTextID
; if in a gym and don't have the corresponding badge, a = GymStatueText1_id and jp PrintPredefTextID
; if in a gym and have the corresponding badge and the next one, a = GymStatueText3_id and jp PrintPredefTextID
; else ret
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
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
.match ; marcelnote - modified this part to add Yellow
	ld b, [hl]              ; b = 1 << bit current badge
	ld a, [wObtainedBadges] ; marcelnote - removed redundant wBeatGymFlags
	and b                   ; do we have the badge of the current gym?
	tx_pre_id GymStatueText1
	jr z, .print            ; if not, just mention Rival's name
	ld a, [wObtainedBadges]
	sla b                   ; b = 1 << bit next badge
	and b                   ; do we also have the badge of the next gym?
	tx_pre_id GymStatueText2
	jr z, .print            ; if not, also mention Player's name
	tx_pre_id GymStatueText3 ; if yes, even mention Yellow's name
.print
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
