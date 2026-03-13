# ═══════════════════════════════════════════════════
# Feedback: Success Message
# Purpose: Standardize success feedback across system
# Parameters: {message}
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"✅ ",color:"green"},{text:"$(message)",color:"white"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"✅ ",color:"green"},{text:"$(message)",color:"white"}]
playsound custom_admin:ui.success master @s ~ ~ ~ 1 1
