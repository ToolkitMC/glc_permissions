# ═══════════════════════════════════════════════════
# Üye Gösterici (MACRO)
# ═══════════════════════════════════════════════════

$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  → ",color:"dark_gray"},{text:"$(member_name)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  → ",color:"dark_gray"},{text:"$(member_name)",color:"yellow"}]