# ═══════════════════════════════════════════════════
# 🎉 GULCE FUN PANEL - EĞLENCE (v1.0.0)
# MOD+ yetkisi gerekir
# ═══════════════════════════════════════════════════

# 1. YETKİ KONTROLÜ
execute unless score @s gulce_permission_level matches 3.. if entity @s[tag=glc.lang_tr] run tellraw @s {text:"❌ Bu özellik için MOD(+) yetkisi gerekiyor!",color:"red"}
execute unless score @s gulce_permission_level matches 3.. if entity @s[tag=glc.lang_en] run tellraw @s {text:"❌ This feature requires MOD(+) permission!",color:"red"}
execute unless score @s gulce_permission_level matches 3.. run return fail

# 2. UI
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"🎉 EĞLENCE PANELİ",color:"gold",bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Sunucuya biraz renk kat!\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"🎉 FUN PANEL",color:"gold",bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Add some fun to the server!\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"🎉 EĞLENCE PANELİ",color:"gold",bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Sunucuya biraz renk kat!\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

# 3. BUTONLAR

# [🎆] FIREWORKS - Tüm oyunculara havai fişek
data modify storage glc:ui ui.actions append value {label:"🎆 Herkese Havai Fişek",action:{type:"minecraft:run_command",command:"/execute as @a at @s run summon minecraft:firework_rocket ~ ~ ~ {FireworksItem:{id:\"minecraft:firework_rocket\",count:1,components:{\"minecraft:fireworks\":{explosions:[{shape:1b,colors:[I;11743532,16711680],fade_colors:[I;16755200],trail:1b,twinkle:1b}],flight_duration:2b}}},ShotAtAngle:1b}"}}

# [🎊] PARTİ MODU - Particle + Ses
data modify storage glc:ui ui.actions append value {label:"🎊 Parti Modu",action:{type:"minecraft:run_command",command:"/function custom_admin:features/fun/party_mode"}}

# [⚡] ŞIMŞEK ÇAKMA
# [⚡] Gerçek şimşek
data modify storage glc:ui ui.actions append value {label:"⚡ Şimşek (Gerçek)",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚡ Gerçek Şimşek",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı"}],actions:[{label:"⚡ Çak!",action:{type:"minecraft:dynamic/run_command",template:"/execute as @a[name=\"$(p)\"] at @s run summon minecraft:lightning_bolt ~ ~ ~"}}]}}}

# [✨] Güvenli şimşek (görsel)
data modify storage glc:ui ui.actions append value {label:"✨ Şimşek (Güvenli)",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"✨ Güvenli Şimşek",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı"}],actions:[{label:"✨ Çak!",action:{type:"minecraft:dynamic/run_command",template:"/execute as @a[name=\"$(p)\"] at @s run summon minecraft:lightning_bolt ~ ~ ~ {NoAI:1b}"}}]}}}

# [🐖] CANAVAR SPAWN
data modify storage glc:ui ui.actions append value {label:"👾 Canavar Çağır",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👾 Canavar Çağır",inputs:[{type:"minecraft:single_option",key:'mob',label:"Canavar",options:[{id:"zombie",display:"🧟 Zombie"},{id:"skeleton",display:"🦴 Skeleton"},{id:"creeper",display:"💥 Creeper"},{id:"enderman",display:"👁️ Enderman"},{id:"witch",display:"🧙 Witch"},{id:"phantom",display:"👻 Phantom"}]},{type:"minecraft:text",key:'amt',label:"Miktar (1-10)",initial:"1"}],actions:[{label:"Spawn!",action:{type:"minecraft:dynamic/run_command",template:"/execute at @s run summon minecraft:$(mob) ~ ~ ~"}}]}}}

# [🌈] RENK DEĞİŞİM MESAJİ
data modify storage glc:ui ui.actions append value {label:"🌈 Renkli Mesaj",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🌈 Renkli Mesaj",inputs:[{type:"minecraft:text",key:'m',label:"Mesaj"},{type:"minecraft:single_option",key:'c1',label:"Renk 1",options:[{id:"gold",display:"Altın"},{id:"aqua",display:"Mavi"},{id:"light_purple",display:"Mor"},{id:"green",display:"Yeşil"}]},{type:"minecraft:single_option",key:'c2',label:"Renk 2",options:[{id:"yellow",display:"Sarı"},{id:"red",display:"Kırmızı"},{id:"white",display:"Beyaz"},{id:"dark_green",display:"Koyu Yeşil"}]}],actions:[{label:"Gönder",action:{type:"minecraft:dynamic/run_command",template:"/tellraw @a [\"\",{\"text\":\"$(m)\",\"color\":\"$(c1)\"},{\"text\":\" ✦ \",\"color\":\"$(c2)\"},{\"text\":\"$(m)\",\"color\":\"$(c2)\"}]"}}]}}}

# [🎵] SES ÇALAR
data modify storage glc:ui ui.actions append value {label:"🎵 Ses Çal",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🎵 Ses Çalar",inputs:[{type:"minecraft:single_option",key:'snd',label:"Ses",options:[{id:"minecraft:ui.toast.challenge_complete",display:"🏆 Zafer"},{id:"minecraft:entity.ender_dragon.death",display:"🐉 Ejderha"},{id:"minecraft:block.beacon.activate",display:"🔔 Beacon"},{id:"minecraft:entity.lightning_bolt.thunder",display:"⚡ Gök Gürültüsü"},{id:"minecraft:music_disc.11",display:"📼 Disk 11"}]}],actions:[{label:"▶ Çal (Herkese)",action:{type:"minecraft:dynamic/run_command",template:"/execute as @a at @s run playsound $(snd) master @s ~ ~ ~ 1 1"}}]}}}

# [🚀] FIRLATMA (Knockback)
data modify storage glc:ui ui.actions append value {label:"🚀 Fırlat",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🚀 Fırlat",inputs:[{type:"minecraft:text",key:'p',label:"Oyuncu Adı"},{type:"minecraft:single_option",key:'dir',label:"Yön",options:[{id:"up",display:"⬆ Yukarı"},{id:"forward",display:"➡ İleri"}]}],actions:[{label:"🚀 Fırlat!",action:{type:"minecraft:dynamic/run_command",template:"/execute as @a[name=\"$(p)\"] run function custom_admin:features/fun/launch {dir:\"$(dir)\"}"}}]}}}

# [🌙] GECE/GÜNDÜZ OYLAMASI
data modify storage glc:ui ui.actions append value {label:"🌙 Gece/Gündüz Değiştir",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🌙 Zaman",inputs:[{type:"minecraft:single_option",key:'t',label:"Vakit",options:[{id:"day",display:"☀️ Gündüz"},{id:"night",display:"🌙 Gece"},{id:"noon",display:"🌤️ Öğle"},{id:"midnight",display:"🌑 Gece Yarısı"}]}],actions:[{label:"⏰ Ayarla",action:{type:"minecraft:dynamic/run_command",template:"/time set $(t)"}}]}}}

# 4. RENDER
function glc_menu:handler/dialog/show
return 0
