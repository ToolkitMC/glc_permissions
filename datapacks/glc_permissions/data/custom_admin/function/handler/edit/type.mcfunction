# ═══════════════════════════════════════════════════
# Edit Type - Tip değiştirir (MACRO)
# ═══════════════════════════════════════════════════

$data modify storage glc:data actions[{id:"$(id)"}].type set value "$(type)"

# Feedback
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Tip değiştirildi: ",color:"green"},{text:"$(type)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Tip değiştirildi: ",color:"green"},{text:"$(type)",color:"yellow"}]