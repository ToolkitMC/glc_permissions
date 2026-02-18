# ═══════════════════════════════════════════════════
# Setup - Simplified (Dynamic version from storage)
# Karmaşık loop manager kaldırıldı
# ═══════════════════════════════════════════════════

# ── Tek Seferlik Yükleme Koruması ──────────────────
# İlk yüklemede flag yoktur → devam et ve flag koy
# /reload sonrası flag zaten var → sadece skip et
execute if data storage glc:sys loaded as @a[tag=glc.lang_tr] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"⏭ Zaten yüklendi, setup atlandı.",color:"gray"}]
execute if data storage glc:sys loaded as @a[tag=glc.lang_en] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"⏭ Already loaded, setup skipped.",color:"gray"}]
execute if data storage glc:sys loaded as @a[tag=gulce_admin] run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if data storage glc:sys loaded run return 0
data modify storage glc:sys loaded set value 1b

# Scoreboard'ları oluştur
scoreboard objectives add gulce.used minecraft.used:minecraft.carrot_on_a_stick
# v2.5.7: Yeni item objective'leri
scoreboard objectives add glc.used.mod_kit minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add glc.used.admin_panel minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add glc.used.quick_action minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add glc.used.spy minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add glc.used.broadcast minecraft.used:minecraft.carrot_on_a_stick


# NameTag input trigger (popup-free string input)
scoreboard objectives add gulce_nametag trigger

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