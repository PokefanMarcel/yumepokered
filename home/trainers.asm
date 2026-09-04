StoreTrainerHeaderPointer::
	ld a, h
	ld [wTrainerHeaderPtr], a
	ld a, l
	ld [wTrainerHeaderPtr+1], a
	ret

; executes the current map script from the function pointer array provided in de.
; bc: pointer to the current map's map script index
; hl: trainer header pointer
ExecuteCurMapScriptInTable:: ; marcelnote - optimized
	call StoreTrainerHeaderPointer
	ld hl, wCurMapScriptStatePtr
	ld a, c
	ld [hli], a
	ld [hl], b
	ld a, [bc] ; a = current map's script
	ld h, d
	ld l, e
	jp CallFunctionInTable

SetCurMapScript::
	ld c, a
	ld hl, wCurMapScriptStatePtr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], c
	ret

IncrementCurMapScript::
	ld hl, wCurMapScriptStatePtr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc [hl]
	ret

LoadGymLeaderAndCityName:: ; marcelnote - modified to reuse existing names
; a is the gym leader's trainer class
	ld [wNameListIndex], a
	ld a, TRAINER_NAME
	ld [wNameListType], a
	ld a, BANK(TrainerNames)
	ld [wPredefBank], a
	call GetName ; stores name in wNameBuffer
	ld hl, wNameBuffer
	ld de, wGymLeaderName
	ld bc, NAME_LENGTH
	call CopyData ; copy from wNameBuffer into wGymLeaderName
	jpfar LoadGymCityName

; reads specific information from trainer header (pointed to at wTrainerHeaderPtr)
; a: offset in header data
ReadTrainerHeaderInfo::
	push de
	push af
	ld d, 0
	ld e, a
	ld hl, wTrainerHeaderPtr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	add hl, de
	pop af
	and a
	jr nz, .nonZeroOffset
	ld a, [hl]
	ld [wTrainerHeaderFlagBit], a
	jr .done
.nonZeroOffset
	cp TRAINER_EVENT_FLAG_POINTER
	jr z, .readPointer
	cp TRAINER_BEFORE_BATTLE_TEXT
	jr z, .readPointer
	cp TRAINER_AFTER_BATTLE_TEXT
	jr z, .readPointer
	cp TRAINER_WON_BATTLE_TEXT
	jr z, .readPointer
;	cp TRAINER_LOST_BATTLE_TEXT
;	jr nz, .done
;	ld a, [hli]        ; TRAINER_LOST_BATTLE_TEXT pointer is overwritten afterwards (XXX why, bug?)
;	ld d, [hl]
;	ld e, a
	jr .done
.readPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
.done
	pop de
	ret

TalkToTrainer::
	call StoreTrainerHeaderPointer
	xor a ; TRAINER_EVENT_FLAG_BIT
	call ReadTrainerHeaderInfo
	ld a, TRAINER_EVENT_FLAG_POINTER
	call ReadTrainerHeaderInfo
	ld a, [wTrainerHeaderFlagBit]
	ld c, a
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	jr z, .trainerNotYetFought
	ld a, TRAINER_AFTER_BATTLE_TEXT
	call ReadTrainerHeaderInfo
	jp PrintText
.trainerNotYetFought
	ld a, TRAINER_BEFORE_BATTLE_TEXT
	call ReadTrainerHeaderInfo
	call PrintText
;	ld a, TRAINER_LOST_BATTLE_TEXT
;	call ReadTrainerHeaderInfo     ; (?) does nothing apparently (maybe bug in ReadTrainerHeaderInfo)
;	push de
	ld a, TRAINER_WON_BATTLE_TEXT
	call ReadTrainerHeaderInfo     ; read end battle text
;	pop de
	call SaveEndBattleTextPointers
	ld hl, wMiscFlags
	bit BIT_SEEN_BY_TRAINER, [hl]
	ret nz
; if the player talked to the trainer of their own volition
	call EngageMapTrainer
	call IncrementCurMapScript ; advance once before StartTrainerBattle advances to EndTrainerBattle
	jr StartTrainerBattle

; checks if any trainers are seeing the player and wanting to fight
CheckFightingMapTrainers::
IF DEF(_DEBUG)
	call DebugPressedOrHeldB
	jr nz, .trainerNotEngaging
ENDC
	call CheckForEngagingTrainers
	ld a, [wSpriteIndex]
	cp $ff
	jr nz, .trainerEngaging
IF DEF(_DEBUG)
.trainerNotEngaging
ENDC
	xor a
	ld [wSpriteIndex], a
	ld [wTrainerHeaderFlagBit], a
	ret
