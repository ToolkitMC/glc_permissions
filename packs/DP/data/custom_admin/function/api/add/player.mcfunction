# ═══════════════════════════════════════════════════
# Add Player - Oyuncu verisini ekler (MACRO)
# ═══════════════════════════════════════════════════

$data modify storage glc:data players append value {name:"$(name)",uuid:"$(uuid)",permissions:[],actions:[]}

# ID ata
$scoreboard players add $(name) gulce_id 1

# Feedback
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Oyuncu eklendi: ",color:"green"},{text:"$(name)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Oyuncu eklendi: ",color:"green"},{text:"$(name)",color:"yellow"}]

# Log
$tellraw @a[tag=gulce_admin] ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"Oyuncu eklendi: ",color:"gray"},{text:"$(name)",color:"yellow"}]
$tellraw @a[tag=gulce_admin] ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"Oyuncu eklendi: ",color:"gray"},{text:"$(name)",color:"yellow"}]