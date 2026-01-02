# Generate random number 1-1000 for precise odds
execute store result score @s ig.odds run random value 1..1000

# Determine win tier based on odds:
# 1-2 (0.2%) = Jackpot (tier 4) - 777
# 3-12 (1.0%) = Large win (tier 3) - LEMON
# 13-72 (6.0%) = Medium win (tier 2) - CHERRY/PLUM
# 73-192 (12.0%) = Small win (tier 1) - BAR
# 193-1000 (80.8%) = Loss (tier 0)

scoreboard players set @s ig.win_tier 0
execute if score @s ig.odds matches 1..2 run scoreboard players set @s ig.win_tier 4
execute if score @s ig.odds matches 3..12 run scoreboard players set @s ig.win_tier 3
execute if score @s ig.odds matches 13..72 run scoreboard players set @s ig.win_tier 2
execute if score @s ig.odds matches 73..192 run scoreboard players set @s ig.win_tier 1

execute store result score #rand_sound ig.bool run random value 1..4

execute if score #rand_sound ig.bool matches 1 run playsound minecraft:777.slot_machine.stop player @a ~ ~ ~ 0.75 0.9
execute if score #rand_sound ig.bool matches 2 run playsound minecraft:777.slot_machine.stop player @a ~ ~ ~ 0.75 1
execute if score #rand_sound ig.bool matches 3 run playsound minecraft:777.slot_machine.stop player @a ~ ~ ~ 0.75 1.1
execute if score #rand_sound ig.bool matches 4 run playsound minecraft:777.slot_machine.stop player @a ~ ~ ~ 0.75 1.2

# Route to win or lose based on win_tier
execute if score @s ig.win_tier matches 1.. run function immersive_gambling:slot_machine/spin/win
execute if score @s ig.win_tier matches 0 run function immersive_gambling:slot_machine/spin/lose