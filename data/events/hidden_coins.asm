MACRO hidden_coin
	db \1, \3, \2
ENDM

HiddenCoinCoords: ; marcelnote - see also GameCornerHiddenObjects
	table_width 3
	; map id, x, y
	hidden_coin GAME_CORNER,  0,  4
	hidden_coin GAME_CORNER,  1, 12
	hidden_coin GAME_CORNER,  3,  7
	hidden_coin GAME_CORNER,  3, 10
	hidden_coin GAME_CORNER,  4,  8
	hidden_coin GAME_CORNER,  9,  8
	hidden_coin GAME_CORNER,  9, 11
	hidden_coin GAME_CORNER, 16, 10
	hidden_coin GAME_CORNER, 10, 12
	hidden_coin GAME_CORNER, 11,  3
	hidden_coin GAME_CORNER, 15,  4
	hidden_coin GAME_CORNER, 12, 11
	assert_max_table_length MAX_HIDDEN_COINS
	db -1 ; end
