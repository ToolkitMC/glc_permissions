$data modify storage glc:data actions append value {id:"$(id)",type:"command",params:{command:"$(command)"},player:"$(player)"}

$tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"✅ Komut eklendi: ","color":"green"},{"text":"$(id)","color":"yellow"}]

$tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"Eylem eklendi: ","color":"gray"},{"text":"$(id)","color":"yellow"}]