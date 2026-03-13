# ═══════════════════════════════════════════════════
# Action Execute: Home (v2.5.7)
# type: "home" - oyuncuyu home'una ışınlar
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.home_name set from storage glc:temp temp.params.home_name
data modify storage glc:temp temp.selector set from storage glc:temp temp.exec_action.player
function custom_admin:handler/execute/types/home_run with storage glc:temp temp
