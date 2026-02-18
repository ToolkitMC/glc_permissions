# ═══════════════════════════════════════════════════
# Schedule Add (WRAPPER for API v2.5.4)
# Purpose: Wrapper that calls handler schedule add
# Parameters: {action_id, delay, player}
# Permission Level: 2 (no OP required)
# Note: This file kept for backward compatibility
# ═══════════════════════════════════════════════════

# Call handler wrapper
$function custom_admin:handler/schedule/add {action_id:"$(action_id)",delay:$(delay),player:"$(player)"}
