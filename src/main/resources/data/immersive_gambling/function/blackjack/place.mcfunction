say placed blackjack
execute at @s positioned 0.0 0 0.0 rotated ~45 0 positioned ^ ^ ^-0.5 align xz facing -0.5 0 -0.5 rotated ~-45 0 positioned as @s run tp @s ~ ~ ~ ~ ~

execute at @s unless block ^1 ^ ^ air run return run function immersive_gambling:blackjack/break
execute at @s unless block ^-1 ^ ^ air run return run function immersive_gambling:blackjack/break

execute store result score @s ig.real_id run data get entity @s UUID[0]

tag @s add placed
execute at @s run setblock ~ ~ ~ minecraft:deepslate_brick_wall
execute at @s run setblock ^1 ^ ^ minecraft:deepslate_brick_wall
execute at @s run setblock ^-1 ^ ^ minecraft:deepslate_brick_wall

execute at @s run function immersive_gambling:blackjack/summon_dealer

scoreboard players operation @n[tag=777.dealer,tag=new] ig.real_id = @s ig.real_id
scoreboard players operation @n[tag=777.dealer_visual,tag=new] ig.real_id = @s ig.real_id

tag @s add 777.temp
execute as @n[tag=777.dealer,tag=new] at @s rotated as @n[tag=777.temp] run tp @s ~ ~ ~ ~ ~
execute as @n[tag=777.dealer_visual,tag=new] at @s rotated as @n[tag=777.temp] run tp @s ~ ~ ~ ~ ~

execute at @s positioned ^ ^ ^ run function immersive_gambling:blackjack/summon_interactions {group: 2}
execute at @s positioned ^0.94 ^ ^ run function immersive_gambling:blackjack/summon_interactions {group: 3}
execute at @s positioned ^-1.005 ^ ^ run function immersive_gambling:blackjack/summon_interactions {group: 1}

execute at @s positioned ^ ^ ^ run function immersive_gambling:blackjack/place_dealer_cards

summon item_display ~ ~0.5 ~ {teleport_duration:0,Tags:["blackjack_model","new"],item:{id:"minecraft:armor_stand",count:1,components:{"minecraft:custom_model_data":6902}}}
execute as @n[type=item_display,tag=blackjack_model,tag=new] at @s rotated as @n[tag=777.temp] positioned 0.0 0 0.0 rotated ~45 0 positioned ^ ^ ^-0.5 align xz facing -0.5 0 -0.5 rotated ~-45 0 positioned as @s run tp @s ~ ~ ~ ~ ~
scoreboard players operation @n[type=item_display,tag=blackjack_model,tag=new] ig.real_id = @s ig.real_id
tag @n[type=item_display,tag=blackjack_model,tag=new] remove new

tag @s remove 777.temp

tag @n[tag=777.dealer,tag=new] remove new
tag @n[tag=777.dealer_visual,tag=new] remove new