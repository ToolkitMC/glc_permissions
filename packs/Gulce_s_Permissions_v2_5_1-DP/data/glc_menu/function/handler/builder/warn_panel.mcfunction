# ═══════════════════════════════════════════════════
# Menü 20: Uyarı Yönetimi Paneli
# DÜZELTİLDİ v2.5.7: mod alanı artık dinamik (@s adı)
# ═══════════════════════════════════════════════════

tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

# Önce @s adını al (player_name sistemi)
function glc_menu:handler/utils/player_name

# ── TÜRKÇE ───────────────────────────────────────
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"⚠️ Uyarı Yönetimi",color:"red",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Uyarı vermek için iki yöntem:\n\n§a● §fDiyalog §7→ Tam form, §cpopup çıkar\n§a● §fNameTag §7→ Eşya adı = oyuncu, §apopup yok\n\n§8📛 NameTag: Elindeki eşyayı\n§8örs'te oyuncu adıyla yeniden adlandır!"},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

# Diyalog ile Uyar (mod alanı boş bırakıldı - API @s'den alır)
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📋 Diyalog: Uyar",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚠️ Uyarı Ver",inputs:[{type:"minecraft:text",key:'player',label:"👤 Oyuncu adı",label_visible:1b,max_length:32},{type:"minecraft:text",key:'reason',label:"📋 Sebep",label_visible:1b,initial:"Kural İhlali",max_length:200}],can_close_with_escape:1b,pause:0b,actions:[{label:"⚠️ Uyar",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/warn/warn {player:\"$(player)\",reason:\"$(reason)\",mod:\"@s\"}"}}]}}}

# Diyalog ile Sorgula
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🔍 Diyalog: Sorgula",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔍 Uyarı Sorgula",inputs:[{type:"minecraft:text",key:'player',label:"👤 Oyuncu adı",label_visible:1b,max_length:32}],can_close_with_escape:1b,pause:0b,actions:[{label:"🔍 Sorgula",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/warn/check {player:\"$(player)\"}"}}]}}}

# Diyalog ile Affet
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"✅ Diyalog: Affet",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"✅ Uyarı Temizle",inputs:[{type:"minecraft:text",key:'player',label:"👤 Oyuncu adı",label_visible:1b,max_length:32}],can_close_with_escape:1b,pause:0b,actions:[{label:"✅ Affet",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/warn/pardon {player:\"$(player)\"}"}}]}}}

# AYRAÇ
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"─── 📛 NameTag ───",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 21"}}

# NameTag kısayolları
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📛 NameTag: Uyar",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 1"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📛 NameTag: Sorgula",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 2"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📛 NameTag: Affet",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 3"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀️ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# ── İNGİLİZCE ────────────────────────────────────
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"⚠️ Warning Management",color:"red",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Two methods to warn players:\n\n§a● §fDialog §7→ Full form, §cpopup appears\n§a● §fNameTag §7→ Item name = player, §ano popup\n\n§8📛 NameTag: Rename your held\n§8item to the player's name in Anvil!"},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📋 Dialog: Warn",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚠️ Warn Player",inputs:[{type:"minecraft:text",key:'player',label:"👤 Player name",label_visible:1b,max_length:32},{type:"minecraft:text",key:'reason',label:"📋 Reason",label_visible:1b,initial:"Rule Violation",max_length:200}],can_close_with_escape:1b,pause:0b,actions:[{label:"⚠️ Warn",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/warn/warn {player:\"$(player)\",reason:\"$(reason)\",mod:\"@s\"}"}}]}}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🔍 Dialog: Check",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔍 Check Warnings",inputs:[{type:"minecraft:text",key:'player',label:"👤 Player name",label_visible:1b,max_length:32}],can_close_with_escape:1b,pause:0b,actions:[{label:"🔍 Check",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/warn/check {player:\"$(player)\"}"}}]}}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"✅ Dialog: Pardon",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"✅ Clear Warnings",inputs:[{type:"minecraft:text",key:'player',label:"👤 Player name",label_visible:1b,max_length:32}],can_close_with_escape:1b,pause:0b,actions:[{label:"✅ Pardon",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/warn/pardon {player:\"$(player)\"}"}}]}}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"─── 📛 NameTag ───",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 21"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📛 NameTag: Warn",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 1"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📛 NameTag: Check",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 2"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📛 NameTag: Pardon",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 3"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀️ Back",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# Fallback (dil tag yoksa TR)
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"⚠️ Uyarı Yönetimi",color:"red",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Uyarı vermek için iki yöntem:\n\n§a● §fDiyalog §7→ Tam form, §cpopup çıkar\n§a● §fNameTag §7→ Eşya adı = oyuncu, §apopup yok"},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📛 NameTag: Uyar",action:{type:"minecraft:run_command",command:"/trigger gulce_nametag set 1"}}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀️ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# Panel göster
function glc_menu:handler/dialog/show with storage glc:ui ui
