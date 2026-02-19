# ═══════════════════════════════════════════════════
# Spectate: Stop (v2.5.7)
# ═══════════════════════════════════════════════════

gamemode survival @s
tag @s remove glc.spectating

execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[SPECTATE] ",color:"green",bold:true},{text:"✅ İzleme sona erdi.",color:"green"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[SPECTATE] ",color:"green",bold:true},{text:"✅ Spectate ended.",color:"green"}]
execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[SPECTATE] ",color:"green",bold:true},{text:"✅ Beobachtung beendet.",color:"green"}]
execute at @s run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 0.8
