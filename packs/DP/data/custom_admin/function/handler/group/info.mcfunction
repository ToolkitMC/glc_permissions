# ═══════════════════════════════════════════════════
# Grup Detaylı Bilgi (MACRO)
# ═══════════════════════════════════════════════════

# Grup var mı kontrol
$execute unless data storage glc:data groups[{id:"$(id)"}] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"❌ HATA: Grup bulunamadı - $(id)",color:"red"}]
$execute unless data storage glc:data groups[{id:"$(id)"}] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"❌ HATA: Grup bulunamadı - $(id)",color:"red"}]
$execute unless data storage glc:data groups[{id:"$(id)"}] run return 0

# Grubu geçici storage'a al
$data modify storage glc:temp temp.info_group set from storage glc:data groups[{id:"$(id)"}]

# Başlık
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"aqua",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"aqua",bold:true}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"📋 Grup Bilgisi: ",color:"gold",bold:true},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"📋 Grup Bilgisi: ",color:"gold",bold:true},{text:"$(id)",color:"yellow"}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"aqua",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"aqua",bold:true}]

# Bilgiler
function custom_admin:handler/group/info_display with storage glc:temp temp.info_group

# Alt çizgi
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"aqua",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"aqua",bold:true}]