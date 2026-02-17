# ═══════════════════════════════════════════════════
# Edit Action - Eylemi düzenler (MACRO)
# ═══════════════════════════════════════════════════

# Action var mı kontrol et
$execute unless data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Eylem bulunamadı: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute unless data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Action not found: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute unless data storage glc:data actions[{id:"$(id)"}] run return 0

# Güncelle
$data modify storage glc:data actions[{id:"$(id)"}] set value {id:"$(id)",type:"$(type)",params:$(params),player:"$(player)"}

# Feedback
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Eylem güncellendi: ",color:"green"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Action updated: ",color:"green"},{text:"$(id)",color:"yellow"}]
