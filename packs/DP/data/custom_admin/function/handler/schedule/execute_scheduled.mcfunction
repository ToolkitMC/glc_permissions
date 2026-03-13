# ═══════════════════════════════════════════════════
# Zamanlanmış Eylemi Çalıştır - DÜZELTME v2.5.4
# DÜZELTME: Silme işlemi kaldırıldı, sadece işaretle
# ═══════════════════════════════════════════════════

# Action ID ve player al
data modify storage glc:temp temp.exec_id set from storage glc:temp temp.current_schedule.action_id
data modify storage glc:temp temp.exec_player set from storage glc:temp temp.current_schedule.player

# Eylemi çalıştır
function custom_admin:handler/schedule/run_action with storage glc:temp temp

# Tekrar kontrolü
execute if data storage glc:temp temp.current_schedule{repeat:1b} run function custom_admin:handler/schedule/reset_delay with storage glc:temp temp

# DÜZELTME: Tekrar değilse sadece işaretle, HEMEN SİLME!
execute unless data storage glc:temp temp.current_schedule{repeat:1b} run function custom_admin:handler/schedule/mark_for_deletion with storage glc:temp temp

# Debug log
execute if entity @s[tag=glc.lang_tr] as @a[tag=gulce_debug,limit=1] run tellraw @s [{text:"[DEBUG] ",color:"gray"},{text:"Scheduled action executed",color:"white"}]
execute if entity @s[tag=glc.lang_en] as @a[tag=gulce_debug,limit=1] run tellraw @s [{text:"[DEBUG] ",color:"gray"},{text:"Scheduled action executed",color:"white"}]
