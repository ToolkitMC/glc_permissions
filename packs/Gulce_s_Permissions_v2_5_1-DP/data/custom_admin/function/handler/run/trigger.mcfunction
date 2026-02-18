# ═══════════════════════════════════════════════════
# Trigger Handler - Scoreboard'ı enable eder ve yürütür
# DÜZELTİLDİ v2.5.7: Tüm trigger case'leri cooldown kontrolünden ÖNCE
# ═══════════════════════════════════════════════════

# Trigger'ı etkinleştir
scoreboard players enable @s gulce_trigger

# Cooldown kontrolü
execute if score @s gulce_cooldown matches 1.. if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Lütfen bekleyin! Cooldown: ",color:"red"},{score:{name:"@s",objective:'gulce_cooldown'},color:"yellow"},{text:" tick",color:"red"}]
execute if score @s gulce_cooldown matches 1.. if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Please wait! Cooldown: ",color:"red"},{score:{name:"@s",objective:'gulce_cooldown'},color:"yellow"},{text:" ticks",color:"red"}]
execute if score @s gulce_cooldown matches 1.. run scoreboard players set @s gulce_trigger 0
execute if score @s gulce_cooldown matches 1.. run return 0

# ─── Tüm Trigger Değerleri ─────────────────────────────────────
# Dialog panelleri
execute if score @s gulce_trigger matches 1 run schedule function custom_admin:handler/dialog/load/main_menu 5t
execute if score @s gulce_trigger matches 2 run function custom_admin:handler/dialog/load/permission_manager
execute if score @s gulce_trigger matches 3 run function custom_admin:handler/dialog/load/help
execute if score @s gulce_trigger matches 4 run function custom_admin:handler/dialog/load/about
execute if score @s gulce_trigger matches 5 run function custom_admin:handler/dialog/load/action_manager

# v2.5.4: Yeni panel yönlendirmeleri (10-15 arası)
execute if score @s gulce_trigger matches 10 run function custom_admin:features/fun/panel
execute if score @s gulce_trigger matches 11 run function custom_admin:features/owner/automation_panel
execute if score @s gulce_trigger matches 12 run function custom_admin:features/mod/player_management
execute if score @s gulce_trigger matches 13 run function custom_admin:features/vip/special_effects
execute if score @s gulce_trigger matches 14 run function custom_admin:features/vip/quick_teleport
execute if score @s gulce_trigger matches 15 run function custom_admin:features/owner/system_control

# v2.5.7: Item Panel trigger'ları (16-20)
execute if score @s gulce_trigger matches 16 run function glc_menu:items/panels/mod_kit
execute if score @s gulce_trigger matches 17 run function glc_menu:items/panels/admin_panel
execute if score @s gulce_trigger matches 18 run function glc_menu:items/panels/quick_action
execute if score @s gulce_trigger matches 19 run function glc_menu:items/spy
execute if score @s gulce_trigger matches 20 run function glc_menu:items/panels/broadcast

# Cooldown ayarla (20 tick = 1 saniye)
execute unless score @s gulce_cooldown matches 1.. run scoreboard players set @s gulce_cooldown 20

# Trigger'ı sıfırla
scoreboard players set @s gulce_trigger 0

# Debug log
execute as @a[tag=gulce_debug,tag=glc.lang_tr] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"Trigger çalıştırıldı: ",color:"gray"},{selector:"@s",color:"yellow"}]
execute as @a[tag=gulce_debug,tag=glc.lang_en] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"Trigger executed: ",color:"gray"},{selector:"@s",color:"yellow"}]
