scoreboard objectives add ig.bool dummy
scoreboard objectives add ig.slot_time dummy
scoreboard objectives add ig.odds dummy
scoreboard objectives add ig.variant dummy
scoreboard objectives add ig.win_time dummy
scoreboard objectives add ig.win_size dummy
scoreboard objectives add ig.real_id dummy
scoreboard objectives add ig.total_spins dummy
scoreboard objectives add ig.multiplier dummy
scoreboard objectives add ig.win_tier dummy

scoreboard objectives add ig.math_temp dummy

scoreboard objectives add ig.deal_timer dummy

scoreboard objectives add ig.bj.cards_in_deck dummy
scoreboard objectives add ig.bj.group dummy
scoreboard objectives add ig.bj.hit_counter dummy

scoreboard objectives add ig.bj.selected_card dummy

scoreboard objectives add ig.bj.cards_dealt dummy
scoreboard objectives add ig.bj.deal_to_group dummy
scoreboard objectives add ig.bj.deal_round dummy
scoreboard objectives add ig.bj.card_value dummy
scoreboard objectives add ig.bj.hand_value dummy

scoreboard objectives add ig.bj.aces_in_hand dummy
scoreboard objectives add ig.bj.aces_soft dummy

scoreboard objectives add ig.bj.reset_timer dummy

scoreboard objectives add ig.scale dummy

recipe give @a immersive_gambling:slot_machine

tellraw @a [{"color":"yellow","text":"Reloaded "},{"color":"gold","text":"777 "},{"color":"yellow","text":"by "},{"color":"#6EDDFF","text":"p"},{"color":"#87CBFF","text":"h"},{"color":"#A0B9FF","text":"a"},{"color":"#B8A6FF","text":"i"},{"color":"#EA82FF","text":"c"}]