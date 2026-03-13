# ═══════════════════════════════════════════════════
# Remove Player - Oyuncu verisini siler (MACRO)
# ═══════════════════════════════════════════════════

$data remove storage glc:data players[{name:"$(name)"}]

# Scoreboard temizliği
$scoreboard players reset $(name) gulce_id

# Feedback
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Oyuncu silindi: ",color:"red"},{text:"$(name)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Oyuncu silindi: ",color:"red"},{text:"$(name)",color:"yellow"}]

# Log
# BUG FIX #2: Tekrarlanan ve birleşik $tellraw satırı ayrıldı
$tellraw @a[tag=gulce_admin] ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"Oyuncu silindi: ",color:"gray"},{text:"$(name)",color:"yellow"}]