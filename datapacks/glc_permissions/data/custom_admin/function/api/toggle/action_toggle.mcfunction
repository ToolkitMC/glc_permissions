$execute unless data storage glc:data actions[{id:"$(id)"}] run return 0

# enabled=1b ise disable, enabled=0b veya yoksa enable
$execute if data storage glc:data actions[{id:"$(id)",enabled:1b}] run return run function custom_admin:api/toggle/action_disable {id:"$(id)"}
$execute if data storage glc:data actions[{id:"$(id)",enabled:0b}] run return run function custom_admin:api/toggle/action_enable {id:"$(id)"}
