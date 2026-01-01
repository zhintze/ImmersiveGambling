# while total >= 22 and we still have soft aces, subtract 10 and consume one soft ace
execute if score @s ig.bj.hand_value matches 22.. if score @s ig.bj.aces_soft matches 1.. run scoreboard players remove @s ig.bj.hand_value 10
execute if score @s ig.bj.hand_value matches 22.. if score @s ig.bj.aces_soft matches 1.. run scoreboard players remove @s ig.bj.aces_soft 1
execute if score @s ig.bj.hand_value matches 22.. if score @s ig.bj.aces_soft matches 1.. run function immersive_gambling:blackjack/bet/soft_fix