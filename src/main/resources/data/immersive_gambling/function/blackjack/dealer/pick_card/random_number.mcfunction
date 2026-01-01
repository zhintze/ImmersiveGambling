# step 2
#pick random card from deck

$execute store result storage immersive_gambling:blackjack deck.card_index int 1 run random value 0..$(amount_in_deck)

function immersive_gambling:blackjack/dealer/pick_card/pick_random_card with storage immersive_gambling:blackjack deck