# ═══════════════════════════════════════════════════
# ✨ GULCE VIP PANEL - QUICK TELEPORT (v2.2.0)
# Koordinatlar glc:config teleport_locations storage'da tutulur
# ═══════════════════════════════════════════════════

# 1. YETKİ KONTROLÜ
execute unless score @s gulce_permission_level matches 2.. if entity @s[tag=glc.lang_tr] run tellraw @s {text:"❌ Bu özellik için VIP(+) yetkisi gerekiyor!",color:'light_purple'}
execute unless score @s gulce_permission_level matches 2.. if entity @s[tag=glc.lang_en] run tellraw @s {text:"❌ This feature requires VIP(+) permission!",color:'light_purple'}
execute unless score @s gulce_permission_level matches 2.. run return fail

# 2. UI
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"✨ VIP HIZLI IŞINLANMA",color:'light_purple',bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Gitmek istediğiniz bölgeyi seçin:\n§8(Cooldown: 30sn)\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"✨ VIP QUICK TELEPORT",color:'light_purple',bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Choose your destination:\n§8(Cooldown: 30sec)\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"✨ VIP HIZLI IŞINLANMA",color:'light_purple',bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Gitmek istediğiniz bölgeyi seçin:\n§8(Cooldown: 30sn)\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

# 3. IŞINLANMA BUTONLARI
# Koordinatlar doğrudan TP ile - Owner storage'dan ayarlar
data modify storage glc:ui ui.actions append value {label:"🏠 Spawn (0 64 0)",action:{type:"minecraft:run_command",command:"/function custom_admin:features/vip/tp_execute {loc:\"spawn\"}"}}
data modify storage glc:ui ui.actions append value {label:"🏰 Kale",action:{type:"minecraft:run_command",command:"/function custom_admin:features/vip/tp_execute {loc:\"castle\"}"}}
data modify storage glc:ui ui.actions append value {label:"⛏️ Maden",action:{type:"minecraft:run_command",command:"/function custom_admin:features/vip/tp_execute {loc:\"mine\"}"}}
data modify storage glc:ui ui.actions append value {label:"🌲 Orman",action:{type:"minecraft:run_command",command:"/function custom_admin:features/vip/tp_execute {loc:\"forest\"}"}}
data modify storage glc:ui ui.actions append value {label:"🌊 Deniz",action:{type:"minecraft:run_command",command:"/function custom_admin:features/vip/tp_execute {loc:\"ocean\"}"}}
data modify storage glc:ui ui.actions append value {label:"🏔️ Dağ",action:{type:"minecraft:run_command",command:"/function custom_admin:features/vip/tp_execute {loc:\"mountain\"}"}}

# 4. COOLDOWN (30sn = 600 tick)
scoreboard players set @s gulce_cooldown 600

# 5. GÖSTERİM
function glc_menu:handler/dialog/show
return 0
