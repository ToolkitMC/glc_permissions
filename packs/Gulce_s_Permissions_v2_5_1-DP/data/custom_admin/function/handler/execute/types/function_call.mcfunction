# ═══════════════════════════════════════════════════
# Function Call Action
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.function set from storage glc:temp temp.params.function
data modify storage glc:temp temp.selector set from storage glc:temp temp.exec_action.player

function custom_admin:handler/execute/types/function_call_run with storage glc:temp temp