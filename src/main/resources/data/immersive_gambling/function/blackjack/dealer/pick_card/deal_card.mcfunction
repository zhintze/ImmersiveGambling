# step 4
scoreboard players set @s ig.deal_timer 0

scoreboard players remove @s ig.bj.deal_to_group 1
execute if score @s ig.bj.deal_to_group matches ..-1 run scoreboard players add @s ig.bj.deal_round 1
execute if score @s ig.bj.deal_to_group matches ..-1 run function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "hit", cmd: "scoreboard players add @s ig.bj.hit_counter 1"}

execute if score @s ig.bj.deal_to_group matches ..-1 run scoreboard players set @s ig.bj.deal_to_group 3

# $say trying to deal card "$(selected_card)" to ig.bj.card_slot$(deal_round) in group $(deal_to_group)

scoreboard players set #has_no_bet ig.math_temp 0

#$say deal card: $(selected_card)

tag @s add 777.dealer_temp
$function immersive_gambling:blackjack/click/execute_as_type_in_group_number {group: $(deal_to_group), type: "ig.bj.card_slot$(deal_round)", cmd: "function immersive_gambling:blackjack/card/set_from_selected {selected_card: '$(selected_card)'}"}
tag @s remove 777.dealer_temp