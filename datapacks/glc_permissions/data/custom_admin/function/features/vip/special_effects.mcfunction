# ═══════════════════════════════════════════════════
# ✨ GULCE VIP PANEL - SPECIAL EFFECTS (1.21.6)
# ═══════════════════════════════════════════════════

# 1. YETKİ KONTROLÜ
execute unless score @s gulce_permission_level matches 2.. if entity @s[tag=glc.lang_tr] run tellraw @s {text:"❌ Bu özellik için VIP(+) yetkisi gerekiyor!",color:'light_purple'}
execute unless score @s gulce_permission_level matches 2.. if entity @s[tag=glc.lang_en] run tellraw @s {text:"❌ Bu özellik için VIP(+) yetkisi gerekiyor!",color:'light_purple'}
execute unless score @s gulce_permission_level matches 2.. run return fail

# 2. UI VERİ YAPISI (Storage)
data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"✨ VIP ÖZEL EFEKTLER",color:'light_purple',bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Kendine bir avantaj seç!\n§8(Efekt cooldown: 60sn)\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

# 3. EFEKT BUTONLARI

# [⚡] Hız
data modify storage glc:ui ui.actions append value {label:"⚡ Hız II",action:{type:"minecraft:run_command",command:"/effect give @s speed 60 1"}}

# [💪] Güç
data modify storage glc:ui ui.actions append value {label:"💪 Güç I",action:{type:"minecraft:run_command",command:"/effect give @s strength 60 0"}}

# [🌟] Gece Görüşü
data modify storage glc:ui ui.actions append value {label:"🌟 Gece Görüşü",action:{type:"minecraft:run_command",command:"/effect give @s night_vision 300"}}

# [🦘] Zıplama
data modify storage glc:ui ui.actions append value {label:"🦘 Zıplama II",action:{type:"minecraft:run_command",command:"/effect give @s jump_boost 60 1"}}

# [👻] Görünmezlik
data modify storage glc:ui ui.actions append value {label:"👻 Görünmezlik",action:{type:"minecraft:run_command",command:"/effect give @s invisibility 60"}}

# [🧼] Temizle (Bonus olarak ekledim, VIP'ler bazen efektlerini silmek ister)
data modify storage glc:ui ui.actions append value {label:"🧼 Efektleri Sil",action:{type:"minecraft:run_command",command:"/effect clear @s"}}

# 4. COOLDOWN AYARLA (60 saniye = 1200 tick)
scoreboard players set @s gulce_cooldown 1200

# 5. GÖSTERİM
function glc_menu:handler/dialog/show