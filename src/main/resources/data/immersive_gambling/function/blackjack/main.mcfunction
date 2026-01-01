function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "bet_item", cmd: "function immersive_gambling:blackjack/bet/main_as_item"}

function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "stand", cmd: "function immersive_gambling:blackjack/stand/main"}

function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "dealer", cmd: "function immersive_gambling:blackjack/dealer/main"}

execute at @s unless block ~ ~ ~ minecraft:deepslate_brick_wall run return run function immersive_gambling:blackjack/break
execute at @s unless block ^1 ^ ^ minecraft:deepslate_brick_wall run return run function immersive_gambling:blackjack/break
execute at @s unless block ^-1 ^ ^ minecraft:deepslate_brick_wall run return run function immersive_gambling:blackjack/break