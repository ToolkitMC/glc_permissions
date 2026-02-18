# ═══════════════════════════════════════════════════
# Set Cooldown Values (TR/EN Support)
# Usage: /function custom_admin:util/cooldown/set {player:"Ahmet123",value:40}
# ═══════════════════════════════════════════════════

# Validate inputs (must be positive numbers)
# Validation removed - macro parameters cannot be validated with matches


# Update storage
$data modify storage glc:config cooldowns.player set value $(value)

# Update scoreboard values
$scoreboard players set $(player) gulce_cooldown $(value)

# Success message - TURKISH
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"✅ Cooldown ayarları güncellendi!",color:"green"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  • Değer: ",color:"gray"},{text:"$(value)",color:"yellow"},{text:" tick",color:"gray"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  • Oyuncu: ",color:"gray"},{text:"$(player)",color:"yellow"}]

# Success message - ENGLISH
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"✅ Cooldown settings updated!",color:"green"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  • Value: ",color:"gray"},{text:"$(value)",color:"yellow"},{text:" ticks",color:"gray"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  • Player: ",color:"gray"},{text:"$(player)",color:"yellow"}]

# Default (Turkish)
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"✅ Cooldown ayarları güncellendi!",color:"green"}]
$execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"  • Değer: ",color:"gray"},{text:"$(value)",color:"yellow"},{text:" tick",color:"gray"}]
$execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"  • Oyuncu: ",color:"gray"},{text:"$(player)",color:"yellow"}]

# Play sound
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2