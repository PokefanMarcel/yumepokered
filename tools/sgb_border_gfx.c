#define PROGRAM_NAME "sgb_border_gfx"
#define USAGE_OPTS "[-h|--help] -o outfile gfx/sgb/*_border.png"

#include "common.h"

#include <png.h>
#include <strings.h>

#define SGB_BORDER_MAX_TILES 128
#define SNES_4BPP_TILE_SIZE 32
#define SGB_BORDER_OUTPUT_SIZE (SGB_BORDER_MAX_TILES * SNES_4BPP_TILE_SIZE)

struct Options {
	char *outfile;
};

struct Image {
	uint8_t *pixels;
	png_uint_32 width;
	png_uint_32 height;
};

struct Color {
	uint8_t r;
	uint8_t g;
	uint8_t b;
};

struct Options options;

void parse_args(int argc, char *argv[]) {
	struct option long_options[] = {
		{"out", required_argument, 0, 'o'},
		{"help", no_argument, 0, 'h'},
		{0}
	};
	for (int opt; (opt = getopt_long(argc, argv, "o:h", long_options)) != -1;) {
		switch (opt) {
		case 'o':
			options.outfile = optarg;
			break;
		case 'h':
			usage_exit(0);
			break;
		default:
			usage_exit(1);
		}
	}
}

bool ends_with(const char *string, const char *suffix) {
	size_t string_length = strlen(string);
	size_t suffix_length = strlen(suffix);
	return string_length >= suffix_length && !strcmp(string + string_length - suffix_length, suffix);
}

bool is_sgb_border_png(const char *path) {
	return ends_with(path, "gfx/sgb/red_border.png")
	    || ends_with(path, "gfx/sgb/blue_border.png")
	    || ends_with(path, "gfx/sgb/green_border.png");
}

void png_error_callback(png_structp png, png_const_charp message) {
	const char *path = png_get_error_ptr(png);
	error_exit("Could not read \"%s\": %s\n", path, message);
}

struct Image read_png_indices(const char *path) {
	FILE *file = xfopen(path, 'r');
	png_structp png = png_create_read_struct(
		PNG_LIBPNG_VER_STRING,
		(void *)path,
		png_error_callback,
		NULL
	);
	if (!png) {
		error_exit("Could not initialize PNG reader for \"%s\"\n", path);
	}
	png_infop info = png_create_info_struct(png);
	if (!info) {
		png_destroy_read_struct(&png, NULL, NULL);
		error_exit("Could not initialize PNG metadata for \"%s\"\n", path);
	}
	if (setjmp(png_jmpbuf(png))) {
		png_destroy_read_struct(&png, &info, NULL);
		xfclose(file);
		exit(1);
	}

	png_init_io(png, file);
	png_read_info(png, info);

	png_uint_32 width = png_get_image_width(png, info);
	png_uint_32 height = png_get_image_height(png, info);
	int bit_depth = png_get_bit_depth(png, info);
	int color_type = png_get_color_type(png, info);

	if (color_type == PNG_COLOR_TYPE_PALETTE) {
		png_colorp palette;
		int num_palette;
		png_get_PLTE(png, info, &palette, &num_palette);
		if (num_palette > 16) {
			error_exit("\"%s\" has %d palette colors; SGB border art supports at most 16\n", path, num_palette);
		}
	} else if (color_type != PNG_COLOR_TYPE_GRAY) {
		if (color_type != PNG_COLOR_TYPE_RGB && color_type != PNG_COLOR_TYPE_RGB_ALPHA) {
			error_exit("\"%s\" must be an indexed, grayscale, RGB, or RGBA PNG\n", path);
		}
		if (bit_depth != 8) {
			error_exit("\"%s\" RGB data must use 8-bit channels\n", path);
		}
	}
	if (color_type == PNG_COLOR_TYPE_GRAY && bit_depth > 4) {
		error_exit("\"%s\" must use 1-, 2-, or 4-bit grayscale samples\n", path);
	}

	if (bit_depth < 8) {
		png_set_packing(png);
	}
	png_read_update_info(png, info);

	size_t rowbytes = png_get_rowbytes(png, info);
	if (rowbytes < width) {
		error_exit("Could not unpack PNG pixels for \"%s\"\n", path);
	}

	uint8_t *rows = xmalloc(rowbytes * height);
	png_bytep *row_pointers = xmalloc(height * sizeof(*row_pointers));
	for (png_uint_32 y = 0; y < height; y++) {
		row_pointers[y] = rows + (size_t)y * rowbytes;
	}
	png_read_image(png, row_pointers);
	png_read_end(png, NULL);
	png_destroy_read_struct(&png, &info, NULL);
	xfclose(file);

