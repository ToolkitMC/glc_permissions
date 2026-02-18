# ═══════════════════════════════════════════════════
# Debug: Log Message
# Purpose: Debug logging (only shows to gulce_debug tag)
# Parameters: {message}
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

$execute if entity @s[tag=gulce_debug,tag=glc.lang_tr] run tellraw @s [{text:"[GLC-DEBUG] ",color:"dark_gray"},{text:"$(message)",color:"gray"}]
$execute if entity @s[tag=gulce_debug,tag=glc.lang_en] run tellraw @s [{text:"[GLC-DEBUG] ",color:"dark_gray"},{text:"$(message)",color:"gray"}]
