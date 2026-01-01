# executing as dealer

function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "dealer_card_slot", cmd: "data modify entity @s text set value '-'"}
function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "dealer_card_slot", cmd: "scoreboard players reset @s ig.bj.card_value"}

function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "card_slot", cmd: "data modify entity @s text set value '-'"}
function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "card_slot", cmd: "scoreboard players reset @s ig.bj.card_value"}

function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "bet_item", cmd: "tag @s remove 777.ready"}

function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "bet", cmd: "tag @s remove 777.has_bet"}
function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "bet", cmd: "tag @s remove 777.busted"}

function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "stand", cmd: "tag @s remove 777.active"}
function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "stand", cmd: "tag @s remove 777.standing"}

function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "hit", cmd: "tag @s remove 777.active"}
function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "hit", cmd: "scoreboard players reset @s ig.bj.hit_counter"}

function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "hand_value", cmd: "data modify entity @s text set value '-'"}
function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "dealer_hand_value", cmd: "data modify entity @s text set value '-'"}

execute at @s as @n[tag=777.dealer_visual] at @s run tp @s ~ ~ ~ facing entity @n[type=armor_stand] feet
execute at @s positioned 0.0 0 0.0 rotated ~45 0 positioned ^ ^ ^-0.5 align xz facing -0.5 0 -0.5 rotated ~-45 0 positioned as @s run tp @s ~ ~ ~ ~ ~

tag @s add 777.reset_temp
execute as @e[tag=777.blackjack_entity] if score @s ig.real_id = @n[tag=777.reset_temp] ig.real_id run scoreboard players reset @s ig.bj.hand_value
execute as @e[tag=777.blackjack_entity] if score @s ig.real_id = @n[tag=777.reset_temp] ig.real_id run tag @s remove 777.in_game
execute as @e[type=armor_stand,tag=blackjack_table] if score @s ig.real_id = @n[tag=777.reset_temp] ig.real_id run tag @s remove 777.in_game
tag @s remove 777.reset_temp