	uint8_t *pixels = xmalloc((size_t)width * height);
	struct Color colors[16] = {0};
	int num_colors = 0;
	int channels = color_type == PNG_COLOR_TYPE_RGB ? 3 : 4;
	for (png_uint_32 y = 0; y < height; y++) {
		for (png_uint_32 x = 0; x < width; x++) {
			uint8_t index;
			if (color_type == PNG_COLOR_TYPE_RGB || color_type == PNG_COLOR_TYPE_RGB_ALPHA) {
				uint8_t *pixel = row_pointers[y] + (size_t)x * channels;
				if (color_type == PNG_COLOR_TYPE_RGB_ALPHA && pixel[3] != 255) {
					free(row_pointers);
					free(rows);
					free(pixels);
					error_exit("\"%s\" uses transparent pixel at (%u,%u); SGB border art must be opaque\n",
						path, x, y);
				}

				index = 0;
				for (; index < num_colors; index++) {
					if (colors[index].r == pixel[0] && colors[index].g == pixel[1] && colors[index].b == pixel[2]) {
						break;
					}
				}
				if (index == num_colors) {
					if (num_colors == 16) {
						free(row_pointers);
						free(rows);
						free(pixels);
						error_exit("\"%s\" uses more than 16 colors; SGB border art supports color indexes 0-15\n", path);
					}
					colors[num_colors++] = (struct Color){pixel[0], pixel[1], pixel[2]};
				}
			} else {
				index = row_pointers[y][x];
			}
			if (index > 15) {
				free(row_pointers);
				free(rows);
				free(pixels);
				error_exit("\"%s\" uses color index %u at (%u,%u); SGB border art supports 0-15\n",
					path, index, x, y);
			}
			pixels[(size_t)y * width + x] = index;
		}
	}
	free(row_pointers);
	free(rows);

	return (struct Image){pixels, width, height};
}

void write_snes_4bpp_tile(
	uint8_t *output,
	const uint8_t *pixels,
	png_uint_32 image_width,
	png_uint_32 tile_x,
	png_uint_32 tile_y,
	int tile_index
) {
	uint8_t *tile = output + tile_index * SNES_4BPP_TILE_SIZE;
	for (png_uint_32 y = 0; y < 8; y++) {
		uint8_t plane0 = 0;
		uint8_t plane1 = 0;
		uint8_t plane2 = 0;
		uint8_t plane3 = 0;
		for (png_uint_32 x = 0; x < 8; x++) {
			uint8_t color = pixels[(tile_y + y) * image_width + tile_x + x];
			uint8_t bit = 1 << (7 - x);
			if (color & 1) plane0 |= bit;
			if (color & 2) plane1 |= bit;
			if (color & 4) plane2 |= bit;
			if (color & 8) plane3 |= bit;
		}
		tile[y * 2] = plane0;
		tile[y * 2 + 1] = plane1;
		tile[16 + y * 2] = plane2;
		tile[16 + y * 2 + 1] = plane3;
	}
}

int main(int argc, char *argv[]) {
	parse_args(argc, argv);

	argc -= optind;
	argv += optind;
	if (!options.outfile || argc != 1) {
		usage_exit(1);
	}

	const char *infile = argv[0];
	if (!is_sgb_border_png(infile)) {
		error_exit("This tool is only for gfx/sgb/*_border.png files\n");
	}

	struct Image image = read_png_indices(infile);
	if (image.width % 8 || image.height % 8) {
		error_exit("\"%s\" dimensions must be multiples of 8, not %ux%u\n", infile, image.width, image.height);
	}

	png_uint_32 width_tiles = image.width / 8;
	png_uint_32 height_tiles = image.height / 8;
	png_uint_32 num_tiles = width_tiles * height_tiles;
	if (num_tiles > SGB_BORDER_MAX_TILES) {
		error_exit("\"%s\" has %u tiles; SGB CHR_TRN supports at most %u\n",
			infile, num_tiles, SGB_BORDER_MAX_TILES);
	}

	uint8_t *output = xcalloc(SGB_BORDER_OUTPUT_SIZE);
	for (png_uint_32 tile_y = 0; tile_y < height_tiles; tile_y++) {
		for (png_uint_32 tile_x = 0; tile_x < width_tiles; tile_x++) {
			int tile_index = tile_y * width_tiles + tile_x;
			write_snes_4bpp_tile(output, image.pixels, image.width, tile_x * 8, tile_y * 8, tile_index);
		}
	}

	write_u8(options.outfile, output, SGB_BORDER_OUTPUT_SIZE);
	free(output);
	free(image.pixels);
	return 0;
}
