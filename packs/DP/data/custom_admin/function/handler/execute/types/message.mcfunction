# ═══════════════════════════════════════════════════
# Message Action
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.message set from storage glc:temp temp.params.message
# Fallback: text alanına da bak
execute unless data storage glc:temp temp.message run data modify storage glc:temp temp.message set from storage glc:temp temp.params.text
data modify storage glc:temp temp.selector set from storage glc:temp temp.exec_action.player

function custom_admin:handler/execute/types/message_run with storage glc:temp temp
