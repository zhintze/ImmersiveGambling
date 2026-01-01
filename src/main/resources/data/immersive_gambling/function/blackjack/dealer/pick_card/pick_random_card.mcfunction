# step 3
# say picking random card

$data modify entity @s data.selected_card set from entity @s data.deck[$(card_index)]

execute store result entity @s data.deal_to_group int 1 run scoreboard players get @s ig.bj.deal_to_group
execute store result entity @s data.deal_round int 1 run scoreboard players get @s ig.bj.deal_round

function immersive_gambling:blackjack/dealer/pick_card/deal_card with entity @s data

execute if score #has_no_bet ig.math_temp matches 1.. run return 0

$data remove entity @s data.deck[$(card_index)]