# Immersive Gambling - Phase 2: Coin Minting System

## Overview

Implement an industrial coin minting pipeline using Immersive Engineering machinery. Coins are manufactured products, not hand-crafted recipes, following real metallurgical principles.

---

## Design Summary

### Production Flow (3 Stages)
```
Stage 1: BLANKING (Metal Press + Blank Mold)
  Ingot → Coin Blank

Stage 2: ANNEALING (Alloy Kiln + Coke Dust)
  Coin Blank + Coke Dust → Annealed Blank

Stage 3: STAMPING (Metal Press + Coin Die)
  Annealed Blank + Die → Finished Coin
  (Die loses 1 durability per use)
```

### Materials Philosophy
- **No iron or steel** in any coin production
- **Coke dust** as the only flux (reducing atmosphere)
- **Slag + creosote + treated wood** for tooling
- **Carbon-ceramic dies** with high durability (1000 uses)

---

## New Items to Register

### Intermediate Items (6 total)
| Item ID | Description | Stack Size |
|---------|-------------|------------|
| `copper_blank` | Raw copper disc | 64 |
| `nickel_blank` | Raw nickel disc | 64 |
| `silver_blank` | Raw silver disc | 64 |
| `annealed_copper_blank` | Heat-treated copper blank | 64 |
| `annealed_nickel_blank` | Heat-treated nickel blank | 64 |
| `annealed_silver_blank` | Heat-treated silver blank | 64 |

### Tooling Items (4 total)
| Item ID | Description | Durability |
|---------|-------------|------------|
| `blank_mold` | Mold for pressing blanks | None (reusable like IE molds) |
| `copper_coin_die` | Stamps copper coins | 1000 |
| `nickel_coin_die` | Stamps nickel coins | 1000 |
| `silver_coin_die` | Stamps silver coins | 1000 |

---

## Task List

### Task 1: Register New Items in Java

**File:** `src/main/java/com/zhintze/immersivegambling/ImmersiveGambling.java`

Add DeferredItem registrations for:
- 6 intermediate blank items
- 1 blank mold (no durability)
- 3 coin dies (damageable items with 1000 durability)

```java
// Intermediate blanks
public static final DeferredItem<Item> COPPER_BLANK = ITEMS.registerSimpleItem("copper_blank");
public static final DeferredItem<Item> NICKEL_BLANK = ITEMS.registerSimpleItem("nickel_blank");
public static final DeferredItem<Item> SILVER_BLANK = ITEMS.registerSimpleItem("silver_blank");
public static final DeferredItem<Item> ANNEALED_COPPER_BLANK = ITEMS.registerSimpleItem("annealed_copper_blank");
public static final DeferredItem<Item> ANNEALED_NICKEL_BLANK = ITEMS.registerSimpleItem("annealed_nickel_blank");
public static final DeferredItem<Item> ANNEALED_SILVER_BLANK = ITEMS.registerSimpleItem("annealed_silver_blank");

// Tooling
public static final DeferredItem<Item> BLANK_MOLD = ITEMS.registerSimpleItem("blank_mold");
public static final DeferredItem<Item> COPPER_COIN_DIE = ITEMS.registerItem("copper_coin_die",
    () -> new Item(new Item.Properties().durability(1000)));
public static final DeferredItem<Item> NICKEL_COIN_DIE = ITEMS.registerItem("nickel_coin_die",
    () -> new Item(new Item.Properties().durability(1000)));
public static final DeferredItem<Item> SILVER_COIN_DIE = ITEMS.registerItem("silver_coin_die",
    () -> new Item(new Item.Properties().durability(1000)));
```

### Task 2: Create Item Models (10 JSON files)

**Directory:** `assets/immersive_gambling/models/item/`

Files to create:
1. `copper_blank.json`
2. `nickel_blank.json`
3. `silver_blank.json`
4. `annealed_copper_blank.json`
5. `annealed_nickel_blank.json`
6. `annealed_silver_blank.json`
7. `blank_mold.json`
8. `copper_coin_die.json`
9. `nickel_coin_die.json`
10. `silver_coin_die.json`

