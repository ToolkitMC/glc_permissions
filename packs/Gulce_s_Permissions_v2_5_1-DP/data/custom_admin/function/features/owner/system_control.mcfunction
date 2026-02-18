# ═══════════════════════════════════════════════════
# 👑 GULCE OWNER PANEL - SYSTEM CONTROL (v2.5.1)
# ═══════════════════════════════════════════════════

# 1. YETKİ KONTROLÜ
execute unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s {text:"❌ Bu panel sadece OWNER yetkisine özeldir!",color:"red"}
execute unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s {text:"❌ This panel is exclusive to OWNER!",color:"red"}
execute unless entity @s[tag=gulce_owner] run return fail

# 2. UI
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"👑 OWNER KONTROL MERKEZİ",color:"red",bold:true},body:{type:"minecraft:plain_message",contents:"\n§eSistem, Dünya ve Oyun Modu ayarları:\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"👑 OWNER CONTROL CENTER",color:"red",bold:true},body:{type:"minecraft:plain_message",contents:"\n§eSystem, World and Gamemode settings:\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"👑 OWNER KONTROL MERKEZİ",color:"red",bold:true},body:{type:"minecraft:plain_message",contents:"\n§eSistem, Dünya ve Oyun Modu ayarları:\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

# ─── ROL & SİSTEM ─────────────────────────────────────────────────

# [👥] ROL MENÜSÜ
data modify storage glc:ui ui.actions append value {label:"👥 Rol Menüsü",action:{type:"minecraft:run_command",command:"/function custom_admin:role/menu"}}

# [📊] OYUNCU LİSTESİ
data modify storage glc:ui ui.actions append value {label:"📊 Oyuncu Listesi",action:{type:"minecraft:run_command",command:"/function custom_admin:role/list_players"}}

# [🔄] RELOAD
data modify storage glc:ui ui.actions append value {label:"🔄 Datapack Reload",action:{type:"minecraft:run_command",command:"/reload"}}

# [📈] SUNUCU İSTATİSTİKLERİ
data modify storage glc:ui ui.actions append value {label:"📈 İstatistikler",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/utils/stats"}}

# ─── DÜNYA AYARLARI ───────────────────────────────────────────────

# [🌞] ZAMAN
data modify storage glc:ui ui.actions append value {label:"🌞 Zaman Ayarla",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🌞 Zaman Yönetimi",inputs:[{type:"minecraft:single_option",key:'tm',label:"Vakit",options:[{id:"day",display:"☀️ Gündüz"},{id:"night",display:"🌙 Gece"},{id:"6000",display:"🌤️ Öğle"},{id:"0",display:"🌅 Şafak"},{id:"18000",display:"🌃 Gece Başlangıcı"}]}],actions:[{label:"⏰ Ayarla",action:{type:"minecraft:dynamic/run_command",template:"/time set $(tm)"}}]}}}

# [🌧️] HAVA DURUMU
data modify storage glc:ui ui.actions append value {label:"🌧️ Hava Durumu",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🌧️ Hava Durumu",inputs:[{type:"minecraft:single_option",key:'wth',label:"Hava",options:[{id:"clear",display:"☀️ Açık"},{id:"rain",display:"🌧️ Yağmurlu"},{id:"thunder",display:"⛈️ Fırtınalı"}]}],actions:[{label:"🌤️ Uygula",action:{type:"minecraft:dynamic/run_command",template:"/weather $(wth)"}}]}}}

# [🌍] OYUN KURALLARI
data modify storage glc:ui ui.actions append value {label:"🌍 Oyun Kuralları",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🌍 Gamerule",inputs:[{type:"minecraft:single_option",key:'rule',label:"Kural",options:[{id:"keep_inventory",display:"🎒 Envanter Koru"},{id:"fall_damage",display:"Düşme Hasarı"},{id:"spawn_mobs",display:"👾 Canavar Spawn"},{id:"command_block_output",display:"Komut Bloğu Çıktıları"},{id:"pvp",display:"⚔️ PvP"},{id:"command_blocks_work",display:"Komut Blokları"},{id:"water_source_conversion",display:"Su Kaynağı Dönüşümü"},{id:"raids",display:"Baskınlar"},{id:"drowning_damage",display:"Boğulma Hasarı"},{id:"tnt_explosion_drop_decay",display:"TNT Patlaması Sonucu Oluşan Damla Çürümesi"}]},{type:"minecraft:single_option",key:'value',label:"Değer",options:[{id:"true",display:"✅ Açık"},{id:"false",display:"❌ Kapalı"}]}],actions:[{label:"✅ Uygula",action:{type:"minecraft:dynamic/run_command",template:"/gamerule $(rule) $(value)"}}]}}}

# ─── OYUN MODU ────────────────────────────────────────────────────

# [🔧] OYUNCU OYUN MODU
data modify storage glc:ui ui.actions append value {label:"🎮 Oyun Modu Değiştir",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🎮 Oyun Modu",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu (isim veya @a)",initial:"@s"},{type:"minecraft:single_option",key:'gm',label:"Mod",options:[{id:"creative",display:"🔧 Creative"},{id:"survival",display:"⚔️ Survival"},{id:"adventure",display:"🗺️ Adventure"},{id:"spectator",display:"👁️ Spectator"}]}],actions:[{label:"✅ Değiştir",action:{type:"minecraft:dynamic/run_command",template:"/gamemode $(gm) @a"}}]}}}

# ─── VIP KONUM AYARLARI ───────────────────────────────────────────

# [📍] VIP IŞINLANMA KONUMLARI AYARLA
data modify storage glc:ui ui.actions append value {label:"📍 VIP Konum Ayarla",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📍 VIP Konum Ayarla",inputs:[{type:"minecraft:single_option",key:'loc',label:"Konum Adı",options:[{id:"spawn",display:"🏠 Spawn"},{id:"castle",display:"🏰 Kale"},{id:"mine",display:"⛏️ Maden"},{id:"forest",display:"🌲 Orman"},{id:"ocean",display:"🌊 Deniz"},{id:"mountain",display:"🏔️ Dağ"}]},{type:"minecraft:text",key:'x',label:"X"},{type:"minecraft:text",key:'y',label:"Y",initial:"64"},{type:"minecraft:text",key:'z',label:"Z"}],actions:[{label:"💾 Kaydet",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:features/vip/set_location {loc:\"$(loc)\",x:$(x),y:$(y),z:$(z)}"}}]}}}

