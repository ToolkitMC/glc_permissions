# ═══════════════════════════════════════════════════
# API: Add Home Action (v2.5.7)
# Usage: /function custom_admin:api/add/action_home {id:"id",home_name:"isim",selector:"OyuncuAdi"}
# type: "home" → home/go çağrısı yapar
# ═══════════════════════════════════════════════════

$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Bu ID zaten var: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"ID already exists: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] run return 0

$data modify storage glc:data actions append value {id:"$(id)",type:"home",params:{home_name:"$(home_name)"},player:"$(selector)",enabled:1b}

$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Home eylemi eklendi: ",color:"green"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Home action added: ",color:"green"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Heimort-Aktion hinzugefügt: ",color:"green"},{text:"$(id)",color:"yellow"}]
