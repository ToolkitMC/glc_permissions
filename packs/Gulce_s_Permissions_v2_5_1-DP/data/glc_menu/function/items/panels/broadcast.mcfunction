# ═══════════════════════════════════════════════════
# BROADCAST WAND Panel - Hızlı Duyuru (MOD+)
# ═══════════════════════════════════════════════════

execute unless score @s gulce_permission_level matches 3.. run return fail

tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

# ── TR ────────────────────────────────────────────
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:["",{text:"📢 DUYURU ASASI",color:"gold",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Sunucuya hızlı duyuru gönder\n§8Şablon seç ya da özel yaz"},can_close_with_escape:1b,pause:0b,columns:1,actions:[]}

# Özel duyuru
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"✏ Özel Duyuru Yaz",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"✏ Özel Duyuru",inputs:[{type:"minecraft:text",key:"msg",label:"Mesaj",max_length:200,label_visible:1b,multiline:{}}],can_close_with_escape:1b,pause:0b,actions:[{label:"📢 Gönder",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/broadcast/send {message:\"$(msg)\",sender:\"@s\"}"}}]}}}

# Hızlı şablonlar
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🛑 Sunucu bakımda!",action:{type:"minecraft:run_command",command:"/function custom_admin:api/broadcast/send {message:\"Sunucu yakında bakıma girecek. Lütfen kendinizi güvende bir yere alın!\",sender:\"@s\"}"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🎉 Etkinlik başlıyor!",action:{type:"minecraft:run_command",command:"/function custom_admin:api/broadcast/send {message:\"🎉 Etkinlik başlıyor! Spawn'a gelin!\",sender:\"@s\"}"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"⚠ Kurallara uyun!",action:{type:"minecraft:run_command",command:"/function custom_admin:api/broadcast/send {message:\"⚠ Sunucu kurallarına uyduğunuzdan emin olun. Devam eden ihlaller bana bildirin.\",sender:\"@s\"}"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🔄 Restart yakında",action:{type:"minecraft:run_command",command:"/function custom_admin:api/broadcast/send {message:\"🔄 Sunucu 5 dakika içinde yeniden başlatılacak!\",sender:\"@s\"}"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📢 Oto Duyuru Yönet",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 11"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀ Ana Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# ── EN ────────────────────────────────────────────
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:["",{text:"📢 BROADCAST WAND",color:"gold",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Send quick announcements to the server\n§8Pick a template or write custom"},can_close_with_escape:1b,pause:0b,columns:1,actions:[]}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"✏ Write Custom Broadcast",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"✏ Custom Broadcast",inputs:[{type:"minecraft:text",key:"msg",label:"Message",max_length:200,label_visible:1b,multiline:{}}],can_close_with_escape:1b,pause:0b,actions:[{label:"📢 Send",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/broadcast/send {message:\"$(msg)\",sender:\"@s\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🛑 Server maintenance!",action:{type:"minecraft:run_command",command:"/function custom_admin:api/broadcast/send {message:\"Server will go into maintenance soon. Please get to a safe location!\",sender:\"@s\"}"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🎉 Event starting!",action:{type:"minecraft:run_command",command:"/function custom_admin:api/broadcast/send {message:\"🎉 Event is starting! Come to spawn!\",sender:\"@s\"}"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚠ Follow the rules!",action:{type:"minecraft:run_command",command:"/function custom_admin:api/broadcast/send {message:\"⚠ Please make sure you follow the server rules. Report ongoing violations to me.\",sender:\"@s\"}"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🔄 Restart soon",action:{type:"minecraft:run_command",command:"/function custom_admin:api/broadcast/send {message:\"🔄 Server will restart in 5 minutes!\",sender:\"@s\"}"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📢 Manage Auto Announce",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 11"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀ Main Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# Fallback
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:["",{text:"📢 DUYURU",color:"gold",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Duyuru gönder"},can_close_with_escape:1b,pause:0b,columns:1,actions:[]}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"✏ Özel Duyuru",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"✏ Duyuru",inputs:[{type:"minecraft:text",key:"msg",label:"Mesaj",max_length:200,multiline:{}}],can_close_with_escape:1b,pause:0b,actions:[{label:"📢 Gönder",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/broadcast/send {message:\"$(msg)\",sender:\"@s\"}"}}]}}}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

function glc_menu:handler/dialog/show with storage glc:ui ui
