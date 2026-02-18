# ═══════════════════════════════════════════════════
# Validation: Player Name
# Purpose: Validate player parameter
# Parameters: {player}
# Returns: #valid gulce_id (1=valid, 0=invalid)
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

# Initialize
scoreboard players set #valid gulce_id 1

# Store player for validation
$data modify storage glc:temp validate_player set value "$(player)"

# Check if empty
execute store result score #player_len gulce_id run data get storage glc:temp validate_player
execute if score #player_len gulce_id matches ..0 run scoreboard players set #valid gulce_id 0
execute if score #player_len gulce_id matches ..0 run function custom_admin:util/feedback/error {message:"Oyuncu adı boş olamaz"}
execute if score #player_len gulce_id matches ..0 run return fail

# Check length (Minecraft max 16 characters)
execute if score #player_len gulce_id matches 17.. run scoreboard players set #valid gulce_id 0
execute if score #player_len gulce_id matches 17.. run function custom_admin:util/feedback/error {message:"Oyuncu adı çok uzun (max 16 karakter)"}
execute if score #player_len gulce_id matches 17.. run return fail

# Success
execute as @a[tag=gulce_debug,limit=1] run function custom_admin:util/debug/log {message:"Player validation passed"}
return 1
