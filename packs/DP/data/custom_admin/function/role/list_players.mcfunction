# ═══════════════════════════════════════════════════
# Role: List All Players by Role
# Usage: /function custom_admin:role/list_players
# Permission Level: 2 (MOD veya OWNER)
# ═══════════════════════════════════════════════════

# Yetki kontrolü
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"❌ Bu komutu kullanma yetkiniz yok!",color:"red"}]
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"❌ Bu komutu kullanma yetkiniz yok!",color:"red"}]
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] run return fail

# Başlık
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"       📋 OYUNCU LİSTESİ       ",color:"yellow",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"       📋 OYUNCU LİSTESİ       ",color:"yellow",bold:true}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
tellraw @s [""]

# OWNER'lar
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"👑 OWNER'lar:",color:"red",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"👑 OWNER'lar:",color:"red",bold:true}]
execute as @a[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s ["  ",{selector:"@s",color:"yellow"}," ",{text:"(Level 4)",color:"gray"}]
execute as @a[tag=gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s ["  ",{selector:"@s",color:"yellow"}," ",{text:"(Level 4)",color:"gray"}]
execute unless entity @a[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s ["  ",{text:"Yok",color:"gray",italic:1b}]
execute unless entity @a[tag=gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s ["  ",{text:"Yok",color:"gray",italic:1b}]

tellraw @s [""]

# MOD'lar
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"👮 MOD'lar:",color:"blue",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"👮 MOD'lar:",color:"blue",bold:true}]
execute as @a[tag=gulce_mod,tag=!gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s ["  ",{selector:"@s",color:"yellow"}," ",{text:"(Level 3)",color:"gray"}]
execute as @a[tag=gulce_mod,tag=!gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s ["  ",{selector:"@s",color:"yellow"}," ",{text:"(Level 3)",color:"gray"}]
execute unless entity @a[tag=gulce_mod,tag=!gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s ["  ",{text:"Yok",color:"gray",italic:1b}]
execute unless entity @a[tag=gulce_mod,tag=!gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s ["  ",{text:"Yok",color:"gray",italic:1b}]

tellraw @s [""]

# VIP'ler
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"⭐ VIP'ler:",color:'light_purple',bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"⭐ VIP'ler:",color:'light_purple',bold:true}]
execute as @a[tag=gulce_vip,tag=!gulce_mod,tag=!gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s ["  ",{selector:"@s",color:"yellow"}," ",{text:"(Level 2)",color:"gray"}]
execute as @a[tag=gulce_vip,tag=!gulce_mod,tag=!gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s ["  ",{selector:"@s",color:"yellow"}," ",{text:"(Level 2)",color:"gray"}]
execute unless entity @a[tag=gulce_vip,tag=!gulce_mod,tag=!gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s ["  ",{text:"Yok",color:"gray",italic:1b}]
execute unless entity @a[tag=gulce_vip,tag=!gulce_mod,tag=!gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s ["  ",{text:"Yok",color:"gray",italic:1b}]

tellraw @s [""]

# Normal oyuncular
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"👤 Oyuncular:",color:"white",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"👤 Oyuncular:",color:"white",bold:true}]
execute as @a[tag=gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s ["  ",{selector:"@s",color:"yellow"}," ",{text:"(Level 1)",color:"gray"}]
execute as @a[tag=gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s ["  ",{selector:"@s",color:"yellow"}," ",{text:"(Level 1)",color:"gray"}]
execute unless entity @a[tag=gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s ["  ",{text:"Yok",color:"gray",italic:1b}]
execute unless entity @a[tag=gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s ["  ",{text:"Yok",color:"gray",italic:1b}]

tellraw @s [""]

# Tag'siz oyuncular
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"❓ Tag'siz:",color:"dark_gray",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"❓ Tag'siz:",color:"dark_gray",bold:true}]
execute as @a[tag=!gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s ["  ",{selector:"@s",color:"yellow"}," ",{text:"(Level 0)",color:"gray"}]
execute as @a[tag=!gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s ["  ",{selector:"@s",color:"yellow"}," ",{text:"(Level 0)",color:"gray"}]
execute unless entity @a[tag=!gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s ["  ",{text:"Yok",color:"gray",italic:1b}]
execute unless entity @a[tag=!gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s ["  ",{text:"Yok",color:"gray",italic:1b}]

execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]

return 0
