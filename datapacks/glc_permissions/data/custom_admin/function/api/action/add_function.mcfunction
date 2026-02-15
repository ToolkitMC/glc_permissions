# ═══════════════════════════════════════════════════
# API: Add Function Call Action (MACRO)
# Usage: /function custom_admin:api/action/add_function {id:"action_id",player:"x",function:"namespace:path/to/function"}
# Example: /function custom_admin:api/action/add_function {id:"custom_fn",player:"@a",function:"minecraft:test"}
# ═══════════════════════════════════════════════════

$function custom_admin:api/add/action_function {id:"$(id)",player:"$(player)",function:"$(function)"}
