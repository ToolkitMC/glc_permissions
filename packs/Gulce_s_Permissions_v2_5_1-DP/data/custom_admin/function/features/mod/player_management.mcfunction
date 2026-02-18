# ═══════════════════════════════════════════════════
# ⚡ GULCE MOD PANEL - PLAYER MANAGEMENT (v2.2.0)
# ═══════════════════════════════════════════════════

# 1. YETKİ KONTROLÜ
execute unless score @s gulce_permission_level matches 3.. if entity @s[tag=glc.lang_tr] run tellraw @s {text:"❌ Bu özellik için MOD(+) yetkisi gerekiyor!",color:"red"}
execute unless score @s gulce_permission_level matches 3.. if entity @s[tag=glc.lang_en] run tellraw @s {text:"❌ This feature requires MOD(+) permission!",color:"red"}
execute unless score @s gulce_permission_level matches 3.. run return fail

# 2. UI HAZIRLIĞI (TR/EN/Default)
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"👮 MOD YÖNETİMİ",color:"blue",bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Oyuncu yönetimi için bir eylem seçin:\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"👮 MOD MANAGEMENT",color:"blue",bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Select an action for player management:\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"👮 MOD YÖNETİMİ",color:"blue",bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Oyuncu yönetimi için bir eylem seçin:\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

# ─── BÖLÜM 1: CEZA SİSTEMİ ───────────────────────────────────────

# [🔇] SUSTUR / UNMUTE
data modify storage glc:ui ui.actions append value {label:"🔇 Sustur / Unmute",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔇 Mute Paneli",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu / Player"},{type:"minecraft:single_option",key:'act',label:"İşlem / Action",options:[{id:"add glc.muted",display:"🔇 Sustur"},{id:"remove glc.muted",display:"🔊 Ses Aç"}]}],actions:[{label:"✅ Uygula",action:{type:"minecraft:dynamic/run_command",template:"/execute as @a[name=\"$(p)\"] run tag @s $(act)"}}]}}}

# [⚠️] UYARI - Herkese veya sadece oyuncuya
data modify storage glc:ui ui.actions append value {label:"⚠️ Uyarı Gönder",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚠️ Uyarı",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı"},{type:"minecraft:text",key:'m',label:"Mesaj"},{type:"minecraft:single_option",key:'target',label:"Kime",options:[{id:"@a",display:"Herkese"},{id:"@a[name=\"$(p)\"]",display:"Sadece oyuncuya"}]}],actions:[{label:"✉ Gönder",action:{type:"minecraft:dynamic/run_command",template:"/tellraw @a[name=\"$(p)\"] [\"\",{\"text\":\"[UYARI] \",\"color\":\"red\",\"bold\":1b},{\"text\":\"$(m)\",\"color\":\"white\"}]"}}]}}}

# [🧊] DONDUR / ÇÖZ
data modify storage glc:ui ui.actions append value {label:"🧊 Dondur / Çöz",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🧊 Freeze",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı"},{type:"minecraft:single_option",key:'act',label:"İşlem",options:[{id:"freeze",display:"🧊 Dondur"},{id:"unfreeze",display:"🔥 Çöz"}]}],actions:[{label:"✅ Uygula",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:features/mod/freeze_handler {player:\"$(p)\",action:\"$(act)\"}"}}]}}}

# [🚫] KICK (sebeple)
data modify storage glc:ui ui.actions append value {label:"🚫 Kick",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🚫 Kick Paneli",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı"},{type:"minecraft:text",key:'r',label:"Sebep / Reason",initial:"Kural İhlali"}],actions:[{label:"🔥 KICK",action:{type:"minecraft:dynamic/run_command",template:"/kick $(p) $(r)"}}]}}}

# [🔒] BAN + PARDON
data modify storage glc:ui ui.actions append value {label:"🔒 Ban / Pardon",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔒 Ban Paneli",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı"},{type:"minecraft:text",key:'r',label:"Sebep",initial:"Kural İhlali"},{type:"minecraft:single_option",key:'act',label:"İşlem",options:[{id:"ban",display:"⛔ Ban"},{id:"pardon",display:"🔓 Pardon"}]}],actions:[{label:"✅ Onayla",action:{type:"minecraft:dynamic/run_command",template:"/$(act) $(p) $(r)"}}]}}}

