# ═══════════════════════════════════════════════════
# Feedback: Info Message
# Purpose: Standardize info feedback across system
# Parameters: {message}
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"ℹ️ ",color:"aqua"},{text:"$(message)",color:"gray"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"ℹ️ ",color:"aqua"},{text:"$(message)",color:"gray"}]
playsound custom_admin:ui.info master @s ~ ~ ~ 1 1
