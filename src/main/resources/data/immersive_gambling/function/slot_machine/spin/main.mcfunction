scoreboard players add @s ig.slot_time 1

execute if score @s ig.slot_time matches 28 run function immersive_gambling:slot_machine/spin/start_looping

execute if score @s ig.slot_time matches 44 run function immersive_gambling:slot_machine/spin/random_loop

execute if score @s ig.slot_time matches 84 run function immersive_gambling:slot_machine/spin/decide

execute if score @s ig.slot_time matches 110 run function immersive_gambling:slot_machine/rewards/check

execute if score @s ig.slot_time matches 40..90 run particle minecraft:crit ~ ~0.35 ~ 0 0 0 0.4 1 normal @a

scoreboard players add @s ig.variant 1
execute if score @s ig.slot_time matches 50..90 if score @s ig.variant matches 4.. run function immersive_gambling:slot_machine/spin/variant