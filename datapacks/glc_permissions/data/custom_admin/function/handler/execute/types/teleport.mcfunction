# ═══════════════════════════════════════════════════
# Teleport Action
# ═══════════════════════════════════════════════════

# Parametreleri al
data modify storage glc:temp temp.x set from storage glc:temp temp.params.x
data modify storage glc:temp temp.y set from storage glc:temp temp.params.y
data modify storage glc:temp temp.z set from storage glc:temp temp.params.z
data modify storage glc:temp temp.player set from storage glc:temp temp.exec_action.player

# Macro ile çalıştır
function custom_admin:handler/execute/types/teleport_run with storage glc:temp temp