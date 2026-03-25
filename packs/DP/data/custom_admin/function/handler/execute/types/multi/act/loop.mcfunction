# ═══════════════════════════════════════════════════
# Multi Drain — Zincirleme eylem çalıştırıcı (Recursive)
# ═══════════════════════════════════════════════════

# 1. Kuyruktan bir adım al
data modify storage glc:temp multi.step set from storage glc:temp multi.queue[0]

# 2. Player belirtilmemişse multi.player'dan miras al
execute unless data storage glc:temp multi.step.player run \
    data modify storage glc:temp multi.step.player set from storage glc:temp multi.player

# 3. Geçici exec_action ve params'e kopyala (mevcut sistemle uyumlu)
data modify storage glc:temp temp.exec_action set from storage glc:temp multi.step
data modify storage glc:temp temp.params set from storage glc:temp multi.step.params

# 4. Tipine göre ilgili handler'ı çağır (senin ana execute sisteminle aynı path)
execute if data storage glc:temp temp.exec_action{type:"teleport"} run function custom_admin:handler/execute/types/teleport
execute if data storage glc:temp temp.exec_action{type:"message"} run function custom_admin:handler/execute/types/message
execute if data storage glc:temp temp.exec_action{type:"sound"} run function custom_admin:handler/execute/types/sound
execute if data storage glc:temp temp.exec_action{type:"particle"} run function custom_admin:handler/execute/types/particle
execute if data storage glc:temp temp.exec_action{type:"title"} run function custom_admin:handler/execute/types/title
execute if data storage glc:temp temp.exec_action{type:"summon"} run function custom_admin:handler/execute/types/summon
execute if data storage glc:temp temp.exec_action{type:"command"} run function custom_admin:handler/execute/types/command
execute if data storage glc:temp temp.exec_action{type:"function"} run function custom_admin:handler/execute/types/function_call
execute if data storage glc:temp temp.exec_action{type:"effect"} run function custom_admin:handler/execute/types/effect
execute if data storage glc:temp temp.exec_action{type:"give"} run function custom_admin:handler/execute/types/give
execute if data storage glc:temp temp.exec_action{type:"clear"} run function custom_admin:handler/execute/types/clear
execute if data storage glc:temp temp.exec_action{type:"gamemode"} run function custom_admin:handler/execute/types/gamemode
execute if data storage glc:temp temp.exec_action{type:"givenbt"} run function custom_admin:handler/execute/types/givenbt
execute if data storage glc:temp temp.exec_action{type:"weather"} run function custom_admin:handler/execute/types/weather
execute if data storage glc:temp temp.exec_action{type:"time"} run function custom_admin:handler/execute/types/time
execute if data storage glc:temp temp.exec_action{type:"dialog"} run function custom_admin:handler/execute/types/dialog
execute if data storage glc:temp temp.exec_action{type:"xp"} run function custom_admin:handler/execute/types/xp
execute if data storage glc:temp temp.exec_action{type:"kick"} run function custom_admin:handler/execute/types/kick
execute if data storage glc:temp temp.exec_action{type:"setblock"} run function custom_admin:handler/execute/types/setblock
execute if data storage glc:temp temp.exec_action{type:"broadcast"} run function custom_admin:handler/execute/types/broadcast
execute if data storage glc:temp temp.exec_action{type:"custom"} run function custom_admin:handler/execute/types/custom

# 5. Adımı kuyruktan sil
data remove storage glc:temp multi.queue[0]

# 6. Kuyrukta hala adım varsa recursive devam et
execute if data storage glc:temp multi.queue[0] run function custom_admin:handler/execute/types/multi/act/loop