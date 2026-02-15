# ═══════════════════════════════════════════════════
# Edit Player - Oyuncu verisini düzenler (MACRO)
# ═══════════════════════════════════════════════════

$data modify storage glc:data players[{name:"$(name)"}] merge value $(data)

# Feedback
$tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"Oyuncu düzenlendi: ","color":"green"},{"text":"$(name)","color":"yellow"}]