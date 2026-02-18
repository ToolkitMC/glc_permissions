# Spy Panel Macro - {spy_target:"isim"}
# ── TR ────────────────────────────────────────────
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:["",{text:"🔍 GÖZETLEME",color:"light_purple",bold:true}],body:{type:"minecraft:plain_message",contents:"§8En yakın oyuncu seçildi.\n§7Bir aksiyon seçin:"},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

$execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.body set value {type:"minecraft:plain_message",contents:"§8Hedef: §e$(spy_target)\n§7Bir aksiyon seçin:"}

$execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📋 Uyarıları Gör",action:{type:"minecraft:run_command",command:"/function custom_admin:api/warn/check {player:\"$(spy_target)\"}"}}
$execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"❄ Dondur",action:{type:"minecraft:run_command",command:"/function custom_admin:features/mod/freeze_by_name {player:\"$(spy_target)\"}"}}
$execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🔥 Çöz",action:{type:"minecraft:run_command",command:"/function custom_admin:features/mod/unfreeze_by_name {player:\"$(spy_target)\"}"}}
$execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"⚠ Uyar",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚠ Uyarı Ver",inputs:[{type:"minecraft:text",key:"r",label:"Sebep",initial:"Kural İhlali",max_length:100,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"⚠ Uyar",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/warn/warn {player:\"$(spy_target)\",reason:\"$(r)\",mod:\"@s\"}"}}]}}}
$execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🔇 Sustur (5dk)",action:{type:"minecraft:run_command",command:"/function custom_admin:features/mod/mute_mute {player:\"$(spy_target)\",reason:\"Moderatör kararı\",duration:6000}"}}
$execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"👢 Kick",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👢 Kick",inputs:[{type:"minecraft:text",key:"r",label:"Sebep",initial:"Kural İhlali",max_length:100}],can_close_with_escape:1b,pause:0b,actions:[{label:"👢 Kick",action:{type:"minecraft:dynamic/run_command",template:"/kick $(spy_target) $(r)"}}]}}}
$execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"❤ İyileştir",action:{type:"minecraft:run_command",command:"/execute as @a[name=$(spy_target)] run function custom_admin:features/mod/health_heal"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 20"}}

# ── EN ────────────────────────────────────────────
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:["",{text:"🔍 SPY MONOCLE",color:"light_purple",bold:true}],body:{type:"minecraft:plain_message",contents:"§8Nearest player selected.\n§7Choose an action:"},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

$execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.body set value {type:"minecraft:plain_message",contents:"§8Target: §e$(spy_target)\n§7Choose an action:"}

$execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📋 View Warnings",action:{type:"minecraft:run_command",command:"/function custom_admin:api/warn/check {player:\"$(spy_target)\"}"}}
$execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"❄ Freeze",action:{type:"minecraft:run_command",command:"/function custom_admin:features/mod/freeze_by_name {player:\"$(spy_target)\"}"}}
$execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🔥 Unfreeze",action:{type:"minecraft:run_command",command:"/function custom_admin:features/mod/unfreeze_by_name {player:\"$(spy_target)\"}"}}
$execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚠ Warn",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚠ Warn",inputs:[{type:"minecraft:text",key:"r",label:"Reason",initial:"Rule Violation",max_length:100,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"⚠ Warn",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/warn/warn {player:\"$(spy_target)\",reason:\"$(r)\",mod:\"@s\"}"}}]}}}
$execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🔇 Mute (5min)",action:{type:"minecraft:run_command",command:"/function custom_admin:features/mod/mute_mute {player:\"$(spy_target)\",reason:\"Moderator decision\",duration:6000}"}}
$execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"👢 Kick",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👢 Kick",inputs:[{type:"minecraft:text",key:"r",label:"Reason",initial:"Rule Violation",max_length:100}],can_close_with_escape:1b,pause:0b,actions:[{label:"👢 Kick",action:{type:"minecraft:dynamic/run_command",template:"/kick $(spy_target) $(r)"}}]}}}
$execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"❤ Heal",action:{type:"minecraft:run_command",command:"/execute as @a[name=$(spy_target)] run function custom_admin:features/mod/health_heal"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀ Back",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 20"}}

# Fallback
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:["",{text:"🔍 GÖZETLEME",color:"light_purple",bold:true}],body:{type:"minecraft:plain_message",contents:"§8Hedef seçildi. Aksiyon seç:"},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
$execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📋 Uyarılar",action:{type:"minecraft:run_command",command:"/function custom_admin:api/warn/check {player:\"$(spy_target)\"}"}}
$execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"❄ Dondur",action:{type:"minecraft:run_command",command:"/function custom_admin:features/mod/freeze_by_name {player:\"$(spy_target)\"}"}}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

function glc_menu:handler/dialog/show with storage glc:ui ui
data remove storage glc:temp spy_target
