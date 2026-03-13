# ═══════════════════════════════════════════════════
# Grup Bilgi Gösterici (MACRO)
# ═══════════════════════════════════════════════════

# Temel bilgiler
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"📛 İsim: ",color:"gray"},{text:"$(name)",color:"aqua"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"📛 İsim: ",color:"gray"},{text:"$(name)",color:"aqua"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"🆔 ID: ",color:"gray"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"🆔 ID: ",color:"gray"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"⭐ Öncelik: ",color:"gray"},{text:"$(priority)",color:'light_purple'}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"⭐ Öncelik: ",color:"gray"},{text:"$(priority)",color:'light_purple'}]

# Üye sayısı
$execute store result score #members gulce_id run data get storage glc:data groups[{id:"$(id)"}].members
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"👥 Üyeler: ",color:"gray"},{score:{name:'#members',objective:'gulce_id'},color:"green"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"👥 Üyeler: ",color:"gray"},{score:{name:'#members',objective:'gulce_id'},color:"green"}]

# Üyeleri listele
$execute if score #members gulce_id matches 1.. run data modify storage glc:temp temp.member_list set from storage glc:data groups[{id:"$(id)"}].members
execute if score #members gulce_id matches 1.. run function custom_admin:handler/group/list_members_loop

# İzin sayısı
$execute store result score #perms gulce_id run data get storage glc:data groups[{id:"$(id)"}].permissions
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"🔐 İzinler: ",color:"gray"},{score:{name:'#perms',objective:'gulce_id'},color:"aqua"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"🔐 İzinler: ",color:"gray"},{score:{name:'#perms',objective:'gulce_id'},color:"aqua"}]

# İzinleri listele
$execute if score #perms gulce_id matches 1.. run data modify storage glc:temp temp.perm_list set from storage glc:data groups[{id:"$(id)"}].permissions
execute if score #perms gulce_id matches 1.. run function custom_admin:handler/group/list_perms_loop