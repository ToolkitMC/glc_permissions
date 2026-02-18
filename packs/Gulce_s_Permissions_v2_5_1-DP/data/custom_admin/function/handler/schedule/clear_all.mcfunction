# ═══════════════════════════════════════════════════
# Tüm Zamanlamaları Temizle
# ═══════════════════════════════════════════════════

# Sayı al
execute store result score #cleared gulce_id run data get storage glc:data scheduled

# Temizle
data remove storage glc:data scheduled
data modify storage glc:data scheduled set value []

# Feedback
execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"🗑️ Tüm zamanlamalar temizlendi: ",color:"green"},{score:{name:'#cleared',objective:'gulce_id'},color:"yellow"}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"🗑️ Tüm zamanlamalar temizlendi: ",color:"green"},{score:{name:'#cleared',objective:'gulce_id'},color:"yellow"}]

# Log
execute as @a[tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"Zamanlamalar temizlendi: ",color:"gray"},{selector:"@s",color:"yellow"}]
execute as @a[tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"Zamanlamalar temizlendi: ",color:"gray"},{selector:"@s",color:"yellow"}]