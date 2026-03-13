# Template: rules
tellraw @a ['',{text:"▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬",color:"gold",bold:true}]
tellraw @a[tag=glc.lang_tr] ['',{text:"  📜 SUNUCU KURALLARI",color:"gold",bold:true}]
tellraw @a[tag=glc.lang_en] ['',{text:"  📜 SERVER RULES",color:"gold",bold:true}]
tellraw @a[tag=glc.lang_de] ['',{text:"  📜 SERVERREGELN",color:"gold",bold:true}]
$tellraw @a ['',{text:"  $(message)",color:"white"}]
tellraw @a ['',{text:"▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬",color:"gold",bold:true}]
execute as @a at @s run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1
