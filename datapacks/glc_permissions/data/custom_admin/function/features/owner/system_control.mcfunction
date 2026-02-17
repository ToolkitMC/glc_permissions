# ═══════════════════════════════════════════════════
# 👑 GULCE OWNER PANEL - SYSTEM CONTROL (1.21.6)
# ═══════════════════════════════════════════════════

# 1. YETKİ KONTROLÜ
execute unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s {text:"❌ Bu panel sadece OWNER yetkisine özeldir!",color:"red"}
execute unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s {text:"❌ Bu panel sadece OWNER yetkisine özeldir!",color:"red"}
execute unless entity @s[tag=gulce_owner] run return fail

# 2. UI VERİ YAPISI (Storage Temiz Başlangıç)
data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"👑 OWNER KONTROL MERKEZİ",color:"red",bold:true},body:{type:"minecraft:plain_message",contents:"\n§eSistem, Dünya ve Oyun Modu ayarları:\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

# 3. BUTONLAR VE KATEGORİLER

# --- ROL YÖNETİMİ (Hızlı Aksiyon) ---
data modify storage glc:ui ui.actions append value {label:"👥 Rol Menüsü",action:{type:"minecraft:run_command",command:"/function custom_admin:role/menu"}}
data modify storage glc:ui ui.actions append value {label:"📊 Oyuncu Listesi",action:{type:"minecraft:run_command",command:"/function custom_admin:role/list_players"}}

# --- SİSTEM AYARLARI ---
data modify storage glc:ui ui.actions append value {label:"🔄 Datapack Reload",action:{type:"minecraft:run_command",command:"/reload"}}

# --- DÜNYA AYARLARI (Inputlu) ---
data modify storage glc:ui ui.actions append value {label:"🌞 Zaman Ayarla",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🌞 Zamanı Yönet",inputs:[{type:"minecraft:single_option",key:'tm',label:"Vakit Seç",options:[{id:'day',display:"Gündüz"},{id:'night',display:"Gece"},{id:"6000",display:"Öğle"}]}],actions:[{label:"⏰ Ayarla",action:{type:"minecraft:dynamic/run_command",template:"/time set $(tm)"}}]}}}

data modify storage glc:ui ui.actions append value {label:"🌧️ Hava Durumu",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🌧️ Hava Durumu Yönet",inputs:[{type:"minecraft:single_option",key:'wth',label:"Hava Durumu",options:[{id:'clear',display:"Açık"},{id:'rain',display:"Yağmurlu"},{id:'thunder',display:"Fırtınalı"}]}],actions:[{label:"🌤️ Uygula",action:{type:"minecraft:dynamic/run_command",template:"/weather $(wth)"}}]}}}

# --- OYUN MODLARI (Inputlu) ---
data modify storage glc:ui ui.actions append value {label:"🔧 Creative Mod",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔧 Oyun Modu Değiştir",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı",initial:"@s"}],actions:[{label:"Yaratıcı Yap",action:{type:"minecraft:run_command",command:"/gamemode creative @s"}}]}}}

data modify storage glc:ui ui.actions append value {label:"⚔️ Survival Mod",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚔️ Oyun Modu Değiştir",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı",initial:"@s"}],actions:[{label:"Hayatta Kalma Yap",action:{type:"minecraft:run_command",command:"/gamemode survival @s"}}]}}}

# --- Diğer ---
data modify storage glc:ui ui.actions append value {label:"Eylem Çalıştırıcı",action:{type:"minecraft:show_dialog","dialog":{"type": "minecraft:multi_action","title":"Eylem çalıştır","inputs":[{"type":"minecraft:text","key":'id',"label":"ID","label_visible":1b,"max_length":2000000000},{"type":"minecraft:boolean","key":'name',"label":"Tüm oyuncular için çalıştır","initial":1b,"on_true":"@a","on_false":"@s"}],"can_close_with_escape":1b,"pause":0b,"after_action":'close',"actions":[{"label":"Çalıştır","action":{"type": "minecraft:dynamic/run_command","template":"/execute as $(name) run function custom_admin:handler/execute/action {\"id\":\"$(id)\"}"}}]}}}

# 4. GÖSTERİM
function glc_menu:handler/dialog/show