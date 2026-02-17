# ═══════════════════════════════════════════════════
# Gruptan Üye Çıkar (MACRO)
# ═══════════════════════════════════════════════════

# Grup var mı kontrol et
$execute unless data storage glc:data groups[{id:"$(group_id)"}] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"❌ HATA: Grup bulunamadı - $(group_id)",color:"red"}]
$execute unless data storage glc:data groups[{id:"$(group_id)"}] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"❌ HATA: Grup bulunamadı - $(group_id)",color:"red"}]
$execute unless data storage glc:data groups[{id:"$(group_id)"}] run return 0

# Üyeyi sil
$data remove storage glc:data groups[{id:"$(group_id)"}].members[{value:"$(player)"}]

# Tag temizle
$tag $(player) remove gulce_group_$(group_id)

# Feedback
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Üye çıkarıldı",color:"green"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"✅ Üye çıkarıldı",color:"green"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  👤 Oyuncu: ",color:"gray"},{text:"$(player)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  👤 Player: ",color:"gray"},{text:"$(player)",color:"yellow"}]
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"  👥 Grup: ",color:"gray"},{text:"$(group_id)",color:"aqua"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"  👥 Grup: ",color:"gray"},{text:"$(group_id)",color:"aqua"}]

# Oyuncuya bildir
$tellraw $(player) ["",{text:"[GULCE] ",color:"gold",bold:true},{text:"📤 Gruptan çıkarıldınız: ",color:"red"},{text:"$(group_id)",color:"yellow"}]

# Log
$execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"Üye çıkarıldı: ",color:"gray"},{text:"$(player)",color:"yellow"},{text:" ← ",color:"gray"},{text:"$(group_id)",color:"red"}]
$execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"Üye çıkarıldı: ",color:"gray"},{text:"$(player)",color:"yellow"},{text:" ← ",color:"gray"},{text:"$(group_id)",color:"red"}]