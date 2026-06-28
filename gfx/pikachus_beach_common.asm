; marcelnote - Pikachu's Beach minigame common gfx assets
IF DEF(_FRA)
PikachusBeachBGGraphics:: INCBIN "translation/fra/gfx/pikachus_beach/background.fra.2bpp"
PikachusBeachBGGraphicsEnd::
PikachusBeachTitleGFX:: INCBIN "translation/fra/gfx/pikachus_beach/title.fra.2bpp"
ELIF DEF(_ESP) ; TODO - Spanish translation
PikachusBeachBGGraphics:: INCBIN "gfx/pikachus_beach/background.2bpp"
PikachusBeachBGGraphicsEnd::
PikachusBeachTitleGFX:: INCBIN "gfx/pikachus_beach/title.2bpp"
ELSE
PikachusBeachBGGraphics:: INCBIN "gfx/pikachus_beach/background.2bpp"
PikachusBeachBGGraphicsEnd::
PikachusBeachTitleGFX:: INCBIN "gfx/pikachus_beach/title.2bpp"
ENDC



PikachusBeachBeachAndFrameGFX::
PikachusBeachBeachGFX:: INCBIN "gfx/pikachus_beach/beach.2bpp"
PikachusBeachFrameGFX:: INCBIN "gfx/pikachus_beach/frame.2bpp"
PikachusBeachBeachAndFrameGFXEnd::

IF DEF(_FRA)
PikachusBeachGameplayEffectsGraphics:: INCBIN "translation/fra/gfx/pikachus_beach/gameplay_effects.fra.2bpp"
PikachusBeachGameplayEffectsGraphicsEnd::
ELIF DEF(_ESP) ; TODO - Spanish translation (START, GOAL!!, Oh no...)
PikachusBeachGameplayEffectsGraphics:: INCBIN "gfx/pikachus_beach/gameplay_effects.2bpp"
PikachusBeachGameplayEffectsGraphicsEnd::
ELSE
PikachusBeachGameplayEffectsGraphics:: INCBIN "gfx/pikachus_beach/gameplay_effects.2bpp"
PikachusBeachGameplayEffectsGraphicsEnd::
ENDC

PikachusBeachPrinterCommonGraphics:: INCBIN "gfx/pikachus_beach/printer_common.2bpp"
PikachusBeachPrinterCommonGraphicsEnd::
