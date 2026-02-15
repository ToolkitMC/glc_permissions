# ═══════════════════════════════════════════════════
# Silme Onayı (MACRO)
# ═══════════════════════════════════════════════════

# Sil
$function custom_admin:handler/remove/permission {id:"$(id)"}

# Feedback
$tellraw @s ["",{"text":"[GLC] ","color":"light_purple","bold":true},{"text":"🗑️ İzin silindi: ","color":"red"},{"text":"$(id)","color":"yellow"}]

# Listeye geri dön
scoreboard players set @s gulce_menu 2
scoreboard players enable @s gulce_menu