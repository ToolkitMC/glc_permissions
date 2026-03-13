# Template: welcome
$tellraw @a[tag=glc.lang_tr] ['',{text:"[🎉 HOŞGELDİN] ",color:"aqua",bold:true},{text:"$(message)",color:"white"}]
$tellraw @a[tag=glc.lang_en] ['',{text:"[🎉 WELCOME] ",color:"aqua",bold:true},{text:"$(message)",color:"white"}]
$tellraw @a[tag=glc.lang_de] ['',{text:"[🎉 WILLKOMMEN] ",color:"aqua",bold:true},{text:"$(message)",color:"white"}]
execute as @a at @s run playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 0.5 1
