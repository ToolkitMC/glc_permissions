# ═══════════════════════════════════════════════════
# Clear Action
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.item set from storage glc:temp temp.params.item
data modify storage glc:temp temp.count set from storage glc:temp temp.params.count
data modify storage glc:temp temp.selector set from storage glc:temp temp.exec_action.player

function custom_admin:handler/execute/types/clear_run with storage glc:temp temp