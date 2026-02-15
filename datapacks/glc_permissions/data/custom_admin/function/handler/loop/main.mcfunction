# ═══════════════════════════════════════════════════
# GULCE Admin Power - Main Tick Loop (OPTIMIZED v1.1)
# Purpose: Core tick system with performance optimizations
# Permission Level: 2 (no OP required)
# Version: 1.1.0
# ═══════════════════════════════════════════════════

# Timer kontrolü (her 20 tick = 1 saniye)
execute if score #main glc.loop matches 0 run function custom_admin:handler/timer

# Cooldown azaltma (optimize edilmiş - limit/sort kaldırıldı)
execute as @a[scores={gulce_cooldown=1..}] run scoreboard players remove @s gulce_cooldown 1

# Zamanlayıcı sistemi (sadece aktif schedule varsa)
execute if score #has_scheduled gulce_id matches 1.. run function custom_admin:handler/schedule/tick

# Loop counter (0-19 arası döngü)
scoreboard players add #main glc.loop 1
execute if score #main glc.loop matches 20.. run scoreboard players set #main glc.loop 0