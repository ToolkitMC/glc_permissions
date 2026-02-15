# ═══════════════════════════════════════════════════
# API: Get Group Info (MACRO)
# Usage: /function custom_admin:api/group/info {group_id:"group_id"}
# Example: /function custom_admin:api/group/info {group_id:"moderators"}
# Shows: Group members, permissions, and details
# ═══════════════════════════════════════════════════

$function custom_admin:handler/group/info {group_id:"$(group_id)"}
