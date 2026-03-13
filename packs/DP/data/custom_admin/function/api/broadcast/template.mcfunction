# ═══════════════════════════════════════════════════
# Broadcast: Send Template (v2.5.7)
# Usage: /function custom_admin:api/broadcast/template {template:"rules|event|restart|welcome|custom",message:"..."}
# Permission: MOD+
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

execute if score @s glc.rate_bc matches 5.. run function custom_admin:util/rate_limit/deny
execute if score @s glc.rate_bc matches 5.. run return 0

$function custom_admin:api/broadcast/template_run {template:"$(template)",message:"$(message)"}

scoreboard players add @s glc.rate_bc 1
