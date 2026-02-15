# ═══════════════════════════════════════════════════
# API: Add Command Action (MACRO)
# Usage: /function custom_admin:api/action/add_command {id:"action_id",player:"x",command:"say Hello"}
# Example: /function custom_admin:api/action/add_command {id:"greet",player:"@a",command:"say Welcome!"}
# ═══════════════════════════════════════════════════

$function custom_admin:api/add/action_command {id:"$(id)",player:"$(player)",command:"$(command)"}
