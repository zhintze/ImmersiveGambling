scoreboard players add @s ig.win_time 1

# Payout timing based on tier
execute if score @s ig.win_tier matches 4 if score @s ig.win_time matches 30 positioned ~ ~1 ~ run function immersive_gambling:slot_machine/rewards/find_tier
execute if score @s ig.win_tier matches 4 if score @s ig.win_time matches 60 positioned ~ ~1 ~ run function immersive_gambling:slot_machine/rewards/find_tier
execute if score @s ig.win_tier matches 4 if score @s ig.win_time matches 90 positioned ~ ~1 ~ run function immersive_gambling:slot_machine/rewards/find_tier
execute if score @s ig.win_tier matches 3 if score @s ig.win_time matches 25 positioned ~ ~1 ~ run function immersive_gambling:slot_machine/rewards/find_tier
execute if score @s ig.win_tier matches 3 if score @s ig.win_time matches 50 positioned ~ ~1 ~ run function immersive_gambling:slot_machine/rewards/find_tier
execute if score @s ig.win_tier matches 2 if score @s ig.win_time matches 20 positioned ~ ~1 ~ run function immersive_gambling:slot_machine/rewards/find_tier
execute if score @s ig.win_tier matches 1 if score @s ig.win_time matches 15 positioned ~ ~1 ~ run function immersive_gambling:slot_machine/rewards/find_tier

# Tier 4 (Jackpot): Full particles
execute if score @s ig.win_tier matches 4 run particle minecraft:totem_of_undying ~ ~0.25 ~ 0 0 0 1 3 normal @a
execute if score @s ig.win_tier matches 4 run particle minecraft:firework ~ ~0.25 ~ 0 0 0 1 1 normal @a
execute if score @s ig.win_tier matches 4 run particle minecraft:end_rod ~ ~0.25 ~ 0 0 0 1.25 2 normal @a
execute if score @s ig.win_tier matches 4 run particle minecraft:flash ~ ~ ~ 10 10 10 0 1 normal @a

# Tier 3 (Large): Reduced particles
execute if score @s ig.win_tier matches 3 run particle minecraft:totem_of_undying ~ ~0.25 ~ 0 0 0 0.8 2 normal @a
execute if score @s ig.win_tier matches 3 run particle minecraft:firework ~ ~0.25 ~ 0 0 0 0.8 1 normal @a
execute if score @s ig.win_tier matches 3 run particle minecraft:end_rod ~ ~0.25 ~ 0 0 0 1 1 normal @a

# Tier 2 (Medium): Happy villager sparkles in radius
execute if score @s ig.win_tier matches 2 run particle minecraft:happy_villager ~0.5 ~0.5 ~ 0 0 0 0 1 normal @a
execute if score @s ig.win_tier matches 2 run particle minecraft:happy_villager ~-0.5 ~0.5 ~ 0 0 0 0 1 normal @a
execute if score @s ig.win_tier matches 2 run particle minecraft:happy_villager ~ ~0.5 ~0.5 0 0 0 0 1 normal @a
execute if score @s ig.win_tier matches 2 run particle minecraft:happy_villager ~ ~0.5 ~-0.5 0 0 0 0 1 normal @a

# Tier 1 (Small): Fewer happy villager sparkles spread across 25 ticks
execute if score @s ig.win_tier matches 1 if score @s ig.win_time matches 1 run particle minecraft:happy_villager ~0.4 ~0.4 ~ 0 0 0 0 1 normal @a
execute if score @s ig.win_tier matches 1 if score @s ig.win_time matches 6 run particle minecraft:happy_villager ~-0.4 ~0.4 ~ 0 0 0 0 1 normal @a
execute if score @s ig.win_tier matches 1 if score @s ig.win_time matches 12 run particle minecraft:happy_villager ~ ~0.4 ~0.4 0 0 0 0 1 normal @a
execute if score @s ig.win_tier matches 1 if score @s ig.win_time matches 18 run particle minecraft:happy_villager ~ ~0.4 ~-0.4 0 0 0 0 1 normal @a
execute if score @s ig.win_tier matches 1 if score @s ig.win_time matches 24 run particle minecraft:happy_villager ~0.3 ~0.5 ~0.3 0 0 0 0 1 normal @a

# Cut off sound early for lower tiers
execute if score @s ig.win_tier matches 1 if score @s ig.win_time matches 20 run stopsound @a player minecraft:777.slot_machine.jackpot
execute if score @s ig.win_tier matches 2 if score @s ig.win_time matches 35 run stopsound @a player minecraft:777.slot_machine.jackpot
execute if score @s ig.win_tier matches 3 if score @s ig.win_time matches 60 run stopsound @a player minecraft:777.slot_machine.jackpot

# End timing based on tier
# Tier 4: 120 ticks (6 sec), Tier 3: 75 ticks, Tier 2: 45 ticks, Tier 1: 25 ticks
execute if score @s ig.win_tier matches 4 if score @s ig.win_time matches 120 run function immersive_gambling:slot_machine/rewards/end
execute if score @s ig.win_tier matches 3 if score @s ig.win_time matches 75 run function immersive_gambling:slot_machine/rewards/end
execute if score @s ig.win_tier matches 2 if score @s ig.win_time matches 45 run function immersive_gambling:slot_machine/rewards/end
execute if score @s ig.win_tier matches 1 if score @s ig.win_time matches 25 run function immersive_gambling:slot_machine/rewards/end
