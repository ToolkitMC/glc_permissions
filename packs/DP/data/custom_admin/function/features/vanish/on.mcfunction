# ═══════════════════════════════════════════════════
# Vanish: On (v2.5.7)
# Invisibility efekti + team nametag gizleme
# player data değişmez - sadece effect + team
# ═══════════════════════════════════════════════════

tag @s add glc.vanish
effect give @s minecraft:invisibility 999999 0 true
team join glc.vanish @s

execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[VANISH] ",color:"light_purple",bold:true},{text:"👻 Görünmez oldunuz!",color:"light_purple"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[VANISH] ",color:"light_purple",bold:true},{text:"👻 You are now invisible!",color:"light_purple"}]
execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[VANISH] ",color:"light_purple",bold:true},{text:"👻 Du bist jetzt unsichtbar!",color:"light_purple"}]
execute as @a[tag=gulce_admin,tag=!glc.vanish] run tellraw @s ['',{text:"[VANISH] ",color:"dark_gray"},{selector:"@s",color:"light_purple"},{text:" → vanish",color:"gray"}]
execute at @s run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 1.5
