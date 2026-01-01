function immersive_gambling:blackjack/click/execute_as_type_in_table {type: "dealer_card_slot", cmd: "function immersive_gambling:blackjack/dealer/bust/text"}
tellraw @a[distance=..3] [{"color":"yellow","text":"Dealer busted with "},{"bold":true,"color":"gold","score":{"name":"@s","objective":"ig.bj.hand_value"}},{"bold":false,"color":"yellow","text":"!"}]

function immersive_gambling:blackjack/dealer/chat/bust_dealer