# ═══════════════════════════════════════════════════
# TPA: Accept (v2.5.7)
# @s = kabul eden (hedef), from = ışınlanacak
# ═══════════════════════════════════════════════════

# Gönderenin adını oku + ışınla
function custom_admin:api/tpa/do_tp with storage glc:tpa pending

# Bildirimler
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[TPA] ",color:"green",bold:true},{text:"✅ İstek kabul edildi, karşı taraf ışınlandı.",color:"green"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[TPA] ",color:"green",bold:true},{text:"✅ Request accepted, player teleported.",color:"green"}]
execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[TPA] ",color:"green",bold:true},{text:"✅ Anfrage angenommen, Spieler teleportiert.",color:"green"}]

# Storage temizle
data remove storage glc:tpa pending
