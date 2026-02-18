# ═══════════════════════════════════════════════════
# Edit Player - Oyuncu verisini düzenler (MACRO)
# ═══════════════════════════════════════════════════

$data modify storage glc:data players[{name:"$(name)"}] merge value $(data)

# Feedback
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Oyuncu düzenlendi: ",color:"green"},{text:"$(name)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Oyuncu düzenlendi: ",color:"green"},{text:"$(name)",color:"yellow"}]