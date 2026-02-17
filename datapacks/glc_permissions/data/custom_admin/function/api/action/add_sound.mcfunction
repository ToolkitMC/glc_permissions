# ═══════════════════════════════════════════════════
# API: Add Sound Action (MACRO)
# Usage: /function custom_admin:api/action/add_sound {id:'action_id',player:'x',sound:"entity.experience_orb.pickup"}
# Example: /function custom_admin:api/action/add_sound {id:'level_up',player:"@a",sound:"entity.player.levelup"}
# ═══════════════════════════════════════════════════

$function custom_admin:api/add/action_sound {id:"$(id)",player:"$(player)",sound:"$(sound)"}
