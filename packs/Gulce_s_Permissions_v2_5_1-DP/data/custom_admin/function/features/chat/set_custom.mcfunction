# ═══════════════════════════════════════════════════
# Chat Prefix: Set Custom Prefix (v2.5.1)
# Usage: /function custom_admin:features/chat/set_custom
#        {player:"Ahmet",prefix:"[PATRON]",color:"light_purple"}
# Permission Level: OWNER
# ═══════════════════════════════════════════════════

# Yetki kontrolü - sadece OWNER
execute unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:'[GULCE] ',color:'dark_red',bold:true},{text:'🚫 Bu işlem için OWNER yetkisi gerekli.',color:'red'}]
execute unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s [{text:'[GULCE] ',color:'dark_red',bold:true},{text:'🚫 OWNER permission required.',color:'red'}]
execute unless entity @s[tag=gulce_owner] run return 0

# Özel team oluştur ve oyuncuyu ata
$team add glc.custom_$(player)
$team modify glc.custom_$(player) color $(color)
$team modify glc.custom_$(player) prefix [{text:'[',color:'dark_gray'},{text:'$(prefix)',color:'$(color)',bold:true},{text:'] ',color:'dark_gray'}]
$team join glc.custom_$(player) $(player)

# Storage'a kaydet (merge ile — diğer prefix'ler silinmez)
execute unless data storage glc:data custom_prefixes run data modify storage glc:data custom_prefixes set value {}
$data modify storage glc:data custom_prefixes.$(player) set value {prefix:'$(prefix)',color:'$(color)'}

# Bildirim - TR
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:'[GULCE] ',color:'gold',bold:true},{text:'✅ Özel prefix ayarlandı: ',color:'green'},{text:'$(player)',color:'yellow'},{text:' → ',color:'gray'},{text:'[$(prefix)]',color:'$(color)',bold:true}]
# Bildirim - EN
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:'[GULCE] ',color:'gold',bold:true},{text:'✅ Custom prefix set: ',color:'green'},{text:'$(player)',color:'yellow'},{text:' → ',color:'gray'},{text:'[$(prefix)]',color:'$(color)',bold:true}]
