# ═══════════════════════════════════════════════════
# Validation: Permission Name
# Purpose: Validate permission parameter
# Parameters: {permission}
# Returns: #valid gulce_id (1=valid, 0=invalid)
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

# Initialize
scoreboard players set #valid gulce_id 1

# Store permission for validation
$data modify storage glc:temp validate_permission set value "$(permission)"

# Check if empty
execute store result score #perm_len gulce_id run data get storage glc:temp validate_permission
execute if score #perm_len gulce_id matches ..0 run scoreboard players set #valid gulce_id 0
execute if score #perm_len gulce_id matches ..0 run function custom_admin:util/feedback/error {message:"İzin adı boş olamaz"}
execute if score #perm_len gulce_id matches ..0 run return fail

# Check length (max 100 characters)
execute if score #perm_len gulce_id matches 101.. run scoreboard players set #valid gulce_id 0
execute if score #perm_len gulce_id matches 101.. run function custom_admin:util/feedback/error {message:"İzin adı çok uzun (max 100 karakter)"}
execute if score #perm_len gulce_id matches 101.. run return fail

# Success
execute as @a[tag=gulce_debug,limit=1] run function custom_admin:util/debug/log {message:"Permission validation passed"}
return 1
