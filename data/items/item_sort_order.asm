; marcelnote - added bag autosort
; The item_sort_rank macro turns the list below into rank constants for ItemSortRanks.
DEF CURRENT_ITEM_SORT_RANK = 1

MACRO item_sort_rank
	ASSERT !DEF(ItemSortRank{d:\1}), "Duplicate item in autosort order"
	DEF ItemSortRank{d:\1} = CURRENT_ITEM_SORT_RANK
	DEF CURRENT_ITEM_SORT_RANK += 1
ENDM

	; Key items
	item_sort_rank TOWN_MAP
	item_sort_rank BICYCLE
	item_sort_rank SURFBOARD
	item_sort_rank ITEMFINDER
	item_sort_rank POKE_FLUTE
	item_sort_rank EXP_ALL
	item_sort_rank POKE_BEEPER

	item_sort_rank OLD_ROD
	item_sort_rank GOOD_ROD
	item_sort_rank SUPER_ROD

	item_sort_rank COIN_CASE
	item_sort_rank COIN

	item_sort_rank POKEDEX
	item_sort_rank S_S_TICKET
	item_sort_rank CITRUS_PASS
	item_sort_rank SILPH_SCOPE

	item_sort_rank OAKS_PARCEL
	item_sort_rank GOLD_TEETH
	item_sort_rank FUJIS_NOTES

	item_sort_rank LIFT_KEY
	item_sort_rank CARD_KEY
	item_sort_rank SECRET_KEY

	item_sort_rank BIKE_VOUCHER
	item_sort_rank SURF_VOUCHER

	item_sort_rank DOME_FOSSIL
	item_sort_rank HELIX_FOSSIL
	item_sort_rank OLD_AMBER

	; Normal items
	item_sort_rank MAX_REPEL
	item_sort_rank SUPER_REPEL
	item_sort_rank REPEL
	item_sort_rank ESCAPE_ROPE
	item_sort_rank POKE_DOLL

	item_sort_rank MASTER_BALL
	item_sort_rank ULTRA_BALL
	item_sort_rank GREAT_BALL
	item_sort_rank POKE_BALL
	item_sort_rank SAFARI_BALL

	item_sort_rank MAX_REVIVE
	item_sort_rank REVIVE

	item_sort_rank FULL_RESTORE
	item_sort_rank MAX_POTION
	item_sort_rank HYPER_POTION
	item_sort_rank SUPER_POTION
	item_sort_rank POTION

	item_sort_rank LEMONADE
	item_sort_rank SODA_POP
	item_sort_rank FRESH_WATER

	item_sort_rank FULL_HEAL
	item_sort_rank ANTIDOTE
	item_sort_rank BURN_HEAL
	item_sort_rank ICE_HEAL
	item_sort_rank AWAKENING
	item_sort_rank PARLYZ_HEAL

	item_sort_rank MAX_ETHER
	item_sort_rank ETHER
	item_sort_rank MAX_ELIXIR
	item_sort_rank ELIXIR

	item_sort_rank RARE_CANDY
	item_sort_rank HP_UP
	item_sort_rank PROTEIN
	item_sort_rank IRON
	item_sort_rank CARBOS
	item_sort_rank CALCIUM
	item_sort_rank PP_UP

	item_sort_rank X_ATTACK
	item_sort_rank X_DEFEND
	item_sort_rank X_SPEED
	item_sort_rank X_SPECIAL
	item_sort_rank X_ACCURACY
	item_sort_rank DIRE_HIT
	item_sort_rank GUARD_SPEC

	item_sort_rank MOON_STONE
	item_sort_rank LEAF_STONE
	item_sort_rank FIRE_STONE
	item_sort_rank WATER_STONE
	item_sort_rank THUNDER_STONE

	item_sort_rank NUGGET

	item_sort_rank ITEM_18
	item_sort_rank ITEM_19
	item_sort_rank ITEM_1A
	item_sort_rank ITEM_1B
	item_sort_rank SAFARI_BAIT
	item_sort_rank SAFARI_ROCK
	ASSERT CURRENT_ITEM_SORT_RANK == NUM_ITEMS + 1, "Autosort order must include each normal item exactly once"

	item_sort_rank HM_CUT
	item_sort_rank HM_FLY
	item_sort_rank HM_SURF
	item_sort_rank HM_STRENGTH
	item_sort_rank HM_FLASH

	item_sort_rank TM_MEGA_PUNCH
	item_sort_rank TM_RAZOR_WIND
	item_sort_rank TM_SWORDS_DANCE
	item_sort_rank TM_WHIRLWIND
	item_sort_rank TM_MEGA_KICK
	item_sort_rank TM_TOXIC
	item_sort_rank TM_HORN_DRILL
	item_sort_rank TM_BODY_SLAM
	item_sort_rank TM_TAKE_DOWN
	item_sort_rank TM_DOUBLE_EDGE
	item_sort_rank TM_BUBBLEBEAM
	item_sort_rank TM_WATER_GUN
	item_sort_rank TM_ICE_BEAM
	item_sort_rank TM_BLIZZARD
	item_sort_rank TM_HYPER_BEAM
	item_sort_rank TM_PAY_DAY
	item_sort_rank TM_SUBMISSION
	item_sort_rank TM_COUNTER
	item_sort_rank TM_SEISMIC_TOSS
	item_sort_rank TM_RAGE
	item_sort_rank TM_MEGA_DRAIN
	item_sort_rank TM_SOLARBEAM
	item_sort_rank TM_DRAGON_RAGE
	item_sort_rank TM_THUNDERBOLT
	item_sort_rank TM_THUNDER
	item_sort_rank TM_EARTHQUAKE
	item_sort_rank TM_FISSURE
	item_sort_rank TM_DIG
	item_sort_rank TM_PSYCHIC_M
	item_sort_rank TM_TELEPORT
	item_sort_rank TM_MIMIC
	item_sort_rank TM_DOUBLE_TEAM
	item_sort_rank TM_REFLECT
	item_sort_rank TM_BIDE
	item_sort_rank TM_METRONOME
	item_sort_rank TM_SELFDESTRUCT
	item_sort_rank TM_EGG_BOMB
	item_sort_rank TM_FIRE_BLAST
	item_sort_rank TM_SWIFT
	item_sort_rank TM_SKULL_BASH
	item_sort_rank TM_SOFTBOILED
	item_sort_rank TM_DREAM_EATER
	item_sort_rank TM_SKY_ATTACK
	item_sort_rank TM_REST
	item_sort_rank TM_THUNDER_WAVE
	item_sort_rank TM_PSYWAVE
	item_sort_rank TM_EXPLOSION
	item_sort_rank TM_ROCK_SLIDE
	item_sort_rank TM_TRI_ATTACK
	item_sort_rank TM_SUBSTITUTE
	item_sort_rank TM_HEX
	ASSERT CURRENT_ITEM_SORT_RANK == NUM_ITEMS + NUM_TM_HM + 1, "Autosort order must include each TM/HM exactly once"

ItemSortRanks::
	table_width 1
FOR item_id, 0, HM01 + NUM_TM_HM
	IF DEF(ItemSortRank{d:item_id})
		db ItemSortRank{d:item_id}
	ELSE
		db $ff ; items which are not listed get ranked last
	ENDC
ENDR
	assert_table_length HM01 + NUM_TM_HM
