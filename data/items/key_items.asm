KeyItemFlags:
	bit_array KeyItemFlags
	dbit FALSE ; MASTER_BALL
	dbit FALSE ; ULTRA_BALL
	dbit FALSE ; GREAT_BALL
	dbit FALSE ; POKE_BALL
	dbit TRUE  ; TOWN_MAP
	dbit TRUE  ; BICYCLE
	dbit TRUE  ; SURFBOARD
	dbit TRUE  ; SAFARI_BALL
	dbit TRUE  ; POKEDEX
	dbit FALSE ; MOON_STONE
	dbit FALSE ; ANTIDOTE
	dbit FALSE ; BURN_HEAL
	dbit FALSE ; ICE_HEAL
	dbit FALSE ; AWAKENING
	dbit FALSE ; PARLYZ_HEAL
	dbit FALSE ; FULL_RESTORE
	dbit FALSE ; MAX_POTION
	dbit FALSE ; HYPER_POTION
	dbit FALSE ; SUPER_POTION
	dbit FALSE ; POTION
	dbit TRUE  ; SAFARI_BAIT ; marcelnote - cleaned badges
	dbit TRUE  ; SAFARI_ROCK ; marcelnote - cleaned badges
	dbit TRUE  ; ITEM_17     ; marcelnote - cleaned badges
	dbit TRUE  ; ITEM_18     ; marcelnote - cleaned badges
	dbit TRUE  ; ITEM_19     ; marcelnote - cleaned badges
	dbit TRUE  ; ITEM_1A     ; marcelnote - cleaned badges
	dbit TRUE  ; ITEM_1B     ; marcelnote - cleaned badges
	dbit TRUE  ; ITEM_1C     ; marcelnote - cleaned badges
	dbit FALSE ; ESCAPE_ROPE
	dbit FALSE ; REPEL
	dbit TRUE  ; OLD_AMBER
	dbit FALSE ; FIRE_STONE
	dbit FALSE ; THUNDER_STONE
	dbit FALSE ; WATER_STONE
	dbit FALSE ; HP_UP
	dbit FALSE ; PROTEIN
	dbit FALSE ; IRON
	dbit FALSE ; CARBOS
	dbit FALSE ; CALCIUM
	dbit FALSE ; RARE_CANDY
	dbit TRUE  ; DOME_FOSSIL
	dbit TRUE  ; HELIX_FOSSIL
	dbit TRUE  ; SECRET_KEY
	dbit TRUE  ; ORANGE_PASS ; marcelnote - new, was ITEM_2C
	dbit TRUE  ; BIKE_VOUCHER
	dbit FALSE ; X_ACCURACY
	dbit FALSE ; LEAF_STONE
	dbit TRUE  ; CARD_KEY
	dbit FALSE ; NUGGET
	dbit FALSE ; ITEM_32
	dbit FALSE ; POKE_DOLL
	dbit FALSE ; FULL_HEAL
	dbit FALSE ; REVIVE
	dbit FALSE ; MAX_REVIVE
	dbit FALSE ; GUARD_SPEC
	dbit FALSE ; SUPER_REPEL
	dbit FALSE ; MAX_REPEL
	dbit FALSE ; DIRE_HIT
	dbit FALSE ; COIN
	dbit FALSE ; FRESH_WATER
	dbit FALSE ; SODA_POP
	dbit FALSE ; LEMONADE
	dbit TRUE  ; S_S_TICKET
	dbit TRUE  ; GOLD_TEETH
	dbit FALSE ; X_ATTACK
	dbit FALSE ; X_DEFEND
	dbit FALSE ; X_SPEED
	dbit FALSE ; X_SPECIAL
	dbit TRUE  ; COIN_CASE
	dbit TRUE  ; OAKS_PARCEL
	dbit TRUE  ; ITEMFINDER
	dbit TRUE  ; SILPH_SCOPE
	dbit TRUE  ; POKE_FLUTE
	dbit TRUE  ; LIFT_KEY
	dbit FALSE ; EXP_ALL
	dbit TRUE  ; OLD_ROD
	dbit TRUE  ; GOOD_ROD
	dbit TRUE  ; SUPER_ROD
	dbit FALSE ; PP_UP
	dbit FALSE ; ETHER
	dbit FALSE ; MAX_ETHER
	dbit FALSE ; ELIXIR
	dbit FALSE ; MAX_ELIXIR
; marcelnote - should add Badges as TRUE to reflect changed constants?
	end_bit_array NUM_ITEMS
