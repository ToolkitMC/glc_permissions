# ═══════════════════════════════════════════════════
# Title Action
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.text set from storage glc:temp temp.params.text
data modify storage glc:temp temp.subtitle set from storage glc:temp temp.params.subtitle
data modify storage glc:temp temp.selector set from storage glc:temp temp.exec_action.player

function custom_admin:handler/execute/types/title_run with storage glc:temp temp