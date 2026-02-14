# ═══════════════════════════════════════════════════
# Zamanlamayı Hemen Çalıştır (MACRO)
# ═══════════════════════════════════════════════════

# Zamanlamayı al
$data modify storage mc:dialog temp.run_schedule set from storage mc:handler data.scheduled[{schedule_id:$(schedule_id)}]

# Eylemi çalıştır
function glc_menu:handler/utils/execute_schedule with storage mc:dialog temp.run_schedule

# Feedback
$tellraw @s ["",{"text":"[GLC] ","color":"light_purple","bold":true},{"text":"▶️ Zamanlama çalıştırıldı: #","color":"green"},{"text":"$(schedule_id)","color":"yellow"}]

# Tekrar değilse sil
$execute unless data storage mc:handler data.scheduled[{schedule_id:$(schedule_id),repeat:1b}] run data remove storage mc:handler data.scheduled[{schedule_id:$(schedule_id)}]

# Tekrar ise delay'i resetle
$execute if data storage mc:handler data.scheduled[{schedule_id:$(schedule_id),repeat:1b}] run function glc_menu:handler/utils/schedule_reset_single {schedule_id:$(schedule_id)}

# Listeye geri dön
trigger gulce_menu set 52