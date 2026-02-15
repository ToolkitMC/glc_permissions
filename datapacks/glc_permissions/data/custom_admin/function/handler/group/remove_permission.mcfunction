# ═══════════════════════════════════════════════════
# Gruptan İzin Çıkar (MACRO)
# ═══════════════════════════════════════════════════

# Grup var mı kontrol et
$execute unless data storage glc:data groups[{id:"$(group_id)"}] run tellraw @s ["",{"text":"[GULCE] ","color":"red","bold":true},{"text":"❌ HATA: Grup bulunamadı - $(group_id)","color":"red"}]
$execute unless data storage glc:data groups[{id:"$(group_id)"}] run return 0

# İzni sil
$data remove storage glc:data groups[{id:"$(group_id)"}].permissions[{permission:"$(permission)"}]

# Feedback
tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"🗑️ İzin silindi","color":"red"}]
$tellraw @s ["",{"text":"  🔐 İzin: ","color":"gray"},{"text":"$(permission)","color":"yellow"}]
$tellraw @s ["",{"text":"  👥 Grup: ","color":"gray"},{"text":"$(group_id)","color":"light_purple"}]

# Gruptaki üyelere bildir
$tellraw @a[tag=gulce_group_$(group_id)] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"🔒 İzin kaldırıldı: ","color":"red"},{"text":"$(permission)","color":"yellow"}]

# Log
tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"İzin silindi: ","color":"gray"},{"text":"$(group_id)","color":"yellow"},{"text":" ← ","color":"gray"},{"text":"$(permission)","color":"red"}]