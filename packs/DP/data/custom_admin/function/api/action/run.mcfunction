$function custom_admin:handler/execute/action {id:"$(id)"}

$tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"Eylem yürütüldü: ","color":"gray"},{"text":"$(id)","color":"yellow"},{"text":" tarafından ","color":"gray"},{"selector":"@s","color":"aqua"}]
