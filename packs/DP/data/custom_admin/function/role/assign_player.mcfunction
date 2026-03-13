# ═══════════════════════════════════════════════════
# Role: Assign PLAYER (Normal Oyuncu)
# Usage: /function custom_admin:role/assign_player {player:'oyuncu_adi'}
# Permission Level: 2 (MOD veya OWNER)
# ═══════════════════════════════════════════════════

# Oyuncuya player tag'i ver
$tag @a[name=$(player),limit=1] add gulce_player

# Tüm üst rolleri kaldır
$tag @a[name=$(player),limit=1] remove gulce_owner
$tag @a[name=$(player),limit=1] remove gulce_mod
$tag @a[name=$(player),limit=1] remove gulce_vip
$tag @a[name=$(player),limit=1] remove gulce_admin

# Başarı mesajı - TR
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ PLAYER rolü verildi",color:"green"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  👤 Oyuncu: ",color:"gray"},{text:"$(player)",color:"yellow"}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  ⭐ Yetki: ",color:"gray"},{text:"NORMAL OYUNCU",color:"white"}]

# Başarı mesajı - EN
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ PLAYER role assigned",color:"green"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  👤 Player: ",color:"gray"},{text:"$(player)",color:"yellow"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  ⭐ Permission: ",color:"gray"},{text:"NORMAL PLAYER",color:"white"}]

# Loglama - TR
$execute if entity @s[tag=glc.lang_tr] run tellraw @a[tag=gulce_mod] [{text:"[LOG] ",color:"dark_gray"},{selector:"@s",color:"gray"},{text:" verdi PLAYER rolünü → ",color:"gray"},{text:"$(player)",color:"yellow"}]
# Loglama - EN
$execute if entity @s[tag=glc.lang_en] run tellraw @a[tag=gulce_mod] [{text:"[LOG] ",color:"dark_gray"},{selector:"@s",color:"gray"},{text:" assigned PLAYER role → ",color:"gray"},{text:"$(player)",color:"yellow"}]

# Oyuncuya bildirim - TR
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  👤 Normal Oyuncu Yetkisi",color:"white",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"  Standart oyun yetkilerine sahipsiniz",color:"gray"}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]

# Oyuncuya bildirim - EN
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  👤 Normal Player Permission",color:"white",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"  You have standard player permissions",color:"gray"}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:"═══════════════════════════════════",color:"gold",bold:true}]
