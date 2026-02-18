# ═══════════════════════════════════════════════════
# Zamanlanmış Eylem Ekle (MACRO)
# ═══════════════════════════════════════════════════

# Benzersiz ID oluştur
scoreboard players add #schedule_id gulce_id 1

# Storage'a ekle
$data modify storage glc:data scheduled append value {schedule_id:0,action_id:"$(action_id)",delay:$(delay),remaining:$(delay),player:"$(player)"}

# ID'yi güncelle (son eklenen)
execute store result storage glc:data scheduled[-1].schedule_id int 1 run scoreboard players get #schedule_id gulce_id

# Feedback
$execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"⏰ Eylem zamanlandı: ",color:"green"},{text:"$(action_id)",color:"yellow"},{text:" → ",color:"gray"},{text:"$(delay)",color:"aqua"},{text:" tick sonra",color:"gray"}]
$execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"⏰ Eylem zamanlandı: ",color:"green"},{text:"$(action_id)",color:"yellow"},{text:" → ",color:"gray"},{text:"$(delay)",color:"aqua"},{text:" tick sonra",color:"gray"}]

# Log
execute store result score #temp gulce_id run scoreboard players get #schedule_id gulce_id

execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"📅 Zamanlandı #",color:"gray"},{score:{name:'#temp',objective:'gulce_id'},color:"yellow"}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"📅 Zamanlandı #",color:"gray"},{score:{name:'#temp',objective:'gulce_id'},color:"yellow"}]

# CRITICAL FIX: Set the has_scheduled flag to enable tick system
scoreboard players set #has_scheduled gulce_id 1
