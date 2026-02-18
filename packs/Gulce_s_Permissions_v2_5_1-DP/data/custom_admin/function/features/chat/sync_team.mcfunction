# ═══════════════════════════════════════════════════
# Chat Prefix: Sync Team (v1.0.0)
# Oyuncuyu doğru team'e atar
# permission sync ve rol atama sonrasında çağrılır
# ═══════════════════════════════════════════════════

# Önce tüm team'lerden çıkar
team leave @s

# Role göre team'e kat
team join glc.owner @s[tag=gulce_owner]
execute if entity @s[tag=gulce_mod]    unless entity @s[tag=gulce_owner] run team join glc.mod @s
execute if entity @s[tag=gulce_vip]    unless entity @s[tag=gulce_owner] unless entity @s[tag=gulce_mod] run team join glc.vip @s
execute if entity @s[tag=gulce_player] unless entity @s[tag=gulce_owner] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_vip] run team join glc.player @s
execute unless entity @s[tag=gulce_owner] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_player] run team join glc.none @s
