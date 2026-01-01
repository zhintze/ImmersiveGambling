execute store result score #rand ig.bool run random value 1..7

execute if score #rand ig.bool matches 1 positioned ~ ~-1 ~ as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/stop_lose1/tween {to_frame: 0, duration: 2}
execute if score #rand ig.bool matches 2 positioned ~ ~-1 ~ as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/stop_lose2/tween {to_frame: 0, duration: 2}
execute if score #rand ig.bool matches 3 positioned ~ ~-1 ~ as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/stop_lose3/tween {to_frame: 0, duration: 2}
execute if score #rand ig.bool matches 4 positioned ~ ~-1 ~ as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/stop_lose4/tween {to_frame: 0, duration: 2}
execute if score #rand ig.bool matches 5 positioned ~ ~-1 ~ as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/stop_lose5/tween {to_frame: 0, duration: 2}
execute if score #rand ig.bool matches 6 positioned ~ ~-1 ~ as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/stop_lose6/tween {to_frame: 0, duration: 2}
execute if score #rand ig.bool matches 7 positioned ~ ~-1 ~ as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/stop_lose7/tween {to_frame: 0, duration: 2}

scoreboard players set @s ig.odds 2