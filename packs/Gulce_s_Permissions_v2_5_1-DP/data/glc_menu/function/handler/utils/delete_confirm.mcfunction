# ═══════════════════════════════════════════════════
# Silme Onayı (MACRO)
# ═══════════════════════════════════════════════════

# Sil
$function custom_admin:handler/remove/permission {id:"$(id)"}

# Feedback (Bilingual v2.5.4)
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GLC] ",color:"light_purple",bold:true},{text:"🗑️ İzin silindi: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GLC] ",color:"light_purple",bold:true},{text:"🗑️ Permission deleted: ",color:"red"},{text:"$(id)",color:"yellow"}]

# Default (Turkish)
$execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GLC] ",color:"light_purple",bold:true},{text:"🗑️ İzin silindi: ",color:"red"},{text:"$(id)",color:"yellow"}]

# Listeye geri dön
scoreboard players set @s gulce_menu 2
scoreboard players enable @s gulce_menu
