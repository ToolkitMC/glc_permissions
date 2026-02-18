# ═══════════════════════════════════════════════════
# GLC Menu - Trigger Handler
# ═══════════════════════════════════════════════════

# Menü 1: Ana Menü
execute if score @s gulce_menu matches 1 run function glc_menu:handler/builder/main

# Menü 2: İzin Listesi (Dinamik)
execute if score @s gulce_menu matches 2 run function glc_menu:handler/builder/permissions

# Menü 3: Düzenleme Menüsü
execute if score @s gulce_menu matches 3 run function glc_menu:handler/builder/edit

# Menü 51: Zamanlayıcı (mevcut)
execute if score @s gulce_menu matches 51 run function custom_admin:handler/schedule/list

# Menü 60: Ayarlar (v2.5.0-fix - New)
execute if score @s gulce_menu matches 60 run function glc_menu:handler/builder/settings

# Menü 20: Uyarı Yönetimi Paneli
execute if score @s gulce_menu matches 20 run function glc_menu:handler/builder/warn_panel

# Menü 21: NameTag Hızlı Giriş
execute if score @s gulce_menu matches 21 run function glc_menu:handler/builder/nametag_panel

# Menü 22: Özel Eylem Oluşturucu
execute if score @s gulce_menu matches 22 run function glc_menu:handler/builder/custom_action_panel

# Kapat
execute if score @s gulce_menu matches -4 run function glc_menu:handler/close

# Menü 4: Dinamik Menü
execute if score @s gulce_menu matches -512 run function glc_menu:handler/dialog/open

# Trigger sıfırla
scoreboard players set @a gulce_menu 0

# Trigger yeniden aktif
scoreboard players enable @s gulce_menu

# Konsol mesajı
function glc_menu:handler/menu_notify with storage glc_menu:names temp