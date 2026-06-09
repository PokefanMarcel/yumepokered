# Trainer AI

Trainer move-choice AI scores the enemy's four move slots, then randomly chooses among the lowest-scoring moves. Lower scores are better. These rules affect move choice only; trainer item use is handled separately.

Before applying any trainer-specific layer, the AI forbids a disabled move and ignores empty move slots.

## Layers

Trainer classes opt into one or more move-choice layers in `data/trainers/move_choices.asm`.

- `1`: Novice
- `2`: Prefer Setup
- `3`: Adept
- `4`: Expert

Layers stack when listed together. For example, `move_choices 1, 3, 4` applies Novice, then Adept, then Expert.

## Novice

Novice heavily discourages a move when one of these conditions is true:

- The move uses `SWITCH_AND_TELEPORT_EFFECT`, such as Whirlwind, Roar, or Teleport, which does nothing in trainer battles.
- The move uses `SPLASH_EFFECT`.
- The move inflicts burn, sleep, poison, or paralysis, and the player's Pokemon already has a major status condition.
- The move uses `DISABLE_EFFECT`, and the player already has a disabled move.
- The move uses `FOCUS_ENERGY_EFFECT`, and the enemy is already getting pumped.
- The move uses `LIGHT_SCREEN_EFFECT`, and the enemy already has Light Screen up.
- The move uses `REFLECT_EFFECT`, and the enemy already has Reflect up.
- The move uses `MIST_EFFECT`, and the enemy is already protected by Mist.
- The move uses `SUBSTITUTE_EFFECT`, and the enemy already has a Substitute.
- The move uses `LEECH_SEED_EFFECT`, and the player is already seeded.
- The move uses `CONFUSION_EFFECT`, such as Confuse Ray or Supersonic, and the player is already confused.
- The move uses `DREAM_EATER_EFFECT`, and the player is not asleep.

## Prefer Setup

Prefer Setup only runs on the first move-choice cycle after the enemy Pokemon is sent out.

It slightly encourages non-damaging moves whose effect ID is in either of these vanilla setup ranges:

- `ATTACK_UP1_EFFECT` through `HAZE_EFFECT`
- `ATTACK_UP2_EFFECT` through `REFLECT_EFFECT`

This includes stat-stage moves, Conversion, Haze, Heal, Transform, and screens.
The rule is based on effect ID after excluding damaging moves.

## Adept

Adept is skipped entirely on the turn after the player voluntarily switches Pokemon.

Adept heavily discourages a move when one of these conditions is true:

- A stat-up move targets an enemy stat that is already at the +6 cap.
- A stat-down move targets a player stat that is already at the -6 cap.
- The move uses `SUBSTITUTE_EFFECT`, and the enemy has less than one quarter of its max HP.
- The move uses `HAZE_EFFECT`, and there are no positive player stat modifiers and no negative enemy stat modifiers to clear.
- The player has a Substitute, and the move uses one of these effects: sleep, poison, paralysis, burn, confusion, stat down by one stage, stat down by two stages, drain HP, Leech Seed, or Dream Eater.
- The move uses `LIGHT_SCREEN_EFFECT`, and the player's last damaging move was Physical.
- The move uses `REFLECT_EFFECT`, `DEFENSE_UP1_EFFECT`, or `DEFENSE_UP2_EFFECT`, and the player's last damaging move was Special.
- The move uses `LEECH_SEED_EFFECT`, and the player is Grass-type.
- The move uses `POISON_EFFECT`, and the player is Poison-type.
- The move uses `BURN_EFFECT`, and the player is Fire-type.
- The move uses `PARALYZE_EFFECT`, is Electric-type, and the player is Ground-type.
- The move is damaging and has no effect because of type immunity.
- The move is a wasteful 0-BP effect, and the enemy has less than one third of its max HP. The affected effects are sleep, poison, paralysis, burn, confusion, Leech Seed, and Disable. Heal and Substitute are intentionally excluded.

Adept applies these softer scoring rules:

- Heal and Explosion are heavily discouraged at full HP, slightly discouraged above half HP, neutral between one third and half HP, and slightly encouraged below one third HP.
- A non-damaging move is slightly discouraged when the player has less than half HP.
- A super-effective damaging move is encouraged.
- A not-very-effective damaging move is discouraged only if the enemy has a better alternative: a damaging move of a different type, Super Fang, or a fixed-damage move.
- A neutral damaging STAB move can be encouraged.
- Fixed-damage moves, encoded with base power `1`, bypass type-effectiveness scoring.

## Expert

Expert heavily discourages a move when one of these conditions is true:

- The move uses `RAGE_EFFECT`, and the enemy is not faster than the player.
- The move uses `RAGE_EFFECT`, and the player's selected move is not a multi-hit or double-hit move.
- The move is Counter, and the player's selected move has 0 base power.
- The move is Counter, and the player's selected move is not Physical.
- The move uses `OHKO_EFFECT`, the enemy is not under X Accuracy, and the enemy is not faster than the player.
- The move uses `EXPLODE_EFFECT`, the player is invulnerable from Fly or Dig, and the enemy is faster.
- The move has 0 base power, the enemy's previous move also had 0 base power, and the move is not Heal or Substitute.
- The player is protected by Mist, and the move lowers one of the player's stats.

Expert applies these softer scoring rules:

- A two-turn charge move is discouraged when the enemy is paralyzed or confused.
- Dig or Fly is discouraged when the player also selected Dig or Fly, the player is not already invulnerable, and the enemy is faster.
- A damaging Physical move can be discouraged if the enemy's Special is higher than its Attack.
- A damaging Special move can be discouraged if the enemy's Attack is higher than its Special.
- A damaging move is discouraged when the player is invulnerable from Fly or Dig and the enemy is faster. Quick Attack and charge-effect moves are exempt.
- After the player switches, status-like effects can receive a random bias so the AI does not always react perfectly to the new Pokemon. The affected effects are sleep, poison, paralysis, burn, confusion, Leech Seed, and Disable.

## Current Progression

The current class assignments use little or no move AI for the simplest early trainers, Novice/Adept behavior for most midgame trainers and type specialists, and Expert behavior for late bosses, Elite Four members, and postgame trainers.
