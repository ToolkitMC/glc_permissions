# Role: Assign OWNER - Do (storage'dan argüman alır)
execute if data storage glc:confirm pending.args.player run function custom_admin:role/assign_owner_exec with storage glc:confirm pending.args
data remove storage glc:confirm pending.args
