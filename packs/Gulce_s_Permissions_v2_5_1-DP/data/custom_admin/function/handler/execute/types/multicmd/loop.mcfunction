# Get first command from array and store as string
data modify storage glc:temp temp.current_cmd set from storage glc:temp temp.multi_commands[0]

# Remove executed command from array
data remove storage glc:temp temp.multi_commands[0]

# Execute the command via macro with both player and command
function custom_admin:handler/execute/types/multicmd/execute_macro with storage glc:temp temp

# Continue loop if more commands exist
execute if data storage glc:temp temp.multi_commands[0] run function custom_admin:handler/execute/types/multicmd/loop
