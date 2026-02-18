# ═══════════════════════════════════════════════════
# Tag Loop Process - İşlemeyi yap
# ═══════════════════════════════════════════════════

scoreboard players add #group_tick_counter gulce_id 1

# İlk grubu al
data modify storage glc:temp temp.current_group set from storage glc:temp temp.groups_remaining[0]

# Tag uygula
function custom_admin:handler/group/apply_single_group with storage glc:temp temp.current_group

# Listeden çıkar
data remove storage glc:temp temp.groups_remaining[0]

# Devam et
execute if data storage glc:temp temp.groups_remaining[0] run function custom_admin:handler/group/apply_tags_loop
