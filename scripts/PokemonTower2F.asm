PokemonTower2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower2F_ScriptPointers
	ld a, [wPokemonTower2FCurScript]
	jp CallFunctionInTable

PokemonTower2FSetDefaultScript: ; marcelnote - was PokemonTower2FResetRivalEncounter:
	xor a ; SCRIPT_POKEMONTOWER2F_DEFAULT
	ld [wJoyIgnore], a
	ld [wPokemonTower2FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower2F_ScriptPointers:
	def_script_pointers
	dw_const PokemonTower2FDefaultScript,       SCRIPT_POKEMONTOWER2F_DEFAULT
	dw_const PokemonTower2FDefeatedRivalScript, SCRIPT_POKEMONTOWER2F_DEFEATED_RIVAL
	dw_const PokemonTower2FRivalExitsScript,    SCRIPT_POKEMONTOWER2F_RIVAL_EXITS
	dw_const PokemonTower2FGhostBattleScript,   SCRIPT_POKEMONTOWER2F_GHOST_BATTLE  ; marcelnote - postgame Agatha event
	dw_const PokemonTower2FPlayerMovingScript,  SCRIPT_POKEMONTOWER2F_PLAYER_MOVING ; marcelnote - postgame Agatha event

PokemonTower2FDefaultScript:
IF DEF(_DEBUG)
	call DebugPressedOrHeldB
	ret nz
ENDC
	CheckEvent EVENT_BEAT_POKEMON_TOWER_RIVAL
	jp nz, PokemonTower2FCheckGhostEncounterScript ; marcelnote - postgame Agatha event, was ret nz
	ld hl, PokemonTower2FRivalEncounterEventCoords
	call ArePlayerCoordsInArray
	jp nc, PokemonTower2FCheckGhostEncounterScript ; marcelnote - postgame Agatha event, was ret nc
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ResetEvent EVENT_POKEMON_TOWER_RIVAL_ON_LEFT
	ld a, [wCoordIndex]
	cp $1
	ld a, PLAYER_DIR_UP
	ld b, SPRITE_FACING_DOWN
	jr nz, .player_below_rival
; the rival is on the left side and the player is on the right side
	SetEvent EVENT_POKEMON_TOWER_RIVAL_ON_LEFT
	ld a, PLAYER_DIR_LEFT
	ld b, SPRITE_FACING_RIGHT
.player_below_rival
	ld [wPlayerMovingDirection], a
	ld a, POKEMONTOWER2F_RIVAL
	ldh [hSpriteIndex], a
	ld a, b
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_POKEMONTOWER2F_RIVAL
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ldh [hJoyHeld], a
	ldh [hJoyPressed], a
	ret

PokemonTower2FRivalEncounterEventCoords:
	dbmapcoord 15,  5
	dbmapcoord 14,  6
	db -1 ; end? (should be $ff?) ; marcelnote - fixed from $0F

PokemonTower2FDefeatedRivalScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, PokemonTower2FSetDefaultScript ; marcelnote - was PokemonTower2FResetRivalEncounter
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_POKEMON_TOWER_RIVAL
	ld a, TEXT_POKEMONTOWER2F_RIVAL
	ldh [hTextID], a
	call DisplayTextID
	ld de, PokemonTower2FRivalDownThenRightMovement
	CheckEvent EVENT_POKEMON_TOWER_RIVAL_ON_LEFT
	jr nz, .got_movement
	ld de, PokemonTower2FRivalRightThenDownMovement
.got_movement
	ld a, POKEMONTOWER2F_RIVAL
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	farcall Music_RivalAlternateStart
	ld a, SCRIPT_POKEMONTOWER2F_RIVAL_EXITS
	ld [wPokemonTower2FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower2FRivalRightThenDownMovement:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

PokemonTower2FRivalDownThenRightMovement:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

PokemonTower2FRivalExitsScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, HS_POKEMON_TOWER_2F_RIVAL
	ld [wMissableObjectIndex], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	call PlayDefaultMusic
	ld a, SCRIPT_POKEMONTOWER2F_DEFAULT
	ld [wPokemonTower2FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower2FCheckGhostEncounterScript: ; marcelnote - postgame Agatha event
	CheckHideShow HS_POKEMON_TOWER_6F_AGATHA
	jp nz, PokemonTower2FSetDefaultScript
	CheckEvent EVENT_BEAT_GHOST_2F
	jp nz, PokemonTower2FSetDefaultScript
	ld hl, PokemonTower2FGhostBattleCoords
	call ArePlayerCoordsInArray
	ret nc
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_POKEMONTOWER2F_GHOST_BATTLE
	ldh [hTextID], a
	call DisplayTextID
	ld a, GHOST_RATICATE
	ld [wCurOpponent], a
	ld a, 62
	ld [wCurEnemyLevel], a
	ld a, SCRIPT_POKEMONTOWER2F_GHOST_BATTLE
	ld [wPokemonTower2FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower2FGhostBattleCoords: ; marcelnote - postgame Agatha event
	dbmapcoord  7,  5
	db -1 ; end

PokemonTower2FGhostBattleScript: ; marcelnote - postgame Agatha event
	ld a, [wIsInBattle]
	cp $ff
	jp z, PokemonTower2FSetDefaultScript
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, [wStatusFlags3]
	bit BIT_TALKED_TO_TRAINER, a
	ret nz
	call UpdateSprites
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, [wBattleResult]
	and a
	jr nz, .did_not_defeat
	SetEvent EVENT_BEAT_GHOST_2F
	ld a, TEXT_POKEMONTOWER2F_GHOST_VANISHED
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_POKEMONTOWER2F_DEFAULT
	ld [wPokemonTower2FCurScript], a
	ld [wCurMapScript], a
	ret
.did_not_defeat
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_RIGHT
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, SCRIPT_POKEMONTOWER2F_PLAYER_MOVING
	ld [wPokemonTower2FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower2FPlayerMovingScript: ; marcelnote - postgame Agatha event
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wPokemonTower2FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower2F_TextPointers:
	def_text_pointers
	dw_const PokemonTower2FRivalText,         TEXT_POKEMONTOWER2F_RIVAL
	dw_const PokemonTower2FChannelerText,     TEXT_POKEMONTOWER2F_CHANNELER
	dw_const PokemonTower2FGhostBattleText,   TEXT_POKEMONTOWER2F_GHOST_BATTLE   ; marcelnote - postgame Agatha event
	dw_const PokemonTower2FGhostVanishedText, TEXT_POKEMONTOWER2F_GHOST_VANISHED ; marcelnote - postgame Agatha event

PokemonTower2FRivalText:
	text_asm
	CheckEvent EVENT_BEAT_POKEMON_TOWER_RIVAL
	jr z, .do_battle
	ld hl, .HowsYourDexText
	call PrintText
	jr .text_script_end
.do_battle
	ld hl, .WhatBringsYouHereText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .DefeatedText
	ld de, .VictoryText
	call SaveEndBattleTextPointers
	ld a, OPP_RIVAL2
	ld [wCurOpponent], a

	; select which team to use during the encounter
	ld a, [wRivalStarter]
	ld b, $4 ; squirtle team ; marcelnote - optimized team choice code by using register b
	cp STARTER2 ; squirtle
	jr z, .got_team
	inc b ; b=5, bulbasaur team
	cp STARTER3 ; bulbasaur
	jr z, .got_team
	inc b ; b=6, charmander team
.got_team
	ld a, b
	ld [wTrainerNo], a

	ld a, SCRIPT_POKEMONTOWER2F_DEFEATED_RIVAL
	ld [wPokemonTower2FCurScript], a
	ld [wCurMapScript], a
.text_script_end
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.WhatBringsYouHereText:
	text_far _PokemonTower2FRivalWhatBringsYouHereText
	text_end

.DefeatedText:
	text_far _PokemonTower2FRivalDefeatedText
	text_end

.VictoryText:
	text_far _PokemonTower2FRivalVictoryText
	text_end

.HowsYourDexText:
	text_far _PokemonTower2FRivalHowsYourDexText
	text_end

PokemonTower2FChannelerText:
	text_far _PokemonTower2FChannelerText
	text_end

PokemonTower2FGhostBattleText: ; marcelnote - postgame Agatha event
	text_far _PokemonTower2FGhostBattleText
	text_end

PokemonTower2FGhostVanishedText: ; marcelnote - postgame Agatha event
	text_far _PokemonTower2FGhostVanishedText
	text_end
