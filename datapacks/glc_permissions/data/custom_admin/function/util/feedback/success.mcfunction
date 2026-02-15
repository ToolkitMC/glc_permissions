# ═══════════════════════════════════════════════════
# Feedback: Success Message
# Purpose: Standardize success feedback across system
# Parameters: {message}
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

$tellraw @s ["",{"text":"✅ ","color":"green"},{"text":"$(message)","color":"white"}]
