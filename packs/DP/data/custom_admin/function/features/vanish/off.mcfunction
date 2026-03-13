# ═══════════════════════════════════════════════════
# Vanish: Off (v2.5.7)
# ═══════════════════════════════════════════════════

tag @s remove glc.vanish
effect clear @s minecraft:invisibility

# Normal role team'ine geri dön
function custom_admin:features/chat/sync_team

execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[VANISH] ",color:"yellow",bold:true},{text:"✅ Görünür oldunuz!",color:"yellow"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[VANISH] ",color:"yellow",bold:true},{text:"✅ You are now visible!",color:"yellow"}]
execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[VANISH] ",color:"yellow",bold:true},{text:"✅ Du bist jetzt sichtbar!",color:"yellow"}]
execute as @a[tag=gulce_admin] run tellraw @s ['',{text:"[VANISH] ",color:"dark_gray"},{selector:"@s",color:"yellow"},{text:" → görünür",color:"gray"}]
execute at @s run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 0.8
