# ═══════════════════════════════════════════════════
# Item Kit Dağıtıcı - Yetki Bazlı
# Herkese ana menü, yetkiye göre ek item'lar verir
# ═══════════════════════════════════════════════════

# Ana menü item'ı - herkes
function glc_menu:handler/utils/give_open_item

# MOD+ → Mod Kit + Spy + Broadcast
execute if score @s gulce_permission_level matches 3.. run function glc_menu:items/give_mod_kit
execute if score @s gulce_permission_level matches 3.. run function glc_menu:items/give_spy
execute if score @s gulce_permission_level matches 3.. run function glc_menu:items/give_broadcast

# ADMIN/OWNER → Admin Panel + Quick Action
execute if score @s gulce_permission_level matches 4.. run function glc_menu:items/give_admin_panel
execute if score @s gulce_permission_level matches 3.. run function glc_menu:items/give_quick_action
execute if score @s gulce_permission_level matches 4.. if entity @s[tag=glc.lang_tr] run give @s minecraft:carrot_on_a_stick[minecraft:custom_data={glcPermissionManager:1b},minecraft:custom_name={"text":"🔐 İzin Yöneticisi","color":"green","bold":true,"italic":false},minecraft:lore=[{"text":"İzinleri yönet","color":"gray","italic":true},{"text":"Sağ tık → İzin Paneli","italic":false,"color":"green"}]]
execute if score @s gulce_permission_level matches 4.. if entity @s[tag=glc.lang_en] run give @s minecraft:carrot_on_a_stick[minecraft:custom_data={glcPermissionManager:1b},minecraft:custom_name={"text":"🔐 Permission Manager","color":"green","bold":true,"italic":false},minecraft:lore=[{"text":"Manage permissions","color":"gray","italic":true},{"text":"Right click → Permission Panel","italic":false,"color":"green"}]]
execute if score @s gulce_permission_level matches 4.. if entity @s[tag=glc.lang_de] run give @s minecraft:carrot_on_a_stick[minecraft:custom_data={glcPermissionManager:1b},minecraft:custom_name={"text":"🔐 Berechtigungs-Manager","color":"green","bold":true,"italic":false},minecraft:lore=[{"text":"Berechtigungen verwalten","color":"gray","italic":true},{"text":"Rechtsklick → Berechtigungs-Panel","italic":false,"color":"green"}]]
execute if score @s gulce_permission_level matches 4.. unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] unless entity @s[tag=glc.lang_de] run give @s minecraft:carrot_on_a_stick[minecraft:custom_data={glcPermissionManager:1b},minecraft:custom_name={"text":"🔐 İzin Yöneticisi","color":"green","bold":true,"italic":false}]
execute if score @s gulce_permission_level matches 3 if entity @s[tag=glc.lang_tr] run give @s minecraft:carrot_on_a_stick[minecraft:custom_data={glcPermissionManager:1b},minecraft:custom_name={"text":"🔐 İzin Yöneticisi","color":"green","bold":true,"italic":false},minecraft:lore=[{"text":"İzinleri yönet","color":"gray","italic":true},{"text":"Sağ tık → İzin Paneli","italic":false,"color":"green"}]]
execute if score @s gulce_permission_level matches 3 if entity @s[tag=glc.lang_en] run give @s minecraft:carrot_on_a_stick[minecraft:custom_data={glcPermissionManager:1b},minecraft:custom_name={"text":"🔐 Permission Manager","color":"green","bold":true,"italic":false},minecraft:lore=[{"text":"Manage permissions","color":"gray","italic":true},{"text":"Right click → Permission Panel","italic":false,"color":"green"}]]
execute if score @s gulce_permission_level matches 3 if entity @s[tag=glc.lang_de] run give @s minecraft:carrot_on_a_stick[minecraft:custom_data={glcPermissionManager:1b},minecraft:custom_name={"text":"🔐 Berechtigungs-Manager","color":"green","bold":true,"italic":false},minecraft:lore=[{"text":"Berechtigungen verwalten","color":"gray","italic":true},{"text":"Rechtsklick → Berechtigungs-Panel","italic":false,"color":"green"}]]
execute if score @s gulce_permission_level matches 3 unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] unless entity @s[tag=glc.lang_de] run give @s minecraft:carrot_on_a_stick[minecraft:custom_data={glcPermissionManager:1b},minecraft:custom_name={"text":"🔐 İzin Yöneticisi","color":"green","bold":true,"italic":false}]

# Bildirim - TR
execute if entity @s[tag=glc.lang_tr] run tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"🎒 Eşyalar envanterinize eklendi!","color":"green"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"🎒 Items added to your inventory!","color":"green"}]
execute if entity @s[tag=glc.lang_de] run tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"🎒 Gegenstände zu Inventar hinzugefügt!","color":"green"}]
playsound minecraft:entity.item.pickup master @s ~ ~ ~ 1 1.2
