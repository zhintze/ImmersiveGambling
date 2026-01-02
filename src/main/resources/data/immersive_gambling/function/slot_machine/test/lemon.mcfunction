# Test LEMON win (Tier 3 - Large)
execute as @e[type=interaction,tag=slot_machine,limit=1,sort=nearest] at @s run scoreboard players set @s ig.win_tier 3
execute as @e[type=interaction,tag=slot_machine,limit=1,sort=nearest] at @s run function immersive_gambling:slot_machine/spin/win
execute as @e[type=interaction,tag=slot_machine,limit=1,sort=nearest] at @s run function immersive_gambling:slot_machine/rewards/win
tellraw @a {"text":"Testing LEMON (Tier 3 - Large) - win3 animation","color":"gold"}
