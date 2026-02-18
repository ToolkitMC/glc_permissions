# ═══════════════════════════════════════════════════
# Main Tick Loop (v1.3.0 - Role System Added)
# Loop manager kaldırıldı - Basit timer sistemi
# ═══════════════════════════════════════════════════

# Permission Level Sync - Her 2 saniyede bir (40 tick)
execute if entity @a if score #permission_sync glc.timer matches ..0 run scoreboard players set #permission_sync glc.timer 1
execute if entity @a if score #permission_sync glc.timer matches 1 run function custom_admin:permissions/sync_levels
execute if entity @a run scoreboard players remove #permission_sync glc.timer 1

# Admin Loop - Tek sefer çalışır (oyuncu başına DEĞİL)
execute if entity @a if score #admin_tick glc.timer matches ..0 run scoreboard players set #admin_tick glc.timer 1
execute if entity @a if score #admin_tick glc.timer matches 1 run function custom_admin:handler/loop/all/1
execute if entity @a run scoreboard players remove #admin_tick glc.timer 1

# Menu Loop - Oyuncu başına çalışır (as @a at @s)
execute if entity @a if score #menu_tick glc.timer matches ..0 run scoreboard players set #menu_tick glc.timer 1
execute if entity @a if score #menu_tick glc.timer matches 1 as @a at @s run function glc_menu:handler/tick
execute if entity @a run scoreboard players remove #menu_tick glc.timer 1

# Menu Opener - Carrot on stick kullanımı
execute as @a[scores={gulce.used=1..},predicate=glc_menu:holding_menu_item] run function glc_menu:handler/builder/main
scoreboard players set @a[scores={gulce.used=1..}] gulce.used 0
# ─── v2.5.0-fix EKLEMELERİ ───────────────────────────────────────────

# Auto Announce - Ayarlanan aralıkta otomatik duyuru
execute if entity @a if score #auto_ann_tick glc.timer matches ..0 run function custom_admin:handler/automation/auto_announce_tick
execute if entity @a run scoreboard players remove #auto_ann_tick glc.timer 1

# Player Join Detection - Yeni oyuncu tespiti (glc.joined tag'i olmayanlar)
execute as @a[tag=!glc.joined] run function custom_admin:handler/player_join

# Freeze sistemi - donmuş oyuncuları yerinde tut (spectator hariç)
execute as @a[gamemode=!spectator,tag=ca.freezed] run tp @s @s

# ─── v2.5.0-fix: NameTag Trigger ────────────────────────────────────────────────
# gulce_nametag trigger: popup-free string input (SelectedItem.custom_name okur)
execute as @a[scores={gulce_nametag=1..}] run scoreboard players enable @s gulce_nametag
execute as @a[scores={gulce_nametag=1}] run function custom_admin:features/input/nametag_warn
execute as @a[scores={gulce_nametag=2}] run function custom_admin:features/input/nametag_check
execute as @a[scores={gulce_nametag=3}] run function custom_admin:features/input/nametag_pardon
execute as @a[scores={gulce_nametag=4}] at @s run function custom_admin:features/mod/freeze_freeze
execute as @a[scores={gulce_nametag=5}] at @s run function custom_admin:features/mod/health_kill
execute as @a[scores={gulce_nametag=6}] at @s run function custom_admin:features/mod/health_heal
scoreboard players set @a[scores={gulce_nametag=1..}] gulce_nametag 0
