# ═══════════════════════════════════════════════════
# Warn: Issue Warning (v1.0.0)
# Usage: /function custom_admin:api/warn/warn
#        {player:"Ahmet",reason:"Küfür",mod:"ModAdi"}
# Permission Level: MOD+
# Strike eşikleri: 3 → kick, 5 → ban (kick+log)
# ═══════════════════════════════════════════════════

# Yetki kontrolü
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:'[GULCE] ',color:'dark_red',bold:true},{text:'🚫 Yetersiz yetki! Gerekli: ',color:'red'},{text:'mod',color:'yellow'}]
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_en] run tellraw @s [{text:'[GULCE] ',color:'dark_red',bold:true},{text:'🚫 Insufficient permission! Required: ',color:'red'},{text:'mod',color:'yellow'}]
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

# Rate limit
execute if score @s gulce_cooldown matches 1.. run function custom_admin:util/rate_limit/deny
execute if score @s gulce_cooldown matches 1.. run return 0

# Hedef oyuncu çevrimiçi mi?
$execute unless entity @a[name=$(player),limit=1] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:'[GULCE] ',color:'red',bold:true},{text:'⚠️ Oyuncu bulunamadı: ',color:'red'},{text:'$(player)',color:'yellow'}]
$execute unless entity @a[name=$(player),limit=1] if entity @s[tag=glc.lang_en] run tellraw @s [{text:'[GULCE] ',color:'red',bold:true},{text:'⚠️ Player not found: ',color:'red'},{text:'$(player)',color:'yellow'}]
$execute unless entity @a[name=$(player),limit=1] run return 0

# Strike sayacını artır
$scoreboard players add $(player) glc.strikes 1

# Storage'a uyarı kaydı ekle
$data modify storage glc:data warnings append value {player:'$(player)',reason:'$(reason)',mod:'$(mod)',timestamp:0}
execute store result storage glc:data warnings[-1].timestamp int 1 run time query gametime

# Oyuncunun güncel strike sayısını storage'a geçici yaz
$execute store result storage glc:temp temp.strike_count int 1 run scoreboard players get $(player) glc.strikes

# Uyarı mesajı oyuncuya - TR
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:'[UYARI] ',color:'red',bold:true},{text:'⚠️ Bir uyarı aldınız!',color:'yellow',bold:true}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:'  📋 Sebep: ',color:'gray'},{text:'$(reason)',color:'white'}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:'  👮 Yetkili: ',color:'gray'},{text:'$(mod)',color:'aqua'}]
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:'  🔢 Toplam uyarı: ',color:'gray'},{score:{name:'$(player)',objective:'glc.strikes'},color:'red',bold:true}]

# Uyarı mesajı oyuncuya - EN
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:'[WARNING] ',color:'red',bold:true},{text:'⚠️ You received a warning!',color:'yellow',bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:'  📋 Reason: ',color:'gray'},{text:'$(reason)',color:'white'}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:'  👮 Staff: ',color:'gray'},{text:'$(mod)',color:'aqua'}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:'  🔢 Total warnings: ',color:'gray'},{score:{name:'$(player)',objective:'glc.strikes'},color:'red',bold:true}]

# Ses efekti
$execute as @a[name=$(player)] run playsound custom_admin:mod.warn master @s ~ ~ ~ 1 1

# Admin log - tüm modlara bildir
$tellraw @a[tag=gulce_mod] [{text:'[LOG] ',color:'dark_gray'},{text:'⚠️ ',color:'yellow'},{text:'$(player)',color:'yellow'},{text:' uyarıldı → ',color:'gray'},{text:'$(reason)',color:'white'},{text:' (by ',color:'dark_gray'},{text:'$(mod)',color:'aqua'},{text:')',color:'dark_gray'}]

# Eşik kontrolleri - cezalandırma
$execute if score $(player) glc.strikes matches 3 run function custom_admin:api/warn/threshold_kick {player:'$(player)'}
$execute if score $(player) glc.strikes matches 5.. run function custom_admin:api/warn/threshold_ban {player:'$(player)'}

# Cooldown
scoreboard players set @s gulce_cooldown 20
