# ═══════════════════════════════════════════════════
# Warn: Threshold Kick (3 strike)
# Macro: {player:"Ahmet"}
# ═══════════════════════════════════════════════════

# Tüm modlara bildir
$tellraw @a[tag=gulce_mod] [{text:'[GULCE] ',color:'gold',bold:true},{text:'⚠️ ',color:'yellow'},{text:'$(player)',color:'red',bold:true},{text:' 3 uyarıya ulaştı → Sunucudan atılıyor!',color:'yellow'}]

# Oyuncuya son uyarı mesajı - TR
$execute as @a[name=$(player),tag=glc.lang_tr] run tellraw @s [{text:'[GULCE] ',color:'dark_red',bold:true},{text:'🚫 3 uyarı limitine ulaştınız! Sunucudan atılıyorsunuz.',color:'red',bold:true}]
# Oyuncuya son uyarı mesajı - EN
$execute as @a[name=$(player),tag=glc.lang_en] run tellraw @s [{text:'[GULCE] ',color:'dark_red',bold:true},{text:'🚫 You reached 3 warnings! You are being kicked.',color:'red',bold:true}]

# Ses - tüm sunucuya
execute as @a at @s run playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 0.3 1.5

# Kick
$kick $(player) §c⚠ 3 Uyarı / 3 Warnings §7- §fGULCE Admin System

# Log
$data modify storage glc:log warn append value {type:'threshold_kick',player:'$(player)',timestamp:0}
execute store result storage glc:log warn[-1].timestamp int 1 run time query gametime
$execute as @a[name=$(player)] run playsound custom_admin:mod.kick master @s ~ ~ ~ 1 1
