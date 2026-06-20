#define PROGRAM_NAME "png_normalize"
#define USAGE_OPTS "[-c|--check] [-q|--quiet] [path ...]"

#include "common.h"

#include <dirent.h>
#include <png.h>
#include <strings.h>
#include <sys/stat.h>
#include <unistd.h>

struct Options {
	bool check;
	bool quiet;
};

struct Options options;
unsigned int checked;
unsigned int changed;
unsigned int invalid;

void parse_args(int argc, char *argv[]) {
	struct option long_options[] = {
		{"check", no_argument, 0, 'c'},
		{"quiet", no_argument, 0, 'q'},
		{"help", no_argument, 0, 'h'},
		{0}
	};
	for (int opt; (opt = getopt_long(argc, argv, "cqh", long_options)) != -1;) {
		switch (opt) {
		case 'c':
			options.check = true;
			break;
		case 'q':
			options.quiet = true;
			break;
		case 'h':
			usage_exit(0);
			break;
		default:
			usage_exit(1);
		}
	}
}

bool has_png_extension(const char *path) {
	size_t length = strlen(path);
	return length >= 4 && !strcasecmp(path + length - 4, ".png");
}

bool is_ignored_directory(const char *name) {
	return !strcmp(name, ".") || !strcmp(name, "..") || !strcmp(name, ".git");
}

char *join_path(const char *directory, const char *name) {
	size_t directory_length = strlen(directory);
	size_t name_length = strlen(name);
	bool needs_slash = directory_length && directory[directory_length - 1] != '/';
	char *path = xmalloc(directory_length + needs_slash + name_length + 1);
	memcpy(path, directory, directory_length);
	if (needs_slash) {
		path[directory_length++] = '/';
	}
	memcpy(path + directory_length, name, name_length + 1);
	return path;
}

void read_ihdr(const char *path, int *bit_depth, int *color_type) {
	FILE *file = xfopen(path, 'r');
	uint8_t header[26];
	xfread(header, sizeof(header), path, file);
	xfclose(file);
	static const uint8_t signature[] = {
		0x89, 'P', 'N', 'G', '\r', '\n', 0x1a, '\n',
		0, 0, 0, 13, 'I', 'H', 'D', 'R'
	};
	if (memcmp(header, signature, sizeof(signature))) {
		error_exit("Not a valid PNG file: \"%s\"\n", path);
	}
	*bit_depth = header[24];
	*color_type = header[25];
}

uint8_t *read_rgba(const char *path, png_uint_32 *width, png_uint_32 *height) {
	png_image image = {0};
	image.version = PNG_IMAGE_VERSION;
	if (!png_image_begin_read_from_file(&image, path)) {
		error_exit("Could not read \"%s\": %s\n", path, image.message);
	}
	image.format = PNG_FORMAT_RGBA;
	size_t size = PNG_IMAGE_SIZE(image);
	uint8_t *pixels = xmalloc(size);
	if (!png_image_finish_read(&image, NULL, pixels, 0, NULL)) {
		free(pixels);
		error_exit("Could not decode \"%s\": %s\n", path, image.message);
	}
	*width = image.width;
	*height = image.height;
	png_image_free(&image);
	return pixels;
}

bool pixels_are_grayscale(const uint8_t *pixels, size_t count) {
	for (size_t i = 0; i < count; i++) {
		const uint8_t *pixel = pixels + i * 4;
		if (pixel[0] != pixel[1] || pixel[1] != pixel[2]) {
			return false;
		}
	}
	return true;
}

bool pixels_are_opaque(const uint8_t *pixels, size_t count) {
	for (size_t i = 0; i < count; i++) {
		if (pixels[i * 4 + 3] != 255) {
			return false;
		}
	}
	return true;
}

