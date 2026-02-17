# ═══════════════════════════════════════════════════
# Role: Remove All Roles
# Usage: /function custom_admin:role/remove_all {player:'oyuncu_adi'}
# Permission Level: 3 (OP veya OWNER)
# ═══════════════════════════════════════════════════

# Tüm rolleri kaldır
$tag @a[name=$(player),limit=1] remove gulce_owner
$tag @a[name=$(player),limit=1] remove gulce_mod
$tag @a[name=$(player),limit=1] remove gulce_vip
$tag @a[name=$(player),limit=1] remove gulce_player
$tag @a[name=$(player),limit=1] remove gulce_admin

# Başarı mesajı
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Tüm roller kaldırıldı",color:"green"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Tüm roller kaldırıldı",color:"green"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  ❌ Oyuncu: ",color:"gray"},{text:"$(player)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  ❌ Player: ",color:"gray"},{text:"$(player)",color:"yellow"}]

# Loglama
$tellraw @a[tag=gulce_owner] ['',{text:"[LOG] ",color:"dark_gray"},{selector:"@s",color:"gray"},{text:" kaldırdı tüm rolleri → ",color:"gray"},{text:"$(player)",color:"yellow"}]

# Oyuncuya bildirim
$tellraw @a[name=$(player)] ['',{text:"═══════════════════════════════════",color:"gold",bold:true}]
$tellraw @a[name=$(player)] ['',{text:"  ❌ Tüm Yetkilerin Kaldırıldı",color:"red",bold:true}]
$tellraw @a[name=$(player)] ['',{text:"═══════════════════════════════════",color:"gold",bold:true}]
$tellraw @a[name=$(player)] ['',{text:"  Artık hiçbir özel yetkin yok",color:"gray"}]
$tellraw @a[name=$(player)] ['',{text:"═══════════════════════════════════",color:"gold",bold:true}]
