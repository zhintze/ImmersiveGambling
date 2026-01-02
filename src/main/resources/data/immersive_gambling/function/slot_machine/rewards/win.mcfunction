# Play win sound scaled by tier
# Tier 4 (Jackpot): volume 1.0, pitch 1.0 (full sound)
# Tier 3 (Large): volume 0.7, pitch 0.9 (lower)
# Tier 2 (Medium): volume 0.5, pitch 0.8 (lower)
# Tier 1 (Small): volume 0.3, pitch 0.7 (lowest)
execute if score @s ig.win_tier matches 4 run playsound minecraft:777.slot_machine.jackpot player @a ~ ~ ~ 1 1
execute if score @s ig.win_tier matches 3 run playsound minecraft:777.slot_machine.jackpot player @a ~ ~ ~ 0.7 0.9
execute if score @s ig.win_tier matches 2 run playsound minecraft:777.slot_machine.jackpot player @a ~ ~ ~ 0.5 0.8
execute if score @s ig.win_tier matches 1 run playsound minecraft:777.slot_machine.jackpot player @a ~ ~ ~ 0.3 0.7

tag @s add winning
tag @s remove using

# Announce jackpot wins only
execute if score @s ig.win_tier matches 4 run tag @s add 777.win_temp
execute as @a if score @s ig.real_id = @n[tag=777.win_temp] ig.real_id run tellraw @a ["",{"selector":"@s","bold":true,"color":"gold"},{"text":" JUST WON THE JACKPOT!","bold":true,"color":"yellow"}]
tag @s remove 777.win_temp
