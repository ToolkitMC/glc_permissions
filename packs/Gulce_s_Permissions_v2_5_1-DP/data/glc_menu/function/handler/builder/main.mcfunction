# ═══════════════════════════════════════════════════
# ⚡ GULCE CONTROL PANEL - CLEAN UI
# ═══════════════════════════════════════════════════

# Loading Göster
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

# Ana menü JSON'ı hazırla (Bilingual Support v2.0.2)
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"⚡ GULCE PANEL",color:gold,bold:true}],body:{type:"minecraft:plain_message",contents:"\n§7Sistem ve izin yönetimi için bir kategori seçin:\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"⚡ GULCE PANEL",color:gold,bold:true}],body:{type:"minecraft:plain_message",contents:"\n§7Select a category for system and permission management:\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

# Default to Turkish if no tag
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"⚡ GULCE PANEL",color:gold,bold:true}],body:{type:"minecraft:plain_message",contents:"\n§7Sistem ve izin yönetimi için bir kategori seçin:\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

# Butonları ekle (Bilingual)
# Turkish buttons
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📋 İzin Listesi",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 2"}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"➕ Yeni İzin Ekle",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"➕ Yeni İzin Ekle",inputs:[{type:"minecraft:text",key:'id',label:"ID",max_length:100},{type:"minecraft:text",key:'player',label:"Oyuncu",max_length:100},{type:"minecraft:text",key:'permission',label:"İzin Adı",max_length:100},{type:"minecraft:text",key:'level',label:"Seviye",initial:"1",max_length:10}],actions:[{label:"✅ Ekle",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/add/permission {id:\"$(id)\",player:\"$(player)\",permission:\"$(permission)\",level:$(level)}"}}]}}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"✎ Düzenle",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"Düzenle",inputs:[{type:"minecraft:text",key:'id',label:"ID",label_visible:1b}],actions:[{label:"İlerle",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:handler/builder/edit_single {id:\"$(id)\"}"}}]}}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"⚠ Toplu Eylem",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"⏰ Zamanlayıcı",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 51"}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"⚙️ Ayarlar",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 60"}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀️ Ana Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# English buttons
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📋 Permission List",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 2"}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"➕ Add Permission",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"➕ Add New Permission",inputs:[{type:"minecraft:text",key:'id',label:"ID",max_length:100},{type:"minecraft:text",key:'player',label:"Player",max_length:100},{type:"minecraft:text",key:'permission',label:"Permission Name",max_length:100},{type:"minecraft:text",key:'level',label:"Level",initial:"1",max_length:10}],actions:[{label:"✅ Add",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/add/permission {id:\"$(id)\",player:\"$(player)\",permission:\"$(permission)\",level:$(level)}"}}]}}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"✎ Edit",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"Edit Permission",inputs:[{type:"minecraft:text",key:'id',label:"ID",label_visible:1b}],actions:[{label:"Continue",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:handler/builder/edit_single {id:\"$(id)\"}"}}]}}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚠ Bulk Action",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⏰ Scheduler",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 51"}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚙️ Settings",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 60"}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀️ Main Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# Default buttons (Turkish) - Eğer hiçbir dil tag'i yoksa
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📋 İzin Listesi",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 2"}}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"➕ Yeni İzin Ekle",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"➕ Yeni İzin Ekle",inputs:[{type:"minecraft:text",key:'id',label:"ID",max_length:100},{type:"minecraft:text",key:'player',label:"Oyuncu",max_length:100},{type:"minecraft:text",key:'permission',label:"İzin Adı",max_length:100},{type:"minecraft:text",key:'level',label:"Seviye",initial:"1",max_length:10}],actions:[{label:"✅ Ekle",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/add/permission {id:\"$(id)\",player:\"$(player)\",permission:\"$(permission)\",level:$(level)}"}}]}}}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"✎ Düzenle",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"Düzenle",inputs:[{type:"minecraft:text",key:'id',label:"ID",label_visible:true}],actions:[{label:"İlerle",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:handler/builder/edit_single {id:\"$(id)\"}"}}]}}}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚠ Toplu Eylem",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⏰ Zamanlayıcı",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 51"}}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚙️ Ayarlar",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 60"}}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀️ Ana Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# v2.5.4: Rol bazlı ek butonlar

# v2.5.4: Yeni Paneller
# Uyarı Yönetimi (MOD+)
execute if score @s gulce_permission_level matches 3.. if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"⚠️ Uyarı Yönetimi",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 20"}}
# NameTag Hızlı Giriş (MOD+)
execute if score @s gulce_permission_level matches 3.. if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📛 NameTag Girişi",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 21"}}
# Özel Eylem Oluşturucu (MOD+)
execute if score @s gulce_permission_level matches 3.. if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"⚙️ Özel Eylem",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 22"}}

# Uyarı Yönetimi (MOD+)
execute if score @s gulce_permission_level matches 3.. if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚠️ Warning Manager",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 20"}}
# NameTag Quick Input (MOD+)
execute if score @s gulce_permission_level matches 3.. if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📛 NameTag Input",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 21"}}
# Custom Action Builder (MOD+)
execute if score @s gulce_permission_level matches 3.. if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚙️ Custom Action",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 22"}}

# Fallback (dil tag yoksa)
execute if score @s gulce_permission_level matches 3.. unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚠️ Uyarı Yönetimi",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 20"}}
execute if score @s gulce_permission_level matches 3.. unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📛 NameTag Girişi",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 21"}}
execute if score @s gulce_permission_level matches 3.. unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚙️ Özel Eylem",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 22"}}
