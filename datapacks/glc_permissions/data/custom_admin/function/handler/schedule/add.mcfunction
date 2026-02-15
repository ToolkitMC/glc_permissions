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
$tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"⏰ Eylem zamanlandı: ","color":"green"},{"text":"$(action_id)","color":"yellow"},{"text":" → ","color":"gray"},{"text":"$(delay)","color":"aqua"},{"text":" tick sonra","color":"gray"}]

# Log
execute store result score #temp gulce_id run scoreboard players get #schedule_id gulce_id

tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"📅 Zamanlandı #","color":"gray"},{"score":{"name":"#temp","objective":"gulce_id"},"color":"yellow"}]
