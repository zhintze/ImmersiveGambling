# Play animation based on win tier for visual effect
# Tier 1 (small) = win1, Tier 2 (medium) = win2, Tier 3 (large) = win3, Tier 4 (jackpot) = win4
execute if score @s ig.win_tier matches 1 positioned ~ ~-1 ~ as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/win1/tween {to_frame: 0, duration: 2}
execute if score @s ig.win_tier matches 2 positioned ~ ~-1 ~ as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/win2/tween {to_frame: 0, duration: 2}
execute if score @s ig.win_tier matches 3 positioned ~ ~-1 ~ as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/win3/tween {to_frame: 0, duration: 2}
execute if score @s ig.win_tier matches 4 positioned ~ ~-1 ~ as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/win4/tween {to_frame: 0, duration: 2}

# Copy win_tier to win_size for reward system compatibility
scoreboard players operation @s ig.win_size = @s ig.win_tier

scoreboard players set @s ig.odds 1