### Task 3: Create Item Textures (10 PNG files)

**Directory:** `assets/immersive_gambling/textures/item/`

Placeholder textures (16x16):
- Blanks: Simple flat discs (copper/gray/silver tints)
- Annealed blanks: Same with slight glow/heat effect
- Blank mold: Square mold with circular cavity
- Dies: Cylindrical stamps with embossed design

### Task 4: Update Language File

**File:** `assets/immersive_gambling/lang/en_us.json`

Add translations:
```json
{
  "item.immersive_gambling.copper_blank": "Copper Blank",
  "item.immersive_gambling.nickel_blank": "Nickel Blank",
  "item.immersive_gambling.silver_blank": "Silver Blank",
  "item.immersive_gambling.annealed_copper_blank": "Annealed Copper Blank",
  "item.immersive_gambling.annealed_nickel_blank": "Annealed Nickel Blank",
  "item.immersive_gambling.annealed_silver_blank": "Annealed Silver Blank",
  "item.immersive_gambling.blank_mold": "Coin Blank Mold",
  "item.immersive_gambling.copper_coin_die": "Copper Coin Die",
  "item.immersive_gambling.nickel_coin_die": "Nickel Coin Die",
  "item.immersive_gambling.silver_coin_die": "Silver Coin Die"
}
```

### Task 5: Create Tooling Crafting Recipes (4 recipes)

**Directory:** `data/immersive_gambling/recipe/`

**blank_mold.json** - Crafted from slag and treated wood:
```json
{
  "type": "minecraft:crafting_shaped",
  "pattern": [
    "STS",
    "T T",
    "STS"
  ],
  "key": {
    "S": { "tag": "c:slags" },
    "T": { "item": "immersiveengineering:treated_wood_horizontal" }
  },
  "result": {
    "id": "immersive_gambling:blank_mold"
  }
}
```

**copper_coin_die.json** - Carbon-ceramic die:
```json
{
  "type": "minecraft:crafting_shaped",
  "pattern": [
    "SCS",
    "CRC",
    "SCS"
  ],
  "key": {
    "S": { "tag": "c:slags" },
    "C": { "item": "immersiveengineering:coal_cite" },
    "R": { "tag": "c:dusts/redstone" }
  },
  "result": {
    "id": "immersive_gambling:copper_coin_die"
  }
}
```

**nickel_coin_die.json** - Incorporates lead for damping:
```json
{
  "type": "minecraft:crafting_shaped",
  "pattern": [
    "SCS",
    "LRL",
    "SCS"
  ],
  "key": {
    "S": { "tag": "c:slags" },
    "C": { "item": "immersiveengineering:coal_coke" },
    "L": { "tag": "c:ingots/lead" },
    "R": { "tag": "c:dusts/redstone" }
  },
  "result": {
    "id": "immersive_gambling:nickel_coin_die"
  }
}
```

**silver_coin_die.json** - Highest precision:
```json
{
  "type": "minecraft:crafting_shaped",
  "pattern": [
    "SCS",
    "CRC",
    "SCS"
  ],
  "key": {
    "S": { "tag": "c:slags" },
    "C": { "item": "immersiveengineering:coal_coke" },
    "R": { "item": "minecraft:redstone_block" }
  },
  "result": {
    "id": "immersive_gambling:silver_coin_die"
  }
}
```

### Task 6: Create Stage 1 Recipes - Blanking (Metal Press)

**Directory:** `data/immersive_gambling/recipe/metalpress/`

**copper_blank.json**:
```json
{
  "type": "immersiveengineering:metal_press",
  "energy": 1200,
  "input": {
    "tag": "c:ingots/copper"
  },
  "mold": "immersive_gambling:blank_mold",
  "result": {
    "id": "immersive_gambling:copper_blank",
    "count": 4
  }
}
```

