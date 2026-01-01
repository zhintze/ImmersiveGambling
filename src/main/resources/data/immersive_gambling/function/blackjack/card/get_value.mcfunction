# say getting value and adding to @n[tag=777.get_value]

# non ace
execute unless score @s ig.bj.card_value matches -1 run scoreboard players operation @n[tag=777.get_value] ig.bj.hand_value += @s ig.bj.card_value

# if ace add 11, track counts
execute if score @s ig.bj.card_value matches -1 run scoreboard players add @n[tag=777.get_value] ig.bj.hand_value 11
execute if score @s ig.bj.card_value matches -1 run scoreboard players add @n[tag=777.get_value] ig.bj.aces_in_hand 1
execute if score @s ig.bj.card_value matches -1 run scoreboard players add @n[tag=777.get_value] ig.bj.aces_soft 1
