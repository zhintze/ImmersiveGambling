# 777 Slot Machine Redesign Plan

## Overview
Redesign the slot machine gambling system with realistic casino-style odds, a new coin betting system, and modded loot integration with Apotheosis and Silent Gear.

---

## Phase 1: Coin System Implementation

### 1.1 Create Coin Items (Java)
**File:** `src/main/java/com/mr777/Mr777.java`

- Add DeferredRegister for Items
- Register 3 new coin items:
  - `copper_coin` - 1x multiplier
  - `nickel_coin` - 2x multiplier
  - `silver_coin` - 3x multiplier
- Add coins to creative tab
- Create placeholder textures (simple colored circles)

### 1.2 Coin Item Models
**Files to create:**
- `assets/mr_777/models/item/copper_coin.json`
- `assets/mr_777/models/item/nickel_coin.json`
- `assets/mr_777/models/item/silver_coin.json`

### 1.3 Coin Textures (Placeholder)
**Files to create:**
- `assets/mr_777/textures/item/copper_coin.png` (copper/orange tint)
- `assets/mr_777/textures/item/nickel_coin.png` (silver/gray tint)
- `assets/mr_777/textures/item/silver_coin.png` (bright silver/white tint)

### 1.4 Language File
**File:** `assets/mr_777/lang/en_us.json`
```json
{
  "item.mr_777.copper_coin": "Copper Coin",
  "item.mr_777.nickel_coin": "Nickel Coin",
  "item.mr_777.silver_coin": "Silver Coin",
  "itemGroup.mr_777.mr_777_tab": "777 Gambling"
}
```

---

## Phase 2: Update Bet System (mcfunctions)

### 2.1 Update Item Tags
**File:** `data/777/tags/item/can_gamble.json`
- Remove all current items (iron block, gold block, etc.)
- Add only: `mr_777:copper_coin`, `mr_777:nickel_coin`, `mr_777:silver_coin`

### 2.2 Create Coin Tier Tags
**File:** `data/777/tags/item/coin_copper.json`
```json
{ "values": ["mr_777:copper_coin"] }
```

**File:** `data/777/tags/item/coin_nickel.json`
```json
{ "values": ["mr_777:nickel_coin"] }
```

**File:** `data/777/tags/item/coin_silver.json`
```json
{ "values": ["mr_777:silver_coin"] }
```

### 2.3 Update check_item.mcfunction
**File:** `data/777/function/slot_machine/gamble/check_item.mcfunction`

Replace bet tier logic:
- Remove `gamble_low` and `gamble_high` checks
- Add coin multiplier detection:
  - Copper coin → `777.multiplier = 1`
  - Nickel coin → `777.multiplier = 2`
  - Silver coin → `777.multiplier = 3`

---

## Phase 3: Restructure Win Rates

### 3.1 New Scoreboard Objective
Add new scoreboard for win tier tracking:
- `777.win_tier` (0=loss, 1=small, 2=medium, 3=large, 4=jackpot)

### 3.2 Update decide.mcfunction
**File:** `data/777/function/slot_machine/spin/decide.mcfunction`

**Remove:**
- All cheater detection code (lines checking for "phaic" and "Bastraction")
- Old odds calculation (1..120 and 1..20)

**New odds calculation:**
```mcfunction
# Generate random number 1-1000 for precise odds
execute store result score @s 777.odds run random value 1..1000

# Determine win tier based on odds:
# 1-300 (30%) = Small win (tier 1)
# 301-400 (10%) = Medium win (tier 2)
# 401-410 (1%) = Large win (tier 3)
# 411 (0.1%) = Jackpot (tier 4)
# 412-1000 (58.9%) = Loss (tier 0)

scoreboard players set @s 777.win_tier 0
execute if score @s 777.odds matches 1..300 run scoreboard players set @s 777.win_tier 1
execute if score @s 777.odds matches 301..400 run scoreboard players set @s 777.win_tier 2
execute if score @s 777.odds matches 401..410 run scoreboard players set @s 777.win_tier 3
execute if score @s 777.odds matches 411 run scoreboard players set @s 777.win_tier 4

# Route to win or lose
execute if score @s 777.win_tier matches 1.. run function 777:slot_machine/spin/win
execute if score @s 777.win_tier matches 0 run function 777:slot_machine/spin/lose
```

### 3.3 Update win.mcfunction
**File:** `data/777/function/slot_machine/spin/win.mcfunction`

