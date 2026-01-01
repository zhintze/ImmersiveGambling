tag @n[tag=blackjack_temp] add 777.blackjack_find_temp
$execute as @e[tag=777.blackjack_entity,tag=ig.bj.$(type)] if score @s ig.bj.group = @n[tag=777.blackjack_find_temp] ig.bj.group if score @s ig.real_id = @n[tag=777.blackjack_find_temp] ig.real_id at @s run $(cmd)
tag @n[tag=blackjack_temp] remove 777.blackjack_find_temp