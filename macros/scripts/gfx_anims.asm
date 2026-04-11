; marcelnote - Pikachu Surfing minigame

; pic + oam animations

MACRO? frame
	db \1
	DEF x = \2
	IF _NARG > 2
		REPT _NARG - 2
			DEF x |= \3 << 1
			shift
		ENDR
	ENDC
	db x
ENDM

	const_def -1, -1

	const endanim_command ; $ff
MACRO? endanim
	db endanim_command
ENDM

	const dorestart_command ; $fe
MACRO? dorestart
	db dorestart_command
ENDM

	const dorepeat_command ; $fd
MACRO? dorepeat
	db dorepeat_command
	db \1
ENDM

	const delanim_command ; $fc
MACRO? delanim
	db delanim_command
ENDM
