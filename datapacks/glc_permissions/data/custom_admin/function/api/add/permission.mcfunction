# ═══════════════════════════════════════════════════
# Add Permission (WRAPPER for API v1.1)
# Purpose: Wrapper that calls new validated API
# Parameters: {id, player, permission, level}
# Permission Level: 2 (no OP required)
# Note: This file kept for backward compatibility
# ═══════════════════════════════════════════════════

# Call new API with validation
$function custom_admin:api/permission/add {id:"$(id)",player:"$(player)",permission:"$(permission)",level:$(level)}