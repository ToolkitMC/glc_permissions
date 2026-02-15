# ═══════════════════════════════════════════════════
# API: Add Message Action (MACRO)
# Usage: /function custom_admin:api/action/add_message {id:"action_id",player:"x",text:"Hello"}
# Example: /function custom_admin:api/action/add_message {id:"welcome",player:"@a",text:"Welcome to the server!"}
# ═══════════════════════════════════════════════════

$function custom_admin:api/add/action_message {id:"$(id)",player:"$(player)",text:"$(text)"}
