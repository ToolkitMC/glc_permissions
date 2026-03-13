# ═══════════════════════════════════════════════════
# Rate Limit: Unblock Player - 10sn sonra engeli kaldır
# ═══════════════════════════════════════════════════

tag @s remove glc.rate_blocked
scoreboard players set @s glc.rate_block_timer 0

# Bildirm - TR
execute if entity @s[tag=glc.lang_tr] run tellraw @s ['',{text:"[GULCE] ",color:"gold"},{text:"✅ Rate limit engeli kaldırıldı.",color:"green"}]

# Bildirim - EN
execute if entity @s[tag=glc.lang_en] run tellraw @s ['',{text:"[GULCE] ",color:"gold"},{text:"✅ Rate limit block lifted.",color:"green"}]
