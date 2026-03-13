# ═══════════════════════════════════════════════════
# VIP Kit: Entry Point (v2.5.7)
# Permission: VIP+
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[KIT] ",color:"red"},{text:"🚫 VIP+ gerekli!",color:"red"}]
execute unless entity @s[tag=gulce_vip] unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

function custom_admin:features/vip/kit_cooldown_check
