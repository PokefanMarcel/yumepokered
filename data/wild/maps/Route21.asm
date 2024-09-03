Route21WildMons:
	def_grass_wildmons 25 ; encounter rate
	;db 21, RATTATA  ; marcelnote - removed
	db 23, PIDGEY
	db 30, RATICATE
	db 23, RATTATA
	db 28, TANGELA   ; marcelnote - was 21, PIDGEY
	db 30, PIDGEOTTO
	db 30, TANGELA   ; marcelnote - was 32, PIDGEOTTO
	db 32, PIDGEOTTO ; marcelnote - was 28, TANGELA
	db 24, MR_MIME   ; marcelnote - was 30, TANGELA
	db 25, EEVEE     ; marcelnote - added
	db 32, TANGELA
	end_grass_wildmons

	def_water_wildmons 5 ; encounter rate
	; marcelnote - old encounters
	;db  5, TENTACOOL
	;db 10, TENTACOOL
	;db 15, TENTACOOL
	;db  5, TENTACOOL
	;db 10, TENTACOOL
	;db 15, TENTACOOL
	;db 20, TENTACOOL
	;db 30, TENTACOOL
	;db 35, TENTACOOL
	;db 40, TENTACOOL
	; marcelnote - new encounters
	db 15, TENTACOOL
	db 20, TENTACOOL
	db 25, TENTACOOL
	db 21, HORSEA
	db 21, SHELLDER
	db 21, STARYU
	db 30, TENTACOOL
	db 35, TENTACOOL
	db 35, TENTACRUEL
	db 40, TENTACOOL
	end_water_wildmons
