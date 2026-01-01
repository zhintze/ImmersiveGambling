advancement revoke @s only immersive_gambling:right_click

tag @s add clicked
execute as @e[type=interaction,distance=..8] at @s run function immersive_gambling:click_detect/find_targetted
tag @s remove clicked