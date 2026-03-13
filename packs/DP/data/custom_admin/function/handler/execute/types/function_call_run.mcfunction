$execute as $(selector) at @s run function $(function)

$execute as $(selector) if entity @s[tag=glc.lang_tr] run tellraw @s ["",{text:"📦 ",color:"aqua"},{text:"Function çalıştırıldı: ",color:"gray"},{text:"$(function)",color:"yellow"}]
$execute as $(selector) if entity @s[tag=glc.lang_en] run tellraw @s ["",{text:"📦 ",color:"aqua"},{text:"Function called: ",color:"gray"},{text:"$(function)",color:"yellow"}]