**nickel_blank.json**:
```json
{
  "type": "immersiveengineering:metal_press",
  "energy": 1600,
  "input": {
    "tag": "c:ingots/nickel"
  },
  "mold": "immersive_gambling:blank_mold",
  "result": {
    "id": "immersive_gambling:nickel_blank",
    "count": 4
  }
}
```

**silver_blank.json**:
```json
{
  "type": "immersiveengineering:metal_press",
  "energy": 2000,
  "input": {
    "tag": "c:ingots/silver"
  },
  "mold": "immersive_gambling:blank_mold",
  "result": {
    "id": "immersive_gambling:silver_blank",
    "count": 4
  }
}
```

### Task 7: Create Stage 2 Recipes - Annealing (Alloy Kiln)

**Directory:** `data/immersive_gambling/recipe/alloysmelter/`

**annealed_copper_blank.json**:
```json
{
  "type": "immersiveengineering:alloy",
  "input0": {
    "item": "immersive_gambling:copper_blank"
  },
  "input1": {
    "item": "immersiveengineering:dust_coke"
  },
  "result": {
    "id": "immersive_gambling:annealed_copper_blank"
  },
  "time": 100
}
```

**annealed_nickel_blank.json**:
```json
{
  "type": "immersiveengineering:alloy",
  "input0": {
    "item": "immersive_gambling:nickel_blank"
  },
  "input1": {
    "item": "immersiveengineering:dust_coke"
  },
  "result": {
    "id": "immersive_gambling:annealed_nickel_blank"
  },
  "time": 150
}
```

**annealed_silver_blank.json**:
```json
{
  "type": "immersiveengineering:alloy",
  "input0": {
    "item": "immersive_gambling:silver_blank"
  },
  "input1": {
    "item": "immersiveengineering:dust_coke"
  },
  "result": {
    "id": "immersive_gambling:annealed_silver_blank"
  },
  "time": 200
}
```

### Task 8: Create Stage 3 Recipes - Stamping (Metal Press with Dies)

**Directory:** `data/immersive_gambling/recipe/metalpress/`

**Note:** IE Metal Press molds don't have durability - the die durability will need custom handling. For Phase 2, we'll use the die as a catalyst mold (not consumed). Die durability will be added in a future phase with custom recipe handling.

**copper_coin.json**:
```json
{
  "type": "immersiveengineering:metal_press",
  "energy": 800,
  "input": {
    "item": "immersive_gambling:annealed_copper_blank"
  },
  "mold": "immersive_gambling:copper_coin_die",
  "result": {
    "id": "immersive_gambling:copper_coin"
  }
}
```

**nickel_coin.json**:
```json
{
  "type": "immersiveengineering:metal_press",
  "energy": 1000,
  "input": {
    "item": "immersive_gambling:annealed_nickel_blank"
  },
  "mold": "immersive_gambling:nickel_coin_die",
  "result": {
    "id": "immersive_gambling:nickel_coin"
  }
}
```

**silver_coin.json**:
```json
{
  "type": "immersiveengineering:metal_press",
  "energy": 1200,
  "input": {
    "item": "immersive_gambling:annealed_silver_blank"
  },
  "mold": "immersive_gambling:silver_coin_die",
  "result": {
    "id": "immersive_gambling:silver_coin"
  }
}
```

### Task 9: Update Creative Tab

**File:** `ImmersiveGambling.java`

Add all new items to the creative tab in logical order:
1. Gambling machines
2. Coins
3. Tooling (mold, dies)
4. Intermediates (blanks, annealed blanks)

### Task 10: Update JEI Plugin

**File:** `jei/ImmersiveGamblingJeiPlugin.java`

Add info pages for:
- Blank mold (explains blanking process)
- Coin dies (explains stamping, mentions durability)
- Intermediate items (explains production flow)

### Task 11: Build and Test

- Run `./gradlew clean build`
- Verify recipes appear in JEI
- Test full production chain in-game

---

