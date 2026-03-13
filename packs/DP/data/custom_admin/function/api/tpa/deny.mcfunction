# ═══════════════════════════════════════════════════
# TPA: Deny (v2.5.7)
# @s = reddeden (hedef)
# ═══════════════════════════════════════════════════

execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[TPA] ",color:"red",bold:true},{text:"❌ İstek reddedildi.",color:"red"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[TPA] ",color:"red",bold:true},{text:"❌ Request denied.",color:"red"}]
execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[TPA] ",color:"red",bold:true},{text:"❌ Anfrage abgelehnt.",color:"red"}]

# Gönderene bildir
function custom_admin:api/tpa/deny_notify with storage glc:tpa pending

data remove storage glc:tpa pending
playsound custom_admin:player.tpa_deny master @s ~ ~ ~ 1 1
