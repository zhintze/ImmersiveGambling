# Stop any playing win animations
execute positioned ~ ~-1 ~ as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/pause_all

tag @s remove winning
scoreboard players reset @s ig.win_time