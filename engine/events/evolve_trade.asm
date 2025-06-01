InGameTrade_CheckForTradeEvo:
; In Japanese Blue, TradeMons include a Graveler and a Haunter,
; both of which have Japanese names that start with "ゴ",
; which is what this routine originally checked in that game.
; For English Red and Blue, this routine was adjusted for
; Graveler's English name and Haunter's early English name "Spectre".
; The final release replaced Graveler and Haunter in TradeMons.
	ld a, [wInGameTradeReceiveMonName]
	cp "G" ; GRAVELER
	jr z, .nameMatched
	; "SPECTRE" (HAUNTER)
	cp "S"
	ret nz
	ld a, [wInGameTradeReceiveMonName + 1]
	cp "P"
	ret nz
.nameMatched
	ld a, [wPartyCount]
	dec a
	ld [wWhichPokemon], a
	ld a, TRUE
	ld [wForceEvolution], a
	ld a, LINK_STATE_TRADING
	ld [wLinkState], a
	callfar TryEvolvingMon
	xor a ; LINK_STATE_NONE
	ld [wLinkState], a
	jp PlayDefaultMusic

; marcelnote - new function for Trade evolutions via overworld interactions
EvolveMonInteraction::
	ld a, LINK_STATE_TRADING
	ld [wLinkState], a
	callfar TryEvolvingMon
	xor a ; LINK_STATE_NONE
	ld [wLinkState], a
; back to world map
	call PlayDefaultMusic
	call ClearScreen
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call ReloadTilesetTilePatterns
	call LoadScreenTilesFromBuffer2
	call UpdateSprites
	callfar RedrawMapView
	call Delay3
	call GBFadeInFromWhite ; or call LoadGBPal
	callfar LoadWildData
	ret

; marcelnote - adapted from IsMoveInParty
; Searches for a specific Mon in the party and stores nickname of corresponding Pokémon in wStringBuffer
; input:  d = which Mon ID to look for (GRAVELER, MACHOKE...)
; output: z flag = whether Mon was found (z = not found; nz = found)
;         [wWhichPokemon] = party index of Mon (0, ..., 5)
;         [wStringBuffer] = nickname of Mon
IsMonInParty::
	ld a, [wPartyCount]
	and a
	ret z   ; treat as not finding a move if the party count is 0
; party count is not 0
	push de
	push hl
	push bc
	ld hl, wPartyCount
	ld a, [hli]     ; moves hl to wPartySpecies
	ld e, a     ; 'e' = how many Pokemon left, starts from [wPartyCount]
.nextMon
	ld a, [hli]
	cp d    ; is it the specified Mon?
	jr z, .foundMon
	dec e
	jr z, .done
	jr .nextMon
.foundMon
	ld a, [wPartyCount]
	sub e
	ld [wWhichPokemon], a
	ld hl, wPartyMon1Nick
	ld bc, wPartyMon2Nick - wPartyMon1Nick
	call AddNTimes  ; brings hl to the address wPartyMon{1+a}Nick
	ld de, wStringBuffer
	call CopyData   ; copy bc bytes from hl to de
	inc b   ; sets nz since b=0 after CopyData
.done
	pop bc
	pop hl
	pop de
	ret
