# ═══════════════════════════════════════════════════
# Effect Action
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.effect set from storage glc:temp temp.params.effect
data modify storage glc:temp temp.duration set from storage glc:temp temp.params.duration
data modify storage glc:temp temp.amplifier set from storage glc:temp temp.params.amplifier
data modify storage glc:temp temp.selector set from storage glc:temp temp.exec_action.player

function custom_admin:handler/execute/types/effect_run with storage glc:temp temp