# ═══════════════════════════════════════════════════
# Feedback: Error Message
# Purpose: Standardize error feedback across system
# Parameters: {message}
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

$tellraw @s ["",{"text":"❌ ","color":"red"},{"text":"$(message)","color":"white"}]
