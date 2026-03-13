# ═══════════════════════════════════════════════════
# Reset Settings to Default
# ═══════════════════════════════════════════════════

# Reset cooldowns to default
tag @s remove glc.lang_tr
tag @s remove glc.lang_en
tag @s add glc.lang_tr
data modify storage glc:config cooldowns.player set value 40
data modify storage glc:config cooldowns.main set value {"value":40,"player":"@a"}
function custom_admin:util/cooldown/set with storage glc:config cooldowns.main

# Success message (bilingual)
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  🔄 AYARLAR SIFIRLANDI",color:"green",bold:true}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"Tüm ayarlar varsayılan değerlere döndürüldü:",color:"gray"}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  • Cooldown: ",color:"gray"},{storage:"glc:config",nbt:"cooldowns.player",color:"yellow"},{text:" ticks",color:"gray"}]

execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  🔄 SETTINGS RESET",color:"green",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"All settings have been reset to default:",color:"gray"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  • Cooldown: ",color:"gray"},{storage:"glc:config",nbt:"cooldowns.player",color:"yellow"},{text:" ticks",color:"gray"}]


# Default (Turkish)
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"  🔄 AYARLAR SIFIRLANDI",color:"green",bold:true}]
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"Tüm ayarlar varsayılan değerlere döndürüldü:",color:"gray"}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  • Cooldown: ",color:"gray"},{storage:"glc:config",nbt:"cooldowns.player",color:"yellow"},{text:" ticks",color:"gray"}]

# Play sound
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.5
