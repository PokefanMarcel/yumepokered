#!/usr/bin/env python3
"""Reindex SGB border artwork to the palette order used by ASM."""

from __future__ import annotations

import argparse
from collections import Counter
from pathlib import Path
import sys

from PIL import Image


DEFAULT_PATH = Path("gfx/sgb/blue_border.png")

BLUE_BORDER_PALETTE = (
    ("white", (247, 239, 239)),
    ("dark blue", (16, 49, 156)),
    ("light blue", (115, 156, 222)),
    ("red accent", (222, 66, 24)),
    ("dark green", (74, 107, 66)),
    ("gray", (198, 198, 198)),
    ("Yume pink", (255, 115, 165)),
    ("Mew light pink", (247, 214, 231)),
    ("black", (0, 0, 0)),
    ("green accent", (90, 173, 123)),
    ("Mew shadow", (214, 189, 206)),
    ("light red", (255, 165, 140)),
    ("blue accent", (57, 123, 214)),
    ("cyan accent", (107, 198, 231)),
    ("deep pink marker", (255, 0, 77)),
    ("deep purple marker", (126, 37, 83)),
)

GREEN_BORDER_PALETTE = (
    ("white", (247, 239, 239)),
    ("dark green", (74, 107, 66)),
    ("light green", (90, 173, 123)),
    ("dark blue", (16, 49, 156)),
    ("dark red", (198, 41, 41)),
    ("gray", (198, 198, 198)),
    ("Yume pink", (255, 115, 165)),
    ("Mew light pink", (247, 214, 231)),
    ("black", (0, 0, 0)),
    ("light red", (255, 115, 107)),
    ("Mew shadow", (214, 189, 206)),
    ("light blue", (115, 156, 222)),
    ("medium green", (66, 148, 74)),
    ("cyan accent", (107, 198, 231)),
    ("deep pink marker", (255, 0, 77)),
    ("deep purple marker", (126, 37, 83)),
)

GREEN_BORDER_ALIASES = {
    (222, 66, 24): 4,   # previous dark red preview
    (255, 165, 140): 9, # previous light red preview
}

RED_BORDER_PALETTE = (
    ("white", (247, 239, 239)),
    ("dark red", (198, 41, 41)),
    ("light red", (255, 115, 107)),
    ("dark green", (74, 107, 66)),
    ("dark blue", (16, 49, 156)),
    ("gray", (198, 198, 198)),
    ("Yume pink", (255, 115, 165)),
    ("Mew light pink", (247, 214, 231)),
    ("black", (0, 0, 0)),
    ("light blue", (115, 156, 222)),
    ("Mew shadow", (214, 189, 206)),
    ("light green", (90, 173, 123)),
    ("medium red", (255, 99, 66)),
    ("cyan accent", (107, 198, 231)),
    ("deep pink marker", (255, 0, 77)),
    ("deep purple marker", (126, 37, 83)),
)

RED_BORDER_ALIASES = {
    (222, 66, 24): 1,   # previous dark red preview
    (255, 165, 140): 2, # previous light red preview
}

STARTER_STICKER_PALETTE = (
    ("white", (238, 247, 255)),
    ("dark blue marker", (16, 49, 156)),
    ("eye blue", (114, 153, 220)),
    ("red mouth", (220, 67, 27)),
    ("bulb dark green", (76, 104, 67)),
    ("gray", (194, 195, 199)),
    ("mouth pink", (255, 119, 168)),
    ("Charmander orange", (240, 123, 7)),
    ("black", (0, 0, 0)),
    ("bulb green", (94, 173, 123)),
    ("Charmander shadow", (214, 82, 0)),
    ("unused", (0, 0, 0)),
    ("Bulbasaur teal", (130, 190, 182)),
    ("Squirtle light blue", (110, 199, 231)),
    ("Squirtle dark blue", (66, 111, 134)),
    ("Bulbasaur shadow", (83, 130, 115)),
)

