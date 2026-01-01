execute if entity @n[tag=ig_slot_temp,tag=using] run return 0
execute if entity @n[tag=ig_slot_temp,tag=winning] run return 0
execute unless items entity @s weapon.mainhand #immersive_gambling:can_gamble run return run function immersive_gambling:slot_machine/gamble/fail

# Set multiplier based on coin type
scoreboard players set @n[tag=ig_slot_temp] ig.multiplier 1
execute if items entity @s weapon.mainhand #immersive_gambling:coin_copper run scoreboard players set @n[tag=ig_slot_temp] ig.multiplier 1
execute if items entity @s weapon.mainhand #immersive_gambling:coin_nickel run scoreboard players set @n[tag=ig_slot_temp] ig.multiplier 2
execute if items entity @s weapon.mainhand #immersive_gambling:coin_silver run scoreboard players set @n[tag=ig_slot_temp] ig.multiplier 3

effect give @s minecraft:hunger 1 2 true

item modify entity @s weapon.mainhand immersive_gambling:remove1

execute store result score #rand_sound ig.bool run random value 1..4

execute if score #rand_sound ig.bool matches 1 run playsound minecraft:777.slot_machine.insert player @a ~ ~ ~ 1 0.8
execute if score #rand_sound ig.bool matches 2 run playsound minecraft:777.slot_machine.insert player @a ~ ~ ~ 1 0.9
execute if score #rand_sound ig.bool matches 3 run playsound minecraft:777.slot_machine.insert player @a ~ ~ ~ 1 1
execute if score #rand_sound ig.bool matches 4 run playsound minecraft:777.slot_machine.insert player @a ~ ~ ~ 1 1.1

execute store result score @s ig.real_id run data get entity @s UUID[0]
execute store result score @n[tag=ig_slot_temp] ig.real_id run data get entity @s UUID[0]

execute as @n[tag=ig_slot_temp] at @s positioned ~ ~-1 ~ run function immersive_gambling:slot_machine/spin/start