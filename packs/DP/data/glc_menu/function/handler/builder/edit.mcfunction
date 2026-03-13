# ═══════════════════════════════════════════════════
# Toplu Düzenleme Menüsü (v2.5.4 - Full Bilingual)
# ═══════════════════════════════════════════════════

# Loading göster
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

# Turkish Menu
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"✏️ Toplu Düzenleme",color:"yellow",bold:true},body:{type:"minecraft:plain_message",contents:"§l§eToplu İşlemler\n\n§7• Tüm İzinleri Sil\n§7• İzin Seviyelerini Sıfırla\n§7• Belirli Oyuncunun İzinlerini Sil"},can_close_with_escape:true,pause:false,actions:[]}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🗑️ Tümünü Sil",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚠️ TEHLİKE",body:{type:"minecraft:plain_message",contents:"§l§4UYARI!\n\n§cTÜM İZİNLER SİLİNECEK!\n\n§7Bu işlem geri alınamaz!"},can_close_with_escape:true,pause:false,actions:[{label:"✅ Eminim, Sil",action:{type:"minecraft:run_command",command:"/data remove storage glc:data permissions"}},{label:"❌ Vazgeç",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}]}}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🔄 Seviyeleri Sıfırla",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔄 Seviye Sıfırlama",inputs:[{type:"minecraft:text",key:'new_level',label:"Yeni Seviye (Tüm izinler için)",initial:"1",max_length:5}],actions:[{label:"✅ Uygula",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:handler/utils/reset_levels {level:$(new_level)}"}}]}}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"👤 Oyuncuya Göre Sil",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👤 Oyuncu İzinlerini Sil",inputs:[{type:"minecraft:text",key:'player',label:"Oyuncu Adı",max_length:50}],actions:[{label:"🗑️ Sil",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:handler/utils/delete_by_player {player:\"$(player)\"}"}}]}}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📊 İstatistikler",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/utils/stats"}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀️ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}

# English Menu
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"✏️ Bulk Actions",color:"yellow",bold:true},body:{type:"minecraft:plain_message",contents:"§l§eBulk Operations\n\n§7• Delete All Permissions\n§7• Reset Permission Levels\n§7• Delete Player Permissions"},can_close_with_escape:true,pause:false,actions:[]}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🗑️ Delete All",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚠️ DANGER",body:{type:"minecraft:plain_message",contents:"§l§4WARNING!\n\n§cALL PERMISSIONS WILL BE DELETED!\n\n§7This action cannot be undone!"},can_close_with_escape:true,pause:false,actions:[{label:"✅ Yes, Delete",action:{type:"minecraft:run_command",command:"/data remove storage glc:data permissions"}},{label:"❌ Cancel",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}]}}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🔄 Reset Levels",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔄 Level Reset",inputs:[{type:"minecraft:text",key:'new_level',label:"New Level (For all permissions)",initial:"1",max_length:5}],actions:[{label:"✅ Apply",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:handler/utils/reset_levels {level:$(new_level)}"}}]}}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"👤 Delete by Player",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👤 Delete Player Permissions",inputs:[{type:"minecraft:text",key:'player',label:"Player Name",max_length:50}],actions:[{label:"🗑️ Delete",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:handler/utils/delete_by_player {player:\"$(player)\"}"}}]}}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📊 Statistics",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/utils/stats"}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀️ Back",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}

# Default Menu (Turkish)
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"✏️ Toplu Düzenleme",color:"yellow",bold:true},body:{type:"minecraft:plain_message",contents:"§l§eToplu İşlemler\n\n§7• Tüm İzinleri Sil\n§7• İzin Seviyelerini Sıfırla\n§7• Belirli Oyuncunun İzinlerini Sil"},can_close_with_escape:true,pause:false,actions:[]}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🗑️ Tümünü Sil",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚠️ TEHLİKE",body:{type:"minecraft:plain_message",contents:"§l§4UYARI!\n\n§cTÜM İZİNLER SİLİNECEK!\n\n§7Bu işlem geri alınamaz!"},can_close_with_escape:true,pause:false,actions:[{label:"✅ Eminim, Sil",action:{type:"minecraft:run_command",command:"/data remove storage glc:data permissions"}},{label:"❌ Vazgeç",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}]}}}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🔄 Seviyeleri Sıfırla",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔄 Seviye Sıfırlama",inputs:[{type:"minecraft:text",key:'new_level',label:"Yeni Seviye (Tüm izinler için)",initial:"1",max_length:5}],actions:[{label:"✅ Uygula",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:handler/utils/reset_levels {level:$(new_level)}"}}]}}}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"👤 Oyuncuya Göre Sil",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👤 Oyuncu İzinlerini Sil",inputs:[{type:"minecraft:text",key:'player',label:"Oyuncu Adı",max_length:50}],actions:[{label:"🗑️ Sil",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:handler/utils/delete_by_player {player:\"$(player)\"}"}}]}}}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📊 İstatistikler",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/utils/stats"}}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀️ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}
