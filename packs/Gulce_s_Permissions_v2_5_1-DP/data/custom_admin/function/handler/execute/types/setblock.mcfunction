# ═══════════════════════════════════════════════════
# Setblock Action - Belirtilen konuma blok yerleştirir
# params: {x:N, y:N, z:N, block:"minecraft:block_id", mode:"replace|keep|destroy"}
# mode opsiyonel, default: replace
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.x set from storage glc:temp temp.params.x
data modify storage glc:temp temp.y set from storage glc:temp temp.params.y
data modify storage glc:temp temp.z set from storage glc:temp temp.params.z
data modify storage glc:temp temp.block set from storage glc:temp temp.params.block
data modify storage glc:temp temp.mode set from storage glc:temp temp.params.mode
data modify storage glc:temp temp.selector set from storage glc:temp temp.exec_action.player

function custom_admin:handler/execute/types/setblock_run with storage glc:temp temp
