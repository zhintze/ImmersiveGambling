# Spawn items in batches of 64 until #spawn_remaining is 0
# Requires: storage immersive_gambling:temp reward_item contains the item to spawn
# Requires: #spawn_remaining ig.math_temp contains count to spawn
# Must be run at the position where items should spawn

execute if score #spawn_remaining ig.math_temp matches ..0 run return 0

# Calculate batch size (min of 64 and remaining)
scoreboard players set #batch_size ig.math_temp 64
execute if score #spawn_remaining ig.math_temp < #batch_size ig.math_temp run scoreboard players operation #batch_size ig.math_temp = #spawn_remaining ig.math_temp

# Spawn item entity with placeholder
summon item ~ ~0.2 ~ {PickupDelay:2,Motion:[0.0,0.2,0.0],Tags:["ig.new_reward"],Item:{id:"minecraft:stone",count:1}}

# Copy item data from storage
data modify entity @n[type=item,tag=ig.new_reward] Item set from storage immersive_gambling:temp reward_item

# Set the count
execute store result entity @n[type=item,tag=ig.new_reward] Item.count byte 1 run scoreboard players get #batch_size ig.math_temp

# Remove tag
tag @n[type=item,tag=ig.new_reward] remove ig.new_reward

# Subtract from remaining
scoreboard players operation #spawn_remaining ig.math_temp -= #batch_size ig.math_temp

# Recurse if more to spawn
execute if score #spawn_remaining ig.math_temp matches 1.. run function immersive_gambling:blackjack/bet/spawn_items_loop
