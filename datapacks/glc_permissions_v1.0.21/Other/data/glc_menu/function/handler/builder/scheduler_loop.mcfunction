# ═══════════════════════════════════════════════════
# Zamanlama Buton Loop
# ═══════════════════════════════════════════════════

# İlk zamanlamayı al
data modify storage mc:dialog temp.current_schedule set from storage mc:dialog temp.schedule_list[0]

# Buton ekle
function glc_menu:handler/builder/add_schedule_button with storage mc:dialog temp.current_schedule

# İlk elemanı sil
data remove storage mc:dialog temp.schedule_list[0]

# Devam et
execute if data storage mc:dialog temp.schedule_list[0] run function glc_menu:handler/builder/scheduler_loop