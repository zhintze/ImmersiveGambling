execute if entity @s[tag=777.dealing] run function immersive_gambling:blackjack/dealer/deal

execute if entity @s[tag=777.finish_hand] run function immersive_gambling:blackjack/dealer/finish_hand/main

execute if score @s ig.bj.reset_timer matches 1.. run scoreboard players remove @s ig.bj.reset_timer 1
execute if score @s ig.bj.reset_timer matches 40 run function immersive_gambling:blackjack/dealer/finish_hand/delay
execute if score @s ig.bj.reset_timer matches 11 run function immersive_gambling:blackjack/reset_flip
execute if score @s ig.bj.reset_timer matches 1 run function immersive_gambling:blackjack/reset_table