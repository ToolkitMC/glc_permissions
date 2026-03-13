# ═══════════════════════════════════════════════════
# Save Current Location (v1.0.0)
# Macro: {loc:"spawn|castle|..."}
# Owner'ın o anki X/Y/Z koordinatlarını storage'a yazar
# ═══════════════════════════════════════════════════
$execute store result storage glc:config teleport_locations.$(loc).x int 1 run data get entity @s Pos[0]
$execute store result storage glc:config teleport_locations.$(loc).y int 1 run data get entity @s Pos[1]
$execute store result storage glc:config teleport_locations.$(loc).z int 1 run data get entity @s Pos[2]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:'[GULCE] ',color:'gold'},{text:'📌 Konum kaydedildi: ',color:'green'},{text:'$(loc)',color:'yellow'}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:'[GULCE] ',color:'gold'},{text:'📌 Location saved: ',color:'green'},{text:'$(loc)',color:'yellow'}]
return 0
