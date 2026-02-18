# ═══════════════════════════════════════════════════
# Cleanup: Temp Data
# Purpose: Clean temporary storage and scoreboards
# Called: After every major operation
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

# Storage cleanup
data remove storage glc:temp validate_id
data remove storage glc:temp validate_player
data remove storage glc:temp validate_level
data remove storage glc:temp validate_permission
data remove storage glc:temp temp
data remove storage glc:temp result

# Scoreboard cleanup
scoreboard players reset #valid gulce_id
scoreboard players reset #id_len gulce_id
scoreboard players reset #player_len gulce_id
scoreboard players reset #perm_len gulce_id
scoreboard players reset #validate_level gulce_id
scoreboard players reset #temp gulce_id
scoreboard players reset #result gulce_id

# Debug log
execute as @a[tag=gulce_debug,limit=1] run function custom_admin:util/debug/log {message:"Cleanup completed"}
