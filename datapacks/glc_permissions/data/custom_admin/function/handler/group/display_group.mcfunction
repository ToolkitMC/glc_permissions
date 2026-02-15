# ═══════════════════════════════════════════════════
# Grup Gösterici (MACRO)
# ═══════════════════════════════════════════════════

# Üye ve izin sayısı
$execute store result score #members gulce_id run data get storage glc:data groups[{id:"$(id)"}].members
$execute store result score #perms gulce_id run data get storage glc:data groups[{id:"$(id)"}].permissions

# Göster
$tellraw @s ["",{"text":"  📁 ","color":"yellow","bold":true},{"text":"$(name)","color":"aqua","bold":true}]
$tellraw @s ["",{"text":"     ID: ","color":"gray"},{"text":"$(id)","color":"yellow"}]
$tellraw @s ["",{"text":"     Öncelik: ","color":"gray"},{"text":"$(priority)","color":"light_purple"}]
tellraw @s ["",{"text":"     Üyeler: ","color":"gray"},{"score":{"name":"#members","objective":"gulce_id"},"color":"green"}]
tellraw @s ["",{"text":"     İzinler: ","color":"gray"},{"score":{"name":"#perms","objective":"gulce_id"},"color":"aqua"}]