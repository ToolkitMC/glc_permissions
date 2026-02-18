# ═══════════════════════════════════════════════════
# İzin Güncelle (MACRO)
# ═══════════════════════════════════════════════════

# Güncelle
$data modify storage glc:data permissions[{id:"$(id)"}].player set value "$(player)"
$data modify storage glc:data permissions[{id:"$(id)"}].permission set value "$(permission)"
$data modify storage glc:data permissions[{id:"$(id)"}].level set value $(level)

# Feedback (Bilingual v2.1.0)
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GLC] ",color:"light_purple",bold:true},{text:"✅ İzin güncellendi: ",color:"green"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GLC] ",color:"light_purple",bold:true},{text:"✅ Permission updated: ",color:"green"},{text:"$(id)",color:"yellow"}]

# Default (Turkish)
$execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GLC] ",color:"light_purple",bold:true},{text:"✅ İzin güncellendi: ",color:"green"},{text:"$(id)",color:"yellow"}]

# Menüye dön
trigger gulce_menu set 2
