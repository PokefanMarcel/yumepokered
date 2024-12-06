# Pokémon Yume 夢 Red/Green/Blue

This is a rom hack of Pokémon Red and Blue based on the [pokered disassembly](https://github.com/pret/pokered).

夢 (yume) is the Japanese kanji for *dream*, underlining the intent to provide a reimagined version of these classic games.

Pokémon Yume Red/Blue/Green aims to improve the original games in terms of gameplay balance, story content, and Pokémon accessibility, all while trying to stay faithful to the authentic Gen 1 experience.
To do this, inspiration was loosely taken from the anime, later Pokémon generations, or the manga..
In some small ways it is also a 'relocalization' effort, in the sense that it tries to highlight the games' Japanese influence through some new visuals and dialogue.
The name is also an homage to [shinpokered](https://github.com/jojobear13/shinpokered), a groundbreaking hack which provided the initial inspiration for this project.


### Main features

- Catch all 151 Pokémon!
- Choose to play as a girl or boy.
- New areas: Saffron Pokémon Academy, Cinnabar Volcano, Mt. Moon square, Celadon Grove, and much more...
- ... and even a brand-new town: Mandarin Island.
- Postgame: new events involving the Elite 4 members, Gen 2 tie-ins, a restored Oak battle, and more!
- New storyline leading to Mew encounter.
- Many popular QoL changes: running shoes, more item space, easier HM use, experience bar...

### Gameplay updates

**Moves**
- Several moves have been parsimoniously reworked in order to increase their viability while trying to maintain the original feeling of the game. Three new moves have been added.
- Consult the [complete list of move changes](docs/move_changes.md) for more info!
- Ghost is now a Special type, and Dragon a Physical type.
- Fix for Focus energy and Dire hit. (Quadruple critical hit rate instead of dividing it by 4.)

**Learnsets**
- Pokémon learnsets have been revamped in the same spirit: to give more options while trying to maintain Gen 1 authenticity.
- The new learnsets can be consulted in this [file](data/pokemon/evos_moves.asm).
- Stone and trade evolutions keep learning moves.

**Battles**
- Gym leaders' and Elite 4 members' Pokémon have better moves overall.
- Several Gym leader teams were slightly modified (but trying to keep their theme intact!).
- New trainers to fight in new and existing areas. (You may recognize some from the anime!)
- Rematches for Gym leaders and the Elite 4, with stronger teams!

**Wild encounters**
- Wild encounters have been reworked, mostly making Pokemon available earlier.
- The locations of the Rods was changed – in particular, the Old Rod is now available very early in the game.
- Fishing encounters were completely reworked – see the files for the [Old rod](data/wild/old_rod.asm), [Good rod](data/wild/good_rod.asm) and [Super rod](data/wild/super_rod.asm).

### Visual updates

- Several tilesets have been reworked, most notably for Viridian Forest and the Pokemon Tower.
- Gym leaders have their own sprites.
- New character sprites when surfing.
- In SuperGameBoy mode, the town palettes have been modified to better reflect the original Japanese town names.
- Many visual bug fixes.

### QoL updates

- Run by pressing B.
- Use Cut, Surf, Strength, and Flash just by pressing A on the map. 
- Bag space expanded to 30 item slots, and a new dedicated bag pocket for key items.
- Prompt to reuse Repel after finishing one.
- Haunter, Graveler, Kadabra and Machoke can evolve by interacting with new dedicated NPCs.
- Move deleter and Move reminder in Fuchsia.
- Experience bar in battle.
- All TMs can be bought at the Celadon Mart after getting the right badge.
- New Celadon Mart floor where you can buy PP-related items in the postgame (Ether, Elixir, PP Up...).

There are also many other smaller tweaks to the original game!

## Credits

This project owes a lot to other existing works, and above all to the pret's [pokered](https://github.com/pret/pokered) disassemby project (without which my project wouldn't exist), but also:

- [Shinpokered](https://github.com/jojobear13/shinpokered): experience bar, many many bug fixes,
- [PureRGB](https://github.com/Vortyne/pureRGB): overworld HM use, ROM space management, repel reuse prompt, many other code snippets,
- [Extreme Yellow](https://github.com/RainbowMetalPigeon/ExtremeYellow): overworld HM use, dynamic TM seller,
- [Yellow Legacy](https://github.com/cRz-Shadows/Pokemon_Yellow_Legacy): inspiration for some balance changes,
- [pokered-crysaudio](https://github.com/dannye/pokered-crysaudio/tree/1edc6019fb8630bccd94f0b0e7dd4082cf7f4245): updated sound engine,
- new sprites have been adapted from Madame Frog/Hatuntun (retrieved [here](https://www.deviantart.com/ghost-missingno/art/Blue-Sprites-for-R-G-B-Y-339796334)), LouLilie ([here](https://www.deviantart.com/loulilie/art/PokemonSpecial-Sprites-Yellow-302559354)),
- the invaluable help from the amazing people on the pokered Discord,
- and many others...

I try my best to keep track of all references, but I'm without a doubt forgetting some.
If you think I should credit your work here, I'll be happy to add you to the list – just reach out to me on the pokered Discord!
