# ═══════════════════════════════════════════════════
# Action Toggle (v2.5.7)
# Macro: {id:"eylem_id"}
# ═══════════════════════════════════════════════════

$execute unless data storage glc:data actions[{id:"$(id)"}] run return 0

# enabled=1b ise disable
$execute if data storage glc:data actions[{id:"$(id)",enabled:1b}] run function custom_admin:api/toggle/action_disable {id:"$(id)"}
# enabled=0b ise enable
$execute if data storage glc:data actions[{id:"$(id)",enabled:0b}] run function custom_admin:api/toggle/action_enable {id:"$(id)"}
