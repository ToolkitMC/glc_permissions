# ═══════════════════════════════════════════════════
# Home Panel (v2.5.7) - VIP+
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run function glc_menu:handler/dialog/not_permission
execute unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

# TR
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"🏠 HOME SİSTEMİ",color:"green",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Ev konumlarını kaydet ve ışınlan.\n§8Birden fazla ev eklenebilir."},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🏠 Eve Git",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🏠 Eve Git",inputs:[{type:"minecraft:text",key:"n",label:"Ev adı",initial:"home",max_length:32,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"🏠 Git",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/home/go {name:\"$(n)\"}"}}]}}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📌 Ev Kaydet",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📌 Ev Kaydet",inputs:[{type:"minecraft:text",key:"n",label:"Ev adı",initial:"home",max_length:32,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"💾 Kaydet",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/home/set {name:\"$(n)\"}"}}]}}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🗑 Ev Sil",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🗑 Ev Sil",inputs:[{type:"minecraft:text",key:"n",label:"Ev adı",initial:"home",max_length:32,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"🗑 Sil",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/home/delete {name:\"$(n)\"}"}}]}}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# EN
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"🏠 HOME SYSTEM",color:"green",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Save and teleport to home locations.\n§8Multiple homes supported."},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🏠 Go Home",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🏠 Go Home",inputs:[{type:"minecraft:text",key:"n",label:"Home name",initial:"home",max_length:32,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"🏠 Go",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/home/go {name:\"$(n)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📌 Set Home",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📌 Set Home",inputs:[{type:"minecraft:text",key:"n",label:"Home name",initial:"home",max_length:32,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"💾 Save",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/home/set {name:\"$(n)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🗑 Delete Home",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🗑 Delete Home",inputs:[{type:"minecraft:text",key:"n",label:"Home name",initial:"home",max_length:32,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"🗑 Delete",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/home/delete {name:\"$(n)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀ Back",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# DE
execute if entity @s[tag=glc.lang_de] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"🏠 HEIMORT-SYSTEM",color:"green",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Speichere und teleportiere zu Heimorten.\n§8Mehrere Heimorte möglich."},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute if entity @s[tag=glc.lang_de] run data modify storage glc:ui ui.actions append value {label:"🏠 Zum Heimort",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🏠 Zum Heimort",inputs:[{type:"minecraft:text",key:"n",label:"Heimortname",initial:"home",max_length:32,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"🏠 Gehen",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/home/go {name:\"$(n)\"}"}}]}}}
execute if entity @s[tag=glc.lang_de] run data modify storage glc:ui ui.actions append value {label:"📌 Heimort setzen",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📌 Heimort setzen",inputs:[{type:"minecraft:text",key:"n",label:"Heimortname",initial:"home",max_length:32,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"💾 Speichern",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/home/set {name:\"$(n)\"}"}}]}}}
execute if entity @s[tag=glc.lang_de] run data modify storage glc:ui ui.actions append value {label:"◀ Zurück",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

function glc_menu:handler/dialog/show with storage glc:ui ui
