# ═══════════════════════════════════════════════════
# Warn: Threshold Ban (5+ strike)
# Macro: {player:"Ahmet"}
# NOT: Datapack'te gerçek /ban yok (OP gerektirir)
# Yöntem: glc.banned tag + her tick kick
# ═══════════════════════════════════════════════════

# Ban tag'i ekle
$tag @a[name=$(player),limit=1] add glc.banned

# Tüm modlara bildir
$tellraw @a[tag=gulce_mod] [{text:'[GULCE] ',color:'dark_red',bold:true},{text:'🔨 ',color:'red'},{text:'$(player)',color:'red',bold:true},{text:' 5+ uyarıya ulaştı → BANLANDI!',color:'red'}]

# Tüm sunucuya duyur
$tellraw @a [{text:'[GULCE] ',color:'dark_red',bold:true},{text:'$(player)',color:'red',bold:true},{text:' sunucudan banlandı.',color:'gray'}]

# Ses
execute as @a at @s run playsound minecraft:entity.ender_dragon.death master @a ~ ~ ~ 0.5 1

# Oyuncuya mesaj
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:'[GULCE] ',color:'dark_red',bold:true},{text:'🔨 BANLANDI! 5 veya daha fazla uyarıya ulaştınız.',color:'red',bold:true}]
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:'[GULCE] ',color:'dark_red',bold:true},{text:'🔨 BANNED! You reached 5 or more warnings.',color:'red',bold:true}]

# Kick
$kick $(player) §4§l🔨 BANLANDINIZ / YOU ARE BANNED §r§c- §fGULCE Admin System §7(5+ uyarı / warnings)

# Log
$data modify storage glc:log warn append value {type:'threshold_ban',player:'$(player)',timestamp:0}
execute store result storage glc:log warn[-1].timestamp int 1 run time query gametime
