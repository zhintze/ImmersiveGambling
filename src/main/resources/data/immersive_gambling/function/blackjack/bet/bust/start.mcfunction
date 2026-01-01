function immersive_gambling:blackjack/click/execute_as_type_in_group_no_tag {type: "hand_value", cmd: "function immersive_gambling:blackjack/bet/bust/text"}

tag @s add 777.busted_temp
function immersive_gambling:blackjack/click/execute_as_type_in_group_no_tag {type: "stand", cmd: "function immersive_gambling:blackjack/stand/start"}
tag @s remove 777.busted_temp

function immersive_gambling:blackjack/click/execute_as_type_in_group_no_tag {type: "bet", cmd: "function immersive_gambling:blackjack/bet/finish/lose_to_dealer"}

tag @s add 777.busted

function immersive_gambling:blackjack/dealer/chat/bust_player