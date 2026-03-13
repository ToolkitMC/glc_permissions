# ═══════════════════════════════════════════════════
# Show Current Settings
# Purpose: Display all current configuration
# ═══════════════════════════════════════════════════

# Turkish
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  ⚙️ MEVCUT AYARLAR",color:"aqua",bold:true}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]

execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"🌐 Dil: ",color:"gray"},{text:"Türkçe",color:"yellow"}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"⏱️ Cooldown Değerleri:",color:"gray"}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  • Değer: ",color:"gray"},{storage:"glc:config",nbt:"cooldowns.player",color:"yellow"},{text:" tick",color:"gray"}]

execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]

# English
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  ⚙️ CURRENT SETTINGS",color:"aqua",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]

execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"🌐 Language: ",color:"gray"},{text:"English",color:"yellow"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"⏱️ Cooldown Values:",color:"gray"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  • Value: ",color:"gray"},{storage:"glc:config",nbt:"cooldowns.player",color:"yellow"},{text:" ticks",color:"gray"}]

execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]

# Default (Turkish)
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"  ⚙️ MEVCUT AYARLAR",color:"aqua",bold:true}]
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"🌐 Dil: ",color:"gray"},{text:"Türkçe",color:"yellow"}]
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"  • Değer: ",color:"gray"},{storage:"glc:config",nbt:"cooldowns.player",color:"yellow"},{text:" tick",color:"gray"}]

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
