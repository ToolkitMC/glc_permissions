# ═══════════════════════════════════════════════════
# Gruptan Üye Çıkar (MACRO)
# ═══════════════════════════════════════════════════

# Grup var mı kontrol et
$execute unless data storage glc:data groups[{id:"$(group_id)"}] run tellraw @s ["",{"text":"[GULCE] ","color":"red","bold":true},{"text":"❌ HATA: Grup bulunamadı - $(group_id)","color":"red"}]
$execute unless data storage glc:data groups[{id:"$(group_id)"}] run return 0

# Üyeyi sil
$data remove storage glc:data groups[{id:"$(group_id)"}].members[{value:"$(player)"}]

# Tag temizle
$tag $(player) remove gulce_group_$(group_id)

# Feedback
tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"✅ Üye çıkarıldı","color":"green"}]
$tellraw @s ["",{"text":"  👤 Oyuncu: ","color":"gray"},{"text":"$(player)","color":"yellow"}]
$tellraw @s ["",{"text":"  👥 Grup: ","color":"gray"},{"text":"$(group_id)","color":"aqua"}]

# Oyuncuya bildir
$tellraw $(player) ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"📤 Gruptan çıkarıldınız: ","color":"red"},{"text":"$(group_id)","color":"yellow"}]

# Log
tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"Üye çıkarıldı: ","color":"gray"},{"text":"$(player)","color":"yellow"},{"text":" ← ","color":"gray"},{"text":"$(group_id)","color":"red"}]