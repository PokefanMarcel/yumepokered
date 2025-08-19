; list menu IDs
	const_def
	const NOLISTMENU         ; $00 ; marcelnote - added new constant
	const PCPOKEMONLISTMENU  ; $01 ; PC pokemon withdraw/deposit lists
	const MOVESLISTMENU      ; $02 ; XXX where is this used?
	const PRICEDITEMLISTMENU ; $03 ; Pokemart buy menu / Pokemart buy/sell choose quantity menu
	const ITEMLISTMENU       ; $04 ; Start menu Item menu / Pokemart sell menu
	const SPECIALLISTMENU    ; $05 ; list of special "items" e.g. floor list in elevators / list of badges

; NamePointers indexes (see home/names2.asm)
	const_def 1
	const MONSTER_NAME  ; 1
	const MOVE_NAME     ; 2
	const UNUSED_NAME   ; 3
	const ITEM_NAME     ; 4
	const PLAYEROT_NAME ; 5
	const ENEMYOT_NAME  ; 6
	const TRAINER_NAME  ; 7

	const_def 1
	const INIT_ENEMYOT_LIST    ; 1
	const INIT_BAG_ITEM_LIST   ; 2
	const INIT_OTHER_ITEM_LIST ; 3
	const INIT_PLAYEROT_LIST   ; 4
	const INIT_MON_LIST        ; 5
