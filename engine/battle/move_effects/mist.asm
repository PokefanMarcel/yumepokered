MistEffect_:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus2
	jr z, .gotPointer
	ld hl, wEnemyBattleStatus2
.gotPointer
	bit PROTECTED_BY_MIST, [hl] ; is mon protected by mist?
	jr nz, .butItFailed
	set PROTECTED_BY_MIST, [hl] ; mon is now protected by mist
	callfar PlayCurrentMoveAnimation
	ld hl, ShroudedInMistText
	jp PrintText

.butItFailed
	jpfar PrintButItFailedText_

ShroudedInMistText:
	text_far _ShroudedInMistText
	text_end
