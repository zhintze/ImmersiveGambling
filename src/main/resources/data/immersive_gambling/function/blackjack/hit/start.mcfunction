execute as @n[tag=ig.bj.dealer] if entity @s[tag=777.dealing] run return 0
execute unless entity @s[tag=777.in_game] run return 0
execute unless entity @s[tag=777.active] run return 0

execute if score @s ig.bj.hit_counter matches 7.. run return run tellraw @a[tag=clicked] {"color":"red","text":"You have the maximum amount of cards!"}

function immersive_gambling:blackjack/dealer/chat/hit

tag @s add 777.hit_temp
function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "dealer", cmd: "function immersive_gambling:blackjack/hit/as_dealer"}
tag @s remove 777.hit_temp

scoreboard players add @s ig.bj.hit_counter 1

playsound minecraft:block.copper_bulb.place player @a ~ ~ ~ 1 1.25