# ═══════════════════════════════════════════════════
# XP Action - Oyuncuya XP verir/alır
# params: {mode:"add|set|query", amount:N, type:"levels|points"}
# type: "levels" = seviye, "points" = puan (default: points)
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.mode set from storage glc:temp temp.params.mode
data modify storage glc:temp temp.amount set from storage glc:temp temp.params.amount
data modify storage glc:temp temp.type set from storage glc:temp temp.params.type
data modify storage glc:temp temp.selector set from storage glc:temp temp.exec_action.player

function custom_admin:handler/execute/types/xp_run with storage glc:temp temp
