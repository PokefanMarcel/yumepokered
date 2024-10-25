MACRO force_bike_surf
	db \1, \3, \2
ENDM

ForcedBikeOrSurfMaps:
	; map id, x, y
	force_bike_surf ROUTE_16,            21, 12 ; marcelnote - adjusted for new ROUTE_16 map size
	force_bike_surf ROUTE_16,            21, 13 ; marcelnote - adjusted for new ROUTE_16 map size
	force_bike_surf ROUTE_18,            33,  8
	force_bike_surf ROUTE_18,            33,  9
	force_bike_surf SEAFOAM_ISLANDS_B3F, 18,  7
	force_bike_surf SEAFOAM_ISLANDS_B3F, 19,  7
	force_bike_surf SEAFOAM_ISLANDS_B4F,  4, 14
	force_bike_surf SEAFOAM_ISLANDS_B4F,  5, 14
	db -1 ; end
