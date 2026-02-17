# ═══════════════════════════════════════════════════
# Set VIP Teleport Location (v1.0.0)
# Owner panelinden çağrılır
# Macro: {loc:"spawn|castle|mine|...", x:0, y:64, z:0}
# ═══════════════════════════════════════════════════
$data modify storage glc:config teleport_locations.$(loc) set value {x:$(x),y:$(y),z:$(z)}
$execute if entity @s[tag=glc.lang_tr] run tellraw @s ["",{"text":"[GULCE] ","color":"gold"},{"text":"📍 Konum ayarlandı: ","color":"gray"},{"text":"$(loc)","color":"yellow"},{"text":" → $(x) $(y) $(z)","color":"aqua"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s ["",{"text":"[GULCE] ","color":"gold"},{"text":"📍 Location set: ","color":"gray"},{"text":"$(loc)","color":"yellow"},{"text":" → $(x) $(y) $(z)","color":"aqua"}]
return 0
