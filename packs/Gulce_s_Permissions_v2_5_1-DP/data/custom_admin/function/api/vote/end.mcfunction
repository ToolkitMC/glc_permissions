# ═══════════════════════════════════════════════════
# Vote: End Vote (v2.5.7)
# Timer dolunca (main loop) veya admin çağırınca çalışır
# ═══════════════════════════════════════════════════

execute unless data storage glc:vote active run return 0

# Sonuçları duyur
function custom_admin:api/vote/announce_results

# Temizle
data remove storage glc:vote active
tag @a remove glc.voting
scoreboard players set #vote_yes glc.timer 0
scoreboard players set #vote_no glc.timer 0
scoreboard players set #vote_timer glc.timer 0
