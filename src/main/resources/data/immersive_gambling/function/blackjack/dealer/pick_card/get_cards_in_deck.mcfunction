# step 1

execute store result score @s ig.bj.cards_in_deck run data get entity @s data.deck
execute store result storage immersive_gambling:blackjack deck.amount_in_deck int 1 run scoreboard players get @s ig.bj.cards_in_deck

# finish hand is dealer, 777.hit_temp is for when the player on far right tries to hit. if this unless check wasnt here, this would run
execute unless entity @s[tag=777.finish_hand] unless entity @e[tag=777.hit_temp] if score @s ig.bj.deal_round matches 3 if score @s ig.bj.deal_to_group matches 3 run return run function immersive_gambling:blackjack/dealer/pick_card/stop_dealing

function immersive_gambling:blackjack/dealer/pick_card/random_number with storage immersive_gambling:blackjack deck