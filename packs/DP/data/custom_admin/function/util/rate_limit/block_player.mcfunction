# ═══════════════════════════════════════════════════
# Rate Limit: Block Player - Abuse tespit edildi
# @s = bloklanacak oyuncu
# ═══════════════════════════════════════════════════

# Tag ekle
tag @s add glc.rate_blocked
scoreboard players set @s glc.rate_block_timer 1

# Büyük cooldown ver (200 tick = 10 saniye)
scoreboard players set @s gulce_cooldown 200

# Oyuncuya bildir - TR
execute if entity @s[tag=glc.lang_tr] run tellraw @s ['',{text:"[GULCE] ",color:"dark_red",bold:true},{text:"🚫 Rate limit aşıldı!",color:"red",bold:true}]
execute if entity @s[tag=glc.lang_tr] run tellraw @s ['',{text:"  Çok fazla istek gönderdiniz.",color:"gray"},{text:" 10 saniye beklemeniz gerekiyor.",color:"red"}]

# Oyuncuya bildir - EN
execute if entity @s[tag=glc.lang_en] run tellraw @s ['',{text:"[GULCE] ",color:"dark_red",bold:true},{text:"🚫 Rate limit exceeded!",color:"red",bold:true}]
execute if entity @s[tag=glc.lang_en] run tellraw @s ['',{text:"  Too many requests.",color:"gray"},{text:" Please wait 10 seconds.",color:"red"}]

# Admin'lere bildir
tellraw @a[tag=gulce_admin] ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"⚠️ Rate limit: ",color:"yellow"},{selector:"@s",color:"red"},{text:" engellendi (abuse tespit edildi)",color:"gray"}]

# Ses
playsound custom_admin:system.rate_limit master @s ~ ~ ~ 1 1

# Güvenlik logu - glc:log storage'a yaz
data modify storage glc:log rate_limit append value {type:"rate_block",timestamp:0}
execute store result storage glc:log rate_limit[-1].timestamp int 1 run time query gametime
execute store result storage glc:log rate_limit[-1].exec_count int 1 run scoreboard players get @s glc.rate_exec
execute store result storage glc:log rate_limit[-1].bc_count int 1 run scoreboard players get @s glc.rate_bc
