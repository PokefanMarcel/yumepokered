roms := \
	yumepokered.gb \
	yumepokeblue.gb \
	yumepokegreen.gb \
	yumepokeblue_debug.gb \
	yumepokerouge.gb \
	yumepokeverte.gb \
	yumepokebleue.gb \
	yumepokebleue_debug.gb
patches := \
	yumepokered.patch \
	yumepokeblue.patch

rom_obj := \
	audio.o \
	home.o \
	main.o \
	maps.o \
	ram.o \
	text.o \
	gfx/pics.o \
	gfx/sprites.o \
	gfx/tilesets.o

yumepokered_obj         := $(rom_obj:.o=_red.o)
yumepokeblue_obj        := $(rom_obj:.o=_blue.o)
yumepokegreen_obj       := $(rom_obj:.o=_green.o)
yumepokeblue_debug_obj  := $(rom_obj:.o=_blue_debug.o)
yumepokered_vc_obj      := $(rom_obj:.o=_red_vc.o)
yumepokeblue_vc_obj     := $(rom_obj:.o=_blue_vc.o)
yumepokerouge_obj       := $(rom_obj:.o=_rouge.o)
yumepokeverte_obj       := $(rom_obj:.o=_verte.o)
yumepokebleue_obj       := $(rom_obj:.o=_bleue.o)
yumepokebleue_debug_obj := $(rom_obj:.o=_bleue_debug.o)


### Build tools

ifeq (,$(shell which sha1sum))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:
.PHONY: all red blue blue_debug clean tidy compare tools

all: $(roms)
red:         yumepokered.gb
blue:        yumepokeblue.gb
green:       yumepokegreen.gb
blue_debug:  yumepokeblue_debug.gb
red_vc:      yumepokered.patch
blue_vc:     yumepokeblue.patch
rouge:       yumepokerouge.gb
verte:       yumepokeverte.gb
bleue:       yumepokebleue.gb
bleue_debug: yumepokebleue.gb

clean: tidy
	find gfx \
	     \( -iname '*.1bpp' \
	        -o -iname '*.2bpp' \
	        -o -iname '*.pic' \) \
	     -delete

tidy:
	$(RM) $(roms) \
	      $(roms:.gb=.sym) \
	      $(roms:.gb=.map) \
	      $(patches) \
	      $(patches:.patch=_vc.gb) \
	      $(patches:.patch=_vc.sym) \
	      $(patches:.patch=_vc.map) \
	      $(patches:%.patch=vc/%.constants.sym) \
	      $(yumepokered_obj) \
	      $(yumepokeblue_obj) \
	      $(yumepokegreen_obj) \
	      $(yumepokered_vc_obj) \
	      $(yumepokeblue_vc_obj) \
	      $(yumepokeblue_debug_obj) \
	      $(yumepokerouge_obj) \
	      $(yumepokeverte_obj) \
	      $(yumepokebleue_obj) \
	      $(yumepokebleue_debug_obj) \
	      rgbdscheck.o
	$(MAKE) clean -C tools/

compare: $(roms) $(patches)
	@$(SHA1) -c roms.sha1

tools:
	$(MAKE) -C tools/


RGBASMFLAGS = -Q8 -P includes.asm -Weverything -Wnumeric-string=2 -Wtruncation=1
# Create a sym/map for debug purposes if `make` run with `DEBUG=1`
ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

$(yumepokered_obj):         RGBASMFLAGS += -D _RED
$(yumepokegreen_obj):       RGBASMFLAGS += -D _GREEN
$(yumepokeblue_obj):        RGBASMFLAGS += -D _BLUE
$(yumepokeblue_debug_obj):  RGBASMFLAGS += -D _BLUE -D _DEBUG
$(yumepokered_vc_obj):      RGBASMFLAGS += -D _RED -D _RED_VC
$(yumepokeblue_vc_obj):     RGBASMFLAGS += -D _BLUE -D _BLUE_VC
$(yumepokerouge_obj):       RGBASMFLAGS += -D _RED -D _FRA
$(yumepokeverte_obj):       RGBASMFLAGS += -D _GREEN -D _FRA
$(yumepokebleue_obj):       RGBASMFLAGS += -D _BLUE -D _FRA
$(yumepokebleue_debug_obj): RGBASMFLAGS += -D _BLUE -D _FRA -D _DEBUG

%.patch: vc/%.constants.sym %_vc.gb %.gb vc/%.patch.template
	tools/make_patch $*_vc.sym $^ $@

