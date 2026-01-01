summon text_display ^-0.385 ^1.13 ^-0.238 {Tags:["777.blackjack_entity","ig.bj.card_slot1","ig.bj.dealer_card_slot","new"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]},text:"",background:-13927937}
summon text_display ^-0.2 ^1.13 ^-0.238 {Tags:["777.blackjack_entity","ig.bj.card_slot2","ig.bj.dealer_card_slot","new"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]},text:"",background:-13927937}
summon text_display ^-0.01 ^1.13 ^-0.238 {Tags:["777.blackjack_entity","ig.bj.card_slot3","ig.bj.dealer_card_slot","new"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]},text:"",background:-13927937}
summon text_display ^0.18 ^1.13 ^-0.238 {Tags:["777.blackjack_entity","ig.bj.card_slot4","ig.bj.dealer_card_slot","new"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]},text:"",background:-13927937}
summon text_display ^0.37 ^1.13 ^-0.238 {Tags:["777.blackjack_entity","ig.bj.card_slot5","ig.bj.dealer_card_slot","new"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]},text:"",background:-13927937}
summon text_display ^0.76 ^1.13 ^-0.238 {Tags:["777.blackjack_entity","ig.bj.card_slot6","ig.bj.dealer_card_slot","new"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]},text:"",background:-13927937}
summon text_display ^0.75 ^1.13 ^-0.1 {Tags:["777.blackjack_entity","ig.bj.card_slot7","ig.bj.dealer_card_slot","new"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]},text:"",background:-13927937}

summon text_display ^ ^1.14 ^-0.12 {line_width:40,Tags:["777.blackjack_entity","ig.bj.dealer_hand_value","new"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.4f,0.4f,0.4f]},text:"",background:0}

# transforms
execute as @e[tag=ig.bj.dealer_card_slot,tag=new] at @s rotated as @n[tag=777.dealer,tag=new] run data merge entity @s {transformation:{left_rotation:[0f,2f,0f,1f],right_rotation:[0.75f,0f,0f,1f],translation:[0f,0.6f,0.2f],scale:[0.0f,0.0f,0.0f]}}

# rotations
execute as @e[tag=ig.bj.dealer_card_slot,tag=new] at @s rotated as @n[tag=777.dealer,tag=new] run tp @s ~ ~ ~ ~ -75
execute as @e[tag=ig.bj.dealer_hand_value,tag=new] at @s rotated as @n[tag=777.dealer,tag=new] run tp @s ~ ~ ~ ~ -80

execute as @e[tag=777.blackjack_entity,tag=new] run scoreboard players set @s ig.bj.group 0
execute as @e[tag=777.blackjack_entity,tag=new] run scoreboard players operation @s ig.real_id = @n[tag=777.temp] ig.real_id

tag @e[tag=777.blackjack_entity,tag=!ig.bj.dealer,tag=new] remove new