## Recipe Summary

### Stage 1: Blanking (Metal Press)
| Input | Mold | Output | Energy |
|-------|------|--------|--------|
| 1 Copper Ingot | Blank Mold | 4 Copper Blanks | 1200 FE |
| 1 Nickel Ingot | Blank Mold | 4 Nickel Blanks | 1600 FE |
| 1 Silver Ingot | Blank Mold | 4 Silver Blanks | 2000 FE |

### Stage 2: Annealing (Alloy Kiln)
| Input 1 | Input 2 | Output | Time |
|---------|---------|--------|------|
| 1 Copper Blank | 1 Coke Dust | 1 Annealed Copper Blank | 100t |
| 1 Nickel Blank | 1 Coke Dust | 1 Annealed Nickel Blank | 150t |
| 1 Silver Blank | 1 Coke Dust | 1 Annealed Silver Blank | 200t |

### Stage 3: Stamping (Metal Press)
| Input | Die | Output | Energy |
|-------|-----|--------|--------|
| 1 Annealed Copper Blank | Copper Die | 1 Copper Coin | 800 FE |
| 1 Annealed Nickel Blank | Nickel Die | 1 Nickel Coin | 1000 FE |
| 1 Annealed Silver Blank | Silver Die | 1 Silver Coin | 1200 FE |

---

## Production Economics

### Coins per Ingot
- **Copper**: 1 ingot → 4 blanks → 4 annealed → 4 coins
- **Nickel**: 1 ingot → 4 blanks → 4 annealed → 4 coins
- **Silver**: 1 ingot → 4 blanks → 4 annealed → 4 coins

### Resource Costs per 4 Coins
| Coin Type | Metal | Coke Dust | Energy | Die Wear |
|-----------|-------|-----------|--------|----------|
| Copper | 1 ingot | 4 | 4,400 FE | 4/1000 |
| Nickel | 1 ingot | 4 | 5,600 FE | 4/1000 |
| Silver | 1 ingot | 4 | 6,800 FE | 4/1000 |

---

## File Summary

### New Files to Create (27 total)

**Java Updates:**
1. `ImmersiveGambling.java` - Add 10 new item registrations

**Models (10 files):**
2-11. `models/item/*.json` for all new items

**Textures (10 files):**
12-21. `textures/item/*.png` for all new items

**Recipes (13 files):**
22. `recipe/blank_mold.json`
23. `recipe/copper_coin_die.json`
24. `recipe/nickel_coin_die.json`
25. `recipe/silver_coin_die.json`
26. `recipe/metalpress/copper_blank.json`
27. `recipe/metalpress/nickel_blank.json`
28. `recipe/metalpress/silver_blank.json`
29. `recipe/alloysmelter/annealed_copper_blank.json`
30. `recipe/alloysmelter/annealed_nickel_blank.json`
31. `recipe/alloysmelter/annealed_silver_blank.json`
32. `recipe/metalpress/copper_coin.json`
33. `recipe/metalpress/nickel_coin.json`
34. `recipe/metalpress/silver_coin.json`

**Language:**
35. Update `en_us.json` with 10 new translations

---

## Notes

- IE molds don't natively support durability - dies are treated as catalysts for now
- Die durability (1000 uses) is registered but consumption requires custom recipe handling (Phase 3)
- Silver uses `c:ingots/silver` tag (provided by IE)
- Nickel uses `c:ingots/nickel` tag (provided by IE)
- Coke dust is `immersiveengineering:dust_coke`
- Slag tag is `c:slags` or use `immersiveengineering:slag`

---

## Future Enhancements (Phase 3+)

1. **Die Durability Consumption**: Custom Metal Press recipe type that damages the die
2. **Lead Integration**: Nickel die recipe uses lead for impact damping
3. **Precision Scaling**: Higher-tier dies produce coins with bonus effects
4. **Creosote Treatment**: Treated dies last longer
5. **Authority Marks**: Redstone-infused dies add authentication component to coins
