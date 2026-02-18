# ═══════════════════════════════════════════════════
# Role: Assign OWNER (Sahip)
# Usage: /function custom_admin:role/assign_owner {player:'oyuncu_adi'}
# Permission Level: 4 (Admin)
# ═══════════════════════════════════════════════════

# Oyuncuya owner tag'i ver
$tag @a[name=$(player),limit=1] add gulce_admin

# Diğer rolleri kaldır
$tag @a[name=$(player),limit=1] remove gulce_mod
$tag @a[name=$(player),limit=1] remove gulce_vip
$tag @a[name=$(player),limit=1] remove gulce_player

# Başarı mesajı - TR
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ OWNER rolü verildi",color:"green"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  👑 Oyuncu: ",color:"gray"},{text:"$(player)",color:"yellow"}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  ⭐ Yetki: ",color:"gray"},{text:"Admin",color:"red",bold:true}]

# Başarı mesajı - EN
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ OWNER role assigned",color:"green"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  👑 Player: ",color:"gray"},{text:"$(player)",color:"yellow"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  ⭐ Permission: ",color:"gray"},{text:"Admin",color:"red",bold:true}]

# Loglama - TR
$execute if entity @s[tag=glc.lang_tr] run tellraw @a[tag=gulce_owner] [{text:"[LOG] ",color:"dark_gray"},{selector:"@s",color:"gray"},{text:" verdi Admin rolünü → ",color:"gray"},{text:"$(player)",color:"yellow"}]
# Loglama - EN
$execute if entity @s[tag=glc.lang_en] run tellraw @a[tag=gulce_owner] [{text:"[LOG] ",color:"dark_gray"},{selector:"@s",color:"gray"},{text:" assigned Admin role → ",color:"gray"},{text:"$(player)",color:"yellow"}]

# Oyuncuya bildirim - TR
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  👑 Admin YETKİSİ",color:"red",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  Tüm yetkilere sahipsiniz!",color:"gray"}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]

# Oyuncuya bildirim - EN
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  👑 Admin PERMISSION",color:"red",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  You have all permissions!",color:"gray"}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
