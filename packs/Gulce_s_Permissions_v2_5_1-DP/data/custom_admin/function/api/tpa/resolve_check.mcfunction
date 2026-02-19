# ═══════════════════════════════════════════════════
# TPA: Resolve Check (macro)
# Macro: {self:"HedefAdı"}
# NOT: Skor kopyası resolve.mcfunction'dan gelir (#glc.tpa_val)
# ═══════════════════════════════════════════════════

# requests.{self}.from var mı?
$execute unless data storage glc:tpa requests.$(self).from if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[TPA] ",color:"red"},{text:"Bekleyen ışınlanma isteği yok.",color:"gray"}]
$execute unless data storage glc:tpa requests.$(self).from if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[TPA] ",color:"red"},{text:"No pending teleport request.",color:"gray"}]
$execute unless data storage glc:tpa requests.$(self).from if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[TPA] ",color:"red"},{text:"Keine ausstehende Teleportanfrage.",color:"gray"}]
$execute unless data storage glc:tpa requests.$(self).from run return 0

# pending'e kopyala
$data modify storage glc:tpa pending.from set from storage glc:tpa requests.$(self).from
$data modify storage glc:tpa pending.to set value "$(self)"

# Skor kopyasından karar ver
execute if score #glc.tpa_val glc.timer matches 1 run function custom_admin:api/tpa/accept
execute if score #glc.tpa_val glc.timer matches 2 run function custom_admin:api/tpa/deny

# Temizle
$data remove storage glc:tpa requests.$(self)
