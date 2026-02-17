# ═══════════════════════════════════════════════════
# ⚡ GULCE MOD PANEL - MODERN UI (1.21.6)
# ═══════════════════════════════════════════════════

# 1. YETKİ KONTROLÜ
execute unless score @s gulce_permission_level matches 3.. if entity @s[tag=glc.lang_tr] run tellraw @s {text:"❌ Bu özellik için MOD(+) yetkisi gerekiyor!",color:"red"}
execute unless score @s gulce_permission_level matches 3.. if entity @s[tag=glc.lang_en] run tellraw @s {text:"❌ Bu özellik için MOD(+) yetkisi gerekiyor!",color:"red"}
execute unless score @s gulce_permission_level matches 3.. run return fail

# 2. UI HAZIRLIĞI
data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"👮 MOD YÖNETİMİ",color:"blue",bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Oyuncu yönetimi için bir eylem seçin:\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

# 3. CEZA VE KONTROL BUTONLARI

# --- [🔇] SUSTUR (Mute) ---
data modify storage glc:ui ui.actions append value {label:"🔇 Sustur",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔇 Sustur",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı"}],actions:[{label:"✅ Onayla",action:{type:"minecraft:dynamic/run_command",template:"/execute as @a[name=\"$(p)\"] run tag @s add muted"}}]}}}

# --- [⚠️] UYARI GÖNDER ---
data modify storage glc:ui ui.actions append value {label:"⚠️ Uyarı Gönder",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚠️ Uyarı Mesajı",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı"},{type:"minecraft:text",key:'m',label:"Mesajınız"}],actions:[{label:"✉ Gönder",action:{type:"minecraft:dynamic/run_command",template:"/tellraw @a[name=\"$(p)\"] [\"\",{\"text\":\"[UYARI] \",\"color\":\"red\",\"bold\":1b},{\"text\":\"$(m)\",\"color\":\"white\"}]"}}]}}}

# --- [🚫] KICK ---
data modify storage glc:ui ui.actions append value {label:"🚫 Oyuncu At (Kick)",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🚫 Kick Paneli",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı"},{type:"minecraft:text",key:'r',label:"Sebep",initial:"Kural İhlali"}],actions:[{label:"🔥 KICK",action:{type:"minecraft:dynamic/run_command",template:"/kick $(p) $(r)"}}]}}}

# --- [🔒] BAN ---
data modify storage glc:ui ui.actions append value {label:"🔒 Yasakla (Ban)",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔒 Ban Paneli",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı"}],actions:[{label:"⛔ BANLA",action:{type:"minecraft:dynamic/run_command",template:"/ban $(p)"}}]}}}

# --- [🚀] YANIMA GETİR ---
data modify storage glc:ui ui.actions append value {label:"🚀 Yanıma Getir",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🚀 Işınlanma",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı"}],actions:[{label:"Çek",action:{type:"minecraft:dynamic/run_command",template:"/tp @a[name=\"$(p)\"] @s"}}]}}}

# --- [🎯] OYUNCUYA GİT ---
data modify storage glc:ui ui.actions append value {label:"🎯 Oyuncuya Git",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🎯 Işınlanma",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı"}],actions:[{label:"Git",action:{type:"minecraft:dynamic/run_command",template:"/tp @s @a[name=\"$(p)\"]"}}]}}}

# --- [💊] EFEKT VER ---
data modify storage glc:ui ui.actions append value {label:"💊 Efekt Ver",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"💊 Efekt Menüsü",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu"},{type:"minecraft:text",key:'e',label:"Efekt (örn: speed)"},{type:"minecraft:text",key:'s',label:"Süre (sn)",initial:"30"}],actions:[{label:"✨ Uygula",action:{type:"minecraft:dynamic/run_command",template:"/effect give @a[name=\"$(p)\"] $(e) $(s)"}}]}}}

# --- [🩹] EFEKT TEMİZLE ---
data modify storage glc:ui ui.actions append value {label:"🩹 Efekt Temizle",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🩹 Temizlik",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı"}],actions:[{label:"🧼 Temizle",action:{type:"minecraft:dynamic/run_command",template:"/effect clear @a[name=\"$(p)\"]"}}]}}}

# 4. RENDER (Görüntüleme)
function glc_menu:handler/dialog/show