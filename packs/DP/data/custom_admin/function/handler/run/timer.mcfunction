# ═══════════════════════════════════════════════════
# Timer - Aynı anda çalıştırmayı engeller (30 tick)
# ═══════════════════════════════════════════════════

# Timer kontrolü
scoreboard players add #global_timer glc.timer 1

# 30 tick kontrolü
execute if score #global_timer glc.timer matches 30.. run scoreboard players set #global_timer glc.timer 0

# Timer aktif iken engelle
execute if score #global_timer glc.timer matches 1..29 run data modify storage glc:temp temp.timer_active set value 1b

# Timer sıfırlandığında temizle
execute if score #global_timer glc.timer matches 0 run data remove storage glc:temp temp.timer_active