# ═══════════════════════════════════════════════════
# API: Add Kick Action
# Usage: /function custom_admin:api/add/action_kick {id:"id",reason:"Sebep",selector:"OyuncuAdi"}
# NOT: selector burada oyuncu ismi olmalı, @a gibi selector çalışmaz
# ═══════════════════════════════════════════════════

$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Bu ID zaten var: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"ID already exists: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] run return 0

# Admin kontrolü (kick güçlü bir eylem)
execute unless entity @s[tag=gulce_admin] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"❌ Kick eylemi sadece adminler ekleyebilir!",color:"red"}]
execute unless entity @s[tag=gulce_admin] run return 0

$data modify storage glc:data actions append value {id:"$(id)",type:'kick',params:{reason:"$(reason)"},player:"$(selector)",enabled:1b}

$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Kick eylemi eklendi: ",color:"green"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Kick action added: ",color:"green"},{text:"$(id)",color:"yellow"}]

$tellraw @a[tag=gulce_admin] ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"Eylem eklendi: ",color:"gray"},{text:"$(id)",color:"yellow"},{text:" [kick]",color:"red"}]
