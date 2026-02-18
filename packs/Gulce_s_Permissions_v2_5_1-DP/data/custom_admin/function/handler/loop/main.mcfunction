# ═══════════════════════════════════════════════════
# GULCE Admin Power - Main Tick Loop (v1.2.2)
# Basitleştirildi - glc.loop kaldırıldı
# ═══════════════════════════════════════════════════

# Timer kontrolü (her 20 tick = 1 saniye)
execute if score #custom_timer glc.timer matches 0 run function custom_admin:handler/timer

# Cooldown azaltma
execute as @a[scores={gulce_cooldown=1..}] run scoreboard players remove @s gulce_cooldown 1

# Rate limit kontrolü (v2.5.4)
# Her 20 tick'te bir çalıştır (timer sıfırlandığında)
execute if score #custom_timer glc.timer matches 0 run function custom_admin:util/rate_limit/check

# v2.4.0: Banlı oyuncu kontrolü
execute if score #custom_timer glc.timer matches 0 run function custom_admin:api/warn/ban_enforce

# Zamanlayıcı sistemi (sadece aktif schedule varsa)
execute if score #has_scheduled gulce_id matches 1.. run function custom_admin:handler/schedule/tick

# Loop counter (0-19 arası döngü)
scoreboard players add #custom_timer glc.timer 1
execute if score #custom_timer glc.timer matches 20.. run scoreboard players set #custom_timer glc.timer 0