tag @s add 777.blackjack_find_table_temp
$execute as @e[tag=777.blackjack_entity,tag=ig.bj.$(type),distance=..5] if score @s ig.real_id = @n[tag=777.blackjack_find_table_temp] ig.real_id at @s run $(cmd)
tag @s remove 777.blackjack_find_table_temp