unsigned int collect_shades(
	const uint8_t *pixels,
	size_t count,
	bool shades[256],
	bool bins[4]
) {
	memset(shades, 0, 256 * sizeof(*shades));
	memset(bins, 0, 4 * sizeof(*bins));
	unsigned int num_shades = 0;
	for (size_t i = 0; i < count; i++) {
		uint8_t value = pixels[i * 4];
		bins[value / 64] = true;
		if (!shades[value]) {
			shades[value] = true;
			num_shades++;
		}
	}
	return num_shades;
}

bool canonicalize_pixels(uint8_t *pixels, size_t count) {
	bool changed_pixels = false;
	for (size_t i = 0; i < count; i++) {
		uint8_t *pixel = pixels + i * 4;
		uint8_t value = pixel[0] / 64 * 85;
		changed_pixels |= pixel[0] != value;
		pixel[0] = value;
		pixel[1] = value;
		pixel[2] = value;
	}
	return changed_pixels;
}

void png_error_callback(png_structp png, png_const_charp message) {
	const char *path = png_get_error_ptr(png);
	error_exit("Could not write \"%s\": %s\n", path, message);
}

void png_warning_callback(png_structp png, png_const_charp message) {
	(void)png;
	fprintf(stderr, PROGRAM_NAME ": warning: %s\n", message);
}

void pack_row(uint8_t *output, const uint8_t *rgba, png_uint_32 width, int bit_depth) {
	if (bit_depth == 8) {
		for (png_uint_32 x = 0; x < width; x++) {
			output[x] = rgba[x * 4];
		}
		return;
	}

	unsigned int pixels_per_byte = 8 / bit_depth;
	unsigned int max_sample = (1u << bit_depth) - 1;
	for (png_uint_32 x = 0; x < width; x++) {
		unsigned int sample = rgba[x * 4] * max_sample / 255;
		unsigned int shift = 8 - bit_depth * (x % pixels_per_byte + 1);
		output[x / pixels_per_byte] |= sample << shift;
	}
}

void write_grayscale(
	const char *path,
	const uint8_t *pixels,
	png_uint_32 width,
	png_uint_32 height,
	int bit_depth,
	mode_t mode
) {
	char *temporary = xmalloc(strlen(path) + sizeof(".normalize.tmp"));
	sprintf(temporary, "%s.normalize.tmp", path);
	FILE *file = xfopen(temporary, 'w');
	png_structp png = png_create_write_struct(
		PNG_LIBPNG_VER_STRING,
		(void *)path,
		png_error_callback,
		png_warning_callback
	);
	if (!png) {
		error_exit("Could not initialize PNG writer for \"%s\"\n", path);
	}
	png_infop info = png_create_info_struct(png);
	if (!info) {
		png_destroy_write_struct(&png, NULL);
		error_exit("Could not initialize PNG metadata for \"%s\"\n", path);
	}

	png_init_io(png, file);
	png_set_IHDR(
		png,
		info,
		width,
		height,
		bit_depth,
		PNG_COLOR_TYPE_GRAY,
		PNG_INTERLACE_NONE,
		PNG_COMPRESSION_TYPE_DEFAULT,
		PNG_FILTER_TYPE_DEFAULT
	);
	png_set_compression_level(png, 9);
	png_set_filter(png, PNG_FILTER_TYPE_BASE, PNG_ALL_FILTERS);
	png_write_info(png, info);

	size_t row_size = (width * bit_depth + 7) / 8;
	uint8_t *row = xcalloc(row_size);
	for (png_uint_32 y = 0; y < height; y++) {
		memset(row, 0, row_size);
		pack_row(row, pixels + (size_t)y * width * 4, width, bit_depth);
		png_write_row(png, row);
	}
	free(row);
	png_write_end(png, info);
	png_destroy_write_struct(&png, &info);
	xfclose(file);

	png_uint_32 verified_width;
	png_uint_32 verified_height;
	uint8_t *verified = read_rgba(temporary, &verified_width, &verified_height);
	size_t pixel_bytes = (size_t)width * height * 4;
	if (
		verified_width != width ||
		verified_height != height ||
		memcmp(verified, pixels, pixel_bytes)
	) {
		free(verified);
		unlink(temporary);
		error_exit("Pixel verification failed for \"%s\"\n", path);
	}
	free(verified);

	if (chmod(temporary, mode & 0777)) {
		unlink(temporary);
		error_exit("Could not preserve permissions for \"%s\": %s\n", path, strerror(errno));
	}
	if (rename(temporary, path)) {
		unlink(temporary);
		error_exit("Could not replace \"%s\": %s\n", path, strerror(errno));
	}
	free(temporary);
}

