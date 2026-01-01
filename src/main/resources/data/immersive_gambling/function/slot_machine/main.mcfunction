execute unless block ~ ~-1 ~ stone_brick_wall unless block ~ ~-1 ~ chain run return run function immersive_gambling:slot_machine/break
execute if block ~ ~-1 ~ stone_brick_wall run return 0
execute if block ~ ~-1 ~ chain run return 0
execute unless block ~ ~-1 ~ chain run function immersive_gambling:slot_machine/break
