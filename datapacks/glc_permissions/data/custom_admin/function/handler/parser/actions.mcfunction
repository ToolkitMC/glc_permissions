# ═══════════════════════════════════════════════════
# Action Parser - Eylemleri ayrıştırır
# ═══════════════════════════════════════════════════

# ID var mı kontrol et
execute if data storage glc:temp {id:true} run function custom_admin:run_actions with storage glc:data actions[0]

# Action'ı işaretle
data modify storage glc:temp temp.action_processed set value 1b

# Feedback
execute if data storage glc:temp temp{feedback:"on"} run tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"Eylem başarıyla işlendi.","color":"green"}]