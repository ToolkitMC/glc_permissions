# ═══════════════════════════════════════════════════
# Confirm: Resolve (v2.5.8)
# glc.confirm trigger'ından çağrılır
# 1 = onayla, 2 = iptal
# ═══════════════════════════════════════════════════

# Skoru geçici yere kopyala
scoreboard players operation #glc.confirm_val glc.timer = @s glc.confirm

# Trigger'ı hemen sıfırla - donmayı önle
scoreboard players set @s glc.confirm 0
scoreboard players enable @s glc.confirm
tag @s remove glc.confirm_pending

# Kopyadan kontrol et
execute if score #glc.confirm_val glc.timer matches 1 run function custom_admin:handler/confirm/execute
execute if score #glc.confirm_val glc.timer matches 2 run function custom_admin:handler/confirm/cancel

# Geçici skoru temizle
scoreboard players reset #glc.confirm_val glc.timer
