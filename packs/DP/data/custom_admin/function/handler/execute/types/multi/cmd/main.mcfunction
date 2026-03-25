# Multi-Command Execution Handler
# Executes multiple commands from a list

# Copy commands array to temp storage
data modify storage glc:temp temp.multi_commands set from storage glc:temp temp.params.commands

# Copy player selector
data modify storage glc:temp temp.player set from storage glc:temp temp.exec_action.player

# Start recursive loop
execute if data storage glc:temp temp.multi_commands[0] run function custom_admin:handler/execute/types/multi/cmd/loop
