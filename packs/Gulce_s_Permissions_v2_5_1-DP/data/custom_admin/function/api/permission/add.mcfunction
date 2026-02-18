# ═══════════════════════════════════════════════════
# API: Add Permission (REFACTORED v1.1)
# Purpose: Yeni izin ekler (validation + error handling)
# Parameters: {id, player, permission, level}
# Returns: Success 1, Fail 0
# Storage: glc:data permissions[]
# Permission Level: 2 (no OP required)
# Version: 1.1.0
# ═══════════════════════════════════════════════════

# Admin check
execute unless entity @s[tag=gulce_admin] run function custom_admin:util/feedback/error {message:"Yetkiniz yok! gulce_admin tag'i gerekli"}
execute unless entity @s[tag=gulce_admin] run return fail

# Debug: Operation started
execute as @s[tag=gulce_debug] run function custom_admin:util/debug/log {message:"Add permission operation started"}

# Validation: ID
$function custom_admin:internal/validation/id {id:"$(id)"}
execute if score #valid gulce_id matches 0 run return fail

# Validation: Player
$function custom_admin:internal/validation/player {player:"$(player)"}
execute if score #valid gulce_id matches 0 run return fail

# Validation: Permission name
$function custom_admin:internal/validation/permission {permission:"$(permission)"}
execute if score #valid gulce_id matches 0 run return fail

# Validation: Level
$function custom_admin:internal/validation/level {level:$(level)}
execute if score #valid gulce_id matches 0 run return fail

# All validations passed - Add to storage
scoreboard players add #perm_count gulce_id 1
$data modify storage glc:data permissions append value {id:"$(id)",player:"$(player)",permission:"$(permission)",level:$(level),created_by:"@s",timestamp:0}

# Success feedback
$function custom_admin:util/feedback/success {message:"İzin eklendi: $(id)"}

# Debug log
$execute as @s[tag=gulce_debug] run function custom_admin:util/debug/log {message:"Permission added - ID: $(id), Player: $(player), Level: $(level)"}

# Admin notification (without tellraw directly)
execute store result score #temp gulce_id run scoreboard players get #perm_count gulce_id
$tellraw @a[tag=gulce_admin] ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"🔐 Yeni izin: ",color:"gray"},{text:"$(permission)",color:"yellow"},{text:" → ",color:"dark_gray"},{text:"$(player)",color:"aqua"},{text:" (Toplam: ",color:"gray"},{score:{name:'#temp',objective:'gulce_id'},color:"green"},{text:")",color:"gray"}]

# Cleanup temp data
function custom_admin:util/cleanup

# Return success
return 1
