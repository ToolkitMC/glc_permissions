# ═══════════════════════════════════════════════════
# ⚡ GULCE ROLE MANAGEMENT - QUICK ACTIONS (1.21.6)
# ═══════════════════════════════════════════════════

# 1. YETKİ KONTROLÜ
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] run tellraw @s {"text":"❌ Bu panele erişim yetkiniz yok!","color":"red"}
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] run return fail

# 2. UI HAZIRLIĞI
data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{"text":"👑 ROL YÖNETİMİ","color":"yellow","bold":true},body:{type:"minecraft:plain_message",contents:"\n§7En yakındaki oyuncuya (@p) işlem yapar:\n "},can_close_with_escape:true,pause:false,columns:2,actions:[]}

# 3. BUTONLAR (Input'suz - Doğrudan Run Command)

# --- [👑] OWNER ROLÜ ---
execute if entity @s[tag=gulce_owner] run data modify storage glc:ui ui.actions append value {label:"👑 OWNER Rolü Ver",action:{type:"minecraft:run_command",command:"/function custom_admin:role/assign_owner {player:\"@s\"}"}}

# --- [👮] MOD ROLÜ ---
execute if entity @s[tag=gulce_owner] run data modify storage glc:ui ui.actions append value {label:"👮 MOD Rolü Ver",action:{type:"minecraft:run_command",command:"/function custom_admin:role/assign_mod {player:\"@s\"}"}}

# --- [⭐] VIP ROLÜ ---
data modify storage glc:ui ui.actions append value {label:"⭐ VIP Rolü Ver",action:{type:"minecraft:run_command",command:"/function custom_admin:role/assign_vip {player:\"@s\"}"}}

# --- [👤] PLAYER ROLÜ ---
data modify storage glc:ui ui.actions append value {label:"👤 PLAYER Rolü Ver",action:{type:"minecraft:run_command",command:"/function custom_admin:role/assign_player {player:\"@s\"}"}}

# --- [❌] TÜM ROLLERİ KALDIR ---
execute if entity @s[tag=gulce_owner] run data modify storage glc:ui ui.actions append value {label:"❌ Rolleri Temizle",action:{type:"minecraft:run_command",command:"/function custom_admin:role/remove_all {player:\"@s\"}"}}

# --- [📋] LİSTELEME ---
data modify storage glc:ui ui.actions append value {label:"📋 Oyuncu Listesi",action:{type:"minecraft:run_command",command:"/function custom_admin:role/list_players"}}

# 4. RENDER
function glc_menu:handler/dialog/show