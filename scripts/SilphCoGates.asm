; marcelnote - simplify Silph Co gates scripts
MACRO? dbgatecoord
; x, y, block
	dbmapcoord \1, \2
	db \3 ; closed gate block
ENDM

; Card Key gate tile blocks
DEF FACILITY_CARD_KEY_GATE_BLOCK_1    EQU $54
DEF FACILITY_CARD_KEY_GATE_BLOCK_2    EQU $5f
DEF INTERIOR_CARD_KEY_GATE_BLOCK      EQU $20
DEF SILPH_FACTORY_CARD_KEY_GATE_BLOCK EQU $2d

SilphCoGateCallback:
; Place closed Card Key gate blocks for gates that are still locked.
; If called after using the Card Key, sets the event for wCardKeyDoorY/wCardKeyDoorX instead.
; hl = gate table entries: y, x, closed block, ending with -1
; de = event flag address for the first gate
; c = event flag bit for the first gate
; Gate events must be consecutive and in the same order as the table.
	ld a, c
	ld [wSilphCoGateEventFlagBit], a ; save first event flag bit
	ld a, e
	ld [wSilphCoGateEventFlagAddress], a ; save the first event flag address
	ld a, d
	ld [wSilphCoGateEventFlagAddress + 1], a
	ld a, [wCardKeyDoorY]
	ld b, a ; b = opened gate y
	ld a, [wCardKeyDoorX]
	ld c, a ; c = opened gate x
	or b ; nonzero if the Card Key just opened a gate
	jr nz, .openedGateLoop ; set that gate event instead of doing map-load work
; Map-load path: place closed blocks for every gate whose event is not set.
	ld a, [wCurrentMapScriptFlags]
	bit BIT_CUR_MAP_LOADED_1, a ; only update gates when the map has just loaded
	ret z
	res BIT_CUR_MAP_LOADED_1, a ; do the load-time gate pass only once
	ld [wCurrentMapScriptFlags], a
.gateLoop
	ld a, [hli]
	cp -1 ; end of gate table
	ret z
	ld b, a ; b = gate y
	ld a, [hli]
	ld c, a ; c = gate x
	ld a, [hli]
	ld [wNewTileBlockID], a ; closed gate block
	push hl ; save the next gate table entry
	push bc ; save gate coordinates
	ld b, FLAG_TEST
	call SilphCoGateEventAction
	ld a, c
	and a ; nonzero means this gate is unlocked
	pop bc
	jr nz, .nextGate ; unlocked gates stay open
	predef ReplaceTileBlock
.nextGate
	ld hl, wSilphCoGateEventFlagBit
	inc [hl] ; advance to the next consecutive event bit
	pop hl
	jr .gateLoop

; Card Key path: match the opened coordinates to the table and set that event.
.openedGateLoop
	ld a, [hli]
	cp -1 ; end of gate table
	jr z, .clearCardKeyDoor
	cp b ; compare gate y
	jr nz, .nextOpenedGate
	ld a, [hli]
	cp c ; compare gate x
	jr nz, .skipOpenedGateBlock
	ld b, FLAG_SET
	call SilphCoGateEventAction
	jr .clearCardKeyDoor
.nextOpenedGate
	inc hl ; skip gate x
.skipOpenedGateBlock
	inc hl ; skip closed gate block
	ld a, [wSilphCoGateEventFlagBit]
	inc a ; advance to the next consecutive event bit
	ld [wSilphCoGateEventFlagBit], a
	jr .openedGateLoop
.clearCardKeyDoor
	xor a
	ld [wCardKeyDoorY], a ; clear pending Card Key gate coordinates
	ld [wCardKeyDoorX], a
	ret

SilphCoGateEventAction:
	ld hl, wSilphCoGateEventFlagBit
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	predef_jump FlagActionPredef

SetCardKeyGateEvent::
; Run the current map's SilphCoGateCallbackScript.
; Card Key maps start by calling their gate callback; get address from there.
	ld hl, wCurMapScriptPtr
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl = current map script
	ld a, [hli]
	cp $cd ; call
	ret nz
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl = called gate callback
	jp hl
