# ═══════════════════════════════════════════════════
# Final Show (MACRO)
# ═══════════════════════════════════════════════════

# Yetki kontrol
$execute unless entity @a[tag=gulce_admin,limit=1,name=$(NAME)] run title @s actionbar {"text":"Yetkin yok!","italic":false,"color":"red"}
$execute unless entity @a[tag=gulce_admin,limit=1,name=$(NAME)] run dialog clear @s
$execute unless entity @a[tag=gulce_admin,limit=1,name=$(NAME)] run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 3 1 1
$execute unless entity @a[tag=gulce_admin,limit=1,name=$(NAME)] run return 0

# Dialog Göster (Player head selector'dan gelen NAME ile)
$execute as $(NAME) at @s run dialog show @s $(ui)

# Log
execute if entity @s[tag=glc.lang_tr,tag=gulce_debug] run tellraw @s [{text:"[GLC] ",color:'light_purple',bold:true},{text:"Dialog gösterildi",color:"green"}]
execute if entity @s[tag=glc.lang_en,tag=gulce_debug] run tellraw @s [{text:"[GLC] ",color:'light_purple',bold:true},{text:"Dialog shown",color:"green"}]
