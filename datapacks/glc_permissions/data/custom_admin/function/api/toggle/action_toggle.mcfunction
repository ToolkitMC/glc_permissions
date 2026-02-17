$execute unless data storage glc:data actions[{id:"$(id)"}] run return 0

# enabled=true ise disable, enabled=false veya yoksa enable
$execute if data storage glc:data actions[{id:"$(id)",enabled:true}] run function custom_admin:api/toggle/action_disable {id:"$(id)"}
$execute if data storage glc:data actions[{id:"$(id)",enabled:false}] run function custom_admin:api/toggle/action_enable {id:"$(id)"}