- Remove random win_size selection (1-4 equal probability)
- Use `777.win_tier` directly for reward tier
- Keep animation selection logic

---

## Phase 4: New Loot Tables

### 4.1 Small Win Loot Table (30%)
**File:** `data/777/loot_table/slot_machine/small_win.json`

Possible rewards (random selection):
- Apotheosis gem dust (1-3)
- Apotheosis common affix gear (reference loot table)
- Apotheosis uncommon affix gear (reference loot table)
- Cracked gem - random type (1)
- Chipped gem - random type (1)
- Flawed gem - random type (1)
- Iron ingots (4-8)
- Bronze ingots (4-8) - if available, else copper
- Steel ingots (4-8) - if available, else iron
- Brass ingots (4-8) - if available, else gold
- Gold ingots (4-8)

### 4.2 Medium Win Loot Table (10%)
**File:** `data/777/loot_table/slot_machine/medium_win.json`

Possible rewards:
- Diamonds (2-5)
- Apotheosis arcane sands (1-2)
- Apotheosis rare affix gear (reference loot table)
- Apotheosis boss spawner item (1)
- Regular gem - random type (1)
- Flawless gem - random type (1)

### 4.3 Large Win Loot Table (1%)
**File:** `data/777/loot_table/slot_machine/large_win.json`

Possible rewards:
- Apotheosis godforged pearl (1)
- Perfect gem - random type (1)
- Apotheosis epic affix gear (reference loot table)

### 4.4 Jackpot Loot Table (0.1%)
**File:** `data/777/loot_table/slot_machine/jackpot.json`

Possible rewards:
- Apotheosis mythic affix gear (reference loot table)

---

## Phase 5: Multiplier Application

### 5.1 Update Reward Distribution
**File:** `data/777/function/slot_machine/rewards/give_loot.mcfunction` (new)

Apply multiplier to stackable items:
```mcfunction
# Get base loot from loot table
# For each stackable item, multiply count by 777.multiplier

# Example for copper coin (1x): give 1 stack
# Example for nickel coin (2x): give 2 stacks or double count
# Example for silver coin (3x): give 3 stacks or triple count
```

### 5.2 Multiplier Display
Show multiplier in chat when spinning:
- "Spinning with Copper Coin (1x multiplier)..."
- "Spinning with Nickel Coin (2x multiplier)..."
- "Spinning with Silver Coin (3x multiplier)..."

---

## Phase 6: Cleanup & Polish

### 6.1 Remove Old Files
- Delete `data/777/tags/item/gamble_low.json`
- Delete `data/777/tags/item/gamble_high.json`
- Delete `data/777/tags/item/gamble_high.json`

### 6.2 Update Scoreboard Initialization
**File:** `data/777/function/load.mcfunction` (or equivalent)

Add new scoreboards:
```mcfunction
scoreboard objectives add 777.multiplier dummy
scoreboard objectives add 777.win_tier dummy
```

### 6.3 Update JEI Plugin
**File:** `src/main/java/com/mr777/jei/Mr777JeiPlugin.java`

- Add coins to ingredient list
- Update info pages with new odds and coin system explanation

### 6.4 Update Fail Message
**File:** `data/777/function/slot_machine/gamble/fail.mcfunction`

Update error message to list valid coins instead of old items.

---

## Phase 7: Testing Checklist

- [ ] Coins appear in creative tab
- [ ] Coins have placeholder textures
- [ ] Slot machine only accepts coins
- [ ] Copper coin gives 1x rewards
- [ ] Nickel coin gives 2x rewards
- [ ] Silver coin gives 3x rewards
- [ ] ~30% of spins result in small wins
- [ ] ~10% of spins result in medium wins
- [ ] ~1% of spins result in large wins
- [ ] ~0.1% of spins result in jackpots
- [ ] Apotheosis items drop correctly
- [ ] Gem types are randomized
- [ ] JEI shows coins and info

---

## File Summary

