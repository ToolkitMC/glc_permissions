# ═══════════════════════════════════════════════════
# API: Send Message (v2.5.7)
# Usage: /function custom_admin:api/send_message {selector:"OyuncuAdi",message:"mesaj",sound:"..."}
# Permission: MOD+
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

$function custom_admin:api/send_message_exec {selector:"$(selector)",message:"$(message)",sound:"$(sound)"}
