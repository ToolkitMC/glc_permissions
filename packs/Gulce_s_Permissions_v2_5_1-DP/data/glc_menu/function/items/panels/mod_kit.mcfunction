# ═══════════════════════════════════════════════════
# MOD KIT Panel - Hızlı Moderasyon (MOD+)
# Sağ tık → doğrudan aksiyon, az tıklama
# ═══════════════════════════════════════════════════

# Yetki kontrolü
execute unless score @s gulce_permission_level matches 3.. if entity @s[tag=glc.lang_tr] run tellraw @s {"text":"❌ Mod yetkisi gerekli!","color":"red"}
execute unless score @s gulce_permission_level matches 3.. if entity @s[tag=glc.lang_en] run tellraw @s {"text":"❌ Mod permission required!","color":"red"}
execute unless score @s gulce_permission_level matches 3.. run return fail

tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

# ── TR ────────────────────────────────────────────
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:["",{text:"⚔ MOD ARAÇLARI",color:"blue",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Oyuncu adı gir, aksiyonu seç:\n§8Tek diyalog = tek adım = hızlı işlem"},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

# Freeze
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"❄ Dondur",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"❄ Oyuncu Dondur",inputs:[{type:"minecraft:text",key:"p",label:"Oyuncu adı",max_length:16,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"❄ Dondur",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:features/mod/freeze_by_name {player:\"$(p)\"}"}}]}}}

# Unfreeze
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🔥 Çöz",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔥 Dondurma Kaldır",inputs:[{type:"minecraft:text",key:"p",label:"Oyuncu adı",max_length:16,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"🔥 Çöz",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:features/mod/unfreeze_by_name {player:\"$(p)\"}"}}]}}}

# Warn
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"⚠ Uyar",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚠ Uyarı Ver",inputs:[{type:"minecraft:text",key:"p",label:"Oyuncu adı",max_length:16,label_visible:1b},{type:"minecraft:text",key:"r",label:"Sebep",max_length:100,initial:"Kural İhlali",label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"⚠ Uyar",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/warn/warn {player:\"$(p)\",reason:\"$(r)\",mod:\"@s\"}"}}]}}}

# Mute
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🔇 Sustur",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔇 Oyuncu Sustur",inputs:[{type:"minecraft:text",key:"p",label:"Oyuncu adı",max_length:16,label_visible:1b},{type:"minecraft:single_option",key:"d",label:"Süre",options:[{id:"1200",display:"1 dakika"},{id:"6000",display:"5 dakika"},{id:"24000",display:"20 dakika"},{id:"72000",display:"1 saat"}]}],can_close_with_escape:1b,pause:0b,actions:[{label:"🔇 Sustur",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:features/mod/mute_mute {player:\"$(p)\",reason:\"Moderatör kararı\",duration:$(d)}"}}]}}}

# Unmute
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🔊 Sus. Kaldır",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔊 Susturmayı Kaldır",inputs:[{type:"minecraft:text",key:"p",label:"Oyuncu adı",max_length:16,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"🔊 Kaldır",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:features/mod/mute_unmute {player:\"$(p)\"}"}}]}}}

# Kick
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"👢 Kick",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👢 Oyuncu Kick",inputs:[{type:"minecraft:text",key:"p",label:"Oyuncu adı",max_length:16,label_visible:1b},{type:"minecraft:text",key:"r",label:"Sebep",max_length:100,initial:"Kural İhlali",label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"👢 Kick",action:{type:"minecraft:dynamic/run_command",template:"/kick $(p) $(r)"}}]}}}

# Uyarı sorgula
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📋 Uyarı Sorgula",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📋 Uyarıları Sorgula",inputs:[{type:"minecraft:text",key:"p",label:"Oyuncu adı",max_length:16,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"🔍 Sorgula",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/warn/check {player:\"$(p)\"}"}}]}}}

