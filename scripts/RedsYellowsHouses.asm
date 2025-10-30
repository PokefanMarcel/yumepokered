; marcelnote - merged RedsHouse floors
RedsYellowsHouses_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RedsYellowsHouses_ScriptPointers
	ld a, [wRedsHouseCurScript]
	jp CallFunctionInTable
; marcelnote - merged RedsHouse floors, RedsHouse1F_Script was just:
;	jp EnableAutoTextBoxDrawing

RedsYellowsHouses_ScriptPointers:
	def_script_pointers
	dw_const RedsYellowsHousesDefaultScript, SCRIPT_REDSYELLOWSHOUSES_DEFAULT
	dw_const DoRet,                          SCRIPT_REDSYELLOWSHOUSES_NOOP ; PureRGB - DoRet

RedsYellowsHousesDefaultScript:
	xor a
	ldh [hJoyHeld], a
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld a, SCRIPT_REDSYELLOWSHOUSES_NOOP
	ld [wRedsHouseCurScript], a
	ret

RedsYellowsHouses_TextPointers:
	def_text_pointers
	dw_const RedsHouse1FMomText,             TEXT_REDSHOUSE1F_MOM
	dw_const YellowsHouse1FDadUnpackingText, TEXT_YELLOWSHOUSE1F_DAD_UNPACKING ; marcelnote - Yellow's dad
	dw_const YellowsHouse1FDadSittingText,   TEXT_YELLOWSHOUSE1F_DAD_SITTING   ; marcelnote - Yellow's dad
	dw_const YellowsHouse2FAsleepText,       TEXT_YELLOWSHOUSE2F_ASLEEP        ; marcelnote - new for Yellow's bedroom
	dw_const YellowsHouse2FYellowText,       TEXT_YELLOWSHOUSE2F_YELLOW        ; marcelnote - Yellow
	dw_const RedsHouse1FTVText,              TEXT_REDSHOUSE1F_TV
	dw_const RedsHouse1FPhoneText,           TEXT_REDSHOUSE1F_PHONE         ; marcelnote - new for pay phones
	dw_const RedsHouse2FSNESText,            TEXT_REDSHOUSE2F_SNES          ; marcelnote - moved from hidden_objects
	dw_const YellowsHouse1FTVText,           TEXT_YELLOWSHOUSE1F_TV         ; marcelnote - new for Yellow's bedroom
	dw_const YellowsHouse2FGameboyText,      TEXT_YELLOWSHOUSE2F_GAMEBOY    ; marcelnote - new for Yellow's bedroom
	dw_const YellowsHouse2FTVText,           TEXT_YELLOWSHOUSE2F_TV         ; marcelnote - new for Yellow's bedroom
	dw_const UnpackedBoxText,                TEXT_YELLOWSHOUSE_UNPACKED_BOX ; marcelnote - new for Yellow's house

RedsHouse1FMomText:
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_GOT_STARTER, a ; received a Pokémon from Oak?
	jr nz, .heal
	ld hl, .WakeUpText
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd
.heal
	call RedsHouse1FMomHealScript
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.WakeUpText:
	text_far _RedsHouse1FMomWakeUpText
	text_end

RedsHouse1FMomHealScript: ; marcelnote - modified for crysaudio
	ld hl, RedsHouse1FMomYouShouldRestText
	call PrintText
	call GBFadeOutToWhite
	call ReloadMapData
	predef HealParty
	ld a, MUSIC_PKMN_HEALED
	call PlayMusic
	call WaitForSongToFinish
	ld a, [wMapMusicSoundID]
	call PlayMusic
	call GBFadeInFromWhite
	ld hl, RedsHouse1FMomLookingGreatText
	jp PrintText

RedsHouse1FMomYouShouldRestText:
	text_far _RedsHouse1FMomYouShouldRestText
	text_end
RedsHouse1FMomLookingGreatText:
	text_far _RedsHouse1FMomLookingGreatText
	text_end

RedsHouse1FTVText:
	text_asm
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ld hl, .WrongSideText
	jr nz, .got_text
	ld hl, .StandByMeMovieText
.got_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.StandByMeMovieText:
	text_far _RedsHouse1FTVStandByMeMovieText
	text_end

.WrongSideText:
	text_far _RedsHouse1FTVWrongSideText
	text_end

RedsHouse1FPhoneText: ; marcelnote - new
	text_far _RedsHouse1FPhoneText
	text_end

RedsHouse2FSNESText: ; marcelnote - moved from hidden_objects
	text_far _RedsHouse2FSNESText
	text_end

YellowsHouse2FGameboyText: ; marcelnote - new for Yellow's House
	text_far _YellowsHouse2FGameboyText
	text_end

YellowsHouse1FDadUnpackingText: ; marcelnote - new for Yellow's House
	text_far _YellowsHouse1FDadUnpackingText
	text_end

YellowsHouse1FDadSittingText: ; marcelnote - new for Yellow's House
	text_asm
	CheckEvent EVENT_BEAT_YELLOW
	ld hl, .YellowIsBackText
	jr nz, .print_text
	CheckEvent EVENT_BEAT_BROCK
	ld hl, .RunIntoHerText
	jr nz, .print_text
	ld hl, .JustMissedHerText
.print_text
	call PrintText
	rst TextScriptEnd ; PureRGB - rst TextScriptEnd

.JustMissedHerText:
	text_far _YellowsHouse1FDadJustMissedHerText
	text_end

.RunIntoHerText:
	text_far _YellowsHouse1FDadJustRunIntoHerText
	text_end

.YellowIsBackText:
	text_far _YellowsHouse1FDadYellowIsBackText
	text_end

YellowsHouse1FTVText: ; marcelnote - new for Yellow's House
	text_far _YellowsHouse1FTVText
	text_end

YellowsHouse2FTVText: ; marcelnote - new for Yellow's House
	text_far _YellowsHouse2FTVText
	text_end

YellowsHouse2FAsleepText: ; marcelnote - new for Yellow's House
	text_far _YellowsHouse2FAsleepText
	text_end

YellowsHouse2FYellowText: ; marcelnote - new for Yellow's House
	text_far _YellowsHouse2FYellowText
	text_end

UnpackedBoxText:: ; marcelnote - new
	text_far _UnpackedBoxText
	text_end
