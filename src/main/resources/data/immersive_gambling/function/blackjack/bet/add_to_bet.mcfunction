# Add to existing bet if items match exactly
# Called from place_bet_item.mcfunction
# Scoreboard inputs: #held_count, #max_bet

# Check if items match (exact NBT comparison)
function immersive_gambling:blackjack/bet/check_item_match

# If items don't match, show error
execute if score #items_match ig.bool matches 0 run return run tellraw @n[tag=clicked] {"color":"red","text":"You can only add more of the same item!"}

# Get current bet count
execute store result score #current_bet ig.math_temp run data get entity @s item.count

# Check if already at max
execute if score #current_bet ig.math_temp >= #max_bet ig.math_temp run return run tellraw @n[tag=clicked] {"color":"red","text":"Bet is already at maximum!"}

# Calculate how much more we can add
scoreboard players operation #room_left ig.math_temp = #max_bet ig.math_temp
scoreboard players operation #room_left ig.math_temp -= #current_bet ig.math_temp

# Calculate amount to add (min of held count and room left)
scoreboard players operation #add_count ig.math_temp = #held_count ig.math_temp
execute if score #add_count ig.math_temp > #room_left ig.math_temp run scoreboard players operation #add_count ig.math_temp = #room_left ig.math_temp

# Calculate new bet total
scoreboard players operation #new_bet ig.math_temp = #current_bet ig.math_temp
scoreboard players operation #new_bet ig.math_temp += #add_count ig.math_temp

# Update bet count (use byte type to match Minecraft item format)
execute store result entity @s item.count byte 1 run scoreboard players get #new_bet ig.math_temp

# Remove items from player's hand
data modify storage immersive_gambling:temp player_item set from entity @n[tag=clicked] SelectedItem
scoreboard players operation #new_hand_count ig.math_temp = #held_count ig.math_temp
scoreboard players operation #new_hand_count ig.math_temp -= #add_count ig.math_temp

# If all items used, clear the slot
execute if score #new_hand_count ig.math_temp matches ..0 as @n[tag=clicked] run item replace entity @s weapon.mainhand with minecraft:air

# If some items remain, update the count
execute if score #new_hand_count ig.math_temp matches 1.. run function immersive_gambling:blackjack/bet/update_player_hand

# Remove ready status since bet changed
tag @s remove 777.ready

# Effects
playsound minecraft:entity.pig.saddle player @a ~ ~ ~ 1 2
particle minecraft:composter ~ ~-0.02 ~ 0.1 0.1 0.1 0 3
