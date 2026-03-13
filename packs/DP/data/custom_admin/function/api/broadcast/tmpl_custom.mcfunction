# Template: custom
$tellraw @a ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"$(message)",color:"white"}]
execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1
