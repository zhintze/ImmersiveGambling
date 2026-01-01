execute if entity @s[tag=777.busted] run return 0

execute unless score @s ig.bj.hand_value matches 21 if score @n[tag=777.dealer_temp] ig.bj.hand_value matches 22.. run return run function immersive_gambling:blackjack/bet/finish/beat_dealer

execute if score @s ig.bj.hand_value matches 21 unless score @n[tag=777.dealer_temp] ig.bj.hand_value matches 21 run return run function immersive_gambling:blackjack/bet/finish/blackjack

execute if score @s ig.bj.hand_value matches ..21 if score @s ig.bj.hand_value > @n[tag=777.dealer_temp] ig.bj.hand_value run function immersive_gambling:blackjack/bet/finish/beat_dealer
execute if score @s ig.bj.hand_value matches ..21 if score @s ig.bj.hand_value = @n[tag=777.dealer_temp] ig.bj.hand_value run function immersive_gambling:blackjack/bet/finish/tie_dealer
execute if score @s ig.bj.hand_value matches ..21 if score @s ig.bj.hand_value < @n[tag=777.dealer_temp] ig.bj.hand_value run function immersive_gambling:blackjack/bet/finish/lose_to_dealer