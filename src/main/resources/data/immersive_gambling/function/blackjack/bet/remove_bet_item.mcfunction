# Remove bet and return items to player
# Handles stacked bets by spawning items in batches of 64

# If no bet (barrier placeholder), do nothing
execute if data entity @s item{id:"minecraft:barrier"} run return 0

# Remove ready status
tag @s remove 777.ready

# Get bet count and store item for spawning
execute store result score #spawn_remaining ig.math_temp run data get entity @s item.count
data modify storage immersive_gambling:temp reward_item set from entity @s item

# Spawn items in batches
function immersive_gambling:blackjack/bet/spawn_items_loop

# Reset bet spot to barrier placeholder
data merge entity @s {item:{id:"minecraft:barrier",count:1,components:{"minecraft:custom_model_data":6903}}}

# Effects
playsound minecraft:entity.item.pickup player @a ~ ~ ~ 1 0.7
particle minecraft:white_smoke ~ ~0.02 ~ 0 0 0 0.025 3

# Remove has_bet tag from interaction
execute on vehicle run tag @s remove 777.has_bet
