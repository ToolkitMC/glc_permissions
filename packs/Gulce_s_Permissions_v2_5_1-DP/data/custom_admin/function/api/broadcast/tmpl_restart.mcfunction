# Template: restart
$tellraw @a[tag=glc.lang_tr] ['',{text:"[⚠ YENİDEN BAŞLATMA] ",color:"red",bold:true},{text:"$(message)",color:"yellow"}]
$tellraw @a[tag=glc.lang_en] ['',{text:"[⚠ RESTART] ",color:"red",bold:true},{text:"$(message)",color:"yellow"}]
$tellraw @a[tag=glc.lang_de] ['',{text:"[⚠ NEUSTART] ",color:"red",bold:true},{text:"$(message)",color:"yellow"}]
execute as @a at @s run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 0.3 1.5
