execute on passengers if data entity @s item{count:1,id:"minecraft:barrier"} run return run function immersive_gambling:blackjack/bet/no_bet_here

execute on passengers if entity @s[tag=777.ready] run return run function immersive_gambling:blackjack/ready/no
execute on passengers run function immersive_gambling:blackjack/ready/yes

scoreboard players set #invalid ig.math_temp 0

tag @s add 777.final_test
# this will run if there is a bet with an item that isnt readied
execute as @e[type=item_display,tag=ig.bj.bet_item] if score @s ig.real_id = @n[tag=777.final_test] ig.real_id unless data entity @s[tag=!777.ready] item{count:1,id:"minecraft:barrier"} at @s run scoreboard players set #invalid ig.math_temp 1
tag @s remove 777.final_test

execute if score #invalid ig.math_temp matches 1 run return run function immersive_gambling:blackjack/bet/there_is_a_bet_not_ready

tag @s add 777.has_bet

#say all bets confirmed, dealing hand

function immersive_gambling:blackjack/dealer/chat/start_deal

function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "dealer", cmd: "function immersive_gambling:blackjack/dealer/create_deck"}