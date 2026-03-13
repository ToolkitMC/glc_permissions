# ═══════════════════════════════════════════════════
# Spectate: Watch Player (v2.5.7)
# Usage: /function custom_admin:features/spectate/watch {player:"OyuncuAdi"}
# Permission: MOD+
# ═══════════════════════════════════════════════════

execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[SPECTATE] ",color:"red"},{text:"🚫 MOD+ gerekli!",color:"red"}]
execute unless entity @s[tag=gulce_mod] unless entity @s[tag=gulce_admin] unless entity @s[tag=gulce_owner] run return 0

$execute unless entity @a[name=$(player),limit=1] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[SPECTATE] ",color:"red"},{text:"Oyuncu bulunamadı: ",color:"gray"},{text:"$(player)",color:"yellow"}]
$execute unless entity @a[name=$(player),limit=1] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[SPECTATE] ",color:"red"},{text:"Player not found: ",color:"gray"},{text:"$(player)",color:"yellow"}]
$execute unless entity @a[name=$(player),limit=1] run return 0

# Gamemode spectator + tp
gamemode spectator @s
$execute at @a[name=$(player),limit=1] run teleport @s @a[name=$(player),limit=1]
tag @s add glc.spectating

execute if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[SPECTATE] ",color:"light_purple",bold:true},{text:"👁 İzleme başladı. ",color:"gray"},{text:"[ÇIKIŞ]",color:"red",bold:true,click_event:{action:"run_command",command:"/function custom_admin:features/spectate/stop"}}]
execute if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[SPECTATE] ",color:"light_purple",bold:true},{text:"👁 Spectating. ",color:"gray"},{text:"[STOP]",color:"red",bold:true,click_event:{action:"run_command",command:"/function custom_admin:features/spectate/stop"}}]
execute if entity @s[tag=glc.lang_de] run tellraw @s [{text:"[SPECTATE] ",color:"light_purple",bold:true},{text:"👁 Beobachtung läuft. ",color:"gray"},{text:"[STOPP]",color:"red",bold:true,click_event:{action:"run_command",command:"/function custom_admin:features/spectate/stop"}}]
execute at @s run playsound minecraft:entity.bat.takeoff master @s ~ ~ ~ 1 1
