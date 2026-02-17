# ═══════════════════════════════════════════════════
# Gamemode Action
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.mode set from storage glc:temp temp.params.mode
data modify storage glc:temp temp.selector set from storage glc:temp temp.exec_action.player

function custom_admin:handler/execute/types/gamemode_run with storage glc:temp temp