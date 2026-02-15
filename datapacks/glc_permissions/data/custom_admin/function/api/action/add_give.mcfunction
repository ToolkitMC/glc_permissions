# ═══════════════════════════════════════════════════
# API: Add Give Item Action (MACRO)
# Usage: /function custom_admin:api/action/add_give {id:"action_id",player:"x",item:"diamond",count:1}
# Example: /function custom_admin:api/action/add_give {id:"give_diamond",player:"@a",item:"diamond",count:5}
# ═══════════════════════════════════════════════════

$function custom_admin:api/add/action_give {id:"$(id)",player:"$(player)",item:"$(item)",count:$(count)}
