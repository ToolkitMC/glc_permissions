# ═══════════════════════════════════════════════════
# Report Panel (v2.5.7)
# TR/EN/DE - Tüm oyuncular rapor gönderebilir
# ═══════════════════════════════════════════════════

tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"📋 OYUNCU RAPORU",color:"red",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Kural ihlali olan oyuncuyu bildir.\n§8Raporunuz moderatörlere iletilir."},can_close_with_escape:1b,pause:0b,columns:1,actions:[]}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📋 Rapor Gönder",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📋 Oyuncu Rapor Et",inputs:[{type:"minecraft:text",key:"t",label:"Oyuncu adı",max_length:16,label_visible:1b},{type:"minecraft:text",key:"r",label:"Sebep",initial:"Kural İhlali",max_length:100,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"📨 Gönder",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/report/send {target:\"$(t)\",reason:\"$(r)\"}"}}]}}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"📋 PLAYER REPORT",color:"red",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Report a rule-breaking player.\n§8Your report will be sent to moderators."},can_close_with_escape:1b,pause:0b,columns:1,actions:[]}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📋 Send Report",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📋 Report Player",inputs:[{type:"minecraft:text",key:"t",label:"Player name",max_length:16,label_visible:1b},{type:"minecraft:text",key:"r",label:"Reason",initial:"Rule Violation",max_length:100,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"📨 Send",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/report/send {target:\"$(t)\",reason:\"$(r)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀ Back",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

execute if entity @s[tag=glc.lang_de] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"📋 SPIELER MELDEN",color:"red",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Melde einen regelverstoßenden Spieler.\n§8Deine Meldung wird an Moderatoren weitergeleitet."},can_close_with_escape:1b,pause:0b,columns:1,actions:[]}
execute if entity @s[tag=glc.lang_de] run data modify storage glc:ui ui.actions append value {label:"📋 Meldung senden",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📋 Spieler melden",inputs:[{type:"minecraft:text",key:"t",label:"Spielername",max_length:16,label_visible:1b},{type:"minecraft:text",key:"r",label:"Grund",initial:"Regelverstoß",max_length:100,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"📨 Senden",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/report/send {target:\"$(t)\",reason:\"$(r)\"}"}}]}}}
execute if entity @s[tag=glc.lang_de] run data modify storage glc:ui ui.actions append value {label:"◀ Zurück",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

function glc_menu:handler/dialog/show with storage glc:ui ui
