# ═══════════════════════════════════════════════════
# Settings Menu Builder (v2.5.0)
# Menu ID: 60
# Purpose: Configure language and cooldown settings
# ═══════════════════════════════════════════════════

# Loading Göster
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

# Turkish Menu
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"⚙️ AYARLAR",color:"aqua",bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Sistem ayarlarını buradan yapılandırabilirsiniz\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🌐 Dil: Türkçe",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🌐 Dil Seçimi",body:{type:"minecraft:plain_message",contents:"Dil değiştirmek için aşağıdan seçim yapın:"},inputs:[{type:"minecraft:single_option",key:'lang',label:"Dil",options:[{id:'tr',display:"🇹🇷 Türkçe"},{id:'en',display:"🇬🇧 English"}]}],actions:[{label:"✅ Uygula",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:util/lang/set {lang:\"$(lang)\"}"}}]}}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"⏱️ Cooldown Ayarları",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⏱️ Cooldown Ayarları",inputs:[{type:"minecraft:text",key:'player',label:"Oyuncu adı (Zorunlu)",initial:"@s",max_length:40000},{type:"minecraft:text",key:'value',label:"Değer (tick)",initial:"20",max_length:2000000000}],body:{type:"minecraft:plain_message",contents:"§e20 tick = 1 saniye\n§7Değerleri tick cinsinden girin"},actions:[{label:"💾 Kaydet",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:util/cooldown/set {player:\"$(player)\",value:\"$(value)\"}"}}]}}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📊 Mevcut Ayarlar",action:{type:"minecraft:run_command",command:"/function custom_admin:util/settings/show"}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🔄 Varsayılana Dön",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:notice",title:"⚠️ Onay",body:{type:"minecraft:plain_message",contents:"Tüm ayarları varsayılan değerlere döndürmek istediğinize emin misiniz?"},can_close_with_escape:1b,pause:0b,action:{label:"✅ Evet, Sıfırla",action:{type:"minecraft:run_command",command:"/function custom_admin:util/settings/reset"}}}}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀️ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}

# English Menu
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"⚙️ SETTINGS",color:"aqua",bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Configure system settings here\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🌐 Language: English",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🌐 Language Selection",body:{type:"minecraft:plain_message",contents:"Select a language below:"},inputs:[{type:"minecraft:single_option",key:'lang',label:"Language",options:[{id:'tr',display:"🇹🇷 Türkçe"},{id:'en',display:"🇬🇧 English"}]}],actions:[{label:"✅ Apply",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:util/lang/set {lang:\"$(lang)\"}"}}]}}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⏱️ Cooldown Settings",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⏱️ Cooldown Settings",inputs:[{type:"minecraft:text",key:'player',label:"Player Name (Compulsory)",initial:"@s",max_length:40000},{type:"minecraft:text",key:'value',label:"Value (tick)",initial:"20",max_length:2000000000}],body:{type:"minecraft:plain_message",contents:"§e20 ticks = 1 second\n§7Enter values in ticks"},actions:[{label:"💾 Save",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:util/cooldown/set {player:\"$(player)\",value:\"$(value)\"}"}}]}}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📊 Current Settings",action:{type:"minecraft:run_command",command:"/function custom_admin:util/settings/show"}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🔄 Reset to Default",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:notice",title:"⚠️ Confirmation",body:{type:"minecraft:plain_message",contents:"Are you sure you want to reset all settings to default values?"},can_close_with_escape:1b,pause:0b,action:{label:"✅ Yes, Reset",action:{type:"minecraft:run_command",command:"/function custom_admin:util/settings/reset"}}}}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀️ Back",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}

# Default Menu (Turkish)
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"⚙️ AYARLAR",color:"aqua",bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Sistem ayarlarını buradan yapılandırabilirsiniz\n "},can_close_with_escape:true,pause:false,columns:2,actions:[]}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🌐 Dil: Türkçe",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🌐 Dil Seçimi",body:{type:"minecraft:plain_message",contents:"Dil değiştirmek için aşağıdan seçim yapın:"},inputs:[{type:"minecraft:single_option",key:'lang',label:"Dil",options:[{id:'tr',display:"🇹🇷 Türkçe"},{id:'en',display:"🇬🇧 English"}]}],actions:[{label:"✅ Uygula",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:util/lang/set {lang:\"$(lang)\"}"}}]}}}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⏱️ Cooldown Ayarları",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⏱️ Cooldown Ayarları",inputs:[{type:"minecraft:text",key:'player',label:"Oyuncu adı (Zorunlu)",initial:"@s",max_length:40000},{type:"minecraft:text",key:'value',label:"Değer (tick)",initial:"20",max_length:2000000000}],body:{type:"minecraft:plain_message",contents:"§e20 tick = 1 saniye\n§7Değerleri tick cinsinden girin"},actions:[{label:"💾 Kaydet",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:util/cooldown/set {player:\"$(player)\",value:\"$(value)\"}"}}]}}}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📊 Mevcut Ayarlar",action:{type:"minecraft:run_command",command:"/function custom_admin:util/settings/show"}}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🔄 Varsayılana Dön",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:notice",title:"⚠️ Onay",body:{type:"minecraft:plain_message",contents:"Tüm ayarları varsayılan değerlere döndürmek istediğinize emin misiniz?"},can_close_with_escape:true,pause:false,action:{label:"✅ Evet, Sıfırla",action:{type:"minecraft:run_command",command:"/function custom_admin:util/settings/reset"}}}}}

execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀️ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}
