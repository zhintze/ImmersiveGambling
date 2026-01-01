# Update player's held item count after placing bet
# Requires: storage immersive_gambling:temp player_item, #new_hand_count ig.math_temp

# Update count in storage (use byte type to match Minecraft item format)
execute store result storage immersive_gambling:temp player_item.count byte 1 run scoreboard players get #new_hand_count ig.math_temp

# Replace player's held item with modified version
item replace entity @n[tag=clicked] weapon.mainhand from storage immersive_gambling:temp player_item
