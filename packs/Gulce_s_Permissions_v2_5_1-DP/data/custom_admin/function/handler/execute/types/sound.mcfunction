# ═══════════════════════════════════════════════════
# Sound Action
# ═══════════════════════════════════════════════════

data modify storage glc:temp temp.sound set from storage glc:temp temp.params.sound
data modify storage glc:temp temp.volume set from storage glc:temp temp.params.volume
data modify storage glc:temp temp.pitch set from storage glc:temp temp.params.pitch
data modify storage glc:temp temp.selector set from storage glc:temp temp.exec_action.player

function custom_admin:handler/execute/types/sound_run with storage glc:temp temp