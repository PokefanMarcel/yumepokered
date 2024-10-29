# Move changes

Moves have been rebalanced to enhance the viability of certain Pokémon and to offer players a broader range of strategic options. The changes are deliberately minimalistic, ensuring that they remain true to the original Gen 1 experience. No mechanics from later generations have been introduced—meaning no new types, no weather effects, no damaging moves that alter stats, no physical/special split, etc.

Feedback is welcome, as long as it aligns with the goal of maintaining the classic Gen 1 feel!

For more detailed information about moves in the game, [check this file](../data/moves/moves.asm).


## New moves

There are **three** new moves:
- HEX has been imported from future generations to provide a strong, viable STAB Ghost-type move. It is now part of the Gastly line's level-up learnset and is also the only new TM in the game, teachable to Pokémon like Hypno, Ninetales, Marowak, and a few others. HEX gains a 50% damage boost when the opponent is afflicted with a status condition, introducing a new move effect. However, given its similarity to DREAM EATER and its natural fit with Ghost-types, this addition feels like a seamless and sensible enhancement to the original movepool.
- ELECTRO BALL is a signature move for the Voltorb line which has a high crit rate. Given Electrode's speed and how critical hits are computed in Gen 1, it essentially becomes the best Electric move in the game.
- WILL-O-WISP is a signature move for the Vulpix line. Ninetales suffers in comparison to Arcanine in Gen 1, and this provides it with a much-needed buff (WILL-O-WISP also pairs nicely with HEX).

| Move         | Type     | Power | Accuracy | PP | Side effect                                                    |
|--------------|----------|-------|----------|----|----------------------------------------------------------------|
| HEX          | Ghost    | 60    | 100      | 15 | Deals 50% more damage if the opponent has a status condition   |
| ELECTRO BALL | Electric | 55    | 95       | 20 | High critical hit rate (RAZOR LEAF clone)                      |
| WILL-O-WISP  | Fire     | -     | 70       | 15 | Inflicts BURN                                                  |


## Type changes

Move type changes are primarily meant to give STAB options to Mons who were lacking them. Notably:
- CUT becomes Bug-type, providing a viable early-game Bug-type move and a decent coverage option to check Psychic-types.
- RAZOR WIND becomes a weaker Bug-type HYPER BEAM, which due to Gen 1 mechanics can skip the recharge turn if it KOes the opponent.
- STRUGGLE takes the unused Bird type to ignore resistances and immunities to Normal-type moves.


| Move         | Type                    | Power | Accuracy       | PP | Additional notes                                                            |
|--------------|-------------------------|-------|----------------|----|-----------------------------------------------------------------------------|
| CUT          | ~~Normal~~ **Bug**      | 50    | 95             | ~~30~~ **25** |                                                                  |
| RAZOR WIND   | ~~Normal~~ **Bug**      | 80    | ~~75~~ **90**  | 15 | **Now needs to recharge one turn after attacking instead of charging before (same as HYPER BEAM)**     |
| GUST         | ~~Normal~~ **Flying**   | 40    | 100            | 35 |                                                                             |
| KARATE CHOP  | ~~Normal~~ **Fighting** | 50    | ~~100~~ **95** | 25 |                                                                             |
| SLAM         | ~~Normal~~ **Dragon**   | 80    | ~~75~~ **90**  | 20 |                                                                             |
| STRUGGLE     | ~~Normal~~ **Bird**     | 50    | 100            | 10 | Bird-type allows STRUGGLE to ignore resistances and immunities              |


## Other changes

Most other changes were made to increase the viability of some subpar moves, or to give them a niche.
In rare cases moves were nerfed, most notably DIG.


| Move         | Type     | Power            | Accuracy       | PP            | Additional notes                                               |
|--------------|----------|------------------|----------------|---------------|----------------------------------------------------------------|
| ABSORB       | Grass    | ~~20~~ **30**    | 100            | 20            |                                                                |
| MEGA DRAIN   | Grass    | ~~40~~ **60**    | 100            | 10            |                                                                |
| SOLARBEAM    | Grass    | ~~120~~ **140**  | 100            | 10            | Power now on par with SKY ATTACK                               |
| FIRE SPIN    | Fire     | 15               | ~~70~~ **75**  | 15            |                                                                |
| WATERFALL    | Water    | 80               | 100            | 15            | **Now has a 10% chance to make the opponent flinch**           |
| LEECH LIFE   | Bug      | ~~20~~ **30**    | 100            | 15            |                                                                |
| TWINEEDLE    | Bug      | ~~25~~ **30**    | 100            | 20            |                                                                |
| PIN MISSILE  | Bug      | ~~14~~ **20**    | ~~85~~ **95**  | ~~20~~ **15** |                                                                |
| POISON STING | Poison   | ~~15~~ **25**    | 100            | 35            |                                                                |
| SMOG         | Poison   | ~~20~~ **25**    | ~~70~~ **85**  | 20            |                                                                |
| ACID         | Poison   | ~~40~~ **65**    | 100            | ~~30~~ **20** |                                                                |
| SLUDGE       | Poison   | ~~65~~ **85**    | 100            | ~~20~~ **15** |                                                                |
| ROCK THROW   | Rock     | 50               | ~~65~~ **85**  | 15            |                                                                |
| BONEMERANG   | Ground   | ~~50~~ **60**    | 90             | 10            |                                                                |
| DIG          | Ground   | ~~100~~ **70**   | 100            | ~~10~~ **15** |                                                                |
| WING ATTACK  | Flying   | ~~35~~ **60**    | 100            | ~~35~~ **25** |                                                                |
| SKY ATTACK   | Flying   | 140              | ~~90~~ **100** | ~~5~~ **10**  |                                                                |
| KINESIS      | Psychic  | -                | 80             | 15            | ~~Lowers opponent's Accuracy~~ **Increases own Special**       |
| LICK         | Ghost    | ~~20~~ **25**    | 100            | ~~30~~ **25** |                                                                |
| FURY ATTACK  | Normal   | 15               | ~~85~~ **95**  | 20            |                                                                |
| FURY SWIPES  | Normal   | 18               | ~~80~~ **90**  | 15            |                                                                |
| DIZZY PUNCH  | Normal   | ~~70~~ **80**    | 100            | 10            | **Now has a 10% chance to confuse the opponent**               |
| SKULL BASH   | Normal   | ~~100~~ **120**  | 100            | 15            |                                                                |
| DOUBLE EDGE  | Normal   | ~~100~~ **120**  | 100            | ~~15~~ **10** |                                                                |
| MEGA KICK    | Normal   | 120              | ~~75~~ **85**  | 5             |                                                                |
| ROAR         | Normal   | -                | ~~100~~ **85** | 20            |                                                                |















