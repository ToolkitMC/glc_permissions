# ═══════════════════════════════════════════════════
# Permission Level Sync
# Purpose: Sync permission levels with tags
# Called: Every 40 ticks or on role change
# ═══════════════════════════════════════════════════

# OWNER = Level 4
execute as @a[tag=gulce_owner] run scoreboard players set @s gulce_permission_level 4

# ADMIN = Level 3 (gulce_admin tag'i var ama owner değil)
execute as @a[tag=gulce_admin,tag=!gulce_owner] run scoreboard players set @s gulce_permission_level 3

# MOD = Level 3 (gulce_mod - admin tag'ı yok)
execute as @a[tag=gulce_mod,tag=!gulce_admin,tag=!gulce_owner] run scoreboard players set @s gulce_permission_level 3

# VIP = Level 2
execute as @a[tag=gulce_vip,tag=!gulce_mod,tag=!gulce_admin,tag=!gulce_owner] run scoreboard players set @s gulce_permission_level 2

# PLAYER = Level 1
execute as @a[tag=gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_admin,tag=!gulce_owner] run scoreboard players set @s gulce_permission_level 1

# No tag = Level 0
execute as @a[tag=!gulce_player,tag=!gulce_vip,tag=!gulce_mod,tag=!gulce_admin,tag=!gulce_owner] run scoreboard players set @s gulce_permission_level 0

# Chat prefix team sync
execute as @a run function custom_admin:features/chat/sync_team
