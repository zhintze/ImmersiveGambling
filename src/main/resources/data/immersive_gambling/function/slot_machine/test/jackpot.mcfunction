# Test 777 win (Tier 4 - Jackpot)
execute as @e[type=interaction,tag=slot_machine,limit=1,sort=nearest] at @s run scoreboard players set @s ig.win_tier 4
execute as @e[type=interaction,tag=slot_machine,limit=1,sort=nearest] at @s run function immersive_gambling:slot_machine/spin/win
execute as @e[type=interaction,tag=slot_machine,limit=1,sort=nearest] at @s run function immersive_gambling:slot_machine/rewards/win
tellraw @a {"text":"Testing 777 (Tier 4 - Jackpot)","color":"red","bold":true}
