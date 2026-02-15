# ═══════════════════════════════════════════════════
# Execute Action - Eylem yürütücü (MACRO)
# ═══════════════════════════════════════════════════

# Eylemi storage'dan al
$data modify storage glc:temp temp.exec_action set from storage glc:data actions[{id:"$(id)"}]

# Eylem var mı kontrol
$execute unless data storage glc:temp temp.exec_action run function custom_admin:util/feedback/error {message:"Eylem bulunamadı: $(id)"}
execute unless data storage glc:temp temp.exec_action run return 0

# Parametreleri geçici storage'a kopyala
data modify storage glc:temp temp.params set from storage glc:temp temp.exec_action.params

# Tipine göre uygun fonksiyonu çağır
execute if data storage glc:temp temp.exec_action{type:"teleport"} run function custom_admin:handler/execute/types/teleport
execute if data storage glc:temp temp.exec_action{type:"message"} run function custom_admin:handler/execute/types/message
execute if data storage glc:temp temp.exec_action{type:"sound"} run function custom_admin:handler/execute/types/sound
execute if data storage glc:temp temp.exec_action{type:"particle"} run function custom_admin:handler/execute/types/particle
execute if data storage glc:temp temp.exec_action{type:"title"} run function custom_admin:handler/execute/types/title
execute if data storage glc:temp temp.exec_action{type:"summon"} run function custom_admin:handler/execute/types/summon
execute if data storage glc:temp temp.exec_action{type:"command"} run function custom_admin:handler/execute/types/command
execute if data storage glc:temp temp.exec_action{type:"function"} run function custom_admin:handler/execute/types/function_call
execute if data storage glc:temp temp.exec_action{type:"clear"} run function custom_admin:handler/execute/types/clear
execute if data storage glc:temp temp.exec_action{type:"gamemode"} run function custom_admin:handler/execute/types/gamemode
execute if data storage glc:temp temp.exec_action{type:"effect"} run function custom_admin:handler/execute/types/effect
execute if data storage glc:temp temp.exec_action{type:"give"} run function custom_admin:handler/execute/types/give
execute if data storage glc:temp temp.exec_action{type:"givenbt"} run function custom_admin:handler/execute/types/givenbt

# Success feedback
$function custom_admin:util/feedback/success {message:"Eylem çalıştırıldı: $(id)"}

# Admin log (sadece admin'lere, spam değil)
$execute as @a[tag=gulce_admin,limit=1] run tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"Eylem: ","color":"gray"},{"text":"$(id)","color":"yellow"},{"text":" → ","color":"gray"},{"selector":"@s","color":"aqua"}]