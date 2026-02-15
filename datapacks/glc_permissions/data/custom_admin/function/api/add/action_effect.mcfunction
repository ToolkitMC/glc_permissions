$data modify storage glc:data actions append value {id:"$(id)",type:"effect",params:{effect:"$(effect)",duration:"$(duration)",amplifier:"$(amplifier)"},player:"$(player)"}

$tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"✅ Efekt eklendi: ","color":"green"},{"text":"$(effect)","color":"yellow"}]

$tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"Eylem eklendi: ","color":"gray"},{"text":"$(id)","color":"yellow"}]