### New Files to Create:
1. `src/main/java/com/mr777/registry/ModItems.java` - Item registry
2. `assets/mr_777/models/item/copper_coin.json`
3. `assets/mr_777/models/item/nickel_coin.json`
4. `assets/mr_777/models/item/silver_coin.json`
5. `assets/mr_777/textures/item/copper_coin.png`
6. `assets/mr_777/textures/item/nickel_coin.png`
7. `assets/mr_777/textures/item/silver_coin.png`
8. `assets/mr_777/lang/en_us.json`
9. `data/777/tags/item/coin_copper.json`
10. `data/777/tags/item/coin_nickel.json`
11. `data/777/tags/item/coin_silver.json`
12. `data/777/loot_table/slot_machine/small_win.json`
13. `data/777/loot_table/slot_machine/medium_win.json`
14. `data/777/loot_table/slot_machine/large_win.json`
15. `data/777/loot_table/slot_machine/jackpot.json`
16. `data/777/function/slot_machine/rewards/give_loot.mcfunction`

### Files to Modify:
1. `src/main/java/com/mr777/Mr777.java` - Add item registration
2. `src/main/java/com/mr777/jei/Mr777JeiPlugin.java` - Update JEI
3. `data/777/tags/item/can_gamble.json` - Replace with coins only
4. `data/777/function/slot_machine/gamble/check_item.mcfunction` - Coin detection
5. `data/777/function/slot_machine/spin/decide.mcfunction` - New odds
6. `data/777/function/slot_machine/spin/win.mcfunction` - Use win_tier
7. `data/777/function/slot_machine/gamble/fail.mcfunction` - Update message
8. `data/777/function/slot_machine/rewards/*.mcfunction` - Apply multiplier

### Files to Delete:
1. `data/777/tags/item/gamble_low.json`
2. `data/777/tags/item/gamble_high.json`

---

## Verified Item IDs

### Apotheosis Items
- `apotheosis:gem_dust` - Gem dust crafting material
- `apotheosis:gem_fused_slate` - Secondary gem crafting material
- `apotheosis:gem` - Base gem item (uses purity component for tier)
- `apotheosis:boss_summoner` - Boss spawner item
- `apotheosis:common_material` - Common rarity material
- `apotheosis:uncommon_material` - Uncommon rarity material
- `apotheosis:rare_material` - Rare rarity material
- `apotheosis:epic_material` - Epic rarity material
- `apotheosis:mythic_material` - Mythic rarity material

### Gem Purity Tiers (component values)
- `cracked` - Lowest tier
- `chipped` - Low tier
- `flawed` - Medium-low tier
- `normal` - Medium tier
- `flawless` - High tier
- `perfect` - Highest tier

### Immersive Engineering Ingots
- `immersiveengineering:ingot_steel`
- `immersiveengineering:ingot_constantan`
- `immersiveengineering:ingot_electrum`
- `immersiveengineering:ingot_aluminum`
- `immersiveengineering:ingot_silver`
- `immersiveengineering:ingot_nickel`

### Silent Gear Ingots
- `silentgear:bronze_ingot`
- `silentgear:crimson_iron_ingot`
- `silentgear:blaze_gold_ingot`
- `silentgear:azure_silver_ingot`

### Vanilla Ingots
- `minecraft:iron_ingot`
- `minecraft:gold_ingot`
- `minecraft:copper_ingot`

## Updated Loot Tables

### Small Win (30%) - One random from:
1. `apotheosis:gem_dust` x1-3
2. `apotheosis:common_material` x1
3. `apotheosis:uncommon_material` x1
4. Gem with purity `cracked` (random gem type)
5. Gem with purity `chipped` (random gem type)
6. Gem with purity `flawed` (random gem type)
7. `minecraft:iron_ingot` x4-8
8. `silentgear:bronze_ingot` x4-8
9. `immersiveengineering:ingot_steel` x4-8
10. `immersiveengineering:ingot_constantan` x4-8
11. `minecraft:gold_ingot` x4-8

### Medium Win (10%) - One random from:
1. `minecraft:diamond` x2-5
2. `apotheosis:gem_fused_slate` x1-2
3. `apotheosis:rare_material` x1
4. `apotheosis:boss_summoner` x1
5. Gem with purity `normal` (random gem type)
6. Gem with purity `flawless` (random gem type)

### Large Win (1%) - One random from:
1. `apotheosis:epic_material` x1
2. Gem with purity `perfect` (random gem type)

### Jackpot (0.1%) - One random from:
1. `apotheosis:mythic_material` x1

## Notes

- Coins have no recipes initially (admin/creative only distribution)
- Placeholder textures will be simple colored circles
- Gems require NBT/component data to set purity - will use loot table functions
- Silent Gear random gear integration comes through Apotheosis affix system
- No "brass" ingot exists - using constantan from IE instead
- No "godforged pearl" or "arcane sands" - using gem_fused_slate and rarity materials
