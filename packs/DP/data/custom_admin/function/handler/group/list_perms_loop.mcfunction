# ═══════════════════════════════════════════════════
# İzin Listesi Loop
# ═══════════════════════════════════════════════════

# İlk izni al ve göster
data modify storage glc:temp temp.perm_item set from storage glc:temp temp.perm_list[0]
function custom_admin:handler/group/display_permission with storage glc:temp temp.perm_item

# Listeden çıkar
data remove storage glc:temp temp.perm_list[0]

# Devam et
execute if data storage glc:temp temp.perm_list[0] run function custom_admin:handler/group/list_perms_loop