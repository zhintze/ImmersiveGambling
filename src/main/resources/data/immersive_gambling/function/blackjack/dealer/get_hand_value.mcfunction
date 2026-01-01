scoreboard players reset @s ig.bj.hand_value
scoreboard players reset @s ig.bj.aces_in_hand
scoreboard players reset @s ig.bj.aces_soft

tag @s add 777.get_value
function immersive_gambling:blackjack/click/execute_as_type_in_group_no_tag {type: "dealer_card_slot", cmd: "function immersive_gambling:blackjack/card/get_value"}
tag @s remove 777.get_value

# after ANY add, repair busts by downgrading 11 to 1
function immersive_gambling:blackjack/bet/soft_fix

execute store result storage immersive_gambling:blackjack hand_value int 1 run scoreboard players get @s ig.bj.hand_value

tag @s add 777.store_num
execute if entity @s[tag=777.finish_hand] run function immersive_gambling:blackjack/click/execute_as_type_in_group_no_tag {type: "dealer_hand_value", cmd: "function immersive_gambling:blackjack/hand_value/set_text"}
tag @s remove 777.store_num