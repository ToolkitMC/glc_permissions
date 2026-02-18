$weather $(weather) $(duration)

$execute as $(selector) if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"☁ ",color:"aqua"},{text:"Hava değişti: ",color:"gray"},{text:"$(weather)",color:"yellow"}]
$execute as $(selector) if entity @s[tag=glc.lang_en] run tellraw @s [{text:"☁ ",color:"aqua"},{text:"Weather changed: ",color:"gray"},{text:"$(weather)",color:"yellow"}]
