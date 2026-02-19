# ═══════════════════════════════════════════════════
# Setup - Simplified (Dynamic version from storage)
# v2.5.7: DE dil desteği, yeni scoreboard'lar eklendi
# ═══════════════════════════════════════════════════

# ── Tek Seferlik Yükleme Koruması ──────────────────
execute if data storage glc:sys loaded as @a[tag=glc.lang_tr] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"⏭ Zaten yüklendi, setup atlandı.",color:"gray"}]
execute if data storage glc:sys loaded as @a[tag=glc.lang_en] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"⏭ Already loaded, setup skipped.",color:"gray"}]
execute if data storage glc:sys loaded as @a[tag=glc.lang_de] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"⏭ Bereits geladen, Setup übersprungen.",color:"gray"}]
execute if data storage glc:sys loaded as @a[tag=gulce_admin] run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if data storage glc:sys loaded run return 0
data modify storage glc:sys loaded set value 1b

# Scoreboard'ları oluştur
scoreboard objectives add gulce.used minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add glc.used.mod_kit minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add glc.used.admin_panel minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add glc.used.quick_action minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add glc.used.spy minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add glc.used.broadcast minecraft.used:minecraft.carrot_on_a_stick
# v2.5.7: Yeni item scoreboardları
scoreboard objectives add glc.used.tpa minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add glc.used.home minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add glc.used.vote minecraft.used:minecraft.carrot_on_a_stick

# NameTag input trigger
scoreboard objectives add gulce_nametag trigger

# v2.5.7: TPA, Oylama, Onay triggerleri
scoreboard objectives add glc.tpa trigger
scoreboard objectives add glc.vote trigger
scoreboard objectives add glc.confirm trigger

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
execute as @a[tag=glc.lang_en] run tellraw @s [{text:"[Gulce's Permissions] ",color:"gold",bold:true},{text:'v',color:"green"},{nbt:'version',"storage":"glc:data",color:"green"},{text:" System loaded!",color:"green"}]
execute as @a[tag=glc.lang_de] run tellraw @s [{text:"[Gulce's Permissions] ",color:"gold",bold:true},{text:'v',color:"green"},{nbt:'version',"storage":"glc:data",color:"green"},{text:" System geladen!",color:"green"}]

# v2.5.7: Vanish team kurulumu
execute unless score #glc.vanish_init global matches 1 run team add glc.vanish
execute unless score #glc.vanish_init global matches 1 run team modify glc.vanish nametagVisibility never
execute unless score #glc.vanish_init global matches 1 run team modify glc.vanish color dark_gray
execute unless score #glc.vanish_init global matches 1 run scoreboard players set #glc.vanish_init global 1
