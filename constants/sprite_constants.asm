; overworld sprites
; SpriteSheetPointerTable indexes (see data/sprites/sprites.asm)
	const_def
	const SPRITE_NONE                    ; $00
	const SPRITE_RED                     ; $01
	const SPRITE_BLUE                    ; $02
	const SPRITE_OAK                     ; $03
	const SPRITE_YOUNGSTER               ; $04
	const SPRITE_MONSTER                 ; $05
	const SPRITE_COOLTRAINER_F           ; $06
	const SPRITE_COOLTRAINER_M           ; $07
	const SPRITE_LITTLE_GIRL             ; $08
	const SPRITE_BIRD                    ; $09
	const SPRITE_MIDDLE_AGED_MAN         ; $0a
	const SPRITE_GAMBLER                 ; $0b
	const SPRITE_SUPER_NERD              ; $0c
	const SPRITE_GIRL                    ; $0d
	const SPRITE_HIKER                   ; $0e
	const SPRITE_BEAUTY                  ; $0f
	const SPRITE_GENTLEMAN               ; $10
	const SPRITE_DAISY                   ; $11
	const SPRITE_BIKER                   ; $12
	const SPRITE_SAILOR                  ; $13
	const SPRITE_COOK                    ; $14
	const SPRITE_BIKE_SHOP_CLERK         ; $15
	const SPRITE_MR_FUJI                 ; $16
	const SPRITE_GIOVANNI                ; $17
	const SPRITE_ROCKET                  ; $18
	const SPRITE_CHANNELER               ; $19
	const SPRITE_WAITER                  ; $1a
	const SPRITE_SILPH_WORKER_F          ; $1b
	const SPRITE_MIDDLE_AGED_WOMAN       ; $1c
	const SPRITE_BRUNETTE_GIRL           ; $1d
	const SPRITE_LANCE                   ; $1e
	const SPRITE_UNUSED_SCIENTIST        ; $1f
	const SPRITE_SCIENTIST               ; $20
	const SPRITE_ROCKER                  ; $21
	const SPRITE_SWIMMER                 ; $22
	const SPRITE_SAFARI_ZONE_WORKER      ; $23
	const SPRITE_GYM_GUIDE               ; $24
	const SPRITE_GRAMPS                  ; $25
	const SPRITE_CLERK                   ; $26
	const SPRITE_FISHING_GURU            ; $27
	const SPRITE_GRANNY                  ; $28
	const SPRITE_NURSE                   ; $29
	const SPRITE_LINK_RECEPTIONIST       ; $2a
	const SPRITE_SILPH_PRESIDENT         ; $2b
	const SPRITE_SILPH_WORKER_M          ; $2c
	const SPRITE_WARDEN                  ; $2d
	const SPRITE_CAPTAIN                 ; $2e
	const SPRITE_FISHER                  ; $2f
	const SPRITE_BLACKBELT               ; $30
	const SPRITE_GUARD                   ; $31
	const SPRITE_UNUSED_GUARD            ; $32
	const SPRITE_MOM                     ; $33
	const SPRITE_BALDING_GUY             ; $34
	const SPRITE_LITTLE_BOY              ; $35
	const SPRITE_UNUSED_GAMEBOY_KID      ; $36
	const SPRITE_GAMEBOY_KID             ; $37
	const SPRITE_FAIRY                   ; $38
	const SPRITE_AGATHA                  ; $39
	const SPRITE_BRUNO                   ; $3a
	const SPRITE_LORELEI                 ; $3b
	const SPRITE_BROCK                   ; $3c ; marcelnote - new sprite
	const SPRITE_MISTY                   ; $3d ; marcelnote - new sprite
	const SPRITE_LT_SURGE                ; $3e ; marcelnote - new sprite
	const SPRITE_ERIKA                   ; $3f ; marcelnote - new sprite
	const SPRITE_KOGA                    ; $40 ; marcelnote - new sprite
	const SPRITE_SABRINA                 ; $41 ; marcelnote - new sprite
	const SPRITE_BLAINE                  ; $42 ; marcelnote - new sprite
	const SPRITE_SWIMMER_F               ; $43 ; marcelnote - new sprite
	const SPRITE_YELLOW                  ; $42 ; marcelnote - new sprite
	const SPRITE_SEEL                    ; $44
DEF FIRST_STILL_SPRITE EQU const_value
	const SPRITE_POKE_BALL               ; $45
	const SPRITE_FOSSIL                  ; $46
	const SPRITE_BOULDER                 ; $47
	const SPRITE_PAPER                   ; $48
	const SPRITE_POKEDEX                 ; $49
	const SPRITE_CLIPBOARD               ; $4a
	const SPRITE_SNORLAX                 ; $4b
	const SPRITE_UNUSED_OLD_AMBER        ; $4c
	const SPRITE_OLD_AMBER               ; $4d
	const SPRITE_UNUSED_GAMBLER_ASLEEP_1 ; $4e
	const SPRITE_UNUSED_GAMBLER_ASLEEP_2 ; $4f
	const SPRITE_GAMBLER_ASLEEP          ; $50
DEF NUM_SPRITES EQU const_value - 1
