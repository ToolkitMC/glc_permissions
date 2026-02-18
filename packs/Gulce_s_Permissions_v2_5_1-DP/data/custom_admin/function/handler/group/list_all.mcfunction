# ═══════════════════════════════════════════════════
# Tüm Grupları Listele
# ═══════════════════════════════════════════════════

# Başlık
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"aqua",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"aqua",bold:true}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"👥 Tüm Gruplar",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"👥 Tüm Gruplar",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"aqua",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"aqua",bold:true}]

# Grup sayısı
execute store result score #total_groups gulce_id run data get storage glc:data groups

# Boş kontrol
execute if score #total_groups gulce_id matches 0 if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  ❌ Hiç grup yok",color:"red"}]
execute if score #total_groups gulce_id matches 0 if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  ❌ Hiç grup yok",color:"red"}]
execute if score #total_groups gulce_id matches 0 if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"aqua",bold:true}]
execute if score #total_groups gulce_id matches 0 if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"aqua",bold:true}]

# Liste hazırla - sadece grup varsa
execute if score #total_groups gulce_id matches 1.. run data modify storage glc:temp temp.list_groups set from storage glc:data groups
execute if score #total_groups gulce_id matches 1.. run function custom_admin:handler/group/list_all_loop

# Toplam
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  📊 Toplam: ",color:"gray"},{score:{name:'#total_groups',objective:'gulce_id'},color:"yellow"},{text:" grup",color:"gray"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  📊 Toplam: ",color:"gray"},{score:{name:'#total_groups',objective:'gulce_id'},color:"yellow"},{text:" grup",color:"gray"}]

# Alt çizgi
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"aqua",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"aqua",bold:true}]