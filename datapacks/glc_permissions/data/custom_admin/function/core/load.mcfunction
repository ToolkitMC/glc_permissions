# ═══════════════════════════════════════════════════
# Core: Load System (v1.1.0)
# Purpose: Initialize scoreboards, storage, and config
# Called: On datapack load
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

# Scoreboards
scoreboard objectives add gulce_id dummy "GLC ID Counter"
scoreboard objectives add gulce_cooldown dummy "GLC Cooldown"
scoreboard objectives add glc.loop dummy "GLC Loop Counter"
scoreboard objectives add gulce_menu trigger "GLC Menu Trigger"
scoreboard objectives add glc_load_type dummy "GLC Load Type"

# Initialize storage if needed
execute unless data storage glc:data version run function custom_admin:internal/storage/init

# Initialize config if needed
execute unless data storage glc:config settings run function custom_admin:internal/storage/init_config

# Check version and migrate if needed
execute unless data storage glc:data {version:"1.1.0"} run tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold"},{"text":"⚠ Version mismatch - updating...","color":"yellow"}]
execute unless data storage glc:data {version:"1.1.0"} run data modify storage glc:data version set value "1.1.0"

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

# Success message
tellraw @a[tag=gulce_admin] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
tellraw @a[tag=gulce_admin] ["",{"text":"  ⚡ GULCE Admin Power v1.1.0","color":"yellow","bold":true}]
tellraw @a[tag=gulce_admin] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
tellraw @a[tag=gulce_admin] ["",{"text":"  📊 Loaded:","color":"aqua"}]
tellraw @a[tag=gulce_admin] ["",{"text":"    🔐 Permissions: ","color":"gray"},{"score":{"name":"#perm_count","objective":"gulce_id"},"color":"green"}]
tellraw @a[tag=gulce_admin] ["",{"text":"    👥 Groups: ","color":"gray"},{"score":{"name":"#group_count","objective":"gulce_id"},"color":"yellow"}]
tellraw @a[tag=gulce_admin] ["",{"text":"    ⚡ Actions: ","color":"gray"},{"score":{"name":"#action_count","objective":"gulce_id"},"color":"aqua"}]
tellraw @a[tag=gulce_admin] ["",{"text":"  ✅ System Ready","color":"green","bold":true}]
tellraw @a[tag=gulce_admin] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
