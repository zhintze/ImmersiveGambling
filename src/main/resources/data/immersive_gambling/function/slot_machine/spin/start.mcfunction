execute as @n[type=item_display,tag=aj.slot_machine.root] at @s run function animated_java:slot_machine/animations/pull_lever/tween {to_frame: 0, duration: 10}
scoreboard players reset @s ig.slot_time
tag @s add using

scoreboard players add @s ig.total_spins 1
function immersive_gambling:slot_machine/spin/display_total_spins

execute store result score #rand_sound ig.bool run random value 1..4

execute if score #rand_sound ig.bool matches 1 run playsound minecraft:777.slot_machine.handle player @a ~ ~ ~ 1 0.9
execute if score #rand_sound ig.bool matches 2 run playsound minecraft:777.slot_machine.handle player @a ~ ~ ~ 1 1
execute if score #rand_sound ig.bool matches 3 run playsound minecraft:777.slot_machine.handle player @a ~ ~ ~ 1 1.1
execute if score #rand_sound ig.bool matches 4 run playsound minecraft:777.slot_machine.handle player @a ~ ~ ~ 1 1.2