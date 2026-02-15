# ═══════════════════════════════════════════════════
# Remove Current - DEPRECATED v1.2.0
# Bu fonksiyon artık kullanılmamalı!
# ═══════════════════════════════════════════════════

# UYARI: Eski metod - artık mark_for_deletion kullanılıyor
tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE WARNING] ","color":"red","bold":true},{"text":"remove_current deprecated! Update to v1.2.0","color":"yellow"}]

# Eski kod (geriye dönük uyumluluk için)
$data remove storage glc:data scheduled[$(current_index)]
scoreboard players remove #schedule_index gulce_id 1
scoreboard players remove #schedule_count gulce_id 1