# ═══════════════════════════════════════════════════
# Rate Limit: Global Check - 20 tick'te bir çalışır (main loop'tan)
# Kısa sürede çok fazla aksiyon tetikleyen oyuncuları yakalar
# Threshold: 10 saniyede 30+ aksiyon → geçici engel
# ═══════════════════════════════════════════════════

# Pencere sayacını artır (her çağrıda +1, 10 çağrı = 200 tick = 10 saniye)
scoreboard players add #rate_window glc.timer 1
execute if score #rate_window glc.timer matches 10.. run function custom_admin:util/rate_limit/reset_counters
execute if score #rate_window glc.timer matches 10.. run scoreboard players set #rate_window glc.timer 0

# Abuse kontrolü - 10sn içinde 30+ action_execute
execute as @a[scores={glc.rate_exec=30..},tag=!glc.rate_blocked] run function custom_admin:util/rate_limit/block_player

# Broadcast abuse - 10sn içinde 5+ broadcast
execute as @a[scores={glc.rate_bc=5..},tag=!glc.rate_blocked] run function custom_admin:util/rate_limit/block_player

# Bloklanmış oyuncuların engel sayacını artır
execute as @a[tag=glc.rate_blocked] run scoreboard players add @s glc.rate_block_timer 1

# 200 tick sonra engeli kaldır
execute as @a[tag=glc.rate_blocked,scores={glc.rate_block_timer=200..}] run function custom_admin:util/rate_limit/unblock_player
