# ═══════════════════════════════════════════════════
# Zamanlama Butonu Ekle (MACRO) - TAM DİNAMİK
# ═══════════════════════════════════════════════════

# Tekrar durumunu kontrol et
# execute store result score #is_repeat gulce_id run data get storage mc:dialog temp.current_schedule.repeat

# Tekrar emoji
execute unless score #is_repeat gulce_id matches 1 run data modify storage mc:dialog temp.repeat_icon set value "⏱️"

# Tekrar text
execute if score #is_repeat gulce_id matches 1 run data modify storage mc:dialog temp.repeat_text set value "§aEvet"
execute unless score #is_repeat gulce_id matches 1 run data modify storage mc:dialog temp.repeat_text set value "§cHayır"

# Icon'u macro'ya geç
data modify storage mc:dialog temp.current_schedule.repeat_icon set from storage mc:dialog temp.repeat_icon
data modify storage mc:dialog temp.current_schedule.repeat_text set from storage mc:dialog temp.repeat_text

# Buton oluştur
function glc_menu:handler/builder/create_schedule_button with storage mc:dialog temp.current_schedule