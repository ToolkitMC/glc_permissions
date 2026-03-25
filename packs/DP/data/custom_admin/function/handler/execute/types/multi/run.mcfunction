# Command
execute if data storage glc:temp temp.exec_action{type:'multi_cmd'} run function custom_admin:handler/execute/types/multi/cmd/main

# Function
execute if data storage glc:temp temp.exec_action{type:'multi_fn'} run function custom_admin:handler/execute/types/multi/func/main

# Action
execute if data storage glc:temp temp.exec_action{type:'multi_act'} run function custom_admin:handler/execute/types/multi/act/main