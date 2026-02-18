# ═══════════════════════════════════════════════════
# Delete Permissions by Player
# Usage: /function glc_menu:handler/utils/delete_by_player {player:"PlayerName"}
# ═══════════════════════════════════════════════════

# Remove all permissions for the specified player
$data remove storage glc:data permissions[{player:"$(player)"}]

# Success message (bilingual)
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"✅ ",color:"green"},{text:"$(player)",color:"yellow"},{text:" adlı oyuncunun izinleri silindi!",color:"green"}]

$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"✅ Permissions deleted for player ",color:"green"},{text:"$(player)",color:"yellow"},{text:"!",color:"green"}]

# Default (Turkish)
$execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"✅ ",color:"green"},{text:"$(player)",color:"yellow"},{text:" adlı oyuncunun izinleri silindi!",color:"green"}]

# Play sound
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
