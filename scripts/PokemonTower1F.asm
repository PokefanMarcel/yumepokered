; marcelnote - script was extensively reworked for postgame Agatha event
PokemonTower1F_Script:
	call EnableAutoTextBoxDrawing
	;ld hl, SilphFactory2FTrainerHeaders
	ld de, PokemonTower1F_ScriptPointers
	ld a, [wPokemonTower1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower1FCurScript], a
	ret

PokemonTower1F_ScriptPointers:
	def_script_pointers
	dw_const PokemonTower1FDefaultScript,       SCRIPT_POKEMONTOWER1F_DEFAULT
	dw_const PokemonTower1FAgathaArguesScript,  SCRIPT_POKEMONTOWER1F_AGATHA_ARGUES
	dw_const PokemonTower1FAgathaLeavesScript,  SCRIPT_POKEMONTOWER1F_AGATHA_LEAVES

PokemonTower1FDefaultScript:
	CheckHideShow HS_POKEMON_TOWER_1F_AGATHA
	ret nz
	ld hl, .Agatha1FCoords
	call ArePlayerCoordsInArray
	jp c, PokemonTower1FAgathaArguesScript

.Agatha1FCoords:
	dbmapcoord 10, 15
	dbmapcoord 11, 15
	db -1 ; end

PokemonTower1FAgathaArguesScript:
	ld a, TEXT_POKEMONTOWER1F_AGATHA
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ldh [hJoyHeld], a
	ldh [hJoyPressed], a
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld de, .AgathaLeavesMovement
	ld a, POKEMONTOWER1F_AGATHA
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_POKEMONTOWER1F_AGATHA_LEAVES
	ld [wPokemonTower1FCurScript], a
	ld [wCurMapScript], a
	ret

.AgathaLeavesMovement:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1 ; end

PokemonTower1FAgathaLeavesScript: ; marcelnote - postgame Agatha event
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, HS_POKEMON_TOWER_1F_AGATHA
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_POKEMON_TOWER_6F_AGATHA
	ld [wMissableObjectIndex], a
	predef ShowObject
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_POKEMONTOWER1F_DEFAULT
	ld [wPokemonTower1FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower1F_TextPointers:
	def_text_pointers
	dw_const PokemonTower1FReceptionistText,    TEXT_POKEMONTOWER1F_RECEPTIONIST
	dw_const PokemonTower1FMiddleAgedWomanText, TEXT_POKEMONTOWER1F_MIDDLE_AGED_WOMAN
	dw_const PokemonTower1FBaldingGuyText,      TEXT_POKEMONTOWER1F_BALDING_GUY
	dw_const PokemonTower1FGirlText,            TEXT_POKEMONTOWER1F_GIRL
	dw_const PokemonTower1FChannelerText,       TEXT_POKEMONTOWER1F_CHANNELER
	dw_const PokemonTower1FLittleBoyText,       TEXT_POKEMONTOWER1F_LITTLE_BOY    ; marcelnote - added 7FChanneler
	dw_const PokemonTower1FAgathaText,          TEXT_POKEMONTOWER1F_AGATHA        ; marcelnote - postgame Agatha
	dw_const PokemonTower1FGentlemanText,       TEXT_POKEMONTOWER1F_GENTLEMAN     ; marcelnote - postgame Agatha event

PokemonTower1FReceptionistText:
	text_far _PokemonTower1FReceptionistText
	text_end

PokemonTower1FMiddleAgedWomanText:
	text_far _PokemonTower1FMiddleAgedWomanText
	text_end

PokemonTower1FBaldingGuyText:
	text_far _PokemonTower1FBaldingGuyText
	text_end

PokemonTower1FGirlText:
	text_far _PokemonTower1FGirlText
	text_end

PokemonTower1FChannelerText:
	text_far _PokemonTower1FChannelerText
	text_end

PokemonTower1FLittleBoyText:   ; marcelnote - added 7FChanneler
	text_far _PokemonTower1FLittleBoyText
	text_end

PokemonTower1FAgathaText: ; marcelnote - postgame Agatha event
	text_far _PokemonTower1FAgathaText
	text_end

PokemonTower1FGentlemanText: ; marcelnote - postgame Agatha event
	text_asm
	CheckEvent EVENT_POSTGAME_AGATHA
	ld hl, .PostEventText
	jr nz, .textLoaded
	ld hl, .PreEventText
.textLoaded
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.PreEventText
	text_far _PokemonTower1FGentlemanPreEventText
	text_end

.PostEventText
	text_far _PokemonTower1FGentlemanPostEventText
	text_end

PokemonTower1FAgathaText2: ; marcelnote - postgame Agatha
	text_asm
	ld hl, .text
	call PrintText
	call GBFadeOutToBlack
	ld a, HS_POKEMON_TOWER_1F_AGATHA
	ld [wMissableObjectIndex], a
	predef HideObject
	call UpdateSprites
	call Delay3
	SetEvent EVENT_POSTGAME_AGATHA
	CheckBothEventsSet EVENT_POSTGAME_LORELEI, EVENT_POSTGAME_BRUNO ; sets Z flag when events are set
	jr nz, .end
	CheckBothEventsSet EVENT_POSTGAME_LANCE, EVENT_POSTGAME_RIVAL
	jr nz, .end
	ld a, HS_INDIGO_PLATEAU_LOBBY_GIRL1 ; marcelnote - remove girl from E4 entrance
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
	ld a, HS_INDIGO_PLATEAU_LOBBY_GIRL2 ; marcelnote - remove girl from E4 entrance
	ld [wMissableObjectIndex], a
	predef HideObjectCont
	ld a, HS_INDIGO_PLATEAU_LOBBY_RIVAL ; marcelnote - show Rival
	ld [wMissableObjectIndex], a
	predef ShowObjectCont
.end
	call GBFadeInFromBlack
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.text
	text_far _PokemonTower1FAgathaText
	text_end
