# Pokémon Yume 夢

<p align="center">
  <img src="/docs/boxart/yumepokered.png"   alt="Yume Red"   width="256">
  &nbsp;&nbsp;&nbsp;
  <img src="/docs/boxart/yumepokegreen.png" alt="Yume Green" width="256">
  &nbsp;&nbsp;&nbsp;
  <img src="/docs/boxart/yumepokeblue.png"  alt="Yume Blue"  width="256">
</p>

Pokémon Yume 夢 is an enhancement hack of Pokémon Red and Blue built on the [pokered disassembly](https://github.com/pret/pokered).
It aims to enrich the originals with improved gameplay balance, greater Pokémon accessibility, and carefully integrated additions that feel as though they were always meant to be there.
Above all, it seeks to preserve the charm and spirit of these games.

夢 (Yume), meaning dream, symbolizes a return to Kanto where the line between memory and reimagination blurs.
Loosely inspired by the anime, manga, and later Pokémon generations, Yume features expanded storylines, new areas, and subtle cultural touches highlighting the games' Japanese roots.

▶▶ Download the latest version from the [releases page](https://github.com/PokefanMarcel/yumepokered/releases). ◀◀


### What's new?

- **Catch 'em all!** All original 151 Pokémon are available through natural gameplay.
- **Play as Red or Green.** Adventure as a girl or a boy.
- **Revisit Kanto.** Explore new areas like the Cinnabar Volcano, the Saffron Pokémon Academy, Celadon Grove... and even an all-new Mandarin Island!
- **Expanded Postgame.** New quests, Elite Four rematches, Gen 2 tie-ins, a restored Prof. Oak battle, and more!
- **Mew quest.** A proper storyline leading to the Mythical Pokémon.
- **Quality-of-life improvements.** Running shoes, bigger bag space, easier HM usage, improved Pokédex, experience bars, repel reuse prompts, a move deleter, and much more.


### Gameplay updates

**Moves**
- Several moves have been parsimoniously reworked in order to increase their viability while trying to maintain the original feeling of the game. Three moves from later generations have been added.
- Consult the [complete list of move changes](docs/move_changes.md) for more info!
- Ghost is now a Special type, and Dragon a Physical type.
- Fix for Focus energy and Dire hit. (Quadruple critical hit rate instead of dividing it by 4.)

**Learnsets**
- Pokémon learnsets have been revamped in the same spirit: to give more options while trying to maintain Gen 1 authenticity.
- The new learnsets can be consulted in this [file](data/pokemon/evos_moves.asm).
- Stone and trade evolutions keep learning moves.

**Battles**
- Updated type match-ups: Ghost is very effective against Psychic, Bug is not effective against Poison.
- Fixed badge boost glitch and Leech Seed/Toxic exploit.
- Gym leaders' and Elite 4 members' Pokémon have better moves overall.
- Several Gym leader teams were slightly modified (but trying to keep their theme intact!).
- The rival's teams now include a more diverse roster to better reflect his storyline.
- New trainers to fight in new and existing areas. (You may recognize some from the anime!)
- Rematches for Gym leaders and the Elite 4 with stronger teams and movesets.
- A new **Battle Hall** with random 3vs3 battles.

**Wild encounters**
- Wild encounters have been reworked to increase diversity and make many Pokémon available earlier in the game.
- For full details (spoilers!), see the files for [wild encounters on each map](data/wild/maps) and their [probabilities](data/wild/probabilities.asm).
- Every fishing rod is available earlier than it was in the original games.
- Fishing encounters were completely reworked in terms of levels and Pokémon diversity.
- For full details (spoilers!), see the files for the [Old rod](data/wild/old_rod.asm), [Good rod](data/wild/good_rod.asm) and [Super rod](data/wild/super_rod.asm).
- The Area feature of the Pokédex now shows Land, Surf, and Fishing encounters separately.
- A new NPC gives the fossil you didn't choose in Mt. Moon later in the game.
- Either Hitmonlee or Hitmonchan is also obtainable from a new NPC before the Elite 4.


### New content

**Maps**
- New zones including Mandarin Island, Cinnabar Volcano, Saffron Pokémon Academy, Mt. Moon square, Celadon Grove... and more.
- Take the brand-new Citrus ferries from Vermilion to Mandarin Island.
- Refurbished Pokécenters! Modern layout with the PC next to the nurse, sleeker design.
- New Celadon Mart floor where PP-related items are sold in the postgame (Ether, Elixir, PP Up...).
- Power Plant has updated mechanics and graphics.

**Story**
- Postgame quests around each Elite 4 member to unlock their rematches.
- A hidden location and adversary to unlock after battling Prof. Oak.
- New secrets in the Cinnabar Mansion could lead you to meet the Mythical Pokémon, Mew.
- Plenty of extra dialogue woven naturally into old and new locations.

**Visuals**
- Several maps have updated graphics and new animations.
- Gym leaders have their own sprites.
- New player sprites when surfing or running.
- In Super Game Boy mode, the town color palettes have been adjusted to better reflect the original Japanese town names.
- Restored gym leader names in trainer card.
- Many visual bug fixes.


### QoL updates

- Run by pressing B.
- Use Cut, Surf, Strength, and Flash just by pressing A on the overworld.
- HMs and other field moves can be taught without taking a move slot.
- All TMs can be bought at the Celadon Mart. Each new badge unlocks new TMs to buy.
- Bag space expanded to 30 item slots, and key items have a new dedicated bag pocket.
- Assign key items like Bicycle, Fishing rods, or Itemfinder to the Select button.
- Prompt to reuse Repel after finishing one.
- Haunter, Graveler, Kadabra and Machoke can evolve by interacting with new dedicated NPCs.
- Move deleter and Move reminder in Fuchsia.
- Experience bar in battle.
- Improved move info box in battle.
- Pressing B during wild battles now shortcuts directly to 'Run' on the main menu.
- Turn Exp.All on and off from the bag.
- Faster dialogue to buy coins at the Game Corner.
- New nurse room in the SS.Anne.
- Pokémon base stats can be consulted directly in the Pokédex.
- Unlock the ability to view DVs and Stat.Exp (the Gen 1 equivalents of IVs and EVs) at the new Pokémon Academy.
- Obtain the *Poké Beeper* from Oak's aide on Route 6 to get alerts when your box is almost full.

There are also many other smaller tweaks to the original game, and still more to come!

Link cable functionalities have not been tested yet – try it at your own risk.


## Screenshots

![green_titlescreen](/docs/screenshots/green_titlescreen.png?raw=true)
![pokecenter](/docs/screenshots/pokecenter.png?raw=true)
![cut_tree](/docs/screenshots/cut_tree.png?raw=true)
![move_reminder](/docs/screenshots/move_reminder.png?raw=true)
![battle_infobox](/docs/screenshots/battle_infobox.png?raw=true)

![key_items](/docs/screenshots/key_items.png?raw=true)
![power_plant](/docs/screenshots/power_plant.png?raw=true)
![red_titlescreen](/docs/screenshots/red_titlescreen.png?raw=true)
![cinnabar_island](/docs/screenshots/cinnabar_island.png?raw=true)
![pokemon_academy](/docs/screenshots/pokemon_academy.png?raw=true)

![nests](/docs/screenshots/nests.png?raw=true)
![skills](/docs/screenshots/skills.png?raw=true)
![mandarin_island](/docs/screenshots/mandarin_island.png?raw=true)
![agatha_sidequest](/docs/screenshots/agatha_sidequest.png?raw=true)
![blue_titlescreen](/docs/screenshots/blue_titlescreen.png?raw=true)


Note: colors are only available in SGB mode for now.


## Version differences

Differences between versions are minimal.  
- Version-exclusive Pokémon are now handled as rarity differences instead of being completely unavailable in the other version.  
  For instance, in the original games, Oddish was exclusive to Red, while Bellsprout was exclusive to Blue.
  In Yume, they are obtainable in all versions, but Oddish is more common in Red and Bellsprout is more common in Blue.  
  Green version shares the same encounter tables as Blue.
  
Other differences remain as in the original games:
- Game Boy Color palettes: Red/Green for Red, Green/Red for Green, Blue/Red for Blue.
- Game Corner slots: different visual designs.
- Super Game Boy: different border graphics.

Unless you’re after an easier hunt for a specific version-exclusive Pokémon, just pick whichever color you like!

## Credits

This project owes a lot to existing works, and above all to the pret [pokered](https://github.com/pret/pokered) disassemby project, but also:

- [Shinpokered](https://github.com/jojobear13/shinpokered): initial inspiration, including the kanji name; girl player, experience bar, temporary field moves, many bug fixes,
- [PureRGB](https://github.com/Vortyne/pureRGB): overworld HM use, ROM space management, repel reuse prompt, use items with Select, several Volcano and Power plant graphics, many other code snippets,
- [Extreme Yellow](https://github.com/RainbowMetalPigeon/ExtremeYellow): overworld HM use, dynamic TM seller,
- [Yellow Legacy](https://github.com/cRz-Shadows/Pokemon_Yellow_Legacy): inspiration for many balance changes,
- [pokered-crysaudio](https://github.com/dannye/pokered-crysaudio/tree/1edc6019fb8630bccd94f0b0e7dd4082cf7f4245): updated sound engine,
- [Polished Crystal](https://github.com/Rangi42/polishedcrystal): math functions, some gfx,
- some new sprites have been provided by or adapted from Madame Frog/Hatuntun (retrieved [here](https://www.deviantart.com/ghost-missingno/art/Blue-Sprites-for-R-G-B-Y-339796334)), LouLilie ([here](https://www.deviantart.com/loulilie/art/PokemonSpecial-Sprites-Yellow-302559354)), Corra, Mauve and FrenchOrange (from the pokered discord), SkidMarc25 ([here](https://www.deviantart.com/skidmarc25/art/Pokemon-Red-Blue-Green-Yellow-Back-Sprite-Touchups-977256591)),
- the invaluable help from the amazing people on the pokered Discord.

I do my best to keep track of all references, but I may have missed some.
If you think your work should be credited here, please reach out – I'll be happy to add it.

## Contact

Enjoy this project? Help make it even better!
I’m looking for creative contributions like new music, fresh graphics (especially Pokémon backsprites), and translations into other languages — please reach out via [GitHub](https://github.com/PokefanMarcel/yumepokered/issues) or [Reddit](https://www.reddit.com/message/compose/?to=wdpk_phoenix)!

NEW: join the Pokémon Yume [Discord server](https://discord.gg/PBCCXxUd)!

