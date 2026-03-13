# ═══════════════════════════════════════════════════
# Permission Check System
# Usage: Yetki kontrolü için kullanılır
# Returns: success if player has permission, fail if not
# ═══════════════════════════════════════════════════

# OWNER seviyesi kontrolü (Level 4)
execute if entity @s[tag=gulce_owner] run return 1

# ADMIN seviyesi kontrolü (Level 3.5 - owner-assigned admin)
execute if entity @s[tag=gulce_admin,tag=!gulce_owner] run return 1

# MOD seviyesi kontrolü (Level 3)
execute if entity @s[tag=gulce_mod] run return 1

# VIP seviyesi kontrolü (Level 2)
execute if entity @s[tag=gulce_vip] run return 1

# PLAYER seviyesi kontrolü (Level 1)
execute if entity @s[tag=gulce_player] run return 1

# Yetki yok
return 0
