# ═══════════════════════════════════════════════════
# Vote Panel (v2.5.7) - ADMIN+
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run function glc_menu:handler/dialog/not_permission
execute unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"📊 OYLAMA SİSTEMİ",color:"gold",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Tüm oyunculara oylama başlat.\n§8Evet/Hayır sonuçları otomatik duyurulur."},can_close_with_escape:1b,pause:0b,columns:1,actions:[]}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📊 Oylama Başlat",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📊 Yeni Oylama",inputs:[{type:"minecraft:text",key:"qtr",label:"Soru (TR)",max_length:100,label_visible:1b},{type:"minecraft:text",key:"qen",label:"Soru (EN)",max_length:100,label_visible:1b},{type:"minecraft:text",key:"qde",label:"Soru (DE)",max_length:100,label_visible:1b},{type:"minecraft:single_option",key:"dur",label:"Süre",options:[{id:"1200",display:"1 dakika"},{id:"2400",display:"2 dakika"},{id:"6000",display:"5 dakika"}]}],can_close_with_escape:1b,pause:0b,actions:[{label:"🚀 Başlat",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/vote/start {question_tr:\"$(qtr)\",question_en:\"$(qen)\",question_de:\"$(qde)\",duration:$(dur)}"}}]}}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"⏹ Oylamayı Bitir",action:{type:"minecraft:run_command",command:"/function custom_admin:api/vote/end"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"📊 VOTE SYSTEM",color:"gold",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Start a vote for all players.\n§8Results are announced automatically."},can_close_with_escape:1b,pause:0b,columns:1,actions:[]}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📊 Start Vote",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📊 New Vote",inputs:[{type:"minecraft:text",key:"qtr",label:"Question (TR)",max_length:100,label_visible:1b},{type:"minecraft:text",key:"qen",label:"Question (EN)",max_length:100,label_visible:1b},{type:"minecraft:text",key:"qde",label:"Question (DE)",max_length:100,label_visible:1b},{type:"minecraft:single_option",key:"dur",label:"Duration",options:[{id:"1200",display:"1 minute"},{id:"2400",display:"2 minutes"},{id:"6000",display:"5 minutes"}]}],can_close_with_escape:1b,pause:0b,actions:[{label:"🚀 Start",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/vote/start {question_tr:\"$(qtr)\",question_en:\"$(qen)\",question_de:\"$(qde)\",duration:$(dur)}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⏹ End Vote",action:{type:"minecraft:run_command",command:"/function custom_admin:api/vote/end"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀ Back",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

function glc_menu:handler/dialog/show with storage glc:ui ui
