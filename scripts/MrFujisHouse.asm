MrFujisHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

MrFujisHouse_TextPointers:
	def_text_pointers
	dw_const MrFujisHouseSuperNerdText,     TEXT_MRFUJISHOUSE_SUPER_NERD
	dw_const MrFujisHouseLittleGirlText,    TEXT_MRFUJISHOUSE_LITTLE_GIRL
	dw_const MrFujisHousePsyduckText,       TEXT_MRFUJISHOUSE_PSYDUCK
	dw_const MrFujisHouseNidorinoText,      TEXT_MRFUJISHOUSE_NIDORINO
	dw_const MrFujisHouseMrFujiText,        TEXT_MRFUJISHOUSE_MR_FUJI
	dw_const MrFujisHouseMrFujiPokedexText, TEXT_MRFUJISHOUSE_POKEDEX

MrFujisHouseSuperNerdText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_RESCUED_MR_FUJI
	ld hl, .MrFujiHadBeenPrayingText
	jr nz, .rescued_mr_fuji
	ld hl, .MrFujiIsntHereText
.rescued_mr_fuji
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.MrFujiIsntHereText:
	text_far _MrFujisHouseSuperNerdMrFujiIsntHereText
	text_end

.MrFujiHadBeenPrayingText:
	text_far _MrFujisHouseSuperNerdMrFujiHadBeenPrayingText
	text_end

MrFujisHouseLittleGirlText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_RESCUED_MR_FUJI
	ld hl, .PokemonAreNiceToHugText
	jr nz, .rescued_mr_fuji
	ld hl, .ThisIsMrFujisHouseText
.rescued_mr_fuji
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.ThisIsMrFujisHouseText:
	text_far _MrFujisHouseLittleGirlThisIsMrFujisHouseText
	text_end

.PokemonAreNiceToHugText:
	text_far _MrFujisHouseLittleGirlPokemonAreNiceToHugText
	text_end

MrFujisHousePsyduckText:
	text_far _MrFujisHousePsyduckText
	text_asm
	ld a, PSYDUCK
	call PlayCry
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

MrFujisHouseNidorinoText:
	text_far _MrFujisHouseNidorinoText
	text_asm
	ld a, NIDORINO
	call PlayCry
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

MrFujisHouseMrFujiText: ; marcelnote - optimized
	text_asm
	CheckEvent EVENT_GOT_POKE_FLUTE
	ld hl, .HasMyFluteHelpedYouText
	jr nz, .print_text
	ld hl, .IThinkThisMayHelpYourQuestText
	call PrintText
	lb bc, POKE_FLUTE, 1
	call GiveItem
	ld hl, .PokeFluteNoRoomText
	jr nc, .print_text
	ld hl, .ReceivedPokeFluteText
	SetEvent EVENT_GOT_POKE_FLUTE
	ld a, HS_POKEMON_TOWER_7F_CHANNELER ; marcelnote - added 7FChanneler
	ld [wMissableObjectIndex], a
	predef ShowObject
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.IThinkThisMayHelpYourQuestText:
	text_far _MrFujisHouseMrFujiIThinkThisMayHelpYourQuestText
	text_end

.ReceivedPokeFluteText:
	text_far _MrFujisHouseMrFujiReceivedPokeFluteText
	sound_get_key_item
	text_far _MrFujisHouseMrFujiPokeFluteExplanationText
	text_end

.PokeFluteNoRoomText:
	text_far _MrFujisHouseMrFujiPokeFluteNoRoomText
	text_end

.HasMyFluteHelpedYouText:
	text_far _MrFujisHouseMrFujiHasMyFluteHelpedYouText
	text_end

MrFujisHouseMrFujiPokedexText:
	text_far _MrFujisHouseMrFujiPokedexText
	text_end
