$clear $(selector) $(item) $(count)

$execute as $(selector) if entity @s[tag=glc.lang_tr] run tellraw @s ["",{text:"🗑️ ",color:"red"},{text:"Envanter temizlendi: ",color:"gray"},{text:"$(item)",color:"yellow"}]
$execute as $(selector) if entity @s[tag=glc.lang_en] run tellraw @s ["",{text:"🗑️ ",color:"red"},{text:"Inventory cleared: ",color:"gray"},{text:"$(item)",color:"yellow"}]
