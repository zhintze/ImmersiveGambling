# Test CHERRY/PLUM win (Tier 2 - Medium)
execute as @e[type=interaction,tag=slot_machine,limit=1,sort=nearest] at @s run scoreboard players set @s ig.win_tier 2
execute as @e[type=interaction,tag=slot_machine,limit=1,sort=nearest] at @s run function immersive_gambling:slot_machine/spin/win
execute as @e[type=interaction,tag=slot_machine,limit=1,sort=nearest] at @s run function immersive_gambling:slot_machine/rewards/win
tellraw @a {"text":"Testing CHERRY/PLUM (Tier 2 - Medium)","color":"green"}
