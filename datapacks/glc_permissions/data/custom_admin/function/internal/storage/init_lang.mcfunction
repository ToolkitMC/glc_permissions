# ═══════════════════════════════════════════════════
# Language System Initialization (v2.0.3)
# Purpose: Initialize language configuration
# ═══════════════════════════════════════════════════

# Default language: Turkish
data modify storage glc:config language set value {current:'tr',available:["tr","en"]}

# Initialize player language preferences (empty by default)
data modify storage glc:data player_langs set value []

execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold"},{text:"✅ Dil sistemi başlatıldı (TR/EN)",color:"green"}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold"},{text:"✅ Dil sistemi başlatıldı (TR/EN)",color:"green"}]
