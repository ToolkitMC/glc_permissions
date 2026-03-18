# ═══════════════════════════════════════════════════
# Dialog Load - Dialog yükleyici
# ═══════════════════════════════════════════════════

# Dialog oluştur
$data modify storage glc:temp temp.dialogData set value $(dialogData)
function glc_menu:handler/utils/create_dialog with storage glc:temp temp.dialogData

# Loading göster
tag @s add glc.show_pending
$scoreboard players set @s glc_load_type $(loadType)
function glc_menu:handler/dialog/loading
$scoreboard players set @s gulce_load.dialog $(tick)