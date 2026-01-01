tag @e remove 777.dealt_card_temp
tag @s add 777.dealt_card_temp
execute as @e[tag=777.blackjack_entity,tag=ig.bj.bet] if score @s ig.real_id = @n[tag=777.dealt_card_temp] ig.real_id if score @s ig.bj.group = @n[tag=777.dealt_card_temp] ig.bj.group unless entity @s[tag=777.has_bet] run return run function immersive_gambling:blackjack/card/no_bet_here

execute as @n[tag=777.dealer_visual] at @s facing entity @n[tag=777.dealt_card_temp] feet run tp @s ~ ~ ~ ~ ~60
tag @s remove 777.dealt_card_temp

execute if score #has_no_bet ig.math_temp matches 1.. run return 0

# $say i was dealt $(selected_card)
particle minecraft:electric_spark ^ ^0.08 ^ 0.025 0.05 0.025 0.05 3
#particle minecraft:white_smoke ^ ^0.08 ^ 0 0 0 0.025 3
playsound minecraft:block.moss.step player @a ~ ~ ~ 1 1.5

#$say ME selected card: $(selected_card)

$scoreboard players set @s ig.bj.selected_card $(selected_card)

execute if score @s ig.bj.selected_card matches 2 run data modify entity @s text set value "➋"
execute if score @s ig.bj.selected_card matches 3 run data modify entity @s text set value "➌"
execute if score @s ig.bj.selected_card matches 4 run data modify entity @s text set value "➍"
execute if score @s ig.bj.selected_card matches 5 run data modify entity @s text set value "➎"
execute if score @s ig.bj.selected_card matches 6 run data modify entity @s text set value "➏"
execute if score @s ig.bj.selected_card matches 7 run data modify entity @s text set value "➐"
execute if score @s ig.bj.selected_card matches 8 run data modify entity @s text set value "➑"
execute if score @s ig.bj.selected_card matches 9 run data modify entity @s text set value "➒"
execute if score @s ig.bj.selected_card matches 10 run data modify entity @s text set value "➓"

execute if score @s ig.bj.selected_card matches 74 run data modify entity @s text set value "🅙"
execute if score @s ig.bj.selected_card matches 81 run data modify entity @s text set value "🅠"
execute if score @s ig.bj.selected_card matches 75 run data modify entity @s text set value "🅚"
execute if score @s ig.bj.selected_card matches 65 run data modify entity @s text set value "♠"

function immersive_gambling:blackjack/card/flip_animation

function immersive_gambling:blackjack/card/set_value

execute if entity @s[tag=ig.bj.dealer_card_slot,tag=ig.bj.card_slot2] run data modify entity @s text set value "?"

#$tellraw @a[distance=..2.25] [{"color":"yellow","text":"Card Dealt: "},{"bold":true,"color":"gold","text":"$(selected_card)"}]
#tellraw @a[distance=..2.25] [{"color":"yellow","text":"Card Dealt: "},{"bold":true,"color":"gold","entity":"@s","nbt":"text"}]
function immersive_gambling:blackjack/card/tellraw_card_dealt