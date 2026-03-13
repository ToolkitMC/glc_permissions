# ═══════════════════════════════════════════════════
# GLC Menu - Trigger Handler (v2.5.8)
# ═══════════════════════════════════════════════════
# Menü açılış sesi
execute unless score @s gulce_menu matches -4 run playsound custom_admin:ui.click master @s ~ ~ ~ 1 1

# Menü 1: Ana Menü
execute if score @s gulce_menu matches 1 run function glc_menu:handler/builder/main

# Menü 2: İzin Listesi (Dinamik)
execute if score @s gulce_menu matches 2 run function glc_menu:handler/builder/permissions

# Menü 3: Düzenleme Menüsü
execute if score @s gulce_menu matches 3 run function glc_menu:handler/builder/edit

# Menü 20: Uyarı Yönetimi Paneli
execute if score @s gulce_menu matches 20 run function glc_menu:handler/builder/warn_panel

# Menü 21: NameTag Hızlı Giriş
execute if score @s gulce_menu matches 21 run function glc_menu:handler/builder/nametag_panel

# Menü 22: Özel Eylem Oluşturucu
execute if score @s gulce_menu matches 22 run function glc_menu:handler/builder/custom_action_panel

# Menü 30: TPA paneli
execute if score @s gulce_menu matches 30 run function glc_menu:handler/builder/tpa_panel

# Menü 31: Home paneli
execute if score @s gulce_menu matches 31 run function glc_menu:handler/builder/home_panel

# Menü 32: Oylama paneli
execute if score @s gulce_menu matches 32 run function glc_menu:handler/builder/vote_panel

# Menü 33: Rapor paneli
execute if score @s gulce_menu matches 33 run function glc_menu:handler/builder/report_panel

# Menü 51: Zamanlayıcı
execute if score @s gulce_menu matches 51 run function custom_admin:handler/schedule/list

# Menü 60: Ayarlar
execute if score @s gulce_menu matches 60 run function glc_menu:handler/builder/settings

# Kapat
execute if score @s gulce_menu matches -4 run function glc_menu:handler/close

# Menü -512: Dinamik Menü
execute if score @s gulce_menu matches -512 run function glc_menu:handler/dialog/open

# Trigger sıfırla
scoreboard players set @s gulce_menu 0
scoreboard players enable @s gulce_menu
