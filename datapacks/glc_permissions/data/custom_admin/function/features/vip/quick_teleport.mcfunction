# ═══════════════════════════════════════════════════
# ✨ GULCE VIP PANEL - QUICK TELEPORT (1.21.6)
# ═══════════════════════════════════════════════════

# 1. YETKİ KONTROLÜ
execute unless score @s gulce_permission_level matches 2.. run tellraw @s {"text":"❌ Bu özellik için VIP(+) yetkisi gerekiyor!","color":"light_purple"}
execute unless score @s gulce_permission_level matches 2.. run return fail

# 2. UI VERİ YAPISI (Storage)
data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{"text":"✨ VIP HIZLI IŞINLANMA","color":"light_purple","bold":true},body:{type:"minecraft:plain_message",contents:"\n§7Gitmek istediğiniz bölgeyi seçin:\n§8(Işınlanma cooldown: 30sn)\n "},can_close_with_escape:true,pause:false,columns:2,actions:[]}

# 3. IŞINLANMA BUTONLARI

# [🏠] Spawn
data modify storage glc:ui ui.actions append value {label:"🏠 Spawn",action:{type:"minecraft:run_command",command:"/trigger gulce_tp_spawn"}}

# [🏰] Kale
data modify storage glc:ui ui.actions append value {label:"🏰 Kale",action:{type:"minecraft:run_command",command:"/trigger gulce_tp_castle"}}

# [⛏️] Maden
data modify storage glc:ui ui.actions append value {label:"⛏️ Maden",action:{type:"minecraft:run_command",command:"/trigger gulce_tp_mine"}}

# [🌲] Orman
data modify storage glc:ui ui.actions append value {label:"🌲 Orman",action:{type:"minecraft:run_command",command:"/trigger gulce_tp_forest"}}

# 4. COOLDOWN AYARLA (30 saniye = 600 tick)
# Not: Menü açıldığında cooldown başlar
scoreboard players set @s gulce_cooldown 600

# 5. GÖSTERİM
function glc_menu:handler/dialog/show