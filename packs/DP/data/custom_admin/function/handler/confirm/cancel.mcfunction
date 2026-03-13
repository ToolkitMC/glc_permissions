# ═══════════════════════════════════════════════════
# Confirm: Cancel (v2.5.7)
# ═══════════════════════════════════════════════════

data remove storage glc:confirm pending

execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gray"},{text:"⚠ İşlem iptal edildi.",color:"yellow"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gray"},{text:"⚠ Action cancelled.",color:"yellow"}]
execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[GULCE] ",color:"gray"},{text:"⚠ Aktion abgebrochen.",color:"yellow"}]

playsound custom_admin:ui.click master @s ~ ~ ~ 1 1
