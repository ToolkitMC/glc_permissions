# ═══════════════════════════════════════════════════
playsound custom_admin:ui.open master @s ~ ~ ~ 1 1
# Dialog Show - Gerçek Gösterici
# ═══════════════════════════════════════════════════

# Player head selector ile NAME'i al (@s context'ini kullanarak)
function glc_menu:handler/utils/player_name

# ui parametresini glc:ui'dan glc_menu:names'e kopyala
data modify storage glc_menu:names temp.ui set from storage glc:ui ui

# Cooldown uygula (v2.0.2 - Configurable)
execute store result score @s gulce_cooldown run data get storage glc:config cooldowns.menu_open

# Dialog göster (NAME ve ui storage'dan)
function glc_menu:handler/dialog/show_final with storage glc_menu:names temp

# Skor -1 yap (tekrar gösterilmesin)
scoreboard players set @s gulce_load.dialog -1

# Pending tag kaldır
tag @s remove glc.show_pending

# Tag temizle
tag @s remove closed.glc