void normalize_png(const char *path, const struct stat *statbuf) {
	int input_depth;
	int input_color;
	read_ihdr(path, &input_depth, &input_color);

	png_uint_32 width;
	png_uint_32 height;
	uint8_t *pixels = read_rgba(path, &width, &height);
	size_t count = (size_t)width * height;
	checked++;
	bool grayscale = pixels_are_grayscale(pixels, count);
	bool opaque = pixels_are_opaque(pixels, count);
	if (!grayscale) {
		free(pixels);
		return;
	}
	if (!opaque) {
		invalid++;
		if (!options.quiet) {
			printf("invalid: %s (transparent grayscale PNG)\n", path);
		}
		free(pixels);
		return;
	}

	bool shades[256];
	bool bins[4];
	unsigned int num_shades = collect_shades(pixels, count, shades, bins);
	unsigned int num_bins = bins[0] + bins[1] + bins[2] + bins[3];
	if (num_shades > 4 || num_shades != num_bins) {
		invalid++;
		if (!options.quiet) {
			printf("invalid: %s (%u grayscale shades occupy %u DMG bins)\n",
				path,
				num_shades,
				num_bins
			);
		}
		free(pixels);
		return;
	}

	int output_depth = !bins[1] && !bins[2] ? 1 : 2;
	bool changed_pixels = canonicalize_pixels(pixels, count);
	if (
		input_color == PNG_COLOR_TYPE_GRAY &&
		input_depth == output_depth &&
		!changed_pixels
	) {
		free(pixels);
		return;
	}

	changed++;
	if (!options.quiet) {
		printf("%s: %s (%d-bit grayscale)\n",
			options.check ? "needs normalization" : "normalized",
			path,
			output_depth
		);
	}
	if (!options.check) {
		write_grayscale(path, pixels, width, height, output_depth, statbuf->st_mode);
	}
	free(pixels);
}

void visit_path(const char *path) {
	struct stat statbuf;
	if (lstat(path, &statbuf)) {
		error_exit("Could not inspect \"%s\": %s\n", path, strerror(errno));
	}
	if (S_ISLNK(statbuf.st_mode)) {
		return;
	}
	if (S_ISREG(statbuf.st_mode)) {
		if (has_png_extension(path)) {
			normalize_png(path, &statbuf);
		}
		return;
	}
	if (!S_ISDIR(statbuf.st_mode)) {
		return;
	}

	DIR *directory = opendir(path);
	if (!directory) {
		error_exit("Could not open directory \"%s\": %s\n", path, strerror(errno));
	}
	struct dirent *entry;
	while ((entry = readdir(directory))) {
		if (is_ignored_directory(entry->d_name)) {
			continue;
		}
		char *child = join_path(path, entry->d_name);
		visit_path(child);
		free(child);
	}
	closedir(directory);
}

int main(int argc, char *argv[]) {
	parse_args(argc, argv);
	if (optind == argc) {
		visit_path(".");
	} else {
		for (int i = optind; i < argc; i++) {
			visit_path(argv[i]);
		}
	}
	if (!options.quiet) {
		printf("%u PNG%s checked; %u %s%s; %u invalid\n",
			checked,
			checked == 1 ? "" : "s",
			changed,
			changed == 1 ? "file" : "files",
			options.check ? " need normalization" : " normalized",
			invalid
		);
	}
	return invalid || (options.check && changed) ? 1 : 0;
}
