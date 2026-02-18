# ═══════════════════════════════════════════════════
# SPY MONOCLE Panel - En Yakın Oyuncuyu İncele (MOD+)
# ═══════════════════════════════════════════════════

execute unless score @s gulce_permission_level matches 3.. if entity @s[tag=glc.lang_tr] run tellraw @s {"text":"❌ Mod yetkisi gerekli!","color":"red"}
execute unless score @s gulce_permission_level matches 3.. run return fail

# En yakın oyuncunun adını al (@a[sort=nearest,limit=1] → kendisi hariç)
execute store success score #spy_found glc.timer if entity @a[tag=!gulce_admin,tag=!gulce_mod,tag=!gulce_owner,sort=nearest,limit=1,distance=0.1..50]
execute if score #spy_found glc.timer matches 0 if entity @s[tag=glc.lang_tr] run tellraw @s ["",{"text":"[GULCE] ","color":"light_purple","bold":true},{"text":"🔍 50 blok içinde oyuncu bulunamadı.","color":"gray"}]
execute if score #spy_found glc.timer matches 0 if entity @s[tag=glc.lang_en] run tellraw @s ["",{"text":"[GULCE] ","color":"light_purple","bold":true},{"text":"🔍 No player found within 50 blocks.","color":"gray"}]
execute if score #spy_found glc.timer matches 0 run return 0

# Hedef oyuncunun adını storage'a yaz
execute as @a[tag=!gulce_admin,tag=!gulce_mod,tag=!gulce_owner,sort=nearest,limit=1,distance=0.1..50] run function glc_menu:handler/utils/player_name
data modify storage glc:temp spy_target set from storage glc_menu:names temp.NAME

tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

# Spy panelini aç (macro ile isim geç)
function glc_menu:items/panels/spy_panel with storage glc:temp
