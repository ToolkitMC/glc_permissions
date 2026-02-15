# ═══════════════════════════════════════════════════
# Tekrarlayan Eylemin Delay'ini Sıfırla
# ═══════════════════════════════════════════════════

# Delay'i remaining'e kopyala
data modify storage glc:temp temp.current_schedule.remaining set from storage glc:temp temp.current_schedule.delay

# Güncelle
function custom_admin:handler/schedule/update_remaining with storage glc:temp temp

# Log
tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"🔄 Eylem tekrar zamanlandı","color":"yellow"}]