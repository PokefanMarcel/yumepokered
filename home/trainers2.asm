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
	ld bc, 6 ; marcelnote - added trainer picture bank
	call AddNTimes
	ld de, wTrainerPicPointer
	dec c ; bc = 5: trainer pic pointer (2), trainer pic bank, trainer base money (2)
	call CopyData
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
