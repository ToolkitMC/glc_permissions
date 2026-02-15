# ═══════════════════════════════════════════════════
# Tüm Zamanlamaları Temizle
# ═══════════════════════════════════════════════════

# Sayı al
execute store result score #cleared gulce_id run data get storage glc:data scheduled

# Temizle
data remove storage glc:data scheduled
data modify storage glc:data scheduled set value []

# Feedback
tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"🗑️ Tüm zamanlamalar temizlendi: ","color":"green"},{"score":{"name":"#cleared","objective":"gulce_id"},"color":"yellow"}]

# Log
tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"Zamanlamalar temizlendi: ","color":"gray"},{"selector":"@s","color":"yellow"}]