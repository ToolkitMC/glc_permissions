# ═══════════════════════════════════════════════════
# İzin Listesi Builder (Dinamik)
# ═══════════════════════════════════════════════════

# Loading göster
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 2
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

# İzin sayısını kontrol et
execute store result score #perm_count gulce_id run data get storage glc:data permissions

# Boş kontrol
execute if score #perm_count gulce_id matches 0 run function glc_menu:handler/builder/permissions_empty
execute if score #perm_count gulce_id matches 0 run return 0

# Temel yapıyı hazırla (Bilingual v2.0.2)
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"📋 İzin Listesi",color:"aqua",bold:true},body:{type:"minecraft:plain_message",contents:"§l§6Kayıtlı İzinler\n\n§7Bir izin seçin:"},can_close_with_escape:1b,pause:0b,"columns":1,actions:[]}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"📋 Permission List",color:"aqua",bold:true},body:{type:"minecraft:plain_message",contents:"§l§6Registered Permissions\n\n§7Select a permission:"},can_close_with_escape:1b,pause:0b,"columns":1,actions:[]}

# Default to Turkish
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"📋 İzin Listesi",color:"aqua",bold:true},body:{type:"minecraft:plain_message",contents:"§l§6Kayıtlı İzinler\n\n§7Bir izin seçin:"},can_close_with_escape:1b,pause:0b,"columns":1,actions:[]}

# ── ARAMA BUTONU ─────────────────────────────────
# İzin listesinin üstüne inline arama dialog'u yerleştir.
# Kullanıcı id / permission / player adını girerek filtreleyebilir.
# Vanilla kısıtı nedeniyle tam eşleşme (exact match) uygulanır.

# TURKISH - Arama butonu
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🔍 Ara",width:305,action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:{text:"🔍 İzin Ara",color:"yellow",bold:true},body:{type:"minecraft:plain_message",contents:"§l§eArama§r\n\n§7İzin adı, ID veya oyuncu adını tam olarak girin:\n§8(Büyük/küçük harf duyarlıdır)"},can_close_with_escape:1b,pause:0b,inputs:[{type:"minecraft:text",key:"query",label:"Ara...",max_length:100}],actions:[{label:"🔍 Ara",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:handler/builder/search_start {query:\"$(query)\"}"}}]}}}

# ENGLISH - Search button
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🔍 Search",width:305,action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:{text:"🔍 Search Permission",color:"yellow",bold:true},body:{type:"minecraft:plain_message",contents:"§l§eSearch§r\n\n§7Enter permission name, ID or player name exactly:\n§8(Case sensitive)"},can_close_with_escape:1b,pause:0b,inputs:[{type:"minecraft:text",key:"query",label:"Search...",max_length:100}],actions:[{label:"🔍 Search",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:handler/builder/search_start {query:\"$(query)\"}"}}]}}}

# FALLBACK (Turkish)
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🔍 Ara",width:305,action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:{text:"🔍 İzin Ara",color:"yellow",bold:true},body:{type:"minecraft:plain_message",contents:"§l§eArama§r\n\n§7İzin adı, ID veya oyuncu adını tam olarak girin:\n§8(Büyük/küçük harf duyarlıdır)"},can_close_with_escape:1b,pause:0b,inputs:[{type:"minecraft:text",key:"query",label:"Ara...",max_length:100}],actions:[{label:"🔍 Ara",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:handler/builder/search_start {query:\"$(query)\"}"}}]}}}

# ── İZİN LİSTESİ ─────────────────────────────────
# İzinleri loop'la ekle
data modify storage glc:ui temp.perm_list set from storage glc:data permissions
scoreboard players set #perm_index gulce_id 0
function glc_menu:handler/builder/build_loop

# Geri butonu ekle (Bilingual)
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀️ Geri","width":48,action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀️ Back","width":48,action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀️ Geri","width":48,action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}
