scoreboard players set #bool ig.bool 0
execute on attacker store result score #bool ig.bool if entity @s[tag=clicked]

tag @s add ig_slot_temp
execute if entity @s[tag=slot_machine] if score #bool ig.bool matches 1 at @s as @n[tag=clicked] at @s run function immersive_gambling:slot_machine/gamble/check_item
tag @s remove ig_slot_temp

tag @s add blackjack_temp
execute if entity @s[tag=ig.bj.hit] if score #bool ig.bool matches 1 at @s as @n[tag=clicked] at @s run function immersive_gambling:blackjack/click/hit
execute if entity @s[tag=ig.bj.stand] if score #bool ig.bool matches 1 at @s as @n[tag=clicked] at @s run function immersive_gambling:blackjack/click/stand
execute if entity @s[tag=ig.bj.bet] if score #bool ig.bool matches 1 at @s as @n[tag=clicked] at @s run function immersive_gambling:blackjack/click/bet {mode: "remove"}
execute if entity @s[tag=ig.bj.ready] if score #bool ig.bool matches 1 at @s as @n[tag=clicked] at @s run function immersive_gambling:blackjack/click/ready
tag @s remove blackjack_temp

execute if score #bool ig.bool matches 1 run data remove entity @s attack