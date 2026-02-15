# ═══════════════════════════════════════════════════
# Command Action
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.command set from storage glc:temp temp.params.command
data modify storage glc:temp temp.player set from storage glc:temp temp.exec_action.player

function custom_admin:handler/execute/types/command_run with storage glc:temp temp