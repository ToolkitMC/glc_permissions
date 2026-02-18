# ═══════════════════════════════════════════════════
# ADMIN PANEL - Yönetim Merkezi (OWNER/ADMIN)
# ═══════════════════════════════════════════════════

execute unless score @s gulce_permission_level matches 4.. if entity @s[tag=glc.lang_tr] run tellraw @s {"text":"❌ Admin/Owner yetkisi gerekli!","color":"red"}
execute unless score @s gulce_permission_level matches 4.. if entity @s[tag=glc.lang_en] run tellraw @s {"text":"❌ Admin/Owner permission required!","color":"red"}
execute unless score @s gulce_permission_level matches 4.. run return fail

tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

# ── TR ────────────────────────────────────────────
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:["",{text:"👑 ADMİN PANEL",color:"dark_red",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Sunucu yönetim merkezi\n§8Rol ata, eylemi çalıştır, sistemi kontrol et"},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"👑 Rol Yönetimi",action:{type:"minecraft:run_command",command:"/function custom_admin:role/menu"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"⚡ Eylem Çalıştır",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚡ Eylem ID ile Çalıştır",inputs:[{type:"minecraft:text",key:"id",label:"Eylem ID",max_length:64,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"▶ Çalıştır",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:handler/execute/action {id:\"$(id)\"}"}}]}}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"⚙ Sistem Kontrolü",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 15"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📢 Otomasyon",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 11"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🎒 Kit Dağıt",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🎒 Kit Dağıt",body:{type:"minecraft:plain_message",contents:"§7Kime item seti verilsin?"},inputs:[{type:"minecraft:single_option",key:"t",label:"Hedef",options:[{id:"self",display:"§aBana"},{id:"all",display:"§eTüm yetkililere"},{id:"player",display:"§9Belirli oyuncuya"}]},{type:"minecraft:text",key:"p",label:"Oyuncu adı (belirli seçilirse)",initial:"",max_length:16}],can_close_with_escape:1b,pause:0b,actions:[{label:"🎒 Ver",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:items/dispatch_kit {target:\"$(t)\",player:\"$(p)\"}"}}]}}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📊 İstatistikler",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/utils/stats"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🔑 Item Kiti Al",action:{type:"minecraft:run_command",command:"/function glc_menu:items/give_kit"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀ Ana Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# ── EN ────────────────────────────────────────────
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:["",{text:"👑 ADMIN PANEL",color:"dark_red",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Server management center\n§8Assign roles, run actions, control system"},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"👑 Role Management",action:{type:"minecraft:run_command",command:"/function custom_admin:role/menu"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚡ Run Action",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚡ Run Action by ID",inputs:[{type:"minecraft:text",key:"id",label:"Action ID",max_length:64,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"▶ Run",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:handler/execute/action {id:\"$(id)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚙ System Control",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 15"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📢 Automation",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 11"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🎒 Distribute Kit",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🎒 Distribute Kit",body:{type:"minecraft:plain_message",contents:"§7Who should receive the item set?"},inputs:[{type:"minecraft:single_option",key:"t",label:"Target",options:[{id:"self",display:"§aMe"},{id:"all",display:"§eAll staff"},{id:"player",display:"§9Specific player"}]},{type:"minecraft:text",key:"p",label:"Player name (if specific)",initial:"",max_length:16}],can_close_with_escape:1b,pause:0b,actions:[{label:"🎒 Give",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:items/dispatch_kit {target:\"$(t)\",player:\"$(p)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📊 Statistics",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/utils/stats"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🔑 Get Item Kit",action:{type:"minecraft:run_command",command:"/function glc_menu:items/give_kit"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀ Main Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# Fallback
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:["",{text:"👑 ADMİN PANEL",color:"dark_red",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Yönetim Merkezi"},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"👑 Roller",action:{type:"minecraft:run_command",command:"/function custom_admin:role/menu"}}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

function glc_menu:handler/dialog/show with storage glc:ui ui
