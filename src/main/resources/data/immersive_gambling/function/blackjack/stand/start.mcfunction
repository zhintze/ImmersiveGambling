execute as @n[tag=ig.bj.dealer] if entity @s[tag=777.dealing] run return 0
execute unless entity @s[tag=777.in_game] run return 0
execute unless entity @s[tag=777.active] run return 0
execute if entity @s[tag=777.standing] run return run tellraw @a[tag=clicked] {"color":"yellow","italic":true,"text":"Already standing. Once you stand, you cannot take it back!"}
tag @s add 777.standing

scoreboard players set #invalid ig.math_temp 0

tag @s add 777.final_test
# this will run if there is group that is not standing
execute as @e[tag=ig.bj.stand] if score @s ig.real_id = @n[tag=777.final_test] ig.real_id if entity @s[tag=777.active,tag=!777.standing] run scoreboard players set #invalid ig.math_temp 1
tag @s remove 777.final_test

playsound minecraft:block.note_block.pling player @a ~ ~ ~ 0.5 2

execute unless entity @e[tag=777.busted_temp] run function immersive_gambling:blackjack/dealer/chat/stand

function immersive_gambling:blackjack/click/execute_as_type_in_group_no_tag {type: "hit", cmd: "tag @s remove 777.active"}

execute if score #invalid ig.math_temp matches 1 run return run function immersive_gambling:blackjack/stand/waiting_for_others_to_stand

# say All players stood, dealer will finish his hand now
function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "dealer", cmd: "function immersive_gambling:blackjack/dealer/finish_hand/start"}