.trainerEngaging
	ld hl, wStatusFlags7
	set BIT_TRAINER_BATTLE, [hl]
	ld [wEmotionBubbleSpriteIndex], a
	xor a ; EXCLAMATION_BUBBLE
	ld [wWhichEmotionBubble], a
	predef EmotionBubble
	ld a, PAD_CTRL_PAD | PAD_A ; marcelnote - added PAD_A (otherwise can Surf/Cut if trainer starts to talk)
	ld [wJoyIgnore], a
	xor a
	ldh [hJoyHeld], a
	call TrainerWalkUpToPlayer_Bank0
	jp IncrementCurMapScript ; next script function is usually DisplayEnemyTrainerTextAndStartBattle

; display the before battle text after the enemy trainer has walked up to the player's sprite
DisplayEnemyTrainerTextAndStartBattle::
	ld a, [wStatusFlags5]
	and 1 << BIT_SCRIPTED_NPC_MOVEMENT
	ret nz ; return if the enemy trainer hasn't finished walking to the player's sprite
	ld [wJoyIgnore], a
	ld a, [wSpriteIndex]
	ldh [hSpriteIndex], a
	call DisplayTextID
	; fallthrough

StartTrainerBattle::
	xor a
	ld [wJoyIgnore], a
	call InitBattleEnemyParameters
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
;	ld hl, wStatusFlags4
;	set BIT_UNKNOWN_4_1, [hl] ; marcelnote - never read
	jp IncrementCurMapScript ; next script function is usually EndTrainerBattle

EndTrainerBattle::
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	set BIT_CUR_MAP_LOADED_2, [hl]
	ld hl, wStatusFlags3
	res BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, wMiscFlags
	res BIT_SEEN_BY_TRAINER, [hl]
	ld a, [wIsInBattle]
	inc a ; LOST_BATTLE?
	jr z, ResetButtonPressedAndMapScript
	ld a, TRAINER_EVENT_FLAG_POINTER
	call ReadTrainerHeaderInfo
	ld a, [wTrainerHeaderFlagBit]
	ld c, a
	ld b, FLAG_SET
	predef FlagActionPredef  ; flag trainer as fought
	ld a, [wEnemyMonOrTrainerClass]
	cp OPP_ID_OFFSET
	jr nc, .skipRemoveSprite
	ld hl, wToggleableObjectList
	ld de, $2
	ld a, [wSpriteIndex]
	call IsInArray ; search for sprite ID
	inc hl
	ld a, [hl]
	ld [wToggleableObjectIndex], a
	predef HideObject
.skipRemoveSprite
;	ld hl, wStatusFlags5
;	bit BIT_UNKNOWN_5_4, [hl] ; marcelnote - never set
;	res BIT_UNKNOWN_5_4, [hl]
;	ret nz

ResetButtonPressedAndMapScript::
	xor a
	ld [wJoyIgnore], a
	ldh [hJoyHeld], a
	ldh [hJoyPressed], a
	ldh [hJoyReleased], a
	jp SetCurMapScript

TrainerWalkUpToPlayer_Bank0::
	jpfar TrainerWalkUpToPlayer

; sets opponent trainer class and party level based on the engaging trainer data
InitBattleEnemyParameters::
	ld a, [wEngagedTrainerClass]
	ld [wCurOpponent], a
	ld [wEnemyMonOrTrainerClass], a
	cp OPP_ID_OFFSET
	ld a, [wEngagedTrainerSet]
	jr c, .noTrainer
	ld [wTrainerNo], a
	ret
.noTrainer
	ld [wCurEnemyLevel], a
	ret

GetSpritePosition1::
	ld hl, _GetSpritePosition1
	jr SpritePositionBankswitch

GetSpritePosition2::
	ld hl, _GetSpritePosition2
	jr SpritePositionBankswitch

SetSpritePosition1::
	ld hl, _SetSpritePosition1
	jr SpritePositionBankswitch

SetSpritePosition2::
	ld hl, _SetSpritePosition2
SpritePositionBankswitch::
	ld b, BANK("Trainer Sight")
	jp Bankswitch ; indirect jump to one of the four functions

CheckForEngagingTrainers::
	xor a ; TRAINER_EVENT_FLAG_BIT
	call ReadTrainerHeaderInfo
	ld d, h
	ld e, l
