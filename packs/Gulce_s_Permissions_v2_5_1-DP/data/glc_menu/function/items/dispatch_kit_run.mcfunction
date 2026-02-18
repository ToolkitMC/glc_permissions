# "self" → sadece çağırana ver
execute if data storage glc:temp {dk_target:"self"} run function glc_menu:items/give_kit

# "all" → tüm yetkililere ver
execute if data storage glc:temp {dk_target:"all"} as @a[scores={gulce_permission_level=3..}] run function glc_menu:items/give_kit

# "player" → belirli oyuncuya
execute if data storage glc:temp {dk_target:"player"} run function glc_menu:items/dispatch_kit_player with storage glc:temp

data remove storage glc:temp dk_target
data remove storage glc:temp dk_player
