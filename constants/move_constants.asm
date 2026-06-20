; move ids
; indexes for:
; - Moves (see data/moves/moves.asm)
; - MoveNames (see data/moves/names.asm)
; - AttackAnimationPointers (see data/moves/animations.asm)
; - MoveSoundTable (see data/moves/sfx.asm)
	const_def
	const NO_MOVE      ; $00
	const POUND        ; $01
	const KARATE_CHOP  ; $02
	const DOUBLESLAP   ; $03
	const COMET_PUNCH  ; $04
	const MEGA_PUNCH   ; $05
	const PAY_DAY      ; $06
	const FIRE_PUNCH   ; $07
	const ICE_PUNCH    ; $08
	const THUNDERPUNCH ; $09
	const SCRATCH      ; $0A
	const VICEGRIP     ; $0B
	const GUILLOTINE   ; $0C
	const RAZOR_WIND   ; $0D
	const SWORDS_DANCE ; $0E
	const CUT          ; $0F
	const GUST         ; $10
	const WING_ATTACK  ; $11
	const WHIRLWIND    ; $12
	const FLY          ; $13
	const BIND         ; $14
	const SLAM         ; $15
	const VINE_WHIP    ; $16
	const STOMP        ; $17
	const DOUBLE_KICK  ; $18
	const MEGA_KICK    ; $19
	const JUMP_KICK    ; $1A
	const ROLLING_KICK ; $1B
	const SAND_ATTACK  ; $1C
	const HEADBUTT     ; $1D
	const HORN_ATTACK  ; $1E
	const FURY_ATTACK  ; $1F
	const HORN_DRILL   ; $20
	const TACKLE       ; $21
	const BODY_SLAM    ; $22
	const WRAP         ; $23
	const TAKE_DOWN    ; $24
	const THRASH       ; $25
	const DOUBLE_EDGE  ; $26
	const TAIL_WHIP    ; $27
	const POISON_STING ; $28
	const TWINEEDLE    ; $29
	const PIN_MISSILE  ; $2A
	const LEER         ; $2B
	const BITE         ; $2C
	const GROWL        ; $2D
	const ROAR         ; $2E
	const SING         ; $2F
	const SUPERSONIC   ; $30
	const SONICBOOM    ; $31
	const DISABLE      ; $32
	const ACID         ; $33
	const EMBER        ; $34
	const FLAMETHROWER ; $35
	const MIST         ; $36
	const WATER_GUN    ; $37
	const HYDRO_PUMP   ; $38
	const SURF         ; $39
	const ICE_BEAM     ; $3A
	const BLIZZARD     ; $3B
	const PSYBEAM      ; $3C
	const BUBBLEBEAM   ; $3D
	const AURORA_BEAM  ; $3E
	const HYPER_BEAM   ; $3F
	const PECK         ; $40
	const DRILL_PECK   ; $41
	const SUBMISSION   ; $42
	const LOW_KICK     ; $43
	const COUNTER      ; $44
	const SEISMIC_TOSS ; $45
	const STRENGTH     ; $46
	const ABSORB       ; $47
	const MEGA_DRAIN   ; $48
	const LEECH_SEED   ; $49
	const GROWTH       ; $4A
	const RAZOR_LEAF   ; $4B
	const SOLARBEAM    ; $4C
	const POISONPOWDER ; $4D
	const STUN_SPORE   ; $4E
	const SLEEP_POWDER ; $4F
	const PETAL_DANCE  ; $50
	const STRING_SHOT  ; $51
	const DRAGON_RAGE  ; $52
	const FIRE_SPIN    ; $53
	const THUNDERSHOCK ; $54
	const THUNDERBOLT  ; $55
	const THUNDER_WAVE ; $56
	const THUNDER      ; $57
	const ROCK_THROW   ; $58
	const EARTHQUAKE   ; $59
	const FISSURE      ; $5A
	const DIG          ; $5B
	const TOXIC        ; $5C
	const CONFUSION    ; $5D
	const PSYCHIC_M    ; $5E
	const HYPNOSIS     ; $5F
	const MEDITATE     ; $60
	const AGILITY      ; $61
	const QUICK_ATTACK ; $62
	const RAGE         ; $63
	const TELEPORT     ; $64
	const NIGHT_SHADE  ; $65
	const MIMIC        ; $66
	const SCREECH      ; $67
	const DOUBLE_TEAM  ; $68
	const RECOVER      ; $69
	const HARDEN       ; $6A
	const MINIMIZE     ; $6B
	const SMOKESCREEN  ; $6C
	const CONFUSE_RAY  ; $6D
	const WITHDRAW     ; $6E
	const DEFENSE_CURL ; $6F
	const BARRIER      ; $70
	const LIGHT_SCREEN ; $71
	const HAZE         ; $72
	const REFLECT      ; $73
	const FOCUS_ENERGY ; $74
	const BIDE         ; $75
	const METRONOME    ; $76
	const MIRROR_MOVE  ; $77
	const SELFDESTRUCT ; $78
	const EGG_BOMB     ; $79
	const LICK         ; $7A
	const SMOG         ; $7B
	const SLUDGE       ; $7C
	const BONE_CLUB    ; $7D
	const FIRE_BLAST   ; $7E
	const WATERFALL    ; $7F
	const CLAMP        ; $80
	const SWIFT        ; $81
	const SKULL_BASH   ; $82
	const SPIKE_CANNON ; $83
	const CONSTRICT    ; $84
	const AMNESIA      ; $85
	const KINESIS      ; $86
	const SOFTBOILED   ; $87
	const HI_JUMP_KICK ; $88
	const GLARE        ; $89
	const DREAM_EATER  ; $8A
	const POISON_GAS   ; $8B
	const BARRAGE      ; $8C
	const LEECH_LIFE   ; $8D
	const LOVELY_KISS  ; $8E
	const SKY_ATTACK   ; $8F
	const TRANSFORM    ; $90
	const BUBBLE       ; $91
	const DIZZY_PUNCH  ; $92
	const SPORE        ; $93
	const FLASH        ; $94
	const PSYWAVE      ; $95
	const SPLASH       ; $96
	const ACID_ARMOR   ; $97
	const CRABHAMMER   ; $98
	const EXPLOSION    ; $99
	const FURY_SWIPES  ; $9A
	const BONEMERANG   ; $9B
	const REST         ; $9C
	const ROCK_SLIDE   ; $9D
	const HYPER_FANG   ; $9E
	const SHARPEN      ; $9F
	const CONVERSION   ; $A0
	const TRI_ATTACK   ; $A1
	const SUPER_FANG   ; $A2
	const SLASH        ; $A3
	const SUBSTITUTE   ; $A4
	const ELECTRO_BALL ; $A5 ; marcelnote - new move
	const WILL_O_WISP  ; $A6 ; marcelnote - new move
	const HEX          ; $A7 ; marcelnote - new move
	const STRUGGLE     ; $A8