# ─── BÖLÜM 2: IŞINLANMA ──────────────────────────────────────────

# [🚀] YANIMA GETİR
data modify storage glc:ui ui.actions append value {label:"🚀 Yanıma Getir",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🚀 Getir",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı"}],actions:[{label:"Getir",action:{type:"minecraft:dynamic/run_command",template:"/tp @a[name=\"$(p)\"] @s"}}]}}}

# [🎯] OYUNCUYA GİT
data modify storage glc:ui ui.actions append value {label:"🎯 Oyuncuya Git",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🎯 Git",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı"}],actions:[{label:"Git",action:{type:"minecraft:dynamic/run_command",template:"/tp @s @a[name=\"$(p)\"]"}}]}}}

# [📍] KOORDİNATA IŞINLA
data modify storage glc:ui ui.actions append value {label:"📍 Koordinata Işınla",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📍 Koordinat Işınlama",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu (isim veya @a)"},{type:"minecraft:text",key:'x',label:"X",initial:"0"},{type:"minecraft:text",key:'y',label:"Y",initial:"64"},{type:"minecraft:text",key:'z',label:"Z",initial:"0"}],actions:[{label:"🚀 Işınla",action:{type:"minecraft:dynamic/run_command",template:"/execute as @a[name=\"$(p)\"] run tp @s $(x) $(y) $(z)"}}]}}}

# ─── BÖLÜM 3: EFEKT & İTEM ───────────────────────────────────────

# [💊] EFEKT VER / TEMİZLE
data modify storage glc:ui ui.actions append value {label:"💊 Efekt Yönetimi",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"💊 Efekt Menüsü",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu"},{type:"minecraft:text",key:'e',label:"Efekt (örn: speed)"},{type:"minecraft:text",key:'s',label:"Süre (sn)",initial:"30"},{type:"minecraft:text",key:'amp',label:"Güç (0=I, 1=II...)",initial:"0"}],actions:[{label:"✨ Ver",action:{type:"minecraft:dynamic/run_command",template:"/effect give @a[name=\"$(p)\"] minecraft:$(e) $(s) $(amp)"}},{label:"🧼 Temizle",action:{type:"minecraft:dynamic/run_command",template:"/effect clear @a[name=\"$(p)\"]"}}]}}}

# [🎒] İTEM VER
data modify storage glc:ui ui.actions append value {label:"🎒 Item Ver",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🎒 Item Ver",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu"},{type:"minecraft:text",key:'item',label:"Item (örn: diamond)"},{type:"minecraft:text",key:'amt',label:"Miktar",initial:"1"}],actions:[{label:"🎁 Ver",action:{type:"minecraft:dynamic/run_command",template:"/give @a[name=\"$(p)\"] minecraft:$(item) $(amt)"}}]}}}

# [❤️] CAN YÖNETİMİ
data modify storage glc:ui ui.actions append value {label:"❤️ Can Yönetimi",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"❤️ Can Yönetimi",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu"},{type:"minecraft:single_option",key:'act',label:"İşlem",options:[{id:"heal",display:"💚 Tam iyileştir"},{id:"half",display:"💛 Yarı can"},{id:"kill",display:"💀 Öldür"}]}],actions:[{label:"✅ Uygula",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:features/mod/health_handler {player:\"$(p)\",action:\"$(act)\"}"}}]}}}

# ─── BÖLÜM 4: DUYURU ─────────────────────────────────────────────

# [💬] SUNUCU DUYURUSU
data modify storage glc:ui ui.actions append value {label:"📢 Duyuru Yap",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📢 Sunucu Duyurusu",inputs:[{type:"minecraft:text",key:'m',label:"Duyuru Metni"},{type:"minecraft:single_option",key:'col',label:"Renk",options:[{id:"gold",display:"🟡 Altın"},{id:"aqua",display:"🔵 Mavi"},{id:"green",display:"🟢 Yeşil"},{id:"red",display:"🔴 Kırmızı"}]}],actions:[{label:"📢 Duyur",action:{type:"minecraft:dynamic/run_command",template:"/tellraw @a [\"\",{\"text\":\"[DUYURU] \",\"color\":\"$(col)\",\"bold\":1b},{\"text\":\"$(m)\",\"color\":\"white\"}]"}}]}}}

# 4. RENDER
function glc_menu:handler/dialog/show
return 0
