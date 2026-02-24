# ═══════════════════════════════════════════════════
# ⚡ GULCE CONTROL PANEL - Sabit Menü
# ═══════════════════════════════════════════════════

# Loading Göster
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 8

# Ana menüyü hazırla (Sabit)
data modify storage glc:ui ui set value "custom_admin:main_menu"
