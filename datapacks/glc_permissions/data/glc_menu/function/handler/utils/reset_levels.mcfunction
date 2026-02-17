# ═══════════════════════════════════════════════════
# Reset All Permission Levels
# Usage: /function glc_menu:handler/utils/reset_levels {level:1}
# ═══════════════════════════════════════════════════

# Set all permission levels in storage
$data modify storage glc:data permissions[].level set value $(level)

# Success message (bilingual)
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"✅ Tüm izin seviyeleri ",color:"green"},{text:"$(level)",color:"yellow"},{text:" olarak ayarlandı!",color:"green"}]

$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"✅ All permission levels set to ",color:"green"},{text:"$(level)",color:"yellow"},{text:"!",color:"green"}]

# Default (Turkish)
$execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"✅ Tüm izin seviyeleri ",color:"green"},{text:"$(level)",color:"yellow"},{text:" olarak ayarlandı!",color:"green"}]

# Play sound
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
