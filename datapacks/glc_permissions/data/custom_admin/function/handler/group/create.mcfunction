# ═══════════════════════════════════════════════════
# Grup Oluştur (MACRO)
# ═══════════════════════════════════════════════════

# Test @
$execute if data storage glc:data groups[{id:"$(id)"}] run return fail

# Grup ID sayacını artır
scoreboard players add #group_count gulce_id 1

# Storage'a ekle
$data modify storage glc:data groups append value {id:"$(id)",name:"$(name)",display_name:"$(name)",permissions:[],members:[],priority:$(priority),created_by:"@s"}

# Başarı mesajı
tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"✅ Grup oluşturuldu","color":"green"}]
$tellraw @s ["",{"text":"  📋 ID: ","color":"gray"},{"text":"$(id)","color":"yellow"}]
$tellraw @s ["",{"text":"  📛 İsim: ","color":"gray"},{"text":"$(name)","color":"aqua"}]
$tellraw @s ["",{"text":"  ⭐ Öncelik: ","color":"gray"},{"text":"$(priority)","color":"light_purple"}]

# Log
execute store result score #temp gulce_id run scoreboard players get #group_count gulce_id
$tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"👥 Yeni grup: ","color":"gray"},{"text":"$(name)","color":"yellow"},{"text":" (Toplam: ","color":"gray"},{"score":{"name":"#temp","objective":"gulce_id"},"color":"aqua"},{"text":")","color":"gray"}]