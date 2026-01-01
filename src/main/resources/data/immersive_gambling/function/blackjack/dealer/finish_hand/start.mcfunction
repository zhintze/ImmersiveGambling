# say HMPH, i will finish my hand

scoreboard players set @s ig.deal_timer 0

function immersive_gambling:blackjack/click/execute_as_type_in_group_number {group: 0, type: "ig.bj.card_slot2", cmd: "function immersive_gambling:blackjack/card/reveal_mystery"}

# start with round 2 to get the dealers second card
scoreboard players set @s ig.bj.deal_round 3

tag @s add 777.finish_hand

function immersive_gambling:blackjack/dealer/get_hand_value