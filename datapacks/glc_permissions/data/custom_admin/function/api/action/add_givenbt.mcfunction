# ═══════════════════════════════════════════════════
# API: Add Give Item with NBT Action (MACRO)
# Usage: /function custom_admin:api/action/add_givenbt {id:'action_id',player:'x',item:'diamond_sword',count:1,nbt:'{Enchantments:[{id:'sharpness',lvl:5}]}'}
# Example: /function custom_admin:api/action/add_givenbt {id:'magic_sword',player:"@a",item:'diamond_sword',count:1,nbt:'{Enchantments:[{id:'sharpness',lvl:5}]}'}
# ═══════════════════════════════════════════════════

$function custom_admin:api/add/action_givenbt {id:"$(id)",player:"$(player)",item:"$(item)",count:$(count),nbt:'$(nbt)'}
