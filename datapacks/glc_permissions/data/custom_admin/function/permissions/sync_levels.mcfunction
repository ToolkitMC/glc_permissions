# ═══════════════════════════════════════════════════
# Permission Level Sync
# Purpose: Sync permission levels with tags
# Called: Every tick or on role change
# ═══════════════════════════════════════════════════

# Score objective oluştur
scoreboard objectives add gulce_permission_level dummy "Permission Level"

# OWNER = Level 4
execute as @a[tag=gulce_owner] run scoreboard players set @s gulce_permission_level 4

# MOD = Level 3
execute as @a[tag=gulce_mod,tag=!gulce_owner] run scoreboard players set @s gulce_permission_level 3

# VIP = Level 2
execute as @a[tag=gulce_vip,tag=!gulce_mod,tag=!gulce_owner] run scoreboard players set @s gulce_permission_level 2

# PLAYER = Level 1
execute as @a[tag=gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_owner] run scoreboard players set @s gulce_permission_level 1

# No tag = Level 0
execute as @a[tag=!gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_owner] run scoreboard players set @s gulce_permission_level 0
