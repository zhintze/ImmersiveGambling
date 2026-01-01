# Immersive Gambling - Phase 1: Rename & Licensing Plan

## Overview
Rename the 777 mod to "Immersive Gambling" as an Immersive Engineering addon, with proper Apache 2.0 licensing and attribution to the original creator (phaic).

---

## Phase 1 Scope

### Naming Convention
- **Mod Name**: Immersive Gambling
- **Mod ID**: `immersive_gambling`
- **Java Package**: `com.zhintze.immersivegambling`
- **Datapack Namespace**: `immersive_gambling`
- **Asset Namespace**: `immersive_gambling`

### License
- Apache 2.0 License
- Attribution to original 777 mod creator (phaic)

---

## Task List

### 1. Add License and Attribution Files
**Files to create:**
- `LICENSE` - Apache 2.0 license text
- `NOTICE` - Attribution to phaic and original 777 mod
- `CREDITS.md` - Detailed credits

### 2. Update gradle.properties
**File:** `gradle.properties`

Change:
```properties
mod_id=mr_777
mod_name=777
mod_license=Apache-2.0
mod_version=2.1.0
mod_group_id=com.mr777
mod_authors=phaic, mooStack
mod_description=All your gambling dreams...
```

To:
```properties
mod_id=immersive_gambling
mod_name=Immersive Gambling
mod_license=Apache-2.0
mod_version=1.0.0
mod_group_id=com.zhintze.immersivegambling
mod_authors=zhintze (Original 777 mod by phaic)
mod_description=An Immersive Engineering addon for industrial coin minting and gambling machines. Based on the 777 mod by phaic.
```

### 3. Rename Java Package Structure
**Directory changes:**
- `src/main/java/com/mr777/` → `src/main/java/com/zhintze/immersivegambling/`

**Files to move and update:**
- `Mr777.java` → `ImmersiveGambling.java`
- `jei/Mr777JeiPlugin.java` → `jei/ImmersiveGamblingJeiPlugin.java`

**Update all internal references:**
- Package declarations
- Import statements
- Class names
- MODID constant

### 4. Update neoforge.mods.toml
**File:** `src/main/resources/META-INF/neoforge.mods.toml`

- Update mod metadata
- Add optional IE dependency for future phases:
```toml
[[dependencies.${mod_id}]]
modId = 'immersiveengineering'
type = 'optional'
versionRange = '[1.21,)'
ordering = 'AFTER'
side = 'BOTH'
```

### 5. Rename Asset Directory
**Directory changes:**
- `src/main/resources/assets/mr_777/` → `src/main/resources/assets/immersive_gambling/`

**Files affected:**
- `lang/en_us.json` - Update translation keys
- `models/item/*.json` - Update texture paths
- `textures/item/*.png` - Move to new location

### 6. Update Language File
**File:** `assets/immersive_gambling/lang/en_us.json`

Update all keys from `item.mr_777.*` to `item.immersive_gambling.*`

### 7. Rename Datapack Namespace
**Directory changes:**
- `src/main/resources/data/777/` → `src/main/resources/data/immersive_gambling/`

**Files requiring internal updates:**
All `.mcfunction` files need namespace updates:
- `777:` → `immersive_gambling:`
- `#777:` → `#immersive_gambling:`

All `.json` files (tags, recipes, loot tables, advancements) need namespace updates.

### 8. Update Item Model Texture References
**Files:** `assets/immersive_gambling/models/item/*.json`

Update texture paths from:
```json
"layer0": "mr_777:item/copper_coin"
```
To:
```json
"layer0": "immersive_gambling:item/copper_coin"
```

### 9. Update Tag References
**Files in:** `data/immersive_gambling/tags/item/`

Update item references from `mr_777:*` to `immersive_gambling:*`

### 10. Update Scoreboard Objective Names
**Files:** All `.mcfunction` files

Update scoreboard names from `777.*` to `ig.*` (shorter for command length):
- `777.odds` → `ig.odds`
- `777.multiplier` → `ig.multiplier`
- `777.win_tier` → `ig.win_tier`
- `777.win_size` → `ig.win_size`
- `777.bool_score` → `ig.bool`
- `777.slot_time` → `ig.slot_time`
- `777.variant` → `ig.variant`
- `777.win_time` → `ig.win_time`
- `777.real_ID` → `ig.real_id`
- `777.total_spins` → `ig.total_spins`
- `777.math_temp` → `ig.math_temp`
- `777.deal_timer` → `ig.deal_timer`
- `777.blackjack.*` → `ig.bj.*`
- `777.scale` → `ig.scale`

### 11. Update Entity Tags
**Files:** All `.mcfunction` files

Update entity tags:
- `slot_temp` → `ig_slot_temp`
- `aj.slot_machine.*` → Keep as-is (Animated Java external reference)
- Other 777-specific tags → `ig_*` prefix

### 12. Update Sound References
**Files:** `.mcfunction` files with playsound commands

Update sound references from `minecraft:777.*` to `minecraft:immersive_gambling.*`
(Or keep vanilla sounds if custom sounds aren't needed)

### 13. Update Recipe References
**Files:** `data/immersive_gambling/recipe/*.json`

Update any namespace references.

### 14. Update Advancement References
**Files:** `data/immersive_gambling/advancement/*.json`

Update criteria and reward function references.

### 15. Clean Build Directory
Remove old build artifacts to prevent conflicts:
- `build/` directory should be cleaned before building

### 16. Update JEI Plugin
**File:** `jei/ImmersiveGamblingJeiPlugin.java`

- Update plugin UID to new namespace
- Update all item references

### 17. Build and Test
- Run `./gradlew clean build`
- Verify no compilation errors
- Copy jar to mooStack libs

---

## File Change Summary

### New Files:
1. `LICENSE` - Apache 2.0
2. `NOTICE` - Attribution
3. `CREDITS.md` - Detailed credits

### Directories to Rename:
1. `src/main/java/com/mr777/` → `src/main/java/com/zhintze/immersivegambling/`
2. `src/main/resources/assets/mr_777/` → `src/main/resources/assets/immersive_gambling/`
3. `src/main/resources/data/777/` → `src/main/resources/data/immersive_gambling/`

### Files to Rename:
1. `Mr777.java` → `ImmersiveGambling.java`
2. `Mr777JeiPlugin.java` → `ImmersiveGamblingJeiPlugin.java`

### Files Requiring Content Updates:
1. `gradle.properties` - Mod metadata
2. `neoforge.mods.toml` - Mod info and dependencies
3. `en_us.json` - Translation keys
4. All `*.mcfunction` files (~80+ files) - Namespace and scoreboard names
5. All `*.json` data files - Namespace references
6. All `models/item/*.json` - Texture paths
7. All `tags/item/*.json` - Item references

---

## Verification Checklist

- [ ] LICENSE file exists with Apache 2.0 text
- [ ] NOTICE file credits phaic as original creator
- [ ] No references to `mr_777` remain in code
- [ ] No references to `777:` remain in datapacks
- [ ] No references to `com.mr777` remain in Java
- [ ] Build completes without errors
- [ ] Mod loads in game (if tested)

---

## Notes

- This is Phase 1 only - no IE integration yet
- Coin recipes remain as-is (creative mode only for now)
- Future Phase 2 will add IE Metal Press recipes
- Future Phase 3 will add intermediate items (blanks, annealed blanks, dies)
