# Play win animation based on ig.win_tier from decide.mcfunction
# Tier mapping (corrected):
# tier 1 (Small) -> win2 (BAR)
# tier 2 (Medium) -> win4 (CHERRY/PLUM)
# tier 3 (Large) -> win3 (LEMON)
# tier 4 (Jackpot) -> win1 (777)

execute if score @s ig.win_tier matches 1 positioned ~ ~-1 ~ as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/win2/tween {to_frame: 0, duration: 2}
execute if score @s ig.win_tier matches 2 positioned ~ ~-1 ~ as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/win4/tween {to_frame: 0, duration: 2}
execute if score @s ig.win_tier matches 3 positioned ~ ~-1 ~ as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/win3/tween {to_frame: 0, duration: 2}
execute if score @s ig.win_tier matches 4 positioned ~ ~-1 ~ as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/win1/tween {to_frame: 0, duration: 2}

# Set win_size to match tier for reward calculations
scoreboard players operation @s ig.win_size = @s ig.win_tier

scoreboard players set @s ig.odds 1
