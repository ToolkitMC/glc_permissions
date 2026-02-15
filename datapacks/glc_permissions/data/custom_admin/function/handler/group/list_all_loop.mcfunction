# ═══════════════════════════════════════════════════
# Grup Listesi Loop
# ═══════════════════════════════════════════════════

# İlk grubu al
data modify storage glc:temp temp.list_item set from storage glc:temp temp.list_groups[0]

# Göster
function custom_admin:handler/group/display_group with storage glc:temp temp.list_item

# Listeden çıkar
data remove storage glc:temp temp.list_groups[0]

# Devam et
execute if data storage glc:temp temp.list_groups[0] run function custom_admin:handler/group/list_all_loop