# ═══════════════════════════════════════════════════
# Execute Action - Eylem yürütücü (MACRO)
# ═══════════════════════════════════════════════════

# Eylemi storage'dan al
$data modify storage glc:temp temp.exec_action set from storage glc:data actions[{id:"$(id)"}]

# Enabled kontrolü - devre dışı eylemler çalışmaz
execute if data storage glc:temp temp.exec_action{enabled:0b} if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"⛔ Eylem devre dışı!",color:"red"}]
execute if data storage glc:temp temp.exec_action{enabled:0b} if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"red",bold:true},{text:"⛔ Action is disabled!",color:"red"}]
execute if data storage glc:temp temp.exec_action{enabled:0b} run return 0

# Eylem var mı kontrol (Bilingual v2.5.4)
$execute unless data storage glc:temp temp.exec_action if entity @s[tag=glc.lang_tr] run function custom_admin:util/feedback/error {message:"Eylem bulunamadı: $(id)"}
$execute unless data storage glc:temp temp.exec_action if entity @s[tag=glc.lang_en] run function custom_admin:util/feedback/error {message:"Action not found: $(id)"}
$execute unless data storage glc:temp temp.exec_action unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run function custom_admin:util/feedback/error {message:"Eylem bulunamadı: $(id)"}
execute unless data storage glc:temp temp.exec_action run return 0

# Parametreleri geçici storage'a kopyala
data modify storage glc:temp temp.params set from storage glc:temp temp.exec_action.params

# Tipine göre uygun fonksiyonu çağır
execute if data storage glc:temp temp.exec_action{type:'teleport'} run function custom_admin:handler/execute/types/teleport
execute if data storage glc:temp temp.exec_action{type:'message'} run function custom_admin:handler/execute/types/message
execute if data storage glc:temp temp.exec_action{type:'sound'} run function custom_admin:handler/execute/types/sound
execute if data storage glc:temp temp.exec_action{type:'particle'} run function custom_admin:handler/execute/types/particle
execute if data storage glc:temp temp.exec_action{type:'title'} run function custom_admin:handler/execute/types/title
execute if data storage glc:temp temp.exec_action{type:'summon'} run function custom_admin:handler/execute/types/summon
execute if data storage glc:temp temp.exec_action{type:'command'} run function custom_admin:handler/execute/types/command
execute if data storage glc:temp temp.exec_action{type:'function'} run function custom_admin:handler/execute/types/function_call
execute if data storage glc:temp temp.exec_action{type:'clear'} run function custom_admin:handler/execute/types/clear
execute if data storage glc:temp temp.exec_action{type:'gamemode'} run function custom_admin:handler/execute/types/gamemode
execute if data storage glc:temp temp.exec_action{type:'effect'} run function custom_admin:handler/execute/types/effect
execute if data storage glc:temp temp.exec_action{type:'give'} run function custom_admin:handler/execute/types/give
execute if data storage glc:temp temp.exec_action{type:'givenbt'} run function custom_admin:handler/execute/types/givenbt
execute if data storage glc:temp temp.exec_action{type:'weather'} run function custom_admin:handler/execute/types/weather
execute if data storage glc:temp temp.exec_action{type:'time'} run function custom_admin:handler/execute/types/time
execute if data storage glc:temp temp.exec_action{type:'dialog'} run function custom_admin:handler/execute/types/dialog
execute if data storage glc:temp temp.exec_action{type:'chain'} run function custom_admin:handler/execute/types/chain
# YENİ EYLEMLER (v2.5.4)
execute if data storage glc:temp temp.exec_action{type:'xp'} run function custom_admin:handler/execute/types/xp
execute if data storage glc:temp temp.exec_action{type:'kick'} run function custom_admin:handler/execute/types/kick
execute if data storage glc:temp temp.exec_action{type:'setblock'} run function custom_admin:handler/execute/types/setblock

# YENİ EYLEMLER (v2.5.4)
execute if data storage glc:temp temp.exec_action{type:'broadcast'} run function custom_admin:handler/execute/types/broadcast

# YENİ EYLEMLER (v2.5.4)
# custom: Herhangi bir fonksiyonu macro args ile çağırır
execute if data storage glc:temp temp.exec_action{type:'custom'} run function custom_admin:handler/execute/types/custom
#execute if data storage glc:temp temp.exec_action{type:'multi_cmd'} run function custom_admin:handler/execute/types/multi/run
execute if data storage glc:temp temp.exec_action{type:'multi_cmd'} run function custom_admin:handler/execute/types/multi/run
execute if data storage glc:temp temp.exec_action{type:'multi_fn'} run function custom_admin:handler/execute/types/multi/run
execute if data storage glc:temp temp.exec_action{type:'multi_act'} run function custom_admin:handler/execute/types/multi/run

# PERF FIX: Success feedback sadece debug modda (tick'de spam olmasın)
$execute if entity @s[tag=gulce_debug] if entity @s[tag=glc.lang_tr] run function custom_admin:util/feedback/success {message:"Eylem çalıştırıldı: $(id)"}
$execute if entity @s[tag=gulce_debug] if entity @s[tag=glc.lang_en] run function custom_admin:util/feedback/success {message:"Action executed: $(id)"}

# Cooldown uygula (v2.5.4 - Configurable)
execute store result score @s gulce_cooldown run data get storage glc:config cooldowns.action_execute

# Rate limit sayacını artır (v2.5.4)
scoreboard players add @s glc.rate_exec 1

# PERF FIX: Admin log sadece debug modda
$execute as @a[tag=gulce_debug,tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Eylem: ",color:"gray"},{text:"$(id)",color:"yellow"},{text:" → ",color:"gray"},{selector:"@s",color:"aqua"}]
$execute as @a[tag=gulce_debug,tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Eylem: ",color:"gray"},{text:"$(id)",color:"yellow"},{text:" → ",color:"gray"},{selector:"@s",color:"aqua"}]
