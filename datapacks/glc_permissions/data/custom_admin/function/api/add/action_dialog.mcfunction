$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Bu ID zaten var: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"ID already exists: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] run return 0

$data modify storage glc:data actions append value {id:"$(id)",type:'dialog',params:{dialog:"$(dialog)"},player:"$(selector)"}

$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Dialog eylemi eklendi: ",color:"green"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Dialog action added: ",color:"green"},{text:"$(id)",color:"yellow"}]
