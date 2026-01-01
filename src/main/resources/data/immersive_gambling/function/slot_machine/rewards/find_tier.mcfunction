# Route to new loot tables based on win_tier
# Tier 1 = small_win, Tier 2 = medium_win, Tier 3 = large_win, Tier 4 = jackpot

# Spawn loot based on multiplier (1x, 2x, or 3x)
# First drop (always happens)
execute if score @s ig.win_size matches 1 run loot spawn ~ ~ ~ loot immersive_gambling:slot_machine/small_win
execute if score @s ig.win_size matches 2 run loot spawn ~ ~ ~ loot immersive_gambling:slot_machine/medium_win
execute if score @s ig.win_size matches 3 run loot spawn ~ ~ ~ loot immersive_gambling:slot_machine/large_win
execute if score @s ig.win_size matches 4 run loot spawn ~ ~ ~ loot immersive_gambling:slot_machine/jackpot

# Second drop (multiplier 2x or 3x)
execute if score @s ig.multiplier matches 2.. if score @s ig.win_size matches 1 run loot spawn ~ ~ ~ loot immersive_gambling:slot_machine/small_win
execute if score @s ig.multiplier matches 2.. if score @s ig.win_size matches 2 run loot spawn ~ ~ ~ loot immersive_gambling:slot_machine/medium_win
execute if score @s ig.multiplier matches 2.. if score @s ig.win_size matches 3 run loot spawn ~ ~ ~ loot immersive_gambling:slot_machine/large_win
execute if score @s ig.multiplier matches 2.. if score @s ig.win_size matches 4 run loot spawn ~ ~ ~ loot immersive_gambling:slot_machine/jackpot

# Third drop (multiplier 3x only)
execute if score @s ig.multiplier matches 3 if score @s ig.win_size matches 1 run loot spawn ~ ~ ~ loot immersive_gambling:slot_machine/small_win
execute if score @s ig.multiplier matches 3 if score @s ig.win_size matches 2 run loot spawn ~ ~ ~ loot immersive_gambling:slot_machine/medium_win
execute if score @s ig.multiplier matches 3 if score @s ig.win_size matches 3 run loot spawn ~ ~ ~ loot immersive_gambling:slot_machine/large_win
execute if score @s ig.multiplier matches 3 if score @s ig.win_size matches 4 run loot spawn ~ ~ ~ loot immersive_gambling:slot_machine/jackpot