BORDER_PALETTES = {
    "blue_border.png": (BLUE_BORDER_PALETTE, {}),
    "red_border.png": (RED_BORDER_PALETTE, RED_BORDER_ALIASES),
    "green_border.png": (GREEN_BORDER_PALETTE, GREEN_BORDER_ALIASES),
    "starter_stickers.png": (STARTER_STICKER_PALETTE, {}),
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Reindex SGB border artwork with fixed color indexes."
    )
    parser.add_argument(
        "png",
        nargs="?",
        type=Path,
        default=DEFAULT_PATH,
        help=f"PNG to reindex, default: {DEFAULT_PATH}",
    )
    parser.add_argument(
        "-c",
        "--check",
        action="store_true",
        help="validate the PNG without rewriting it",
    )
    parser.add_argument(
        "--print-palette",
        action="store_true",
        help="print the expected index table",
    )
    return parser.parse_args()


def palette_for_path(path: Path) -> tuple[tuple[tuple[str, tuple[int, int, int]], ...], dict[tuple[int, int, int], int]]:
    try:
        return BORDER_PALETTES[path.name]
    except KeyError:
        supported = ", ".join(sorted(BORDER_PALETTES))
        raise SystemExit(f"{path}: unsupported SGB artwork PNG; expected one of: {supported}")


def expected_flat_palette(palette: tuple[tuple[str, tuple[int, int, int]], ...]) -> list[int]:
    flat_palette: list[int] = []
    for _name, rgb in palette:
        flat_palette.extend(rgb)
    return flat_palette


def print_palette(palette: tuple[tuple[str, tuple[int, int, int]], ...]) -> None:
    for index, (name, rgb) in enumerate(palette):
        print(f"{index:2d}: #{rgb[0]:02X}{rgb[1]:02X}{rgb[2]:02X} {name}")


def indexed_pixels(
    image: Image.Image,
    path: Path,
    palette: tuple[tuple[str, tuple[int, int, int]], ...],
    aliases: dict[tuple[int, int, int], int],
) -> list[int]:
    index_by_rgb: dict[tuple[int, int, int], int] = {}
    for index, (_name, rgb) in enumerate(palette):
        index_by_rgb.setdefault(rgb, index)
    rgba_image = image.convert("RGBA")
    output: list[int] = []
    unknown: Counter[tuple[int, int, int]] = Counter()
    transparent: list[tuple[int, int]] = []

    width, _height = rgba_image.size
    rgba = rgba_image.tobytes()
    for offset in range(0, len(rgba), 4):
        red, green, blue, alpha = rgba[offset : offset + 4]
        pixel_index = offset // 4
        x = pixel_index % width
        y = pixel_index // width
        if alpha != 255:
            transparent.append((x, y))
            continue
        rgb = (red, green, blue)
        index = index_by_rgb.get(rgb)
        if index is None:
            index = aliases.get(rgb)
        if index is None:
            unknown[rgb] += 1
            continue
        output.append(index)

    if transparent:
        examples = ", ".join(f"({x},{y})" for x, y in transparent[:8])
        raise SystemExit(f"{path}: transparent pixels are not supported: {examples}")
    if unknown:
        details = ", ".join(
            f"#{rgb[0]:02X}{rgb[1]:02X}{rgb[2]:02X} x{count}"
            for rgb, count in sorted(unknown.items())
        )
        raise SystemExit(f"{path}: unexpected colors: {details}")

    return output


def is_indexed_as_expected(
    image: Image.Image,
    pixels: list[int],
    palette: tuple[tuple[str, tuple[int, int, int]], ...],
) -> bool:
    if image.mode != "P":
        return False
    image_palette = image.getpalette() or []
    expected = expected_flat_palette(palette)
    if image_palette[: len(expected)] != expected:
        return False
    return list(image.tobytes()) == pixels


def main() -> int:
    args = parse_args()
    palette, aliases = palette_for_path(args.png)
    if args.print_palette:
        print_palette(palette)

    image = Image.open(args.png)
    pixels = indexed_pixels(image, args.png, palette, aliases)

    if is_indexed_as_expected(image, pixels, palette):
        print(f"{args.png}: already indexed correctly")
        return 0

    if args.check:
        print(f"{args.png}: not indexed correctly", file=sys.stderr)
        return 1

    output = Image.new("P", image.size)
    output.putpalette(expected_flat_palette(palette))
    output.putdata(pixels)
    output.save(args.png, bits=4)
    print(f"{args.png}: reindexed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
