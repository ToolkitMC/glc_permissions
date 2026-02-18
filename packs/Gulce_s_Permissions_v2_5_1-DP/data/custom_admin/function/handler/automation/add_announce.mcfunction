# ═══════════════════════════════════════════════════
# Add Auto Announce (v1.0.0)
# Macro: {msg:"<text>", interval:<ticks>}
# ═══════════════════════════════════════════════════
execute unless data storage glc:config auto_announce run data modify storage glc:config auto_announce set value {enabled:1b,messages:[],interval:1200,current_index:0}
$data modify storage glc:config auto_announce.messages append value "$(msg)"
$data modify storage glc:config auto_announce.interval set value $(interval)
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:'[GULCE] ',color:'gold'},{text:'📢 Oto duyuru eklendi: ',color:'green'},{text:'$(msg)',color:'yellow'}]
return 0
