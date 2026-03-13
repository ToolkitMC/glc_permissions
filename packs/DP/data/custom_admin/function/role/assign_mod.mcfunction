# ═══════════════════════════════════════════════════
# Role: Assign MOD (Moderatör)
# Usage: /function custom_admin:role/assign_mod {player:'oyuncu_adi'}
# Permission Level: 3 (OP gerekli veya OWNER)
# ═══════════════════════════════════════════════════

# Oyuncuya mod tag'i ver
$tag @a[name=$(player),limit=1] add gulce_mod

# Alt rolleri de ekle
$tag @a[name=$(player),limit=1] add gulce_vip
$tag @a[name=$(player),limit=1] add gulce_player

# OWNER tag'ini kaldır (güvenlik)
$tag @a[name=$(player),limit=1] remove gulce_owner

# Başarı mesajı - TR
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ MOD rolü verildi",color:"green"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  👮 Oyuncu: ",color:"gray"},{text:"$(player)",color:"yellow"}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  ⭐ Yetki: ",color:"gray"},{text:"MODERATÖR",color:"blue",bold:true}]

# Başarı mesajı - EN
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ MOD role assigned",color:"green"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  👮 Player: ",color:"gray"},{text:"$(player)",color:"yellow"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  ⭐ Permission: ",color:"gray"},{text:"MODERATOR",color:"blue",bold:true}]

# Loglama - TR
$execute if entity @s[tag=glc.lang_tr] run tellraw @a[tag=gulce_owner] [{text:"[LOG] ",color:"dark_gray"},{selector:"@s",color:"gray"},{text:" verdi MOD rolünü → ",color:"gray"},{text:"$(player)",color:"yellow"}]
# Loglama - EN
$execute if entity @s[tag=glc.lang_en] run tellraw @a[tag=gulce_owner] [{text:"[LOG] ",color:"dark_gray"},{selector:"@s",color:"gray"},{text:" assigned MOD role → ",color:"gray"},{text:"$(player)",color:"yellow"}]

# Oyuncuya bildirim - TR
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  👮 MOD Yetkisi Alındı!",color:"blue",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  Moderatör yetkilerine sahipsiniz",color:"gray"}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  ⚡ Oyuncu yönetimi",color:"aqua"}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  ⚡ Mesaj yönetimi",color:"aqua"}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  ⚡ Teleport yetkisi",color:"aqua"}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]

# Oyuncuya bildirim - EN
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  👮 MOD Permission Granted!",color:"blue",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  You have moderator permissions",color:"gray"}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  ⚡ Player management",color:"aqua"}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  ⚡ Message management",color:"aqua"}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  ⚡ Teleport permission",color:"aqua"}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
