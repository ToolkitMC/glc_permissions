# ═══════════════════════════════════════════════════
# Chat Prefix: Apply Tags (v1.0.0)
# Oyuncunun rolüne göre chat prefix tag'ini uygular
# Her permission sync'te çağrılır
# ═══════════════════════════════════════════════════

# Önce eski prefix tag'lerini temizle
tag @s remove glc.prefix_owner
tag @s remove glc.prefix_mod
tag @s remove glc.prefix_vip
tag @s remove glc.prefix_player
tag @s remove glc.prefix_none

# Role göre prefix tag ata
tag @s[tag=gulce_owner] add glc.prefix_owner
execute if entity @s[tag=gulce_mod]    unless entity @s[tag=gulce_owner] run tag @s add glc.prefix_mod
execute if entity @s[tag=gulce_vip]    unless entity @s[tag=gulce_owner] unless entity @s[tag=gulce_mod] run tag @s add glc.prefix_vip
execute if entity @s[tag=gulce_player] unless entity @s[tag=gulce_owner] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_vip] run tag @s add glc.prefix_player
execute unless entity @s[tag=gulce_owner] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_player] run tag @s add glc.prefix_none
