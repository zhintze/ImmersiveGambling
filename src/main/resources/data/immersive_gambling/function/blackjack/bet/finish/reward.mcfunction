# Reward player for winning (2x payout - bet returned + equal profit)
# Handles stacked bets

# If no bet (barrier placeholder), do nothing
execute if data entity @s item{id:"minecraft:barrier"} run return 0

# Get bet count
execute store result score #bet_count ig.math_temp run data get entity @s item.count

# Calculate reward (2x bet)
scoreboard players operation #spawn_remaining ig.math_temp = #bet_count ig.math_temp
scoreboard players set #multiplier ig.math_temp 2
scoreboard players operation #spawn_remaining ig.math_temp *= #multiplier ig.math_temp

# Store item for spawning
data modify storage immersive_gambling:temp reward_item set from entity @s item

# Spawn reward items in batches
function immersive_gambling:blackjack/bet/spawn_items_loop

# Reset bet spot to barrier placeholder
data merge entity @s {item:{id:"minecraft:barrier",count:1,components:{"minecraft:custom_model_data":6903}}}

# Effects
playsound minecraft:entity.item.pickup player @a ~ ~ ~ 1 0.7
particle minecraft:white_smoke ~ ~0.02 ~ 0 0 0 0.025 3

# Remove ready status
tag @s remove 777.ready
