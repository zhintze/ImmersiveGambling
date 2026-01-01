# Place or add to bet on the blackjack table
# Supports stacking up to 10x max_stack_size

# Check player is holding an item
execute as @n[tag=clicked] unless items entity @s weapon.mainhand * run return run tellraw @s {"color":"red","text":"You must be holding an item!"}

# Get held item count
execute store result score #held_count ig.math_temp run data get entity @n[tag=clicked] SelectedItem.count

# Get max stack size (default 64 if not specified)
execute store result score #max_stack ig.math_temp run data get entity @n[tag=clicked] SelectedItem.components."minecraft:max_stack_size"
execute if score #max_stack ig.math_temp matches 0 run scoreboard players set #max_stack ig.math_temp 64

# Calculate max bet (10x max stack size)
scoreboard players operation #max_bet ig.math_temp = #max_stack ig.math_temp
scoreboard players set #multiplier ig.math_temp 10
scoreboard players operation #max_bet ig.math_temp *= #multiplier ig.math_temp

# Check if bet spot is empty (has barrier placeholder)
execute if data entity @s item{id:"minecraft:barrier"} run function immersive_gambling:blackjack/bet/place_new_bet
execute unless data entity @s item{id:"minecraft:barrier"} run function immersive_gambling:blackjack/bet/add_to_bet
