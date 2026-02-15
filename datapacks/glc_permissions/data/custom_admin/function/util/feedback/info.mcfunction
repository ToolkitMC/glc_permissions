# ═══════════════════════════════════════════════════
# Feedback: Info Message
# Purpose: Standardize info feedback across system
# Parameters: {message}
# Permission Level: 2 (no OP required)
# ═══════════════════════════════════════════════════

$tellraw @s ["",{"text":"ℹ️ ","color":"aqua"},{"text":"$(message)","color":"gray"}]
