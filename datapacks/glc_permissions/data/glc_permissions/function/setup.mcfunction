# ═══════════════════════════════════════════════════
# Setup - Simplified (Dynamic version from storage)
# Karmaşık loop manager kaldırıldı
# ═══════════════════════════════════════════════════

# Scoreboard'ları oluştur
scoreboard objectives add gulce.used minecraft.used:minecraft.carrot_on_a_stick

# Timer başlangıç değerleri
scoreboard players set #admin_tick glc.timer 20
scoreboard players set #menu_tick glc.timer 10
scoreboard players set #custom_timer glc.timer 0

# Core sistem yükle
function custom_admin:core/load

# Diğer sistemleri yükle
function custom_admin:handler/load/1
function glc_menu:handler/load

execute as @a[tag=glc.lang_tr] run tellraw @s [{text:"[Gulce's Permissions] ",color:"gold",bold:true},{text:'v',color:"green"},{nbt:'version',"storage":"glc:data",color:"green"},{text:" Sistem yüklendi!",color:"green"}]
execute as @a[tag=glc.lang_en] run tellraw @s [{text:"[Gulce's Permissions] ",color:"gold",bold:true},{text:'v',color:"green"},{nbt:'version',"storage":"glc:data",color:"green"},{text:" Sistem yüklendi!",color:"green"}]