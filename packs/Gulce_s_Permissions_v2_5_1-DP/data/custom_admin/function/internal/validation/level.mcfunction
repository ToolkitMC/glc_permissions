# ═══════════════════════════════════════════════════
# Validation: Permission Level
# Purpose: Validate level parameter (must be 1-10)
# Parameters: {level}
# Returns: #valid gulce_id (1=valid, 0=invalid)
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

# Initialize
scoreboard players set #valid gulce_id 1

# Set level to scoreboard for numeric validation
$scoreboard players set #validate_level gulce_id $(level)

# Check if level is in valid range (1-10)
execute if score #validate_level gulce_id matches ..0 run scoreboard players set #valid gulce_id 0
execute if score #validate_level gulce_id matches ..0 run function custom_admin:util/feedback/error {message:"Seviye 1-10 arasında olmalı"}
execute if score #validate_level gulce_id matches ..0 run return fail

execute if score #validate_level gulce_id matches 11.. run scoreboard players set #valid gulce_id 0
execute if score #validate_level gulce_id matches 11.. run function custom_admin:util/feedback/error {message:"Seviye 1-10 arasında olmalı"}
execute if score #validate_level gulce_id matches 11.. run return fail

# Success
execute as @a[tag=gulce_debug,limit=1] run function custom_admin:util/debug/log {message:"Level validation passed"}
return 1
