# ═══════════════════════════════════════════════════
# Home: Go Check (macro)
# Macro: {player:"...", name:"..."}
# ═══════════════════════════════════════════════════

$execute unless data storage glc:homes $(player).$(name) if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[HOME] ",color:"red"},{text:"⚠ Ev bulunamadı: ",color:"gray"},{text:"$(name)",color:"yellow"}]
$execute unless data storage glc:homes $(player).$(name) if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[HOME] ",color:"red"},{text:"⚠ Home not found: ",color:"gray"},{text:"$(name)",color:"yellow"}]
$execute unless data storage glc:homes $(player).$(name) if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[HOME] ",color:"red"},{text:"⚠ Heimort nicht gefunden: ",color:"gray"},{text:"$(name)",color:"yellow"}]
$execute unless data storage glc:homes $(player).$(name) run return 0

# Storage'dan koordinatları oku + ışınla
$data modify storage glc:temp home_tp set from storage glc:homes $(player).$(name)
function custom_admin:features/vip/tp_do with storage glc:temp home_tp
data remove storage glc:temp home_tp

execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[HOME] ",color:"aqua",bold:true},{text:"🏠 Eve ışınlandınız!",color:"green"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[HOME] ",color:"aqua",bold:true},{text:"🏠 Teleported home!",color:"green"}]
execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[HOME] ",color:"aqua",bold:true},{text:"🏠 Zum Heimort teleportiert!",color:"green"}]
execute at @s run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 1

scoreboard players set @s gulce_cooldown 60
