; list menu IDs
	const_def
	const NOLISTMENU         ; $00 ; marcelnote - added new constant
;	const PCPOKEMONLISTMENU  ; $01 ; PC pokemon withdraw/deposit lists ; marcelnote - revamped Bill's PC
	const PRICEDITEMLISTMENU ; $01 ; Pokemart buy menu / Pokemart buy/sell choose quantity menu
	const ITEMLISTMENU       ; $02 ; Start menu Item menu / Pokemart sell menu
	const SPECIALLISTMENU    ; $03 ; list of special "items" e.g. floor list in elevators / list of badges

; NamePointers indexes (see home/names.asm)
	const_def
	const MOVE_NAME     ; 0
	const ITEM_NAME     ; 1
	const TRAINER_NAME  ; 2
;	const MONSTER_NAME  ; marcelnote - now handled directly by GetMonName
;	const PLAYEROT_NAME ; unused
;	const ENEMYOT_NAME  ; unused