# NameTag hızlı giriş
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📛 NameTag Modu",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 21"}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀ Ana Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# ── EN ────────────────────────────────────────────
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:["",{text:"⚔ MOD TOOLS",color:"blue",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Enter player name, select action:\n§8One dialog = one step = fast action"},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"❄ Freeze",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"❄ Freeze Player",inputs:[{type:"minecraft:text",key:"p",label:"Player name",max_length:16,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"❄ Freeze",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:features/mod/freeze_by_name {player:\"$(p)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🔥 Unfreeze",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔥 Unfreeze Player",inputs:[{type:"minecraft:text",key:"p",label:"Player name",max_length:16,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"🔥 Unfreeze",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:features/mod/unfreeze_by_name {player:\"$(p)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚠ Warn",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚠ Issue Warning",inputs:[{type:"minecraft:text",key:"p",label:"Player name",max_length:16,label_visible:1b},{type:"minecraft:text",key:"r",label:"Reason",max_length:100,initial:"Rule Violation",label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"⚠ Warn",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/warn/warn {player:\"$(p)\",reason:\"$(r)\",mod:\"@s\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🔇 Mute",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔇 Mute Player",inputs:[{type:"minecraft:text",key:"p",label:"Player name",max_length:16,label_visible:1b},{type:"minecraft:single_option",key:"d",label:"Duration",options:[{id:"1200",display:"1 minute"},{id:"6000",display:"5 minutes"},{id:"24000",display:"20 minutes"},{id:"72000",display:"1 hour"}]}],can_close_with_escape:1b,pause:0b,actions:[{label:"🔇 Mute",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:features/mod/mute_mute {player:\"$(p)\",reason:\"Moderator decision\",duration:$(d)}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🔊 Unmute",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔊 Unmute Player",inputs:[{type:"minecraft:text",key:"p",label:"Player name",max_length:16,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"🔊 Unmute",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:features/mod/mute_unmute {player:\"$(p)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"👢 Kick",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👢 Kick Player",inputs:[{type:"minecraft:text",key:"p",label:"Player name",max_length:16,label_visible:1b},{type:"minecraft:text",key:"r",label:"Reason",max_length:100,initial:"Rule Violation",label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"👢 Kick",action:{type:"minecraft:dynamic/run_command",template:"/kick $(p) $(r)"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📋 Check Warns",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📋 Check Warnings",inputs:[{type:"minecraft:text",key:"p",label:"Player name",max_length:16,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"🔍 Check",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/warn/check {player:\"$(p)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📛 NameTag Mode",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 21"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀ Main Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# Fallback (TR)
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:["",{text:"⚔ MOD ARAÇLARI",color:"blue",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Oyuncu adı gir, aksiyonu seç:"},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"❄ Dondur",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"❄ Dondur",inputs:[{type:"minecraft:text",key:"p",label:"Oyuncu",max_length:16}],can_close_with_escape:1b,pause:0b,actions:[{label:"❄ Dondur",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:features/mod/freeze_by_name {player:\"$(p)\"}"}}]}}}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚠ Uyar",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚠ Uyar",inputs:[{type:"minecraft:text",key:"p",label:"Oyuncu",max_length:16},{type:"minecraft:text",key:"r",label:"Sebep",initial:"Kural İhlali",max_length:100}],can_close_with_escape:1b,pause:0b,actions:[{label:"⚠ Uyar",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/warn/warn {player:\"$(p)\",reason:\"$(r)\",mod:\"@s\"}"}}]}}}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

function glc_menu:handler/dialog/show with storage glc:ui ui

# v2.5.7: Spectate ve Vanish butonları
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"👁 Spectate",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👁 Oyuncu İzle",inputs:[{type:"minecraft:text",key:"p",label:"Oyuncu adı",max_length:16,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"👁 İzle",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:features/spectate/watch {player:\"$(p)\"}"}}]}}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"👻 Vanish",action:{type:"minecraft:run_command",command:"/function custom_admin:features/vanish/toggle"}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"👁 Spectate",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👁 Watch Player",inputs:[{type:"minecraft:text",key:"p",label:"Player name",max_length:16,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"👁 Watch",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:features/spectate/watch {player:\"$(p)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"👻 Vanish",action:{type:"minecraft:run_command",command:"/function custom_admin:features/vanish/toggle"}}

execute if entity @s[tag=glc.lang_de] run data modify storage glc:ui ui.actions append value {label:"👁 Beobachten",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👁 Spieler beobachten",inputs:[{type:"minecraft:text",key:"p",label:"Spielername",max_length:16,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"👁 Beobachten",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:features/spectate/watch {player:\"$(p)\"}"}}]}}}
execute if entity @s[tag=glc.lang_de] run data modify storage glc:ui ui.actions append value {label:"👻 Unsichtbar",action:{type:"minecraft:run_command",command:"/function custom_admin:features/vanish/toggle"}}
