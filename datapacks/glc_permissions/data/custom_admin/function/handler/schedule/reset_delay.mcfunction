# ═══════════════════════════════════════════════════
# Tekrarlayan Eylemin Delay'ini Sıfırla
# ═══════════════════════════════════════════════════

# Delay'i remaining'e kopyala
data modify storage glc:temp temp.current_schedule.remaining set from storage glc:temp temp.current_schedule.delay

# Güncelle
function custom_admin:handler/schedule/update_remaining with storage glc:temp temp

# PERF FIX: Log sadece debug modda
execute as @a[tag=gulce_debug,tag=glc.lang_tr,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"🔄 Eylem tekrar zamanlandı",color:"yellow"}]
execute as @a[tag=gulce_debug,tag=glc.lang_en,tag=gulce_admin] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"🔄 Action rescheduled",color:"yellow"}]