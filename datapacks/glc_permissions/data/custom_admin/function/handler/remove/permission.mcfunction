# ═══════════════════════════════════════════════════
# Remove Permission - İzin siler (MACRO)
# ═══════════════════════════════════════════════════

# İzin var mı kontrol
$execute unless data storage glc:data permissions[{id:"$(id)"}] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Bulunamadı: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute unless data storage glc:data permissions[{id:"$(id)"}] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Not found: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute unless data storage glc:data permissions[{id:"$(id)"}] run return 0

# Sil
$data remove storage glc:data permissions[{id:"$(id)"}]

# Feedback
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ İzin silindi: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Permission deleted: ",color:"red"},{text:"$(id)",color:"yellow"}]

# Log
$tellraw @a[tag=gulce_admin] ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"İzin silindi: ",color:"gray"},{text:"$(id)",color:"yellow"}]
