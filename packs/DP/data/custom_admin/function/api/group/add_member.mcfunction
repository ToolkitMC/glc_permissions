# ═══════════════════════════════════════════════════
# API: Add Member to Group (MACRO)
# Usage: /function custom_admin:api/group/add_member {group_id:'group_id',player:'x'}
# Example: /function custom_admin:api/group/add_member {group_id:'moderators',player:'x'}
# ═══════════════════════════════════════════════════

$function custom_admin:handler/group/add_member {group_id:"$(group_id)",player:"$(player)"}
