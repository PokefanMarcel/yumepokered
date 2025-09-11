GetTrainerInformation::
	call GetTrainerName
	ld a, [wLinkState]
	and a
	jr nz, .linkBattle
	ld a, BANK(TrainerPicAndMoneyPointers)
	call BankswitchHome
	ld a, [wTrainerClass]
	dec a
	ld hl, TrainerPicAndMoneyPointers
	ld bc, $6 ; marcelnote - added trainer picture bank
	call AddNTimes
	ld de, wTrainerPicPointer
	ld a, [hli] ; trainer pic pointer
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli] ; trainer pic bank
	ld [de], a  ; wTrainerPicBank
	inc de
	ld a, [hli] ; trainer base money
	ld [de], a  ; wTrainerBaseMoney
	inc de
	ld a, [hl]
	ld [de], a
	jp BankswitchBack
.linkBattle
	ld hl, wTrainerPicPointer
	ld de, RedPicFront
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld [hl], BANK(RedPicFront) ; marcelnote - added for trainer picture bank
	ret

GetTrainerName::
	jpfar GetTrainerName_
