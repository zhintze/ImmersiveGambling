execute if entity @s[tag=ig.bj.dealer_card_slot,tag=ig.bj.card_slot2] run return run tellraw @a[distance=..2.25] [{"color":"yellow","text":"Card Dealt: "},{"bold":true,"color":"gold","text":"?"}]

execute if score @s ig.bj.selected_card matches 2..10 run tellraw @a[distance=..2.25] [{"color":"yellow","text":"Card Dealt: "},{"bold":true,"color":"gold","score":{"name":"@s","objective":"ig.bj.selected_card"}}]

execute if score @s ig.bj.selected_card matches 74 run tellraw @a[distance=..2.25] [{"color":"yellow","text":"Card Dealt: "},{"bold":true,"color":"gold","text":"J"}]
execute if score @s ig.bj.selected_card matches 81 run tellraw @a[distance=..2.25] [{"color":"yellow","text":"Card Dealt: "},{"bold":true,"color":"gold","text":"Q"}]
execute if score @s ig.bj.selected_card matches 75 run tellraw @a[distance=..2.25] [{"color":"yellow","text":"Card Dealt: "},{"bold":true,"color":"gold","text":"K"}]
execute if score @s ig.bj.selected_card matches 65 run tellraw @a[distance=..2.25] [{"color":"yellow","text":"Card Dealt: "},{"bold":true,"color":"gold","text":"♠"}]