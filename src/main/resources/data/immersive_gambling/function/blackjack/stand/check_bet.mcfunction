tag @s add 777.bet_check
# this will run if there is a bet with an item
execute as @e[type=item_display,tag=ig.bj.bet_item] if score @s ig.real_id = @n[tag=777.bet_check] ig.real_id unless data entity @s item{count:1,id:"minecraft:barrier"} at @s run scoreboard players set #invalid ig.math_temp 1
tag @s remove 777.bet_check