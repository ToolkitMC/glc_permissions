$execute unless data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Eylem bulunamadı: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute unless data storage glc:data actions[{id:"$(id)"}] run return 0

$data modify storage glc:data actions[{id:"$(id)"}].enabled set value false

$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"⛔ Eylem devre dışı: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"⛔ Action disabled: ",color:"red"},{text:"$(id)",color:"yellow"}]
