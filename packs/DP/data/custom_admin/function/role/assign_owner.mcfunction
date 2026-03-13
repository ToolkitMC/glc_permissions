# ═══════════════════════════════════════════════════
# Role: Assign OWNER (Sahip)
# Usage: /function custom_admin:role/assign_owner {player:'oyuncu_adi'}
# Permission Level: 4 (OWNER)
# ═══════════════════════════════════════════════════

# Oyuncuya owner tag'i ver
$tag @a[name=$(player),limit=1] add gulce_owner
$tag @a[name=$(player),limit=1] add gulce_admin

# Diğer rolleri kaldır
$tag @a[name=$(player),limit=1] remove gulce_mod
$tag @a[name=$(player),limit=1] remove gulce_vip
$tag @a[name=$(player),limit=1] remove gulce_player

# Başarı mesajı - TR
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ OWNER rolü verildi",color:"green"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  👑 Oyuncu: ",color:"gray"},{text:"$(player)",color:"yellow"}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  ⭐ Yetki: ",color:"gray"},{text:"OWNER",color:"red",bold:true}]

# Başarı mesajı - EN
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ OWNER role assigned",color:"green"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  👑 Player: ",color:"gray"},{text:"$(player)",color:"yellow"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  ⭐ Permission: ",color:"gray"},{text:"OWNER",color:"red",bold:true}]

# Loglama - TR
$execute if entity @s[tag=glc.lang_tr] run tellraw @a[tag=gulce_owner] [{text:"[LOG] ",color:"dark_gray"},{selector:"@s",color:"gray"},{text:" verdi OWNER rolünü → ",color:"gray"},{text:"$(player)",color:"yellow"}]
# Loglama - EN
$execute if entity @s[tag=glc.lang_en] run tellraw @a[tag=gulce_owner] [{text:"[LOG] ",color:"dark_gray"},{selector:"@s",color:"gray"},{text:" assigned OWNER role → ",color:"gray"},{text:"$(player)",color:"yellow"}]

# Oyuncuya bildirim - TR
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  👑 OWNER YETKİSİ",color:"red",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  Tüm yetkilere sahipsiniz!",color:"gray"}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]

# Oyuncuya bildirim - EN
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  👑 OWNER PERMISSION",color:"red",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  You have all permissions!",color:"gray"}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
