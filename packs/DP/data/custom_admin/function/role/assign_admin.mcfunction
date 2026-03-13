# ═══════════════════════════════════════════════════
# Role: Assign ADMIN
# Usage: /function custom_admin:role/assign_admin {player:'oyuncu_adi'}
# Permission Level: 4 (OWNER only)
# ═══════════════════════════════════════════════════

# Oyuncuya admin tag'i ver
$tag @a[name=$(player),limit=1] add gulce_admin

# Diğer rolleri kaldır (admin, owner DEĞİL - admin ayrı bir rol)
$tag @a[name=$(player),limit=1] remove gulce_owner
$tag @a[name=$(player),limit=1] remove gulce_mod
$tag @a[name=$(player),limit=1] remove gulce_vip
$tag @a[name=$(player),limit=1] remove gulce_player

# Başarı mesajı - TR
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ ADMIN rolü verildi",color:"green"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  🛡 Oyuncu: ",color:"gray"},{text:"$(player)",color:"yellow"}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  ⭐ Yetki: ",color:"gray"},{text:"ADMIN",color:"dark_red",bold:true}]

# Başarı mesajı - EN
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ ADMIN role assigned",color:"green"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  🛡 Player: ",color:"gray"},{text:"$(player)",color:"yellow"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  ⭐ Permission: ",color:"gray"},{text:"ADMIN",color:"dark_red",bold:true}]

# Fallback (dil tag yoksa TR)
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ ADMIN rolü verildi",color:"green"}]
$execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"  🛡 Oyuncu: ",color:"gray"},{text:"$(player)",color:"yellow"}]
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run tellraw @s [{text:"  ⭐ Yetki: ",color:"gray"},{text:"ADMIN",color:"dark_red",bold:true}]

# Loglama
$execute if entity @s[tag=glc.lang_tr] run tellraw @a[tag=gulce_owner] [{text:"[LOG] ",color:"dark_gray"},{selector:"@s",color:"gray"},{text:" verdi ADMIN rolünü → ",color:"gray"},{text:"$(player)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @a[tag=gulce_owner] [{text:"[LOG] ",color:"dark_gray"},{selector:"@s",color:"gray"},{text:" assigned ADMIN role → ",color:"gray"},{text:"$(player)",color:"yellow"}]

# Oyuncuya bildirim - TR
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"dark_red",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  🛡 ADMİN YETKİSİ",color:"dark_red",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"dark_red",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  Yönetici yetkilerine sahipsiniz!",color:"gray"}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"dark_red",bold:true}]

# Oyuncuya bildirim - EN
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"dark_red",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  🛡 ADMIN PERMISSION",color:"dark_red",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"dark_red",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  You have administrator permissions!",color:"gray"}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"dark_red",bold:true}]
