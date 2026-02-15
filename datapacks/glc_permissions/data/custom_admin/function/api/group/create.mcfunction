# ═══════════════════════════════════════════════════
# API: Create Group (MACRO)
# Usage: /function custom_admin:api/group/create {id:"group_id",name:"Group Name"}
# Example: /function custom_admin:api/group/create {id:"moderators",name:"Moderators"}
# ═══════════════════════════════════════════════════

$function custom_admin:handler/group/create {id:"$(id)",name:"$(name)"}
