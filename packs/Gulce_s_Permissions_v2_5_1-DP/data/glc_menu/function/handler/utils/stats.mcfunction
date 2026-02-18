# ═══════════════════════════════════════════════════
# Permission Statistics Display
# DÜZELTİLDİ v2.5.7: array boyutu için doğru syntax
# ═══════════════════════════════════════════════════

# Sayıları al (scoreboard'dan - load'da güncelleniyor)
execute store result score #total_perms gulce_id if data storage glc:data permissions[]
execute store result score #total_groups gulce_id if data storage glc:data groups[]
execute store result score #total_actions gulce_id if data storage glc:data actions[]

# Turkish
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  📊 İSTATİSTİKLER",color:"aqua",bold:true}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"📋 Toplam İzin: ",color:"gray"},{score:{name:"#total_perms",objective:"gulce_id"},color:"yellow"}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"👥 Toplam Grup: ",color:"gray"},{score:{name:"#total_groups",objective:"gulce_id"},color:"yellow"}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"⚡ Toplam Eylem: ",color:"gray"},{score:{name:"#total_actions",objective:"gulce_id"},color:"yellow"}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]

# English
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  📊 STATISTICS",color:"aqua",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"📋 Total Permissions: ",color:"gray"},{score:{name:"#total_perms",objective:"gulce_id"},color:"yellow"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"👥 Total Groups: ",color:"gray"},{score:{name:"#total_groups",objective:"gulce_id"},color:"yellow"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"⚡ Total Actions: ",color:"gray"},{score:{name:"#total_actions",objective:"gulce_id"},color:"yellow"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]

# Default fallback (Turkish)
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"📋 İzin: ",color:"gray"},{score:{name:"#total_perms",objective:"gulce_id"},color:"yellow"},{text:"  👥 Grup: ",color:"gray"},{score:{name:"#total_groups",objective:"gulce_id"},color:"yellow"},{text:"  ⚡ Eylem: ",color:"gray"},{score:{name:"#total_actions",objective:"gulce_id"},color:"yellow"}]
