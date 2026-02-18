# ═══════════════════════════════════════════════════
# Summon Action
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.entity set from storage glc:temp temp.params.entity
data modify storage glc:temp temp.x set from storage glc:temp temp.params.x
data modify storage glc:temp temp.y set from storage glc:temp temp.params.y
data modify storage glc:temp temp.z set from storage glc:temp temp.params.z
data modify storage glc:temp temp.nbt set from storage glc:temp temp.params.nbt
data modify storage glc:temp temp.selector set from storage glc:temp temp.exec_action.player

function custom_admin:handler/execute/types/summon_run with storage glc:temp temp
