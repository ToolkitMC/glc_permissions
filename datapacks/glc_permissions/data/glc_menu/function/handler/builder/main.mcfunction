# ═══════════════════════════════════════════════════
# ⚡ GULCE CONTROL PANEL - CLEAN UI
# ═══════════════════════════════════════════════════

# Loading Göster
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 25

# Ana menü JSON'ı hazırla
data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{"text":"⚡ GULCE PANEL","color":"gold","bold":true},body:{type:"minecraft:plain_message",contents:"\n§7Sistem ve izin yönetimi için bir kategori seçin:\n "},can_close_with_escape:true,pause:false,columns:2,actions:[]}

# Butonları ekle
data modify storage glc:ui ui.actions append value {label:"📋 İzin Listesi",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 2"}}

data modify storage glc:ui ui.actions append value {label:"➕ Yeni İzin Ekle",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"➕ Yeni İzin Ekle",inputs:[{type:"minecraft:text",key:"id",label:"ID",max_length:100},{type:"minecraft:text",key:"player",label:"Oyuncu",max_length:100},{type:"minecraft:text",key:"permission",label:"İzin Adı",max_length:100},{type:"minecraft:text",key:"level",label:"Seviye",initial:"1",max_length:10}],actions:[{label:"✅ Ekle",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/add/permission {id:\"$(id)\",player:\"$(player)\",permission:\"$(permission)\",level:$(level)}"}}]}}}

data modify storage glc:ui ui.actions append value {label:"✎ Düzenle",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"Düzenle",inputs:[{type:"minecraft:text",key:"id",label:"ID",label_visible:1b}],actions:[{label:"İlerle",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:handler/builder/edit_single {id:\"$(id)\"}"}}]}}}

data modify storage glc:ui ui.actions append value {label:"⚠ Toplu Eylem",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}

data modify storage glc:ui ui.actions append value {label:"⏰ Zamanlayıcı",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 51"}}

data modify storage glc:ui ui.actions append value {label:"◀️ Ana Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}
