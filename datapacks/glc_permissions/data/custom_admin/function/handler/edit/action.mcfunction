# ═══════════════════════════════════════════════════
# Edit Action - Eylemi düzenler (MACRO)
# ═══════════════════════════════════════════════════

$data modify storage glc:data actions[{id:"$(id)"}] set value {id:"$(id)",type:"$(type)",params:$(params),player:"$(player)"}

# Feedback
$tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"Eylem düzenlendi: ","color":"green"},{"text":"$(id)","color":"yellow"}]