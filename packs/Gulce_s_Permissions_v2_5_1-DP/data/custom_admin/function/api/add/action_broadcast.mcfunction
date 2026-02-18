# ═══════════════════════════════════════════════════
# API: Broadcast Aksiyon Ekle
# Usage: /function custom_admin:api/add/action_broadcast
#        {id:"duyuru_1",message:"Sunucuya hoş geldiniz!",prefix:"[DUYURU]",color:"gold"}
# Permission Level: MOD (Level 3+)
# ═══════════════════════════════════════════════════

# Yetki kontrolü
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s ['',{text:"[GULCE] ",color:"dark_red",bold:true},{text:"🚫 Yetersiz yetki! Gerekli: ",color:"red"},{text:"mod",color:"yellow"}]
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s ['',{text:"[GULCE] ",color:"dark_red",bold:true},{text:"🚫 Insufficient permission! Required: ",color:"red"},{text:"mod",color:"yellow"}]
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] run return 0

# Duplicate ID kontrolü
$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"Bu ID zaten var: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"ID already exists: ",color:"red"},{text:"$(id)",color:"yellow"}]
$execute if data storage glc:data actions[{id:"$(id)"}] run return 0

# Aksiyon ekle
$data modify storage glc:data actions append value {id:"$(id)",type:'broadcast',enabled:1b,params:{message:"$(message)",prefix:"$(prefix)",color:"$(color)"},player:"@a"}

# Başarı mesajı - TR
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Broadcast eklendi: ",color:"green"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  📢 Mesaj: ",color:"gray"},{text:"$(message)",color:"white"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  🏷️ Prefix: ",color:"gray"},{text:"$(prefix)",color:"gold"},{text:"  🎨 Renk: ",color:"gray"},{text:"$(color)",color:"aqua"}]

# Başarı mesajı - EN
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Broadcast added: ",color:"green"},{text:"$(id)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  📢 Message: ",color:"gray"},{text:"$(message)",color:"white"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  🏷️ Prefix: ",color:"gray"},{text:"$(prefix)",color:"gold"},{text:"  🎨 Color: ",color:"gray"},{text:"$(color)",color:"aqua"}]

# Admin log
$tellraw @a[tag=gulce_admin] ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"Broadcast eklendi: ",color:"gray"},{text:"$(id)",color:"yellow"}]
