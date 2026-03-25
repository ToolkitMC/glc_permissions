# Get first function from array and store as string
data modify storage glc:temp temp.current_fn set from storage glc:temp temp.multi_funcs[0]

# Remove executed function from array
data remove storage glc:temp temp.multi_funcs[0]

# Execute the function via macro with both player and function
function custom_admin:handler/execute/types/multi/func/execute_macro with storage glc:temp temp

# Continue loop if more commands exist
execute if data storage glc:temp temp.multi_funcs[0] run function custom_admin:handler/execute/types/multi/func/loop
