$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Bu ID zaten var: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"ID already exists: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] run return 0

$data modify storage glc:data actions append value {id:"$(id)",type:'givenbt',params:{item:"$(item)",count:"$(count)",nbt:"$(nbt)"},player:"$(selector)"}

$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Item eklendi: ",color:"green"},{text:"$(item)",color:"yellow"},{text:" x$(count)",color:"aqua"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Item eklendi: ",color:"green"},{text:"$(item)",color:"yellow"},{text:" x$(count)",color:"aqua"}]

$tellraw @a[tag=gulce_admin] ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"Eylem eklendi: ",color:"gray"},{text:"$(id)",color:"yellow"}]