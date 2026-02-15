# ═══════════════════════════════════════════════════
# API: Delete Group (MACRO)
# Usage: /function custom_admin:api/group/delete {id:"group_id"}
# Example: /function custom_admin:api/group/delete {id:"moderators"}
# ═══════════════════════════════════════════════════

$function custom_admin:handler/group/delete {id:"$(id)"}
