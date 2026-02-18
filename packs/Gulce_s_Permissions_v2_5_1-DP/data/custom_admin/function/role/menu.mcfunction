# ═══════════════════════════════════════════════════
# ⚡ GULCE ROLE MANAGEMENT - QUICK ACTIONS
# DÜZELTİLDİ v2.5.7: @s yerine player_name sistemi kullanıyor
# ═══════════════════════════════════════════════════

# 1. YETKİ KONTROLÜ
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] unless entity @s[tag=gulce_admin] if entity @s[tag=glc.lang_tr] run tellraw @s {text:"❌ Bu panele erişim yetkiniz yok!",color:"red"}
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] unless entity @s[tag=gulce_admin] if entity @s[tag=glc.lang_en] run tellraw @s {text:"❌ You do not have access to this panel!",color:"red"}
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] unless entity @s[tag=gulce_admin] run return fail

# 2. Kendi adını al (player_name sistemi - @s varlık değil oyuncu adı döner)
function glc_menu:handler/utils/player_name

# 3. UI HAZIRLIĞI
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"👑 ROL YÖNETİMİ",color:"yellow",bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Oyuncu adını girerek rol atayın:\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"👑 ROLE MANAGEMENT",color:"yellow",bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Enter player name to assign a role:\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"👑 ROL YÖNETİMİ",color:"yellow",bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Oyuncu adını girerek rol atayın:\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

# 4. BUTONLAR - Input ile oyuncu adı alır (macro-safe)
# --- [👑] OWNER ROLÜ ---
execute if entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"👑 OWNER Rolü Ver",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👑 OWNER Rolü Ver",inputs:[{type:"minecraft:text",key:'p',label:"👤 Oyuncu Adı",max_length:16}],can_close_with_escape:1b,pause:0b,actions:[{label:"✅ Ver",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:role/assign_owner {player:\"$(p)\"}"}}]}}}
execute if entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"👑 Assign OWNER",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👑 Assign OWNER Role",inputs:[{type:"minecraft:text",key:'p',label:"👤 Player Name",max_length:16}],can_close_with_escape:1b,pause:0b,actions:[{label:"✅ Assign",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:role/assign_owner {player:\"$(p)\"}"}}]}}}

# --- [🛡] ADMIN ROLÜ ---
execute if entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🛡 ADMIN Rolü Ver",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🛡 ADMIN Rolü Ver",inputs:[{type:"minecraft:text",key:'p',label:"👤 Oyuncu Adı",max_length:16}],can_close_with_escape:1b,pause:0b,actions:[{label:"✅ Ver",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:role/assign_admin {player:\"$(p)\"}"}}]}}}
execute if entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🛡 Assign ADMIN",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🛡 Assign ADMIN Role",inputs:[{type:"minecraft:text",key:'p',label:"👤 Player Name",max_length:16}],can_close_with_escape:1b,pause:0b,actions:[{label:"✅ Assign",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:role/assign_admin {player:\"$(p)\"}"}}]}}}

# --- [👮] MOD ROLÜ ---
execute if entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"👮 MOD Rolü Ver",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👮 MOD Rolü Ver",inputs:[{type:"minecraft:text",key:'p',label:"👤 Oyuncu Adı",max_length:16}],can_close_with_escape:1b,pause:0b,actions:[{label:"✅ Ver",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:role/assign_mod {player:\"$(p)\"}"}}]}}}
execute if entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"👮 Assign MOD",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👮 Assign MOD Role",inputs:[{type:"minecraft:text",key:'p',label:"👤 Player Name",max_length:16}],can_close_with_escape:1b,pause:0b,actions:[{label:"✅ Assign",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:role/assign_mod {player:\"$(p)\"}"}}]}}}

# --- [⭐] VIP ROLÜ ---
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"⭐ VIP Rolü Ver",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⭐ VIP Rolü Ver",inputs:[{type:"minecraft:text",key:'p',label:"👤 Oyuncu Adı",max_length:16}],can_close_with_escape:1b,pause:0b,actions:[{label:"✅ Ver",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:role/assign_vip {player:\"$(p)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⭐ Assign VIP",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⭐ Assign VIP Role",inputs:[{type:"minecraft:text",key:'p',label:"👤 Player Name",max_length:16}],can_close_with_escape:1b,pause:0b,actions:[{label:"✅ Assign",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:role/assign_vip {player:\"$(p)\"}"}}]}}}

# --- [👤] PLAYER ROLÜ ---
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"👤 PLAYER Rolü Ver",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👤 PLAYER Rolü Ver",inputs:[{type:"minecraft:text",key:'p',label:"👤 Oyuncu Adı",max_length:16}],can_close_with_escape:1b,pause:0b,actions:[{label:"✅ Ver",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:role/assign_player {player:\"$(p)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"👤 Assign PLAYER",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👤 Assign PLAYER Role",inputs:[{type:"minecraft:text",key:'p',label:"👤 Player Name",max_length:16}],can_close_with_escape:1b,pause:0b,actions:[{label:"✅ Assign",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:role/assign_player {player:\"$(p)\"}"}}]}}}

# --- [❌] TÜM ROLLERİ KALDIR ---
execute if entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"❌ Rolleri Temizle",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"❌ Rolleri Temizle",inputs:[{type:"minecraft:text",key:'p',label:"👤 Oyuncu Adı",max_length:16}],can_close_with_escape:1b,pause:0b,actions:[{label:"🗑️ Temizle",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:role/remove_all {player:\"$(p)\"}"}}]}}}
execute if entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"❌ Remove All Roles",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"❌ Remove All Roles",inputs:[{type:"minecraft:text",key:'p',label:"👤 Player Name",max_length:16}],can_close_with_escape:1b,pause:0b,actions:[{label:"🗑️ Remove",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:role/remove_all {player:\"$(p)\"}"}}]}}}

# --- [📋] LİSTELEME ---
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📋 Oyuncu Listesi",action:{type:"minecraft:run_command",command:"/function custom_admin:role/list_players"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📋 Player List",action:{type:"minecraft:run_command",command:"/function custom_admin:role/list_players"}}

# 5. RENDER
function glc_menu:handler/dialog/show
return 0
