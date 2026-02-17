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

execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold"},{text:"✅ Admin loop aktifleştirildi",color:"green"}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold"},{text:"✅ Admin loop aktifleştirildi",color:"green"}]

# Initialize storage if needed
function custom_admin:internal/storage/init

# Initialize config if needed
execute unless data storage glc:config settings run function custom_admin:internal/storage/init_config

# Initialize language system (v2.0.0)
execute unless data storage glc:config language run function custom_admin:internal/storage/init_lang

# Initialize cooldown/timer system (v2.0.0)
execute unless data storage glc:config cooldowns run function custom_admin:internal/storage/init_cooldowns

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
execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"  ⚡ GULCE Admin Power v",color:"yellow",bold:true},{nbt:'version',"storage":"glc:data",color:"yellow",bold:true}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"  ⚡ GULCE Admin Power v",color:"yellow",bold:true},{nbt:'version',"storage":"glc:data",color:"yellow",bold:true}]
execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"  📊 Loaded:",color:"aqua"}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"  📊 Loaded:",color:"aqua"}]
execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"    🔐 Permissions: ",color:"gray"},{score:{name:'#perm_count',objective:'gulce_id'},color:"green"}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"    🔐 Permissions: ",color:"gray"},{score:{name:'#perm_count',objective:'gulce_id'},color:"green"}]
execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"    👥 Groups: ",color:"gray"},{score:{name:'#group_count',objective:'gulce_id'},color:"yellow"}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"    👥 Groups: ",color:"gray"},{score:{name:'#group_count',objective:'gulce_id'},color:"yellow"}]
execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"    ⚡ Actions: ",color:"gray"},{score:{name:'#action_count',objective:'gulce_id'},color:"aqua"}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"    ⚡ Actions: ",color:"gray"},{score:{name:'#action_count',objective:'gulce_id'},color:"aqua"}]
execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"  ✅ System Ready",color:"green",bold:true}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"  ✅ System Ready",color:"green",bold:true}]
execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"═══════════════════════════════════",color:"gold",bold:true}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"═══════════════════════════════════",color:"gold",bold:true}]
