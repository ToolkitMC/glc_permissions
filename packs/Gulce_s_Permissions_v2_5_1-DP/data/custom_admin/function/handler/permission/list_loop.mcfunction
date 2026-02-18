# ═══════════════════════════════════════════════════
# Permission List Loop
# ═══════════════════════════════════════════════════

# İlk elemanı al
data modify storage glc:temp perm_list.current set from storage glc:temp perm_list.items[0]

# Göster
function custom_admin:handler/permission/list_display with storage glc:temp perm_list.current

# Listeden çıkar
data remove storage glc:temp perm_list.items[0]

# Devam et
execute if data storage glc:temp perm_list.items[0] run function custom_admin:handler/permission/list_loop
