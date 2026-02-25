# ═══════════════════════════════════════════════════
# API: Add XP Action
# Usage: /function custom_admin:api/add/action_xp {id:"id",mode:"add",amount:100,type:"points",selector:"@s"}
# mode: add | set
# type: L (levels) | (boş = points)
# ═══════════════════════════════════════════════════

$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Bu ID zaten var: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"ID already exists: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] run return 0

$data modify storage glc:data actions append value {id:"$(id)",type:'xp',params:{mode:"$(mode)",amount:"$(amount)",type:"$(type)"},player:"$(selector)",enabled:1b}

$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ XP eylemi eklendi: ",color:"green"},{text:"$(id)",color:"yellow"},{text:" ($(mode) $(amount)$(type))",color:"aqua"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ XP action added: ",color:"green"},{text:"$(id)",color:"yellow"},{text:" ($(mode) $(amount)$(type))",color:"aqua"}]

$tellraw @a[tag=gulce_admin] ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"Eylem eklendi: ",color:"gray"},{text:"$(id)",color:"yellow"},{text:" [xp]",color:"aqua"}]
