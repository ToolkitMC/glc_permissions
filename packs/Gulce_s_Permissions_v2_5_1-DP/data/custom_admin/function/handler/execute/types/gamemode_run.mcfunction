$gamemode $(mode) $(selector)

$execute as $(selector) if entity @s[tag=glc.lang_tr] run tellraw @s ["",{text:"🎮 ",color:"gold"},{text:"Oyun modu değişti: ",color:"gray"},{text:"$(mode)",color:"yellow"}]
$execute as $(selector) if entity @s[tag=glc.lang_en] run tellraw @s ["",{text:"🎮 ",color:"gold"},{text:"Game mode changed: ",color:"gray"},{text:"$(mode)",color:"yellow"}]
