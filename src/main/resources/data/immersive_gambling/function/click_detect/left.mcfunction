advancement revoke @s only immersive_gambling:left_click

tag @s add clicked
execute as @e[type=interaction,distance=..8] at @s run function immersive_gambling:click_detect/find_attacker
tag @s remove clicked