# ═══════════════════════════════════════════════════
# Menü 22: Özel Eylem Oluşturucu
# Herhangi bir fonksiyonu args ile eylem olarak kaydeder
# ═══════════════════════════════════════════════════

tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

# ── TÜRKÇE ───────────────────────────────────────
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"⚙️ Özel Eylem Oluşturucu",color:"light_purple",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Herhangi bir fonksiyonu makro args ile eylem olarak kaydet.\n\n§l§6Eylem Tipi: §r§fcustom\n§l§6Nasıl Çalışır:\n§f1. §7Fonksiyon yolunu gir §e(ns:path)\n§f2. §7Args JSON'ını gir §e({key:\"val\"})\n§f3. §7Eylemi kaydet → menüden çalıştır\n\n§8Örnek:\n§8ns:path = custom_admin:api/warn/warn\n§8args = {player:\"Ahmet\",reason:\"Test\",mod:\"@s\"}"},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

# Yeni özel eylem ekle
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"➕ Özel Eylem Ekle",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"➕ Özel Eylem Ekle",inputs:[{type:"minecraft:text",key:'id',label:"🔑 Eylem ID",label_visible:1b,max_length:64,initial:"ozel_eylem_1"},{type:"minecraft:text",key:'function',label:"📂 Fonksiyon (ns:path)",label_visible:1b,max_length:200,initial:"custom_admin:api/warn/warn"},{type:"minecraft:text",key:'args',label:"📦 Argümanlar (NBT/JSON)",label_visible:1b,max_length:2000,initial:"{player:\"Ahmet\",reason:\"Test\",mod:\"Staff\"}",multiline:{}},{type:"minecraft:text",key:'player',label:"👤 Oyuncu Seçici",label_visible:1b,max_length:64,initial:"@s"}],can_close_with_escape:1b,pause:0b,actions:[{label:"✅ Kaydet",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/add/action_custom {id:\"$(id)\",function:\"$(function)\",args:\"$(args)\",player:\"$(player)\"}"}}]}}}

# Eylem listesi
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📋 Eylem Listesi",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}

# Eylem çalıştır (ID ile)
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"▶️ Eylem Çalıştır",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"▶️ Eylem Çalıştır",inputs:[{type:"minecraft:text",key:'id',label:"🔑 Eylem ID",label_visible:1b,max_length:64}],can_close_with_escape:1b,pause:0b,actions:[{label:"▶️ Çalıştır",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:handler/execute/action {id:\"$(id)\"}"}}]}}}

# Eylem sil
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"🗑️ Eylem Sil",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🗑️ Eylem Sil",inputs:[{type:"minecraft:text",key:'id',label:"🔑 Silinecek ID",label_visible:1b,max_length:64}],can_close_with_escape:1b,pause:0b,actions:[{label:"🗑️ Sil",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/delete/action {id:\"$(id)\"}"}}]}}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀️ Ana Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# ── İNGİLİZCE ────────────────────────────────────
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:['',{text:"⚙️ Custom Action Builder",color:"light_purple",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Register any function with macro args as an action.\n\n§l§6Action Type: §r§fcustom\n§l§6How It Works:\n§f1. §7Enter function path §e(ns:path)\n§f2. §7Enter args JSON §e({key:\"val\"})\n§f3. §7Save → run from menu\n\n§8Example:\n§8ns:path = custom_admin:api/warn/warn\n§8args = {player:\"Ahmet\",reason:\"Test\",mod:\"@s\"}"},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"➕ Add Custom Action",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"➕ Add Custom Action",inputs:[{type:"minecraft:text",key:'id',label:"🔑 Action ID",label_visible:1b,max_length:64,initial:"custom_action_1"},{type:"minecraft:text",key:'function',label:"📂 Function (ns:path)",label_visible:1b,max_length:200,initial:"custom_admin:api/warn/warn"},{type:"minecraft:text",key:'args',label:"📦 Arguments (NBT/JSON)",label_visible:1b,max_length:2000,initial:"{player:\"Ahmet\",reason:\"Test\",mod:\"Staff\"}",multiline:{}},{type:"minecraft:text",key:'player',label:"👤 Player Selector",label_visible:1b,max_length:64,initial:"@s"}],can_close_with_escape:1b,pause:0b,actions:[{label:"✅ Save",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/add/action_custom {id:\"$(id)\",function:\"$(function)\",args:\"$(args)\",player:\"$(player)\"}"}}]}}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📋 Action List",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"▶️ Run Action",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"▶️ Run Action",inputs:[{type:"minecraft:text",key:'id',label:"🔑 Action ID",label_visible:1b,max_length:64}],can_close_with_escape:1b,pause:0b,actions:[{label:"▶️ Run",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:handler/execute/action {id:\"$(id)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"🗑️ Delete Action",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🗑️ Delete Action",inputs:[{type:"minecraft:text",key:'id',label:"🔑 Action ID to delete",label_visible:1b,max_length:64}],can_close_with_escape:1b,pause:0b,actions:[{label:"🗑️ Delete",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:api/delete/action {id:\"$(id)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀️ Main Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# Panel göster
function glc_menu:handler/dialog/show