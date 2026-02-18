# İlk permission'ı al
data modify storage glc:temp perm_parse.current set from storage glc:temp perm_parse.list[0]

# O oyuncuya tag uygula
function custom_admin:handler/parser/permissions_apply with storage glc:temp perm_parse.current

# Listeden çıkar
data remove storage glc:temp perm_parse.list[0]

# Kalan varsa devam et
execute if data storage glc:temp perm_parse.list[0] run function custom_admin:handler/parser/permissions_loop
