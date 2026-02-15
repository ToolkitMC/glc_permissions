# ═══════════════════════════════════════════════════
# Grup Sil (MACRO)
# ═══════════════════════════════════════════════════

$execute unless data storage glc:data groups[{id:"$(id)"}] run return fail

# Önce grubu geçici storage'a al
$data modify storage glc:temp temp.deleted_group set from storage glc:data groups[{id:"$(id)"}]

# Üye sayısını kontrol et
execute store result score #member_count gulce_id run data get storage glc:temp temp.deleted_group.members

# Tüm üyelerden tag'leri temizle
$execute if score #member_count gulce_id matches 1.. run tag @a remove gulce_group_$(id)

# Storage'dan sil
$data remove storage glc:data groups[{id:"$(id)"}]

# Grup sayacını azalt
scoreboard players remove #group_count gulce_id 1

# Feedback
$tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"🗑️ Grup silindi: ","color":"red"},{"text":"$(id)","color":"yellow"}]
execute if score #member_count gulce_id matches 1.. run tellraw @s ["",{"text":"  👥 ","color":"gray"},{"score":{"name":"#member_count","objective":"gulce_id"},"color":"yellow"},{"text":" üyenin tag'leri temizlendi","color":"gray"}]

# Log
$tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"Grup silindi: ","color":"gray"},{"text":"$(id)","color":"red"}]