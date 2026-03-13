# Template: event
tellraw @a ['',{text:"★★★★★★★★★★★★★★★★★★★★★",color:"yellow",bold:true}]
tellraw @a[tag=glc.lang_tr] ['',{text:"  🎉 ETKİNLİK!",color:"yellow",bold:true}]
tellraw @a[tag=glc.lang_en] ['',{text:"  🎉 EVENT!",color:"yellow",bold:true}]
tellraw @a[tag=glc.lang_de] ['',{text:"  🎉 EVENT!",color:"yellow",bold:true}]
$tellraw @a ['',{text:"  $(message)",color:"white"}]
tellraw @a ['',{text:"★★★★★★★★★★★★★★★★★★★★★",color:"yellow",bold:true}]
execute as @a at @s run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 0.5 1.2
