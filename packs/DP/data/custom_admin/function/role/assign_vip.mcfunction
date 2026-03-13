# ═══════════════════════════════════════════════════
# Role: Assign VIP
# Usage: /function custom_admin:role/assign_vip {player:'oyuncu_adi'}
# Permission Level: 2 (MOD veya OWNER)
# ═══════════════════════════════════════════════════

# Oyuncuya vip tag'i ver
$tag @a[name=$(player),limit=1] add gulce_vip
$tag @a[name=$(player),limit=1] add gulce_player

# Üst rolleri kaldır (güvenlik)
$tag @a[name=$(player),limit=1] remove gulce_owner
$tag @a[name=$(player),limit=1] remove gulce_mod

# Başarı mesajı - TR
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ VIP rolü verildi",color:"green"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  ⭐ Oyuncu: ",color:"gray"},{text:"$(player)",color:"yellow"}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  ⭐ Yetki: ",color:"gray"},{text:"VIP",color:'light_purple',bold:true}]

# Başarı mesajı - EN
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ VIP role assigned",color:"green"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  ⭐ Player: ",color:"gray"},{text:"$(player)",color:"yellow"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  ⭐ Permission: ",color:"gray"},{text:"VIP",color:'light_purple',bold:true}]

# Loglama - TR
$execute if entity @s[tag=glc.lang_tr] run tellraw @a[tag=gulce_mod] [{text:"[LOG] ",color:"dark_gray"},{selector:"@s",color:"gray"},{text:" verdi VIP rolünü → ",color:"gray"},{text:"$(player)",color:"yellow"}]
# Loglama - EN
$execute if entity @s[tag=glc.lang_en] run tellraw @a[tag=gulce_mod] [{text:"[LOG] ",color:"dark_gray"},{selector:"@s",color:"gray"},{text:" assigned VIP role → ",color:"gray"},{text:"$(player)",color:"yellow"}]

# Oyuncuya bildirim - TR
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  ⭐ VIP Yetkisi Alındı!",color:'light_purple',bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  VIP özelliklerine erişim",color:"gray"}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  ✨ Özel eşyalar",color:"aqua"}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  ✨ Hızlı erişim",color:"aqua"}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  ✨ Özel efektler",color:"aqua"}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]

# Oyuncuya bildirim - EN
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  ⭐ VIP Permission Granted!",color:'light_purple',bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  Access to VIP features",color:"gray"}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  ✨ Special items",color:"aqua"}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  ✨ Quick access",color:"aqua"}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  ✨ Special effects",color:"aqua"}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
