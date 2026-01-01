scoreboard players set #10 ig.bool 10
scoreboard players operation #temp ig.bool = @s ig.total_spins
scoreboard players operation #temp ig.bool %= #10 ig.bool
execute if score #temp ig.bool matches 0 run tellraw @a[distance=..8] ["",{"text":"Total Spins on this machine:","color":"dark_aqua"},{"text":" ","color":"aqua"},{"score":{"name":"@s","objective":"ig.total_spins"},"color":"aqua"}]