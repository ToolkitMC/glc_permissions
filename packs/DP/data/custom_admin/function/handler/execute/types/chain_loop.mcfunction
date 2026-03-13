# İlk action ID'yi al
data modify storage glc:temp chain.current set from storage glc:temp chain.list[0]

# O action'ı çalıştır
function custom_admin:handler/execute/types/chain_execute with storage glc:temp chain

# Listeden çıkar
data remove storage glc:temp chain.list[0]

# Kalan varsa devam et
execute if data storage glc:temp chain.list[0] run function custom_admin:handler/execute/types/chain_loop
