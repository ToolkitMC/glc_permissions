# ═══════════════════════════════════════════════════
# İzin Gösterici (MACRO)
# ═══════════════════════════════════════════════════

$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  → ",color:"dark_gray"},{text:"$(permission)",color:"aqua"},{text:" (Lvl ",color:"gray"},{text:"$(level)",color:'light_purple'},{text:")",color:"gray"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  → ",color:"dark_gray"},{text:"$(permission)",color:"aqua"},{text:" (Lvl ",color:"gray"},{text:"$(level)",color:'light_purple'},{text:")",color:"gray"}]