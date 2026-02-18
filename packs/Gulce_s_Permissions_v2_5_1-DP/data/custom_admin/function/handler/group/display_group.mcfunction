# ═══════════════════════════════════════════════════
# Grup Gösterici (MACRO)
# ═══════════════════════════════════════════════════

# Üye ve izin sayısı
$execute store result score #members gulce_id run data get storage glc:data groups[{id:"$(id)"}].members
$execute store result score #perms gulce_id run data get storage glc:data groups[{id:"$(id)"}].permissions

# Göster
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  📁 ",color:"yellow",bold:true},{text:"$(name)",color:"aqua",bold:true}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  📁 ",color:"yellow",bold:true},{text:"$(name)",color:"aqua",bold:true}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"     ID: ",color:"gray"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"     ID: ",color:"gray"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"     Öncelik: ",color:"gray"},{text:"$(priority)",color:'light_purple'}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"     Öncelik: ",color:"gray"},{text:"$(priority)",color:'light_purple'}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"     Üyeler: ",color:"gray"},{score:{name:'#members',objective:'gulce_id'},color:"green"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"     Üyeler: ",color:"gray"},{score:{name:'#members',objective:'gulce_id'},color:"green"}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"     İzinler: ",color:"gray"},{score:{name:'#perms',objective:'gulce_id'},color:"aqua"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"     İzinler: ",color:"gray"},{score:{name:'#perms',objective:'gulce_id'},color:"aqua"}]