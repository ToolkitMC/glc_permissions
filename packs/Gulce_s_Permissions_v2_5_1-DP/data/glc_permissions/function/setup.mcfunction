# ═══════════════════════════════════════════════════
# Setup - Simplified (Dynamic version from storage)
# v2.5.9: Duplicate scoreboard'lar kaldırıldı
# ═══════════════════════════════════════════════════

# Log'a yaz (Starting...)
summon minecraft:interaction ~ ~ ~ {Tags:["glc.setup"],CustomName:{"text":"[GULCE]"}}
execute as @e[type=minecraft:interaction,tag=glc.setup,limit=1] run say Starting...

# ── Tek Seferlik Yükleme Koruması ──────────────────
execute if data storage glc:sys loaded as @a[tag=glc.lang_tr] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"⏭ Zaten yüklendi, setup atlandı.",color:"gray"}]
execute if data storage glc:sys loaded as @a[tag=glc.lang_en] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"⏭ Already loaded, setup skipped.",color:"gray"}]
execute if data storage glc:sys loaded as @a[tag=glc.lang_de] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"⏭ Bereits geladen, Setup übersprungen.",color:"gray"}]
execute if data storage glc:sys loaded as @a[tag=gulce_admin] run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if data storage glc:sys loaded run return 0
data modify storage glc:sys loaded set value 1b

# Scoreboard'ları oluştur (Carrot on a stick kullanım sayaçları)
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

# NOT v2.5.9: glc.tpa, glc.vote, glc.confirm objective'leri
# custom_admin:core/load tarafından zaten oluşturulduğu için burada tekrarlanmıyor.

# Core sistem yükle (bu, yukarıdaki objective'leri de oluşturur)
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

# Log'a yaz (Setup is complete.)
execute as @e[type=minecraft:interaction,tag=glc.setup,limit=1] run say Setup is complete.
kill @e[type=minecraft:interaction,tag=glc.setup]

execute unless score #glc.vanish_init global matches 1 run team modify glc.vanish color dark_gray
execute unless score #glc.vanish_init global matches 1 run scoreboard players set #glc.vanish_init global 1

execute as @p[sort=arbitrary,level=1] at @s positioned ~ ~ ~ rotated as @s anchored eyes if entity @s run tag @s add gulce_admin
