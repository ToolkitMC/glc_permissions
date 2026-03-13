# ═══════════════════════════════════════════════════
# Gruba Üye Ekle (MACRO)
# ═══════════════════════════════════════════════════

# Grup var mı kontrol et
$execute unless data storage glc:data groups[{id:"$(group_id)"}] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"❌ HATA: Grup bulunamadı - $(group_id)",color:"red"}]
$execute unless data storage glc:data groups[{id:"$(group_id)"}] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"❌ HATA: Grup bulunamadı - $(group_id)",color:"red"}]
$execute unless data storage glc:data groups[{id:"$(group_id)"}] run return 0

# DÜZELTME: return komutu ayrı satıra alındı (geçersiz zincirleme kaldırıldı)
$execute unless entity $(player) if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"❌ HATA: Oyuncu bulunamadı - $(player)",color:"red"}]
$execute unless entity $(player) if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"❌ ERROR: Player not found - $(player)",color:"red"}]
$execute unless entity $(player) run return 0

# BUG FIX #4: Duplicate üye kontrolü — sonuç artık kullanılıyor
# store success = 1 ise oyuncu ZATEN üye demektir
$execute store success score #already_member gulce_id run data get storage glc:data groups[{id:"$(group_id)"}].members[{value:"$(player)"}]
$execute if score #already_member gulce_id matches 1 if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"yellow",bold:true},{text:"⚠ Oyuncu zaten bu grubun üyesi: $(player)",color:"yellow"}]
$execute if score #already_member gulce_id matches 1 if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"yellow",bold:true},{text:"⚠ Player is already a member: $(player)",color:"yellow"}]
execute if score #already_member gulce_id matches 1 run return 0

# Üye ekle
$data modify storage glc:data groups[{id:"$(group_id)"}].members append value "$(player)"

# Tag ver
$tag $(player) add gulce_group_$(group_id)

# Feedback
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Üye eklendi",color:"green"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Üye eklendi",color:"green"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  👤 Oyuncu: ",color:"gray"},{text:"$(player)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  👤 Player: ",color:"gray"},{text:"$(player)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  👥 Grup: ",color:"gray"},{text:"$(group_id)",color:"aqua"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  👥 Grup: ",color:"gray"},{text:"$(group_id)",color:"aqua"}]

# Oyuncuya bildir
$tellraw $(player) ["",{text:"[GULCE] ",color:"gold",bold:true},{text:"📥 Gruba eklendiniz: ",color:"green"},{text:"$(group_id)",color:"yellow"}]

# Log
# BUG FIX #1: Tekrarlanan ve birleşik $tellraw satırı ayrıldı
$tellraw @a[tag=gulce_admin] ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"Üye eklendi: ",color:"gray"},{text:"$(player)",color:"yellow"},{text:" → ",color:"gray"},{text:"$(group_id)",color:"aqua"}]