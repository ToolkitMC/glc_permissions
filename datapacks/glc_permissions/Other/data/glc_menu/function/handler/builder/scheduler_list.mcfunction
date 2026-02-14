# ═══════════════════════════════════════════════════
# Aktif Zamanlamaları Listele (Menü)
# ═══════════════════════════════════════════════════

# Loading göster
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 20

# Zamanlama sayısını kontrol et
execute store result score #scheduled_count gulce_id run data get storage mc:handler data.scheduled

# Boş kontrol
execute if score #scheduled_count gulce_id matches 0 run function glc_menu:handler/builder/scheduler_empty
execute if score #scheduled_count gulce_id matches 0 run return 0

# Menü hazırla
data modify storage mc:dialog ui set value {type:"minecraft:multi_action",title:{"text":"📋 Aktif Zamanlamalar","color":"aqua","bold":true},body:{type:"minecraft:plain_message",contents:"§l§6Zamanlanmış Görevler\n\n§7Bir görevi seçin:"},can_close_with_escape:true,pause:false,actions:[]}

# Zamanlamaları loop'la ekle
data modify storage mc:dialog temp.schedule_list set from storage mc:handler data.scheduled
function glc_menu:handler/builder/scheduler_loop

# Geri butonu
data modify storage mc:dialog ui.actions append value {label:"◀️ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 6"}}