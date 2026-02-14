# ═══════════════════════════════════════════════════
# Zamanlamayı Yürüt (MACRO)
# ═══════════════════════════════════════════════════

# Eylemi çalıştır
$execute as $(player) run function custom_admin:execute/action {id:"$(action_id)"}

# Log
$tellraw @a[tag=gulce_admin] ["",{"text":"[GLC] ","color":"light_purple","bold":true},{"text":"⏰ Zamanlama: ","color":"gray"},{"text":"$(action_id)","color":"yellow"},{"text":" → ","color":"gray"},{"text":"$(player)","color":"aqua"}]