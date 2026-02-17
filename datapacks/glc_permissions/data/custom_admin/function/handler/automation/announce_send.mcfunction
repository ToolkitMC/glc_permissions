# ═══════════════════════════════════════════════════
# Announce Send - storage index'ten mesaj gönder
# ═══════════════════════════════════════════════════
execute store result score #ann_i glc.timer run data get storage glc:config auto_announce.current_index
execute if score #ann_i glc.timer matches 0 run tellraw @a [{"text":"[AUTO] ","color":"gold","bold":true},{"nbt":"auto_announce.messages[0]","storage":"glc:config","color":"white"}]
execute if score #ann_i glc.timer matches 1 run tellraw @a [{"text":"[AUTO] ","color":"gold","bold":true},{"nbt":"auto_announce.messages[1]","storage":"glc:config","color":"white"}]
execute if score #ann_i glc.timer matches 2 run tellraw @a [{"text":"[AUTO] ","color":"gold","bold":true},{"nbt":"auto_announce.messages[2]","storage":"glc:config","color":"white"}]
execute if score #ann_i glc.timer matches 3 run tellraw @a [{"text":"[AUTO] ","color":"gold","bold":true},{"nbt":"auto_announce.messages[3]","storage":"glc:config","color":"white"}]
execute if score #ann_i glc.timer matches 4 run tellraw @a [{"text":"[AUTO] ","color":"gold","bold":true},{"nbt":"auto_announce.messages[4]","storage":"glc:config","color":"white"}]
execute as @a at @s run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 0.5 1.5
