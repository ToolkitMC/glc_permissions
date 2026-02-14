# Tüm loop değerlerini göster
tellraw @s [{"text":"\n========== Loop Değerleri ==========","color":"gold","bold":true}]

# Main loop
execute store result storage glc:temp display.main int 1 run scoreboard players get #main glc.loop
tellraw @s [{"text":"• ","color":"gray"},{"text":"Main Loop: ","color":"yellow"},{"nbt":"display.main","storage":"glc:temp","color":"green"},{"text":" tick","color":"gray"}]

# GLC loop
execute store result storage glc:temp display.glc int 1 run scoreboard players get #glc glc.loop
tellraw @s [{"text":"• ","color":"gray"},{"text":"GLC Loop: ","color":"yellow"},{"nbt":"display.glc","storage":"glc:temp","color":"green"},{"text":" tick","color":"gray"}]

tellraw @s [{"text":"===================================\n","color":"gold","bold":true}]
