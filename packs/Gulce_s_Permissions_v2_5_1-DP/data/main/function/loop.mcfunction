# ═══════════════════════════════════════════════════
# Main Tick Loop (v2.5.9 - Timer Bug Düzeltmesi)
# ═══════════════════════════════════════════════════

# Permission Level Sync - Her 2 saniyede bir (40 tick)
# DÜZELTME v2.5.9: Reset değeri 1 yerine 40 olmalıydı
# (1'e resetlenince ilk tetikten sonra her tick çalışıyordu)
execute if entity @a if score #permission_sync glc.timer matches ..0 run scoreboard players set #permission_sync glc.timer 40
execute if entity @a if score #permission_sync glc.timer matches 1 run function custom_admin:permissions/sync_levels
execute if entity @a run scoreboard players remove #permission_sync glc.timer 1

# Admin Loop - Her 1 saniyede bir (20 tick)
# DÜZELTME v2.5.9: Reset değeri 1 yerine 20 olmalıydı
execute if entity @a if score #admin_tick glc.timer matches ..0 run scoreboard players set #admin_tick glc.timer 20
execute if entity @a if score #admin_tick glc.timer matches 1 run function custom_admin:handler/loop/all/1
execute if entity @a run scoreboard players remove #admin_tick glc.timer 1

# Menu Loop - Her 0.5 saniyede bir (10 tick), oyuncu başına çalışır
# DÜZELTME v2.5.9: Reset değeri 1 yerine 10 olmalıydı
execute if entity @a if score #menu_tick glc.timer matches ..0 run scoreboard players set #menu_tick glc.timer 10
execute if entity @a if score #menu_tick glc.timer matches 1 as @a at @s run function glc_menu:handler/tick
execute if entity @a run scoreboard players remove #menu_tick glc.timer 1

# Menu Opener - Carrot on stick kullanımı
execute as @a[scores={gulce.used=1..},predicate=glc_menu:holding_menu_item] run function glc_menu:handler/builder/main

# ─── v2.5.7: Yeni Item Handler'ları ───────────────────────────────────────
# Her item tipi için: sağ tık → predicate kontrolü → panel aç
execute as @a[scores={gulce.used=1..}] if entity @s[predicate=glc_menu:glc_mod_kit] run function glc_menu:items/panels/mod_kit
execute as @a[scores={gulce.used=1..}] if entity @s[predicate=glc_menu:glc_admin_panel] run function glc_menu:items/panels/admin_panel
execute as @a[scores={gulce.used=1..}] if entity @s[predicate=glc_menu:glc_quick_action] run function glc_menu:items/panels/quick_action
execute as @a[scores={gulce.used=1..}] if entity @s[predicate=glc_menu:glc_spy] run function glc_menu:items/spy
execute as @a[scores={gulce.used=1..}] if entity @s[predicate=glc_menu:glc_broadcast] run function glc_menu:items/panels/broadcast

scoreboard players set @a[scores={gulce.used=1..}] gulce.used 0
# ─── v2.5.4 EKLEMELERİ ───────────────────────────────────────────

# Auto Announce - Ayarlanan aralıkta otomatik duyuru
execute if entity @a if score #auto_ann_tick glc.timer matches ..0 run function custom_admin:handler/automation/auto_announce_tick
execute if entity @a run scoreboard players remove #auto_ann_tick glc.timer 1

# Player Join Detection - Yeni oyuncu tespiti (glc.joined tag'i olmayanlar)
execute as @a[tag=!glc.joined] run function custom_admin:handler/player_join

# Freeze sistemi - donmuş oyuncuları yerinde tut (spectator hariç)
execute as @a[gamemode=!spectator,tag=ca.freezed] run tp @s @s

# ─── v2.5.4: NameTag Trigger ────────────────────────────────────────────────
# gulce_nametag trigger: popup-free string input (SelectedItem.custom_name okur)
execute as @a[scores={gulce_nametag=1..}] run scoreboard players enable @s gulce_nametag
execute as @a[scores={gulce_nametag=1}] run function custom_admin:features/input/nametag_warn
execute as @a[scores={gulce_nametag=2}] run function custom_admin:features/input/nametag_check
execute as @a[scores={gulce_nametag=3}] run function custom_admin:features/input/nametag_pardon
execute as @a[scores={gulce_nametag=4}] at @s run function custom_admin:features/mod/freeze_freeze
execute as @a[scores={gulce_nametag=5}] at @s run function custom_admin:features/input/nametag_kill
execute as @a[scores={gulce_nametag=6}] at @s run function custom_admin:features/mod/health_heal
scoreboard players set @a[scores={gulce_nametag=1..}] gulce_nametag 0
