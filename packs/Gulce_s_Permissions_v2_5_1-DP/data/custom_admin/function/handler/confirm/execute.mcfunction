# ═══════════════════════════════════════════════════
# Confirm: Execute Pending Action (v2.5.7)
# ═══════════════════════════════════════════════════

execute if data storage glc:confirm pending.action run function custom_admin:handler/confirm/run with storage glc:confirm pending
data remove storage glc:confirm pending
