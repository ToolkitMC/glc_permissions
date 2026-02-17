# ═══════════════════════════════════════════════════
# Language Setter
# Usage: /function custom_admin:util/lang/set {lang:"tr"} or {lang:"en"}
# ═══════════════════════════════════════════════════

# Remove existing language tags
tag @s remove glc.lang_tr
tag @s remove glc.lang_en

# Apply new language tag based on parameter
$execute if entity @s run tag @s[type=player] add glc.lang_$(lang)

# Feedback messages
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"✅ Dil değiştirildi: ",color:"green"},{text:"Türkçe",color:"yellow"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"✅ Language changed: ",color:"green"},{text:"English",color:"yellow"}]

# Play sound
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2

# Reopen menu if needed
execute if score @s gulce_menu matches 60 run trigger gulce_menu set 60
