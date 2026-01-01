# Check if held item matches bet item (exact NBT match excluding count)
# Sets #items_match ig.bool to 1 if match, 0 if no match
# Must be run as the bet item_display entity with @n[tag=clicked] being the player

# Start assuming items don't match
scoreboard players set #items_match ig.bool 0

# Store bet item to storage (from item_display)
data modify storage immersive_gambling:temp bet set from entity @s item

# Store held item to storage (from player)
data modify storage immersive_gambling:temp held set from entity @n[tag=clicked] SelectedItem

# First check: do the item IDs match?
# Copy bet id to compare location
data modify storage immersive_gambling:temp compare_id set from storage immersive_gambling:temp bet.id

# Try to overwrite with held id - if same, returns 0
execute store success score #id_different ig.bool run data modify storage immersive_gambling:temp compare_id set from storage immersive_gambling:temp held.id

# If IDs are different, items don't match - exit early
execute if score #id_different ig.bool matches 1 run return 0

# Second check: do the components match?
# Remove count from both items for component comparison
data remove storage immersive_gambling:temp bet.count
data remove storage immersive_gambling:temp held.count

# Now compare the full items (without count)
data modify storage immersive_gambling:temp compare set from storage immersive_gambling:temp bet
execute store success score #items_different ig.bool run data modify storage immersive_gambling:temp compare set from storage immersive_gambling:temp held

# If no change was made (items_different = 0), items match
execute if score #items_different ig.bool matches 0 run scoreboard players set #items_match ig.bool 1
