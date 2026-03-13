# ═══════════════════════════════════════════════════
# Time Action - Zamanı değiştirir
# params: {mode:"set|add", value:"day|night|noon|midnight|0..24000"}
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.mode set from storage glc:temp temp.params.mode
data modify storage glc:temp temp.value set from storage glc:temp temp.params.value
execute unless data storage glc:temp temp.mode run data modify storage glc:temp temp.mode set value "set"

data modify storage glc:temp temp.selector set from storage glc:temp temp.exec_action.player
execute unless data storage glc:temp temp.selector run data modify storage glc:temp temp.selector set value "@s"
function custom_admin:handler/execute/types/time_run with storage glc:temp temp
