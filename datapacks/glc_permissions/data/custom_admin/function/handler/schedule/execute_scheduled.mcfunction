# ═══════════════════════════════════════════════════
# Zamanlanmış Eylemi Çalıştır
# ═══════════════════════════════════════════════════

# Action ID ve player al
data modify storage glc:temp temp.exec_id set from storage glc:temp temp.current_schedule.action_id
data modify storage glc:temp temp.exec_player set from storage glc:temp temp.current_schedule.player

# Eylemi çalıştır
function custom_admin:handler/schedule/run_action with storage glc:temp temp

# Tekrar kontrolü
execute if data storage glc:temp temp.current_schedule{repeat:1b} run function custom_admin:handler/schedule/reset_delay with storage glc:temp temp

# Tekrar değilse sil
execute unless data storage glc:temp temp.current_schedule{repeat:1b} run function custom_admin:handler/schedule/remove_current with storage glc:temp temp

# Debug log only (NO tellraw in tick!)
execute as @a[tag=gulce_debug,limit=1] run function custom_admin:util/debug/log {message:"Scheduled action executed"}