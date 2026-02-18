# ═══════════════════════════════════════════════════
# Dialog Action - Dialog gösterir
# params: {dialog:"namespace:dialog_id"}
# execute as $(selector) at @s run dialog show @s $(dialog)
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.dialog set from storage glc:temp temp.params.dialog
data modify storage glc:temp temp.selector set from storage glc:temp temp.exec_action.player

function custom_admin:handler/execute/types/dialog_run with storage glc:temp temp
