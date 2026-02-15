# ═══════════════════════════════════════════════════
# Main Menu - GULCE Admin Power v1.3.0
# ═══════════════════════════════════════════════════

# Yetki seviyesini kontrol et
execute unless score @s gulce_permission_level matches 1.. run tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"❌ Bu menüye erişim yetkiniz yok!","color":"red"}]
execute unless score @s gulce_permission_level matches 1.. run return fail

# Ana menüyü göster
tellraw @s ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
tellraw @s ["",{"text":"  ⚡ GULCE Admin Power v1.3.0 ⚡","color":"yellow","bold":true}]
tellraw @s ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
tellraw @s [""]

# Oyuncuya rolünü göster
execute if entity @s[tag=gulce_owner] run tellraw @s ["",{"text":"  👑 Rolünüz: ","color":"gray"},{"text":"OWNER","color":"red","bold":true}]
execute if entity @s[tag=gulce_mod,tag=!gulce_owner] run tellraw @s ["",{"text":"  👮 Rolünüz: ","color":"gray"},{"text":"MOD","color":"blue","bold":true}]
execute if entity @s[tag=gulce_vip,tag=!gulce_mod,tag=!gulce_owner] run tellraw @s ["",{"text":"  ⭐ Rolünüz: ","color":"gray"},{"text":"VIP","color":"light_purple","bold":true}]
execute if entity @s[tag=gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_owner] run tellraw @s ["",{"text":"  👤 Rolünüz: ","color":"gray"},{"text":"PLAYER","color":"white"}]

tellraw @s [""]

# OWNER menüleri
execute if entity @s[tag=gulce_owner] run tellraw @s ["",{"text":"👑 OWNER MENÜLERI:","color":"red","bold":true}]
execute if entity @s[tag=gulce_owner] run tellraw @s ["",{"text":"  [⚙️] ","color":"red","clickEvent":{"action":"run_command","value":"/function custom_admin:features/owner/system_control"},"hoverEvent":{"action":"show_text","value":"Sistem kontrol paneli"}},{"text":"Sistem Kontrolü","color":"red","clickEvent":{"action":"run_command","value":"/function custom_admin:features/owner/system_control"},"hoverEvent":{"action":"show_text","value":"Sistem kontrol paneli"}}]
execute if entity @s[tag=gulce_owner] run tellraw @s ["",{"text":"  [👥] ","color":"yellow","clickEvent":{"action":"run_command","value":"/function custom_admin:role/menu"},"hoverEvent":{"action":"show_text","value":"Rol yönetimi"}},{"text":"Rol Yönetimi","color":"yellow","clickEvent":{"action":"run_command","value":"/function custom_admin:role/menu"},"hoverEvent":{"action":"show_text","value":"Rol yönetimi"}}]
execute if entity @s[tag=gulce_owner] run tellraw @s [""]

# MOD menüleri
execute if score @s gulce_permission_level matches 3.. run tellraw @s ["",{"text":"👮 MOD MENÜLERI:","color":"blue","bold":true}]
execute if score @s gulce_permission_level matches 3.. run tellraw @s ["",{"text":"  [🛡️] ","color":"blue","clickEvent":{"action":"run_command","value":"/function custom_admin:features/mod/player_management"},"hoverEvent":{"action":"show_text","value":"Oyuncu yönetimi"}},{"text":"Oyuncu Yönetimi","color":"blue","clickEvent":{"action":"run_command","value":"/function custom_admin:features/mod/player_management"},"hoverEvent":{"action":"show_text","value":"Oyuncu yönetimi"}}]
execute if score @s gulce_permission_level matches 3.. run tellraw @s [""]

# VIP menüleri
execute if score @s gulce_permission_level matches 2.. run tellraw @s ["",{"text":"⭐ VIP MENÜLERI:","color":"light_purple","bold":true}]
execute if score @s gulce_permission_level matches 2.. run tellraw @s ["",{"text":"  [🚀] ","color":"aqua","clickEvent":{"action":"run_command","value":"/function custom_admin:features/vip/quick_teleport"},"hoverEvent":{"action":"show_text","value":"Hızlı teleport"}},{"text":"Hızlı Teleport","color":"aqua","clickEvent":{"action":"run_command","value":"/function custom_admin:features/vip/quick_teleport"},"hoverEvent":{"action":"show_text","value":"Hızlı teleport"}}]
execute if score @s gulce_permission_level matches 2.. run tellraw @s ["",{"text":"  [✨] ","color":"light_purple","clickEvent":{"action":"run_command","value":"/function custom_admin:features/vip/special_effects"},"hoverEvent":{"action":"show_text","value":"Özel efektler"}},{"text":"Özel Efektler","color":"light_purple","clickEvent":{"action":"run_command","value":"/function custom_admin:features/vip/special_effects"},"hoverEvent":{"action":"show_text","value":"Özel efektler"}}]
execute if score @s gulce_permission_level matches 2.. run tellraw @s [""]

# Klasik menü (eski sistem uyumluluğu)
tellraw @s ["",{"text":"📋 KLASİK MENÜLER:","color":"yellow","bold":true}]
tellraw @s ["",{"text":"  [📜] ","color":"green","clickEvent":{"action":"run_command","value":"/function glc_menu:handler/builder/main"},"hoverEvent":{"action":"show_text","value":"Eski menü sistemi"}},{"text":"Klasik Menü","color":"green","clickEvent":{"action":"run_command","value":"/function glc_menu:handler/builder/main"},"hoverEvent":{"action":"show_text","value":"Eski menü sistemi"}}]

tellraw @s ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]

# Bilgi
tellraw @s ["",{"text":"💡 Yetki seviyeniz: ","color":"gray"},{"score":{"name":"@s","objective":"gulce_permission_level"},"color":"yellow"}]