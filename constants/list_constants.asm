; list menu IDs
	const_def
	const NOLISTMENU         ; $00 ; marcelnote - added new constant
;	const PCPOKEMONLISTMENU  ; $01 ; PC pokemon withdraw/deposit lists ; marcelnote - revamped Bill's PC
	const PRICEDITEMLISTMENU ; $01 ; Pokemart buy menu / Pokemart buy/sell choose quantity menu
	const ITEMLISTMENU       ; $02 ; Start menu Item menu / Pokemart sell menu
	const SPECIALLISTMENU    ; $03 ; list of special "items" e.g. floor list in elevators / list of badges

; NamePointers indexes (see home/names2.asm)
	const_def 1
	const MONSTER_NAME  ; 1
	const MOVE_NAME     ; 2
	const ITEM_NAME     ; 3
	const PLAYEROT_NAME ; 4
	const ENEMYOT_NAME  ; 5
	const TRAINER_NAME  ; 6
