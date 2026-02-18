# ═══════════════════════════════════════════════════
# Validation: ID (Generic - No Duplicate Check)
# Purpose: Validate ID parameter (length only)
# Parameters: {id}
# Returns: #valid gulce_id (1=valid, 0=invalid)
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

# Initialize
scoreboard players set #valid gulce_id 1

# Store ID for validation
$data modify storage glc:temp validate_id set value "$(id)"

# Check if empty
execute store result score #id_len gulce_id run data get storage glc:temp validate_id
execute if score #id_len gulce_id matches ..0 run scoreboard players set #valid gulce_id 0
execute if score #id_len gulce_id matches ..0 run function custom_admin:util/feedback/error {message:"ID boş olamaz"}
execute if score #id_len gulce_id matches ..0 run return fail

# Check length (max 50 characters)
execute if score #id_len gulce_id matches 51.. run scoreboard players set #valid gulce_id 0
execute if score #id_len gulce_id matches 51.. run function custom_admin:util/feedback/error {message:"ID çok uzun (max 50 karakter)"}
execute if score #id_len gulce_id matches 51.. run return fail

# Success
execute as @a[tag=gulce_debug,limit=1] run function custom_admin:util/debug/log {message:"ID validation (generic) passed"}
return 1
