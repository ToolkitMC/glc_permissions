$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Bu ID zaten var: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"ID already exists: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] run return 0

$data modify storage glc:data actions append value {id:"$(id)",type:'function',params:{function:"$(function)"},player:"$(selector)"}

$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ İşlev eklendi: ",color:"green"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ İşlev eklendi: ",color:"green"},{text:"$(id)",color:"yellow"}]

$tellraw @a[tag=gulce_admin] ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"Eylem eklendi: ",color:"gray"},{text:"$(id)",color:"yellow"}]