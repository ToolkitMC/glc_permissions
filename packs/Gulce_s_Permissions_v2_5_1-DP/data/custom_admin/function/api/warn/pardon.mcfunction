# ═══════════════════════════════════════════════════
# Warn: Remove / Pardon (v1.0.0)
# Usage: /function custom_admin:api/warn/pardon
#        {player:"Ahmet"}
# Permission Level: MOD+
# ═══════════════════════════════════════════════════

# Yetki kontrolü
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:'[GULCE] ',color:'dark_red',bold:true},{text:'🚫 Yetersiz yetki! Gerekli: ',color:'red'},{text:'mod',color:'yellow'}]
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s [{text:'[GULCE] ',color:'dark_red',bold:true},{text:'🚫 Insufficient permission! Required: ',color:'red'},{text:'mod',color:'yellow'}]
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

# Strike'ları sıfırla
$scoreboard players set $(player) glc.strikes 0
$tag @a[name=$(player),limit=1] remove glc.banned

# Bildirim - TR
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:'[GULCE] ',color:'gold',bold:true},{text:'✅ Uyarılar temizlendi: ',color:'green'},{text:'$(player)',color:'yellow'}]
# Bildirim - EN
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:'[GULCE] ',color:'gold',bold:true},{text:'✅ Warnings cleared: ',color:'green'},{text:'$(player)',color:'yellow'}]

# Oyuncuya bildir (çevrimiçiyse)
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:'[GULCE] ',color:'green'},{text:'✅ Uyarılarınız temizlendi.',color:'green'}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:'[GULCE] ',color:'green'},{text:'✅ Your warnings have been cleared.',color:'green'}]

# Log
$data modify storage glc:log warn append value {type:'pardon',player:'$(player)',timestamp:0}
execute store result storage glc:log warn[-1].timestamp int 1 run time query gametime
