execute if score @s ig.bj.hand_value matches 17.. run function immersive_gambling:blackjack/dealer/finish_hand/end

# only deal to group zero
scoreboard players set @s ig.bj.deal_to_group 0

scoreboard players add @s ig.deal_timer 1
execute if score @s ig.deal_timer matches 12.. run function immersive_gambling:blackjack/dealer/pick_card/get_cards_in_deck