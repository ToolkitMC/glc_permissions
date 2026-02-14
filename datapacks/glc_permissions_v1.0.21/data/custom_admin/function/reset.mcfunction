playsound minecraft:block.anvil.land master @s ~ ~ ~ 4 0

# Storage'leri sil:
data remove storage mc:dialog ui
data remove storage mc:handler data
data remove storage mc:_ temp
data remove storage glc:loops config
data remove storage mc:dialog temp
data remove storage glc_menu:names temp

# Scoreboard'ları sil:
scoreboard objectives remove gulce_cooldown
scoreboard objectives remove gulce_id
scoreboard objectives remove gulce_load.dialog
scoreboard objectives remove gulce_menu
scoreboard objectives remove gulce_timer
scoreboard objectives remove gulce_trigger
scoreboard objectives remove gulce.used
scoreboard objectives remove glc.loop
scoreboard objectives remove glc_load_type

# Tag'ları sil:
tag @s remove gulce_admin

# Feedback (1.21.5-safe click_event + command)
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 4 0
tellraw @a {"text":"═══════════════════════════════","color":"dark_gray","bold":true}
tellraw @a [{"text":"[✓] ","color":"green","bold":true},{"text":"Sistem Temizlendi","color":"gold","bold":true}]
tellraw @a {"text":""}
tellraw @a [{"text":"• ","color":"gray"},{"text":"Tüm storage'lar silindi","color":"yellow"}]
tellraw @a [{"text":"• ","color":"gray"},{"text":"Tüm scoreboard'lar kaldırıldı","color":"yellow"}]
tellraw @a [{"text":"• ","color":"gray"},{"text":"Admin tag'ları temizlendi","color":"yellow"}]
tellraw @a [{"text":"[i]","color":"gold"},{"text":"Tekrar açmak için","color":"yellow"},{"text":":","extra":[{"text":" "}]},{"text":"Tıkla!","click_event":{"action":"run_command","command":"/function #glc_permissions:__setup"}}]
tellraw @a {"text":"═══════════════════════════════","color":"dark_gray","bold":true}