# ═══════════════════════════════════════════════════
# Schedule: Tick (OPTIMIZED v2.5.4 with flag system)
# Purpose: Process scheduled actions
# Called: Only when #has_scheduled flag is set
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

# Process all scheduled actions
execute if data storage glc:data scheduled[0] run function custom_admin:handler/schedule/process_all

# If no more scheduled actions, reset flag
execute unless data storage glc:data scheduled[0] run scoreboard players set #has_scheduled gulce_id 0

# Cleanup
data remove storage glc:temp scheduled_processed