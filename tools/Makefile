.PHONY: all clean

CC := gcc
CFLAGS := -O3 -std=c17 -Wall -Wextra -pedantic

tools := \
	gfx \
	make_patch \
	pkmncompress \
	scan_includes

all: $(tools)
	@:

clean:
	$(RM) $(tools) png_normalize

%: %.c common.h
	$(CC) $(CFLAGS) -o $@ $<

PNG_CFLAGS := $(shell pkg-config --cflags libpng 2>/dev/null || libpng-config --cflags 2>/dev/null)
PNG_LIBS := $(shell pkg-config --libs libpng 2>/dev/null || libpng-config --ldflags 2>/dev/null || echo -lpng)

# Optional maintenance tool. It is intentionally not part of $(tools), so
# normal builds and `make tools` do not build or run it.
png_normalize: png_normalize.c common.h
	$(CC) $(CFLAGS) $(PNG_CFLAGS) -o $@ $< $(PNG_LIBS)
