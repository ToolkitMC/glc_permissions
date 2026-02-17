$tp $(selector) $(x) $(y) $(z)

$execute as $(selector) if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"📍 ",color:"aqua"},{text:"Işınlandınız: ",color:"gray"},{text:"$(x) $(y) $(z)",color:"yellow"}]
$execute as $(selector) if entity @s[tag=glc.lang_en] run tellraw @s [{text:"📍 ",color:"aqua"},{text:"Teleported to: ",color:"gray"},{text:"$(x) $(y) $(z)",color:"yellow"}]
