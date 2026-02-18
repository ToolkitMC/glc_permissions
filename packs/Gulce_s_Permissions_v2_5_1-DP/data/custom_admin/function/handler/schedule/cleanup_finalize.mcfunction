# ═══════════════════════════════════════════════════
# Cleanup Finalize - Temizliği tamamla
# ═══════════════════════════════════════════════════

# Eski array'i temiz array ile değiştir
data modify storage glc:data scheduled set from storage glc:temp temp.clean_scheduled

# Temizlik
data remove storage glc:temp temp.clean_scheduled
data remove storage glc:temp temp.processing
data remove storage glc:temp temp.current_item

# Sayıyı güncelle
execute store result score #schedule_count gulce_id run data get storage glc:data scheduled

# Flag'i güncelle
execute if score #schedule_count gulce_id matches 1.. run scoreboard players set #has_scheduled gulce_id 1
execute unless score #schedule_count gulce_id matches 1.. run scoreboard players set #has_scheduled gulce_id 0

# Log (sadece debug modda)
execute if entity @s[tag=glc.lang_tr] if score #delete_count gulce_id matches 1.. run tellraw @a[tag=gulce_debug] ['',{text:"[DEBUG] ",color:"gray"},{text:"🗑️ ",color:"red"},{score:{name:'#delete_count',objective:'gulce_id'},color:"yellow"},{text:" zamanlama silindi",color:"gray"}]
execute if entity @s[tag=glc.lang_en] if score #delete_count gulce_id matches 1.. run tellraw @a[tag=gulce_debug] ['',{text:"[DEBUG] ",color:"gray"},{text:"🗑️ ",color:"red"},{score:{name:'#delete_count',objective:'gulce_id'},color:"yellow"},{text:" zamanlama silindi",color:"gray"}]
