# ═══════════════════════════════════════════════════
# Core: Load System (v1.1.0)
# Purpose: Initialize scoreboards, storage, and config
# Called: On datapack load
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

# Scoreboards
scoreboard objectives add gulce_id dummy "GLC ID Counter"
scoreboard objectives add gulce_cooldown dummy "GLC Cooldown"
scoreboard objectives add glc.timer dummy "GLC Timer System"
scoreboard objectives add gulce_menu trigger "GLC Menu Trigger"
scoreboard objectives add glc_load_type dummy "GLC Load Type"
scoreboard objectives add gulce_permission_level dummy "Permission Level"

# DÜZELTME v1.2.0: Global objective oluştur
scoreboard objectives add global dummy "Global System Flags"

# DÜZELTME v1.2.0: Admin loop'u aktifleştir
scoreboard players set #admin_loop global 1
scoreboard players set #system_active global 1

tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold"},{"text":"✅ Admin loop aktifleştirildi","color":"green"}]

# Initialize storage if needed
execute unless data storage glc:data version run function custom_admin:internal/storage/init

# Initialize config if needed
execute unless data storage glc:config settings run function custom_admin:internal/storage/init_config

# Version is managed by init function - no hardcoded checks needed

# Initialize counters
execute unless score #perm_count gulce_id matches -2147483648.. run scoreboard players set #perm_count gulce_id 0
execute unless score #group_count gulce_id matches -2147483648.. run scoreboard players set #group_count gulce_id 0
execute unless score #action_count gulce_id matches -2147483648.. run scoreboard players set #action_count gulce_id 0
execute unless score #has_scheduled gulce_id matches -2147483648.. run scoreboard players set #has_scheduled gulce_id 0

# Count existing data
execute store result score #perm_count gulce_id if data storage glc:data permissions[]
execute store result score #group_count gulce_id if data storage glc:data groups[]
execute store result score #action_count gulce_id if data storage glc:data actions[]

# Set scheduled flag
execute if data storage glc:data scheduled[0] run scoreboard players set #has_scheduled gulce_id 1
execute unless data storage glc:data scheduled[0] run scoreboard players set #has_scheduled gulce_id 0

# v1.3.0: Initialize permission levels
function custom_admin:permissions/sync_levels

# Success message with DYNAMIC version
tellraw @a[tag=gulce_admin] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
tellraw @a[tag=gulce_admin] ["",{"text":"  ⚡ GULCE Admin Power v","color":"yellow","bold":true},{"nbt":"version","storage":"glc:data","color":"yellow","bold":true}]
tellraw @a[tag=gulce_admin] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
tellraw @a[tag=gulce_admin] ["",{"text":"  📊 Loaded:","color":"aqua"}]
tellraw @a[tag=gulce_admin] ["",{"text":"    🔐 Permissions: ","color":"gray"},{"score":{"name":"#perm_count","objective":"gulce_id"},"color":"green"}]
tellraw @a[tag=gulce_admin] ["",{"text":"    👥 Groups: ","color":"gray"},{"score":{"name":"#group_count","objective":"gulce_id"},"color":"yellow"}]
tellraw @a[tag=gulce_admin] ["",{"text":"    ⚡ Actions: ","color":"gray"},{"score":{"name":"#action_count","objective":"gulce_id"},"color":"aqua"}]
tellraw @a[tag=gulce_admin] ["",{"text":"  ✅ System Ready","color":"green","bold":true}]
tellraw @a[tag=gulce_admin] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
