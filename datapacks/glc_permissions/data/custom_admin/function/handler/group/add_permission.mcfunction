# ═══════════════════════════════════════════════════
# Gruba İzin Ekle (MACRO)
# ═══════════════════════════════════════════════════

# Grup var mı kontrol et
$execute unless data storage glc:data groups[{id:"$(group_id)"}] run tellraw @s ["",{"text":"[GULCE] ","color":"red","bold":true},{"text":"❌ HATA: Grup bulunamadı - $(group_id)","color":"red"}]
$execute unless data storage glc:data groups[{id:"$(group_id)"}] run return 0

# İzin ekle
$data modify storage glc:data groups[{id:"$(group_id)"}].permissions append value {permission:"$(permission)",level:$(level)}

# Feedback
tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"✅ İzin eklendi","color":"green"}]
$tellraw @s ["",{"text":"  🔐 İzin: ","color":"gray"},{"text":"$(permission)","color":"yellow"}]
$tellraw @s ["",{"text":"  📊 Seviye: ","color":"gray"},{"text":"$(level)","color":"aqua"}]
$tellraw @s ["",{"text":"  👥 Grup: ","color":"gray"},{"text":"$(group_id)","color":"light_purple"}]

# Gruptaki tüm üyelere bildir
$tellraw @a[tag=gulce_group_$(group_id)] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"🔓 Yeni izin: ","color":"green"},{"text":"$(permission)","color":"yellow"},{"text":" (Lvl ","color":"gray"},{"text":"$(level)","color":"aqua"},{"text":")","color":"gray"}]

# Log
$tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"İzin eklendi: ","color":"gray"},{"text":"$(group_id)","color":"yellow"},{"text":" → ","color":"gray"},{"text":"$(permission)","color":"aqua"}]