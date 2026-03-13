# ═══════════════════════════════════════════════════
# Vanish: Toggle (v2.5.7)
# Usage: /function custom_admin:features/vanish/toggle
# Permission: MOD+
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

execute if entity @s[tag=glc.vanish] run function custom_admin:features/vanish/off
execute unless entity @s[tag=glc.vanish] run function custom_admin:features/vanish/on
