#say hit

scoreboard players operation @s ig.bj.deal_to_group = @n[tag=777.hit_temp] ig.bj.group
scoreboard players operation @s ig.bj.deal_round = @n[tag=777.hit_temp] ig.bj.hit_counter
scoreboard players add @s ig.bj.deal_round 1

function immersive_gambling:blackjack/dealer/pick_card/get_cards_in_deck