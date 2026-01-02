# Stop all animations and reset state
execute as @e[type=interaction,tag=slot_machine,limit=1,sort=nearest] at @s run function immersive_gambling:slot_machine/rewards/end
tellraw @a {"text":"Animations stopped","color":"gray"}
