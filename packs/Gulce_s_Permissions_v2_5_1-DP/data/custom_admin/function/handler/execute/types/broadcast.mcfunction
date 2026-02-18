# ═══════════════════════════════════════════════════
# Broadcast Action - Tüm sunucuya mesaj gönderir
# params: {message:"JSON veya düz metin", prefix:"[DUYURU]", color:"gold"}
# player: Kullanılmaz (sunucu geneli)
# Permission Level: MOD (Level 3+)
# ═══════════════════════════════════════════════════

# Yetki kontrolü - sadece MOD+ kullanabilir
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s ['',{text:"[GULCE] ",color:"dark_red",bold:true},{text:"🚫 Yetersiz yetki! Gerekli: ",color:"red"},{text:"mod",color:"yellow"}]
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s ['',{text:"[GULCE] ",color:"dark_red",bold:true},{text:"🚫 Insufficient permission! Required: ",color:"red"},{text:"mod",color:"yellow"}]
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_owner] run return 0

# Rate limit kontrolü
execute if score @s gulce_cooldown matches 1.. run function custom_admin:util/rate_limit/deny
execute if score @s gulce_cooldown matches 1.. run return 0

# Mesaj ve prefix'i çek
data modify storage glc:temp temp.bc_message set from storage glc:temp temp.params.message
data modify storage glc:temp temp.bc_prefix set from storage glc:temp temp.params.prefix
data modify storage glc:temp temp.bc_color set from storage glc:temp temp.params.color

# Fallback: text alanına da bak
execute unless data storage glc:temp temp.bc_message run data modify storage glc:temp temp.bc_message set from storage glc:temp temp.params.text

# Yayınla
function custom_admin:handler/execute/types/broadcast_run with storage glc:temp temp

# Cooldown uygula (broadcast için daha uzun - spam önleme)
scoreboard players set @s gulce_cooldown 60

# Rate limit kaydı
scoreboard players add @s glc.rate_bc 1

# Log
execute as @a[tag=gulce_debug,tag=glc.lang_tr] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"📢 Broadcast gönderildi",color:"gray"},{text:" → @a",color:"aqua"}]
execute as @a[tag=gulce_debug,tag=glc.lang_en] run tellraw @s ['',{text:"[GULCE] ",color:"gold",bold:true},{text:"📢 Broadcast sent",color:"gray"},{text:" → @a",color:"aqua"}]
