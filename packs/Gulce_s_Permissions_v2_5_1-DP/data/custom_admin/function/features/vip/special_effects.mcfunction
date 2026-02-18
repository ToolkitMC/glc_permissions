# ═══════════════════════════════════════════════════
# ✨ GULCE VIP PANEL - SPECIAL EFFECTS (v2.2.0)
# ═══════════════════════════════════════════════════

# 1. YETKİ KONTROLÜ
execute unless score @s gulce_permission_level matches 2.. if entity @s[tag=glc.lang_tr] run tellraw @s {text:"❌ Bu özellik için VIP(+) yetkisi gerekiyor!",color:'light_purple'}
execute unless score @s gulce_permission_level matches 2.. if entity @s[tag=glc.lang_en] run tellraw @s {text:"❌ This feature requires VIP(+) permission!",color:'light_purple'}
execute unless score @s gulce_permission_level matches 2.. run return fail

# Cooldown kontrolü
execute if score @s gulce_cooldown matches 1.. if entity @s[tag=glc.lang_tr] run tellraw @s {text:"⏳ Cooldown devam ediyor!",color:"red"}
execute if score @s gulce_cooldown matches 1.. if entity @s[tag=glc.lang_en] run tellraw @s {text:"⏳ Cooldown active!",color:"red"}
execute if score @s gulce_cooldown matches 1.. run return fail

# 2. UI
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"✨ VIP ÖZEL EFEKTLER",color:'light_purple',bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Kendine bir avantaj seç!\n§8(Cooldown: 60sn)\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"✨ VIP SPECIAL EFFECTS",color:'light_purple',bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Choose your advantage!\n§8(Cooldown: 60sec)\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"✨ VIP ÖZEL EFEKTLER",color:'light_purple',bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Kendine bir avantaj seç!\n§8(Cooldown: 60sn)\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

# 3. EFEKT BUTONLARI
# [⚡] Hız II
data modify storage glc:ui ui.actions append value {label:"⚡ Hız II (60sn)",action:{type:"minecraft:run_command",command:"/effect give @s minecraft:speed 60 1"}}

# [💪] Güç I
data modify storage glc:ui ui.actions append value {label:"💪 Güç I (60sn)",action:{type:"minecraft:run_command",command:"/effect give @s minecraft:strength 60 0"}}

# [🌟] Gece Görüşü
data modify storage glc:ui ui.actions append value {label:"🌟 Gece Görüşü (5dk)",action:{type:"minecraft:run_command",command:"/effect give @s minecraft:night_vision 300 0"}}

# [🦘] Zıplama II
data modify storage glc:ui ui.actions append value {label:"🦘 Zıplama II (60sn)",action:{type:"minecraft:run_command",command:"/effect give @s minecraft:jump_boost 60 1"}}

# [👻] Görünmezlik
data modify storage glc:ui ui.actions append value {label:"👻 Görünmezlik (60sn)",action:{type:"minecraft:run_command",command:"/effect give @s minecraft:invisibility 60 0"}}

# [🛡️] Dayanıklılık II
data modify storage glc:ui ui.actions append value {label:"🛡️ Zırh II (60sn)",action:{type:"minecraft:run_command",command:"/effect give @s minecraft:resistance 60 1"}}

# [🌊] Su Nefesi
data modify storage glc:ui ui.actions append value {label:"🌊 Su Nefesi (5dk)",action:{type:"minecraft:run_command",command:"/effect give @s minecraft:water_breathing 300 0"}}

# [🔥] Ateş Direnci
data modify storage glc:ui ui.actions append value {label:"🔥 Ateş Direnci (5dk)",action:{type:"minecraft:run_command",command:"/effect give @s minecraft:fire_resistance 300 0"}}

# [✨] ÖZEL PAKET - Hepsini birden (sadece VIP+)
execute if score @s gulce_permission_level matches 3.. run data modify storage glc:ui ui.actions append value {label:"✨ MOD Paketi (Hepsi)",action:{type:"minecraft:run_command",command:"/function custom_admin:features/vip/vip_bundle"}}

# [🧼] Temizle
data modify storage glc:ui ui.actions append value {label:"🧼 Efektleri Sil",action:{type:"minecraft:run_command",command:"/effect clear @s"}}

# 4. COOLDOWN (60sn = 1200 tick)
scoreboard players set @s gulce_cooldown 1200

# 5. GÖSTERİM
function glc_menu:handler/dialog/show
return 0
