# ═══════════════════════════════════════════════════
# TPA Panel (v2.5.7) - VIP+
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run function glc_menu:handler/dialog/not_permission
execute unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

# TR
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"📍 TPA - IŞINLANMA",color:"aqua",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Bir oyuncuya ışınlanma isteği gönder.\n§8Karşı tarafın kabul etmesi gerekir."},can_close_with_escape:1b,pause:0b,columns:1,actions:[]}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📨 TPA İsteği Gönder",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📨 TPA İsteği",inputs:[{type:"minecraft:text",key:"p",label:"Oyuncu adı",max_length:16,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"📨 Gönder",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/tpa/send {to:\"$(p)\"}"}}]}}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# EN
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"📍 TPA - TELEPORT",color:"aqua",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Send a teleport request to a player.\n§8They must accept."},can_close_with_escape:1b,pause:0b,columns:1,actions:[]}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📨 Send TPA Request",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📨 TPA Request",inputs:[{type:"minecraft:text",key:"p",label:"Player name",max_length:16,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"📨 Send",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/tpa/send {to:\"$(p)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀ Back",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# DE
execute if entity @s[tag=glc.lang_de] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"📍 TPA - TELEPORT",color:"aqua",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Sende eine Teleportanfrage.\n§8Der Spieler muss zustimmen."},can_close_with_escape:1b,pause:0b,columns:1,actions:[]}
execute if entity @s[tag=glc.lang_de] run data modify storage glc:ui ui.actions append value {label:"📨 TPA-Anfrage senden",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📨 TPA Anfrage",inputs:[{type:"minecraft:text",key:"p",label:"Spielername",max_length:16,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"📨 Senden",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/tpa/send {to:\"$(p)\"}"}}]}}}
execute if entity @s[tag=glc.lang_de] run data modify storage glc:ui ui.actions append value {label:"◀ Zurück",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# Fallback
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] unless entity @s[tag=glc.lang_de] run data modify storage glc:ui ui set from storage glc:ui ui
