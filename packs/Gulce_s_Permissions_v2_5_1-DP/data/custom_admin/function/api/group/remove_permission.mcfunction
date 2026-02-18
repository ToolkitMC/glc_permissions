# ═══════════════════════════════════════════════════
# API: Remove Permission from Group (MACRO)
# Usage: /function custom_admin:api/group/remove_permission {group_id:'group_id',permission:"perm.name"}
# Example: /function custom_admin:api/group/remove_permission {group_id:'moderators',permission:"mod.kick"}
# ═══════════════════════════════════════════════════

$function custom_admin:handler/group/remove_permission {group_id:"$(group_id)",permission:"$(permission)"}
