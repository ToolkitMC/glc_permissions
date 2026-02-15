# ═══════════════════════════════════════════════════
# Zamanlama Loop İşleyici - DÜZELTME v1.2.1
# DÜZELTME: Her tick çalışır, max 20 schedule işler
# ═══════════════════════════════════════════════════

# Mevcut zamanlamayı al
execute store result storage glc:temp temp.current_index int 1 run scoreboard players get #schedule_index gulce_id
function custom_admin:handler/schedule/get_by_index with storage glc:temp temp

# Kalan süreyi azalt
execute store result score #remaining gulce_id run data get storage glc:temp temp.current_schedule.remaining
scoreboard players remove #remaining gulce_id 1

# Güncelle
execute store result storage glc:temp temp.current_schedule.remaining int 1 run scoreboard players get #remaining gulce_id
function custom_admin:handler/schedule/update_remaining with storage glc:temp temp

# Süre doldu mu kontrol
execute if score #remaining gulce_id matches ..0 run function custom_admin:handler/schedule/execute_scheduled

# Index artır
scoreboard players add #schedule_index gulce_id 1

# Devam et - Max 20 schedule/tick (performans limiti)
execute if score #schedule_index gulce_id < #schedule_count gulce_id if score #schedule_index gulce_id matches ..19 run function custom_admin:handler/schedule/process_loop

# Loop bittikten SONRA temizlik yap
execute if score #schedule_index gulce_id >= #schedule_count gulce_id run function custom_admin:handler/schedule/cleanup_deleted
execute if score #schedule_index gulce_id matches 20.. run function custom_admin:handler/schedule/cleanup_deleted