DEF NUM_ATTACKS EQU const_value - 1

DEF CANNOT_MOVE EQU $ff

	; Moves do double duty as animation identifiers.

	const SHOWPIC_ANIM
	const STATUS_AFFECTED_ANIM
	const ANIM_A8
	const ENEMY_HUD_SHAKE_ANIM
	const TRADE_BALL_DROP_ANIM
	const TRADE_BALL_SHAKE_ANIM
	const TRADE_BALL_TILT_ANIM
	const TRADE_BALL_POOF_ANIM
	const XSTATITEM_ANIM ; use X Attack/Defense/Speed/Special
	const XSTATITEM_DUPLICATE_ANIM
	const SHRINKING_SQUARE_ANIM
	const ANIM_B1
	const ANIM_B2
	const ANIM_B3
	const ANIM_B4
	const ANIM_B5
	const ANIM_B6
	const ANIM_B7
	const BURN_ANIM ; marcelnote - new, replaces ANIM_B8
	const ANIM_B9
	const PSN_ANIM ; Plays when a monster is burned or poisoned ; marcelnote - renamed from BURN_PSN_ANIM
	const ANIM_BB
	const SLP_PLAYER_ANIM
	const SLP_ANIM ; sleeping monster
	const CONF_PLAYER_ANIM
	const CONF_ANIM ; confused monster
	const SLIDE_DOWN_ANIM
	const TOSS_ANIM ; toss Poké Ball
	const SHAKE_ANIM ; shaking Poké Ball when catching monster
	const POOF_ANIM ; puff of smoke
	const BLOCKBALL_ANIM ; trainer knocks away Poké Ball
	const GREATTOSS_ANIM ; toss Great Ball
	const ULTRATOSS_ANIM ; toss Ultra Ball or Master Ball
	const SHAKE_SCREEN_ANIM
	const HIDEPIC_ANIM ; monster disappears
	const ROCK_ANIM ; throw rock
	const BAIT_ANIM ; throw bait

DEF NUM_ATTACK_ANIMS EQU const_value - 1
