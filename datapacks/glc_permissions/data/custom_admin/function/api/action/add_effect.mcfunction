# ═══════════════════════════════════════════════════
# API: Add Effect Action (MACRO)
# Usage: /function custom_admin:api/action/add_effect {id:"action_id",player:"x",effect:"speed",duration:200,amplifier:1}
# Example: /function custom_admin:api/action/add_effect {id:"speed_boost",player:"@a",effect:"speed",duration:200,amplifier:1}
# ═══════════════════════════════════════════════════

$function custom_admin:api/add/action_effect {id:"$(id)",player:"$(player)",effect:"$(effect)",duration:$(duration),amplifier:$(amplifier)}
