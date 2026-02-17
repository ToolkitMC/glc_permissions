# ═══════════════════════════════════════════════════
# API: Add Setblock Action
# Usage: /function custom_admin:api/add/action_setblock {id:"id",x:0,y:64,z:0,block:"minecraft:stone",mode:"replace",selector:"@s"}
# mode: replace | keep | destroy
# ═══════════════════════════════════════════════════

$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Bu ID zaten var: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"ID already exists: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] run return 0

$data modify storage glc:data actions append value {id:"$(id)",type:'setblock',params:{x:"$(x)",y:"$(y)",z:"$(z)",block:"$(block)",mode:"$(mode)"},player:"$(selector)",enabled:1b}

$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Setblock eylemi eklendi: ",color:"green"},{text:"$(id)",color:"yellow"},{text:" [$(block)]",color:"gray"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Setblock action added: ",color:"green"},{text:"$(id)",color:"yellow"},{text:" [$(block)]",color:"gray"}]

$tellraw @a[tag=gulce_admin] ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"Eylem eklendi: ",color:"gray"},{text:"$(id)",color:"yellow"},{text:" [setblock]",color:"dark_green"}]
