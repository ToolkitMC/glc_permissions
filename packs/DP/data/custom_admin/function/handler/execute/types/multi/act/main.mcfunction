# ═══════════════════════════════════════════════════
# Multi — Çoklu eylem zincirleme (Chain / Multi Command)
# ═══════════════════════════════════════════════════
# Yapı: 
# {
#   id:"...",
#   type:"multi_act",
#   player:"@s",
#   steps:[{type:"message", params:{text:"..."}}, ...]
# }

# 1. Kuyruğu ve player bilgisini storage'a al
data modify storage glc:temp multi.queue set from storage glc:temp temp.params.steps
data modify storage glc:temp multi.player set from storage glc:temp temp.exec_action.player

# 2. Kuyrukta en az 1 adım varsa zinciri başlat
execute if data storage glc:temp multi.queue[0] run function custom_admin:handler/execute/types/multi/act/loop

# 3. Temizlik (multi storage'ını sil)
data remove storage glc:temp multi