.trainerLoop
	call StoreTrainerHeaderPointer
	ld a, [de]
	ld [wSpriteIndex], a
	ld [wTrainerHeaderFlagBit], a
	inc a ; $ff?
	ret z
	ld a, TRAINER_EVENT_FLAG_POINTER
	call ReadTrainerHeaderInfo
	ld b, FLAG_TEST
	ld a, [wTrainerHeaderFlagBit]
	ld c, a
	predef FlagActionPredef
	ld a, c
	and a ; has the trainer already been defeated?
	jr nz, .continue
	push hl
	push de
	push hl
	xor a ; TRAINER_EVENT_FLAG_BIT
	call ReadTrainerHeaderInfo
	inc hl
	ld a, [hl]
	pop hl
	ld [wTrainerEngageDistance], a
	ld a, [wSpriteIndex]
	swap a
	ld [wTrainerSpriteOffset], a
	predef TrainerEngage
	pop de
	pop hl
	ld a, [wTrainerSpriteOffset]
	and a
	ret nz ; break if the trainer is engaging
.continue
	ld hl, TRAINER_STRUCT_SIZE
	add hl, de
	ld d, h
	ld e, l
	jr .trainerLoop

; hl = text if the player wins
; de = text if the player loses
SaveEndBattleTextPointers:: ; marcelnote - optimized, could directly input bc = text if the player wins
	ld b, h
	ld c, l
	ld hl, wEndBattleTextRomBank
	ldh a, [hLoadedROMBank]
	ld [hli], a ; wEndBattleTextRomBank
	ld a, b
	ld [hli], a ; wEndBattleWinTextPointer
	ld a, c
	ld [hli], a ; wEndBattleWinTextPointer + 1
	ld a, d
	ld [hli], a ; wEndBattleLoseTextPointer
	ld [hl], e  ; wEndBattleLoseTextPointer + 1
	ret

; loads data of some trainer on the current map and plays pre-battle music
; [wSpriteIndex]: sprite ID of trainer who is engaged
EngageMapTrainer::
	ld hl, wMapSpriteExtraData
	ld d, 0
	ld a, [wSpriteIndex]
	dec a
	add a
	ld e, a
	add hl, de     ; seek to engaged trainer data
	ld a, [hli]    ; load trainer class
	ld [wEngagedTrainerClass], a
	ld a, [hl]     ; load trainer mon set
	ld [wEngagedTrainerSet], a
	jr PlayTrainerMusic

PrintEndBattleText::
	push hl
	ld hl, wStatusFlags3
	bit BIT_PRINT_END_BATTLE_TEXT, [hl]
	res BIT_PRINT_END_BATTLE_TEXT, [hl]
	pop hl
	ret z
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wEndBattleTextRomBank]
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	push hl
	callfar SaveTrainerName
	ld hl, TrainerEndBattleText
	call PrintText
	pop hl
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	callfar SetEnemyTrainerToStayAndFaceAnyDirection
	jp WaitForSoundToFinish

GetSavedEndBattleTextPointer::
	ld a, [wBattleResult]
	and a
	ld hl, wEndBattleWinTextPointer
	jr z, .gotPointer
	ld hl, wEndBattleLoseTextPointer
.gotPointer
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ret

TrainerEndBattleText::
	text_far _TrainerNameText
	text_asm
	call GetSavedEndBattleTextPointer
	call TextCommandProcessor
	rst TextScriptEnd

; only engage with the trainer if the player is not already
; engaged with another trainer
; XXX unused? ; marcelnote - removed
;CheckIfAlreadyEngaged::
;	ld a, [wMiscFlags]
;	bit BIT_SEEN_BY_TRAINER, a
;	ret nz
;	call EngageMapTrainer
;	xor a
;	ret

PlayTrainerMusic:: ; marcelnote - optimized
	ld a, [wEngagedTrainerClass]
	cp OPP_RIVAL1
	ret z
	cp OPP_RIVAL2
	ret z
	cp OPP_RIVAL3
	ret z
	cp OPP_YELLOW ; marcelnote - no EngagedTrainer music for Yellow
	ret z
	ld a, [wGymLeaderNo]
	and a
	ret nz
	xor a
	ld [wMusicFade], a
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
;	ld a, 0 ; BANK(Music_MeetEvilTrainer)
;	ld [wAudioROMBank], a
;	ld [wAudioSavedROMBank], a
	ld a, [wEngagedTrainerClass]
	ld hl, EvilTrainerList
	call IsInList
	ld b, MUSIC_MEET_EVIL_TRAINER
	jr c, .playSound
	ld a, e ; e = [wEngagedTrainerClass] from IsInList
	ld hl, FemaleTrainerList
	call IsInList
	inc b ; MUSIC_MEET_FEMALE_TRAINER
	jr c, .playSound
	inc b ; MUSIC_MEET_MALE_TRAINER
.playSound
	ld a, b
;	ld [wNewSoundID], a
	jp PlayMusic

INCLUDE "data/trainers/encounter_types.asm"
