# ═══════════════════════════════════════════════════
# API: Add Teleport Action (MACRO)
# Usage: /function custom_admin:api/action/add_teleport {id:"action_id",player:"x",x:0,y:100,z:0}
# Example: /function custom_admin:api/action/add_teleport {id:"spawn_tp",player:"@a",x:0,y:100,z:0}
# ═══════════════════════════════════════════════════

$function custom_admin:api/add/action_teleport {id:"$(id)",player:"$(player)",x:$(x),y:$(y),z:$(z)}
