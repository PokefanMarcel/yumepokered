GetTrainerName_::
	ld hl, wLinkEnemyTrainerName
	ld a, [wLinkState]
	and a
	jr nz, .foundName
	ld hl, wRivalName
	ld a, [wTrainerClass]
	cp RIVAL1
	jr z, .foundName
	cp RIVAL2
	jr z, .foundName
	cp RIVAL3
	jr z, .foundName
	ld [wNameListIndex], a
	ld a, TRAINER_NAME
	ld [wNameListType], a
	ld a, BANK(TrainerNames)
	ld [wPredefBank], a
	call GetName ; stores name in wNameBuffer
	ld hl, wNameBuffer
.foundName
	ld de, wTrainerName
	ld bc, ITEM_NAME_LENGTH
	jp CopyData
