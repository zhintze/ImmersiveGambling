# Test BAR win (Tier 1 - Small)
execute as @e[type=interaction,tag=slot_machine,limit=1,sort=nearest] at @s run scoreboard players set @s ig.win_tier 1
execute as @e[type=interaction,tag=slot_machine,limit=1,sort=nearest] at @s run function immersive_gambling:slot_machine/spin/win
execute as @e[type=interaction,tag=slot_machine,limit=1,sort=nearest] at @s run function immersive_gambling:slot_machine/rewards/win
tellraw @a {"text":"Testing BAR (Tier 1 - Small) - win2 animation","color":"yellow"}
