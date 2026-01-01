tag @s add 777.blackjack_find_temp
$execute as @e[tag=777.blackjack_entity,tag=$(type)] if score @s ig.bj.group matches $(group) if score @s ig.real_id = @n[tag=777.blackjack_find_temp] ig.real_id at @s run $(cmd)
tag @s remove 777.blackjack_find_temp