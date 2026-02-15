# ═══════════════════════════════════════════════════
# Main Tick Loop (v1.2.2 - Optimized)
# Loop manager kaldırıldı - Basit timer sistemi
# ═══════════════════════════════════════════════════

# Admin Loop - Tek sefer çalışır (oyuncu başına DEĞİL)
execute if entity @a if score #admin_tick glc.timer matches ..0 run scoreboard players set #admin_tick glc.timer 20
execute if entity @a if score #admin_tick glc.timer matches 20 run function custom_admin:handler/loop/all/1
execute if entity @a run scoreboard players remove #admin_tick glc.timer 1

# Menu Loop - Oyuncu başına çalışır (as @a at @s)
execute if entity @a if score #menu_tick glc.timer matches ..0 run scoreboard players set #menu_tick glc.timer 10
execute if entity @a if score #menu_tick glc.timer matches 10 as @a at @s run function glc_menu:handler/tick
execute if entity @a run scoreboard players remove #menu_tick glc.timer 1

# Menu Opener - Carrot on stick kullanımı
execute as @a[scores={gulce.used=1..},predicate=glc_menu:holding_menu_item] run function #glc_menu:menu
scoreboard players set @a[scores={gulce.used=1..}] gulce.used 0