$data modify storage glc:data actions append value {id:"$(id)",type:"give",params:{item:"$(item)",count:"$(count)"},player:"$(player)"}

$tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"✅ Item eklendi: ","color":"green"},{"text":"$(item)","color":"yellow"},{"text":" x$(count)","color":"aqua"}]

$tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"Eylem eklendi: ","color":"gray"},{"text":"$(id)","color":"yellow"}]