# [📍] MEVCUT KONUMU KAYDET (Owner'ın bulunduğu yeri)
data modify storage glc:ui ui.actions append value {label:"📌 Bulunduğum Konumu Kaydet",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📌 Konum Kaydet",inputs:[{type:"minecraft:single_option",key:'loc',label:"Konum Adı",options:[{id:"spawn",display:"🏠 Spawn"},{id:"castle",display:"🏰 Kale"},{id:"mine",display:"⛏️ Maden"},{id:"forest",display:"🌲 Orman"},{id:"ocean",display:"🌊 Deniz"},{id:"mountain",display:"🏔️ Dağ"}]}],actions:[{label:"💾 Kaydet",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:features/owner/save_current_location {loc:\"$(loc)\"}"}}]}}}

# ─── EYLEM SİSTEMİ ────────────────────────────────────────────────

# [⚡] EYLEM ÇALIŞTIR
data modify storage glc:ui ui.actions append value {label:"⚡ Eylem Çalıştır",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚡ Eylem Çalıştırıcı",inputs:[{type:"minecraft:text",key:'id',label:"Eylem ID",max_length:100},{type:"minecraft:single_option",key:'target',label:"Hedef",options:[{id:"@a",display:"Tüm Oyuncular"},{id:"@s",display:"Sadece Ben"},{id:"@a[tag=gulce_vip]",display:"VIP'ler"}]}],actions:[{label:"▶ Çalıştır",action:{type:"minecraft:dynamic/run_command",template:"/execute as $(target) run function custom_admin:handler/execute/action {id:\"$(id)\"}"}}]}}}

# 4. GÖSTERİM
function glc_menu:handler/dialog/show
return 0
