# ═══════════════════════════════════════════════════
# Feedback: Error Message
# Purpose: Standardize error feedback across system
# Parameters: {message}
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"❌ ",color:"red"},{text:"$(message)",color:"white"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"❌ ",color:"red"},{text:"$(message)",color:"white"}]
