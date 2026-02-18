# ═══════════════════════════════════════════════════
# Permission Statistics Display
# ═══════════════════════════════════════════════════

# Count total permissions
execute store result score #total_perms gulce_id run data get storage glc:data permissions

# Turkish
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  📊 İSTATİSTİKLER",color:"aqua",bold:true}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"📋 Toplam İzin: ",color:"gray"},{score:{name:"#total_perms",objective:"gulce_id"},color:"yellow"}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]

# English
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  📊 STATISTICS",color:"aqua",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"📋 Total Permissions: ",color:"gray"},{score:{name:"#total_perms",objective:"gulce_id"},color:"yellow"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]

# Default (Turkish)
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"  📊 İSTATİSTİKLER",color:"aqua",bold:true}]
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"📋 Toplam İzin: ",color:"gray"},{score:{name:"#total_perms",objective:"gulce_id"},color:"yellow"}]
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
