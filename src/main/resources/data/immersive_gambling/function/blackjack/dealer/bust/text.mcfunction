execute if entity @s[tag=ig.bj.card_slot1] run data modify entity @s text set value "B"
execute if entity @s[tag=ig.bj.card_slot2] run data modify entity @s text set value "U"
execute if entity @s[tag=ig.bj.card_slot3] run data modify entity @s text set value "S"
execute if entity @s[tag=ig.bj.card_slot4] run data modify entity @s text set value "T"
execute if entity @s[tag=ig.bj.card_slot5] run data modify entity @s text set value " ! "

execute if entity @s[tag=ig.bj.card_slot6] run data modify entity @s text set value ""
execute if entity @s[tag=ig.bj.card_slot7] run data modify entity @s text set value ""

function immersive_gambling:blackjack/card/flip_animation

playsound minecraft:block.glass.break player @a ~ ~ ~ 0.15 1.25
particle minecraft:totem_of_undying ~ ~ ~ 0 0 0 0.5 12