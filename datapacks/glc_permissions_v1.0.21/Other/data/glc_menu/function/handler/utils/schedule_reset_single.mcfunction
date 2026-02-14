# ═══════════════════════════════════════════════════
# Tek Zamanlamayı Resetle (MACRO)
# ═══════════════════════════════════════════════════

# Delay'den remaining'e kopyala
$data modify storage mc:handler data.scheduled[{schedule_id:$(schedule_id)}].remaining set from storage mc:handler data.scheduled[{schedule_id:$(schedule_id)}].delay

# Log
$tellraw @a[tag=gulce_admin] ["",{"text":"[GLC] ","color":"light_purple","bold":true},{"text":"🔄 Zamanlama sıfırlandı: #","color":"yellow"},{"text":"$(schedule_id)","color":"aqua"}]