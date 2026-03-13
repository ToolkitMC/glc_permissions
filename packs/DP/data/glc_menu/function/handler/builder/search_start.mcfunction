# ═══════════════════════════════════════════════════
# Arama Başlat (MACRO) - TR/EN/DE Support
# ═══════════════════════════════════════════════════
# Çağrı: function glc_menu:handler/builder/search_start {query:"<arama_terimi>"}
# Filtre: id, permission veya player alanlarından exact match
# Pipeline: permissions.mcfunction ile aynı loading pattern'ı kullanır.

# Query'yi storage'a kaydet
$data modify storage glc:ui temp.search_query set value "$(query)"

# Loading pipeline başlat (permissions.mcfunction ile aynı)
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 2
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

# İzin sayısını kontrol et
execute store result score #perm_count gulce_id run data get storage glc:data permissions

# Boş kontrol
execute if score #perm_count gulce_id matches 0 run function glc_menu:handler/builder/permissions_empty
execute if score #perm_count gulce_id matches 0 run return 0

# UI yapısını hazırla - arama sonuçları başlığı (Bilingual)
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"🔍 Arama Sonuçları",color:"yellow",bold:true},body:{type:"minecraft:plain_message",contents:"§l§6Filtrelenmiş İzinler\n\n§7Eşleşen izinler:"},can_close_with_escape:1b,pause:0b,"columns":1,actions:[]}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"🔍 Search Results",color:"yellow",bold:true},body:{type:"minecraft:plain_message",contents:"§l§6Filtered Permissions\n\n§7Matching permissions:"},can_close_with_escape:1b,pause:0b,"columns":1,actions:[]}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"🔍 Arama Sonuçları",color:"yellow",bold:true},body:{type:"minecraft:plain_message",contents:"§l§6Filtrelenmiş İzinler\n\n§7Eşleşen izinler:"},can_close_with_escape:1b,pause:0b,"columns":1,actions:[]}

# İzin listesini kopyala, loop başlat
data modify storage glc:ui temp.perm_list set from storage glc:data permissions
scoreboard players set #perm_index gulce_id 0

# Filtrelenmiş loop
function glc_menu:handler/builder/search_loop

# Geri butonu → tam listeye dön (trigger 2)
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀️ Geri","width":48,action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 2"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀️ Back","width":48,action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 2"}}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀️ Geri","width":48,action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 2"}}

# Temizlik (query artık search_check tarafından tüketildi)
data remove storage glc:ui temp.search_query
data remove storage glc:ui temp.perm_list
