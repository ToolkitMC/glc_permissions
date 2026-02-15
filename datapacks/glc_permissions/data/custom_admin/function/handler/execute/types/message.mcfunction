# ═══════════════════════════════════════════════════
# Message Action
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.text set from storage glc:temp temp.params.text
data modify storage glc:temp temp.player set from storage glc:temp temp.exec_action.player

function custom_admin:handler/execute/types/message_run with storage glc:temp temp