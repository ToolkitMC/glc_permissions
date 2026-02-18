# ═══════════════════════════════════════════════════
# Auto Announce Tick Wrapper (v1.0.0)
# Storage'dan interval okur, sayacı ayarlar
# ═══════════════════════════════════════════════════
execute unless data storage glc:config auto_announce run return 0
execute store result score #ann_interval glc.timer run data get storage glc:config auto_announce.interval 1
execute if score #ann_interval glc.timer matches 1.. store result score #auto_ann_tick glc.timer run scoreboard players get #ann_interval glc.timer
execute unless score #ann_interval glc.timer matches 1.. run scoreboard players set #auto_ann_tick glc.timer 1200
function custom_admin:handler/automation/auto_announce
