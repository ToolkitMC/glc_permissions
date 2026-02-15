# ═══════════════════════════════════════════════════
# Liste Gösterme Döngüsü
# ═══════════════════════════════════════════════════

# İlk elemanı al
data modify storage glc:temp temp.list_item set from storage glc:temp temp.list_scheduled[0]

# Göster
function custom_admin:handler/schedule/display_item with storage glc:temp temp.list_item

# Listeden çıkar
data remove storage glc:temp temp.list_scheduled[0]

# Devam et
execute if data storage glc:temp temp.list_scheduled[0] run function custom_admin:handler/schedule/list_loop