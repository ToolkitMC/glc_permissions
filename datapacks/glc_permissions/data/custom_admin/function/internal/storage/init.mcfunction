# ═══════════════════════════════════════════════════
# Storage: Initialize / Migrate
# Purpose: Initialize glc:data storage or migrate from glc:data
# Called: On first load or version update
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

# Check if glc:data already exists
execute unless data storage glc:data version run tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold"},{"text":"📦 Storage initialization...","color":"gray"}]

# Migrate from old glc:data namespace if exists
execute if data storage glc:data permissions[0] unless data storage glc:data permissions[0] run data modify storage glc:data permissions set from storage glc:data permissions
execute if data storage glc:data groups[0] unless data storage glc:data groups[0] run data modify storage glc:data groups set from storage glc:data groups
execute if data storage glc:data actions[0] unless data storage glc:data actions[0] run data modify storage glc:data actions set from storage glc:data actions
execute if data storage glc:data scheduled[0] unless data storage glc:data scheduled[0] run data modify storage glc:data scheduled set from storage glc:data scheduled

# Initialize empty arrays if not exists
execute unless data storage glc:data permissions run data modify storage glc:data permissions set value []
execute unless data storage glc:data groups run data modify storage glc:data groups set value []
execute unless data storage glc:data actions run data modify storage glc:data actions set value []
execute unless data storage glc:data scheduled run data modify storage glc:data scheduled set value []

# Set version
data modify storage glc:data version set value "1.1.0"

# Notify admin
execute if data storage glc:data data run tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold"},{"text":"✅ Migration completed: glc:data → glc:data","color":"green"}]
execute unless data storage glc:data data run tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold"},{"text":"✅ Storage initialized: glc:data","color":"green"}]
