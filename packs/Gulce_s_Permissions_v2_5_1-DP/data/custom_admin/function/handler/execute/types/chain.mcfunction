# ═══════════════════════════════════════════════════
# Chain Action - Zincir eylemleri sırayla çalıştırır
# params: {chain:["id1","id2","id3"]}
# ═══════════════════════════════════════════════════

# Zinciri geçici listeye kopyala
data modify storage glc:temp chain.list set from storage glc:temp temp.params.chain
data modify storage glc:temp chain.selector set from storage glc:temp temp.exec_action.player

# Zinciri başlat
execute if data storage glc:temp chain.list[0] run function custom_admin:handler/execute/types/chain_loop
data remove storage glc:temp chain
