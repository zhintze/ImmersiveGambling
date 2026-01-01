tag @s add 777.dealer_temp
function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "bet", cmd: "function immersive_gambling:blackjack/bet/compare_scores"}
tag @s remove 777.dealer_temp

execute if score @s ig.bj.hand_value matches 22.. run function immersive_gambling:blackjack/dealer/bust/start