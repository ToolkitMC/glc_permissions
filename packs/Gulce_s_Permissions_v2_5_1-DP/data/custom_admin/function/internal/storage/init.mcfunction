# ═══════════════════════════════════════════════════
# Storage: Initialize
# Purpose: Ensure all required storage keys exist
# Called: Every load (safe - uses unless data guards)
# ═══════════════════════════════════════════════════

# Initialize empty arrays if not exists
execute unless data storage glc:data permissions run data modify storage glc:data permissions set value []
execute unless data storage glc:data groups run data modify storage glc:data groups set value []
execute unless data storage glc:data actions run data modify storage glc:data actions set value []
execute unless data storage glc:data scheduled run data modify storage glc:data scheduled set value []

# Initialize role system if not exists
execute unless data storage glc:data roles run data modify storage glc:data roles set value {owner:[],mod:[],vip:[],player:[]}

# Her zaman version güncelle
data modify storage glc:data version set value "3.0.2"

# Notify admin
execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold"},{text:"✅ Storage hazır: glc:data",color:"green"}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold"},{text:"✅ Storage ready: glc:data",color:"green"}]
