# ═══════════════════════════════════════════════════
# Role: List All Players by Role
# Usage: /function custom_admin:role/list_players
# Permission Level: 2 (MOD veya OWNER)
# ═══════════════════════════════════════════════════

# Yetki kontrolü
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] run tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"❌ Bu komutu kullanma yetkiniz yok!","color":"red"}]
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] run return fail

# Başlık
tellraw @s ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
tellraw @s ["",{"text":"       📋 OYUNCU LİSTESİ       ","color":"yellow","bold":true}]
tellraw @s ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
tellraw @s [""]

# OWNER'lar
tellraw @s ["",{"text":"👑 OWNER'lar:","color":"red","bold":true}]
execute as @a[tag=gulce_owner] run tellraw @s ["  ",{"selector":"@s","color":"yellow"}," ",{"text":"(Level 4)","color":"gray"}]
execute unless entity @a[tag=gulce_owner] run tellraw @s ["  ",{"text":"Yok","color":"gray","italic":true}]

tellraw @s [""]

# MOD'lar
tellraw @s ["",{"text":"👮 MOD'lar:","color":"blue","bold":true}]
execute as @a[tag=gulce_mod,tag=!gulce_owner] run tellraw @s ["  ",{"selector":"@s","color":"yellow"}," ",{"text":"(Level 3)","color":"gray"}]
execute unless entity @a[tag=gulce_mod,tag=!gulce_owner] run tellraw @s ["  ",{"text":"Yok","color":"gray","italic":true}]

tellraw @s [""]

# VIP'ler
tellraw @s ["",{"text":"⭐ VIP'ler:","color":"light_purple","bold":true}]
execute as @a[tag=gulce_vip,tag=!gulce_mod,tag=!gulce_owner] run tellraw @s ["  ",{"selector":"@s","color":"yellow"}," ",{"text":"(Level 2)","color":"gray"}]
execute unless entity @a[tag=gulce_vip,tag=!gulce_mod,tag=!gulce_owner] run tellraw @s ["  ",{"text":"Yok","color":"gray","italic":true}]

tellraw @s [""]

# Normal oyuncular
tellraw @s ["",{"text":"👤 Oyuncular:","color":"white","bold":true}]
execute as @a[tag=gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_owner] run tellraw @s ["  ",{"selector":"@s","color":"yellow"}," ",{"text":"(Level 1)","color":"gray"}]
execute unless entity @a[tag=gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_owner] run tellraw @s ["  ",{"text":"Yok","color":"gray","italic":true}]

tellraw @s [""]

# Tag'siz oyuncular
tellraw @s ["",{"text":"❓ Tag'siz:","color":"dark_gray","bold":true}]
execute as @a[tag=!gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_owner] run tellraw @s ["  ",{"selector":"@s","color":"yellow"}," ",{"text":"(Level 0)","color":"gray"}]
execute unless entity @a[tag=!gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_owner] run tellraw @s ["  ",{"text":"Yok","color":"gray","italic":true}]

tellraw @s ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
