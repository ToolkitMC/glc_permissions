# ═══════════════════════════════════════════════════
# TP Execute (v2.5.4)
# Macro: {loc:"spawn|castle|mine|..."}
# Storage'dan konum bilgisini okuyup "with storage" ile TP yapar
# ═══════════════════════════════════════════════════

# Konum mevcut mu?
$execute unless data storage glc:config teleport_locations.$(loc) if entity @s[tag=glc.lang_tr] run tellraw @s {text:'📍 Bu konumun koordinatları ayarlanmamış!',color:'red'}
$execute unless data storage glc:config teleport_locations.$(loc) if entity @s[tag=glc.lang_en] run tellraw @s {text:'📍 Coordinates not set for this location!',color:'red'}
$execute unless data storage glc:config teleport_locations.$(loc) run return fail

# Storage'dan loc verisini temp'e kopyala, sonra macro ile oku
$data modify storage glc:temp tp set from storage glc:config teleport_locations.$(loc)
function custom_admin:features/vip/tp_do with storage glc:temp tp
