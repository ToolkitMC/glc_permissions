# ═══════════════════════════════════════════════════
# Menu Notify (FIXED v1.1 - No click_event)
# Purpose: Menu opened notification
# Parameters: macro from storage
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

# Debug log
$execute as @a[tag=gulce_debug,limit=1] run function custom_admin:util/debug/log {message:"Menu opened by $(NAME)"}