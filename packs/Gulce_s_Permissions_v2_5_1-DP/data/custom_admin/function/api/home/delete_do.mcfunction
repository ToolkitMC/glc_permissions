# ═══════════════════════════════════════════════════
# Home: Delete Do (macro)
# Macro: {player:"...", name:"..."}
# ═══════════════════════════════════════════════════

$execute unless data storage glc:homes $(player).$(name) if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[HOME] ",color:"red"},{text:"⚠ Ev bulunamadı: ",color:"gray"},{text:"$(name)",color:"yellow"}]
$execute unless data storage glc:homes $(player).$(name) run return 0

$data remove storage glc:homes $(player).$(name)

$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[HOME] ",color:"yellow"},{text:"🗑 Ev silindi: ",color:"gray"},{text:"$(name)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[HOME] ",color:"yellow"},{text:"🗑 Home deleted: ",color:"gray"},{text:"$(name)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[HOME] ",color:"yellow"},{text:"🗑 Heimort gelöscht: ",color:"gray"},{text:"$(name)",color:"yellow"}]
