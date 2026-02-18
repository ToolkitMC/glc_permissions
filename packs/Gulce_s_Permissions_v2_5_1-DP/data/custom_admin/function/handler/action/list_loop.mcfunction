# ═══════════════════════════════════════════════════
# Action List Loop
# ═══════════════════════════════════════════════════

data modify storage glc:temp action_list.current set from storage glc:temp action_list.items[0]
function custom_admin:handler/action/list_display with storage glc:temp action_list.current
data remove storage glc:temp action_list.items[0]
execute if data storage glc:temp action_list.items[0] run function custom_admin:handler/action/list_loop
