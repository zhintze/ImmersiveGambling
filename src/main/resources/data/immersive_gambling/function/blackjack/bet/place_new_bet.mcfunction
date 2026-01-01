# Place a new bet on empty bet spot
# Called from place_bet_item.mcfunction
# Scoreboard inputs: #held_count, #max_bet

# Calculate amount to place (min of held count and max bet)
scoreboard players operation #place_count ig.math_temp = #held_count ig.math_temp
execute if score #place_count ig.math_temp > #max_bet ig.math_temp run scoreboard players operation #place_count ig.math_temp = #max_bet ig.math_temp

# Copy item from player to bet display
data modify entity @s item set from entity @n[tag=clicked] SelectedItem

# Set the bet count (use byte type to match Minecraft item format)
execute store result entity @s item.count byte 1 run scoreboard players get #place_count ig.math_temp

# Remove items from player's hand
# Store held item to storage, modify count, replace in hand
data modify storage immersive_gambling:temp player_item set from entity @n[tag=clicked] SelectedItem
scoreboard players operation #new_hand_count ig.math_temp = #held_count ig.math_temp
scoreboard players operation #new_hand_count ig.math_temp -= #place_count ig.math_temp

# If all items used, clear the slot
execute if score #new_hand_count ig.math_temp matches ..0 as @n[tag=clicked] run item replace entity @s weapon.mainhand with minecraft:air

# If some items remain, update the count
execute if score #new_hand_count ig.math_temp matches 1.. run function immersive_gambling:blackjack/bet/update_player_hand

# Effects
playsound minecraft:entity.pig.saddle player @a ~ ~ ~ 1 2
particle minecraft:composter ~ ~-0.02 ~ 0.1 0.1 0.1 0 3

# Mark that this spot has a bet
execute on vehicle run tag @s add 777.has_bet