rgbdscheck.o: rgbdscheck.asm
	$(RGBASM) -o $@ $<

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tidy tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
preinclude_deps := includes.asm $(shell tools/scan_includes includes.asm)
define DEP
$1: $2 $$(shell tools/scan_includes $2) $(preinclude_deps) | rgbdscheck.o
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Dependencies for objects (drop _red and _blue from asm file basenames)
$(foreach obj, $(yumepokered_obj), $(eval $(call DEP,$(obj),$(obj:_red.o=.asm))))
$(foreach obj, $(yumepokeblue_obj), $(eval $(call DEP,$(obj),$(obj:_blue.o=.asm))))
$(foreach obj, $(yumepokegreen_obj), $(eval $(call DEP,$(obj),$(obj:_green.o=.asm))))
$(foreach obj, $(yumepokeblue_debug_obj), $(eval $(call DEP,$(obj),$(obj:_blue_debug.o=.asm))))
$(foreach obj, $(yumepokered_vc_obj), $(eval $(call DEP,$(obj),$(obj:_red_vc.o=.asm))))
$(foreach obj, $(yumepokeblue_vc_obj), $(eval $(call DEP,$(obj),$(obj:_blue_vc.o=.asm))))
$(foreach obj, $(yumepokerouge_obj), $(eval $(call DEP,$(obj),$(obj:_rouge.o=.asm))))
$(foreach obj, $(yumepokeverte_obj), $(eval $(call DEP,$(obj),$(obj:_verte.o=.asm))))
$(foreach obj, $(yumepokebleue_obj), $(eval $(call DEP,$(obj),$(obj:_bleue.o=.asm))))
$(foreach obj, $(yumepokebleue_debug_obj), $(eval $(call DEP,$(obj),$(obj:_bleue_debug.o=.asm))))

# Dependencies for VC files that need to run scan_includes
%.constants.sym: %.constants.asm $(shell tools/scan_includes %.constants.asm) $(preinclude_deps) | rgbdscheck.o
	$(RGBASM) $(RGBASMFLAGS) $< > $@

endif


%.asm: ;


yumepokered_pad         = 0x00
yumepokeblue_pad        = 0x00
yumepokegreen_pad       = 0x00
yumepokered_vc_pad      = 0x00
yumepokeblue_vc_pad     = 0x00
yumepokeblue_debug_pad  = 0xff
yumepokerouge_pad       = 0x00
yumepokeverte_pad       = 0x00
yumepokebleue_pad       = 0x00
yumepokebleue_debug_pad = 0xff

yumepokered_opt         = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON RED"
yumepokegreen_opt       = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON GREEN"
yumepokeblue_opt        = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON BLUE"
yumepokeblue_debug_opt  = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON BLUE"
yumepokered_vc_opt      = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON RED"
yumepokeblue_vc_opt     = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON BLUE"
yumepokerouge_opt       = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON RED"
yumepokeverte_opt       = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON GREEN"
yumepokebleue_opt       = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON BLUE"
yumepokebleue_debug_opt = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON BLUE"

%.gb: $$(%_obj) layout.link
	$(RGBLINK) -p $($*_pad) -d -m $*.map -n $*.sym -l layout.link -o $@ $(filter %.o,$^)
	$(RGBFIX) -p $($*_pad) $($*_opt) $@


### Misc file-specific graphics rules

gfx/battle/move_anim_0.2bpp: tools/gfx += --trim-whitespace
gfx/battle/move_anim_1.2bpp: tools/gfx += --trim-whitespace

gfx/intro/blue_jigglypuff_1.2bpp: rgbgfx += --columns
gfx/intro/blue_jigglypuff_2.2bpp: rgbgfx += --columns
gfx/intro/blue_jigglypuff_3.2bpp: rgbgfx += --columns
gfx/intro/red_nidorino_1.2bpp: rgbgfx += --columns
gfx/intro/red_nidorino_2.2bpp: rgbgfx += --columns
gfx/intro/red_nidorino_3.2bpp: rgbgfx += --columns
gfx/intro/gengar.2bpp: rgbgfx += --columns
gfx/intro/gengar.2bpp: tools/gfx += --remove-duplicates --preserve=0x19,0x76

gfx/credits/the_end.2bpp: tools/gfx += --interleave --png=$<

gfx/slots/red_slots_1.2bpp: tools/gfx += --trim-whitespace
gfx/slots/blue_slots_1.2bpp: tools/gfx += --trim-whitespace
gfx/slots/green_slots_1.2bpp: tools/gfx += --trim-whitespace

gfx/tilesets/%.2bpp: tools/gfx += --trim-whitespace
gfx/tilesets/reds_house.2bpp: tools/gfx += --preserve=0x48

gfx/trade/game_boy.2bpp: tools/gfx += --remove-duplicates


### Catch-all graphics rules

%.png: ;

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	$(RGBGFX) $(rgbgfx) --depth 1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) --depth 1 -o $@ $@)

%.pic: %.2bpp
	tools/pkmncompress $< $@
