MarkTownVisitedAndLoadToggleableObjects::
	ld a, [wCurMap]
	cp NUM_CITY_MAPS + 1 ; marcelnote - replaced FIRST_ROUTE_MAP
	jr nc, .notInTown
	ld c, a
	ld b, FLAG_SET
	ld hl, wTownVisitedFlag   ; mark town as visited (for flying)
	predef FlagActionPredef
.notInTown
	ld hl, ToggleableObjectMapPointers
	ld a, [wCurMap]
	ld b, $0
	ld c, a
	add hl, bc
	add hl, bc
	ld a, [hli] ; load toggleable objects pointer in hl
	ld h, [hl]
	ld l, a
	push hl
;;;;;; marcelnote - this is adapted from PureRGB to deal with extended HideShow list
	ld a, l
	cp LOW(ToggleableObjectStatesCont)
	ld a, h
	sbc HIGH(ToggleableObjectStatesCont) ; sets carry flag if hl address is < ToggleableObjectStatesCont
	ld de, ToggleableObjectStates
	ResetEventA EVENT_USE_TOGGLEABLE_OBJECTS_CONT_LIST
	jr c, .listLoaded
	ld de, ToggleableObjectStatesCont
	SetEventA EVENT_USE_TOGGLEABLE_OBJECTS_CONT_LIST
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
	ld de, wToggleableObjectList
	pop hl
.writeToggleableObjectsListLoop
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
	ld [de], a                 ; write (global) toggleable object index
	inc de
	jr .writeToggleableObjectsListLoop
.done
	ld a, -1
	ld [de], a                 ; write sentinel
	ret

InitializeToggleableObjectsFlags:
	ld hl, wToggleableObjectFlags
	ld bc, wToggleableObjectFlagsEnd - wToggleableObjectFlags
	xor a
	call FillMemory ; clear toggleable objects flags
	ld hl, ToggleableObjectStates
	xor a
	ld [wToggleableObjectCounter], a
.toggleableObjectsLoop
	ld a, [hli]
	cp -1           ; end of list
;	ret z
	jp z, InitializeToggleableObjectsFlagsCont ; marcelnote - continue with extended list instead
	push hl
	inc hl
	ld a, [hl]
	cp OFF
	jr nz, .skip
	ld hl, wToggleableObjectFlags
	ld a, [wToggleableObjectCounter]
	ld c, a
	ld b, FLAG_SET
	call FlagAction ; set flag if object is toggled off
.skip
	ld hl, wToggleableObjectCounter
	inc [hl]
	pop hl
	inc hl
	inc hl
	jr .toggleableObjectsLoop

InitializeToggleableObjectsFlagsCont: ; marcelnote - replicates code above for extended list
; TO DO: there is probably a way to merge the two functions into something shorter
; by making the loop into its own function which is called twice
	ld hl, wToggleableObjectFlagsCont
	ld bc, wToggleableObjectFlagsContEnd - wToggleableObjectFlagsCont
	xor a
	call FillMemory ; clear toggleable objects flags
	ld hl, ToggleableObjectStatesCont
	xor a
	ld [wToggleableObjectCounter], a
.toggleableObjectsLoop
	ld a, [hli]
	cp -1           ; end of list
	ret z
	push hl
	inc hl
	ld a, [hl]
	cp OFF
	jr nz, .skip
	ld hl, wToggleableObjectFlagsCont
	ld a, [wToggleableObjectCounter]
	ld c, a
	ld b, FLAG_SET
	call FlagAction ; set flag if object is toggled off
.skip
	ld hl, wToggleableObjectCounter
	inc [hl]
	pop hl
	inc hl
	inc hl
	jr .toggleableObjectsLoop

; tests if current object is toggled off/has been hidden
IsObjectHidden:
	ldh a, [hCurrentSpriteOffset]
	swap a
	ld b, a
	ld hl, wToggleableObjectList
.loop
	ld a, [hli]
	cp -1
	jr z, .notHidden ; not toggleable -> not hidden
	cp b
	ld a, [hli]
	jr nz, .loop
	ld c, a
	ld b, FLAG_TEST
;;;;;; marcelnote - adapted from PureRGB to deal with extended HideShow list
	CheckEvent EVENT_USE_TOGGLEABLE_OBJECTS_CONT_LIST
	ld hl, wToggleableObjectFlags
	jr z, .useNormalList
	ld hl, wToggleableObjectFlagsCont
.useNormalList
;;;;;;
	call FlagAction
	ld a, c
	and a
	jr nz, .hidden
.notHidden
	xor a
.hidden
	ldh [hIsToggleableObjectOff], a
	ret

; adds toggleable object (items, leg. pokemon, etc.) to the map
; [wToggleableObjectIndex]: index of the toggleable object to be added (global index)
; marcelnote - adapted from PureRGB for extended HideShow list
ShowObject:
	ld hl, wToggleableObjectFlags
	jr ShowObjectCommon

ShowObjectCont:
	ld hl, wToggleableObjectFlagsCont
	; fallthrough
ShowObjectCommon:
	ld a, [wToggleableObjectIndex]
	ld c, a
	ld b, FLAG_RESET
	call FlagAction   ; reset "removed" flag
	jp UpdateSprites

; removes toggleable object (items, leg. pokemon, etc.) from the map
; [wToggleableObjectIndex]: index of the toggleable object to be removed (global index)
; marcelnote - adapted from PureRGB for extended HideShow list
HideObject:
	ld hl, wToggleableObjectFlags
	jr HideObjectCommon

HideObjectCont:
	ld hl, wToggleableObjectFlagsCont
	; fallthrough
HideObjectCommon:
	ld a, [wToggleableObjectIndex]
	ld c, a
	ld b, FLAG_SET
	call FlagAction   ; set "removed" flag
	jp UpdateSprites
