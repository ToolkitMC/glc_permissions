# ═══════════════════════════════════════════════════
# Role Assign Admin - Do (storage'dan argüman alır)
# ═══════════════════════════════════════════════════

execute if data storage glc:confirm pending.args.player run function custom_admin:role/assign_admin_exec with storage glc:confirm pending.args
data remove storage glc:confirm pending.args
