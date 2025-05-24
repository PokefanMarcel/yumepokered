MarkTownVisitedAndLoadMissableObjects::
	ld a, [wCurMap]
	cp NUM_CITY_MAPS + 1 ; marcelnote - replaced FIRST_ROUTE_MAP
	jr nc, .notInTown
	ld c, a
	ld b, FLAG_SET
	ld hl, wTownVisitedFlag   ; mark town as visited (for flying)
	predef FlagActionPredef
.notInTown
	ld hl, MapHSPointers
	ld a, [wCurMap]
	ld b, $0
	ld c, a
	add hl, bc
	add hl, bc
	ld a, [hli]                ; load missable objects pointer in hl
	ld h, [hl]
	; fall through

LoadMissableObjects:
	ld l, a
	push hl
;;;;;; marcelnote - this is adapted from PureRGB to deal with extended HideShow list
	ld a, l
	cp LOW(MissableObjectsCont)
	ld a, h
	sbc HIGH(MissableObjectsCont) ; sets carry flag if hl address is < MissableObjectsCont
	ld de, MissableObjects
	ResetEventA EVENT_USE_MISSABLE_OBJECTS_CONT_LIST
	jr c, .listLoaded
	ld de, MissableObjectsCont
	SetEventA EVENT_USE_MISSABLE_OBJECTS_CONT_LIST
.listLoaded
;;;;;;
	ld a, l
	sub e
	ldh [hDividend + 3], a
	ld a, h
	sbc d
	ldh [hDividend + 2], a
	xor a
	ldh [hDividend], a
	ldh [hDividend + 1], a
	ld a, $3
	ldh [hDivisor], a
	call Divide                ; divide difference by 3, resulting in the global offset (number of missable items before ours) ; TO CHECK !!!
	ld a, [wCurMap]
	ld b, a
	ldh a, [hQuotient + 3]
	ld c, a                    ; store global offset in c
	ld de, wMissableObjectList
	pop hl
.writeMissableObjectsListLoop
	ld a, [hli]
	cp -1
	jr z, .done     ; end of list
	cp b
	jr nz, .done    ; not for current map anymore
	ld a, [hli]
	inc hl
	ld [de], a                 ; write (map-local) sprite ID
	inc de
	ld a, c
	inc c
	ld [de], a                 ; write (global) missable object index
	inc de
	jr .writeMissableObjectsListLoop
.done
	ld a, -1
	ld [de], a                 ; write sentinel
	ret

InitializeMissableObjectsFlags:
	ld hl, wMissableObjectFlags
	ld bc, wMissableObjectFlagsEnd - wMissableObjectFlags
	xor a
	call FillMemory ; clear missable objects flags
	ld hl, MissableObjects
	xor a
	ld [wMissableObjectCounter], a
.missableObjectsLoop
	ld a, [hli]
	cp -1           ; end of list
	;ret z
	jp z, InitializeMissableObjectsFlagsCont ; marcelnote - continue with extended list instead
	push hl
	inc hl
	ld a, [hl]
	cp HIDE
	jr nz, .skip
	ld hl, wMissableObjectFlags
	ld a, [wMissableObjectCounter]
	ld c, a
	ld b, FLAG_SET
	call FlagAction ; set flag if Item is hidden
.skip
	ld hl, wMissableObjectCounter
	inc [hl]
	pop hl
	inc hl
	inc hl
	jr .missableObjectsLoop

InitializeMissableObjectsFlagsCont: ; marcelnote - replicates code above for extended list
; TO DO: there is probably a way to merge the two functions into something shorter
; by making the loop into its own function which is called twice
	ld hl, wMissableObjectFlagsCont
	ld bc, wMissableObjectFlagsContEnd - wMissableObjectFlagsCont
	xor a
	call FillMemory ; clear missable objects flags
	ld hl, MissableObjectsCont
	xor a
	ld [wMissableObjectCounter], a
.missableObjectsLoop
	ld a, [hli]
	cp -1           ; end of list
	ret z
	push hl
	inc hl
	ld a, [hl]
	cp HIDE
	jr nz, .skip
	ld hl, wMissableObjectFlagsCont
	ld a, [wMissableObjectCounter]
	ld c, a
	ld b, FLAG_SET
	call FlagAction ; set flag if Item is hidden
.skip
	ld hl, wMissableObjectCounter
	inc [hl]
	pop hl
	inc hl
	inc hl
	jr .missableObjectsLoop

; tests if current sprite is a missable object that is hidden/has been removed
IsObjectHidden:
	ldh a, [hCurrentSpriteOffset]
	swap a
	ld b, a
	ld hl, wMissableObjectList
.loop
	ld a, [hli]
	cp -1
	jr z, .notHidden ; not missable -> not hidden
	cp b
	ld a, [hli]
	jr nz, .loop
	ld c, a
	ld b, FLAG_TEST
;;;;;; marcelnote - adapted from PureRGB to deal with extended HideShow list
	CheckEvent EVENT_USE_MISSABLE_OBJECTS_CONT_LIST
	ld hl, wMissableObjectFlags
	jr z, .useNormalList
	ld hl, wMissableObjectFlagsCont
.useNormalList
;;;;;;
	call FlagAction
	ld a, c
	and a
	jr nz, .hidden
.notHidden
	xor a
.hidden
	ldh [hIsHiddenMissableObject], a
	ret

; adds missable object (items, leg. pokemon, etc.) to the map
; [wMissableObjectIndex]: index of the missable object to be added (global index)
; marcelnote - adapted from PureRGB for extended HideShow list
ShowObject:
;ShowObject2:
	ld hl, wMissableObjectFlags
	jr ShowObjectCommon

ShowObjectCont:
	ld hl, wMissableObjectFlagsCont
	; fallthrough
ShowObjectCommon:
	ld a, [wMissableObjectIndex]
	ld c, a
	ld b, FLAG_RESET
	call FlagAction   ; reset "removed" flag
	jp UpdateSprites

; removes missable object (items, leg. pokemon, etc.) from the map
; [wMissableObjectIndex]: index of the missable object to be removed (global index)
; marcelnote - adapted from PureRGB for extended HideShow list
HideObject:
	ld hl, wMissableObjectFlags
	jr HideObjectCommon

HideObjectCont:
	ld hl, wMissableObjectFlagsCont
	; fallthrough
HideObjectCommon:
	ld a, [wMissableObjectIndex]
	ld c, a
	ld b, FLAG_SET
	call FlagAction   ; set "removed" flag
	jp UpdateSprites
