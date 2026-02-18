playsound minecraft:block.anvil.land master @s ~ ~ ~ 4 0

# Storage'leri sil:
data remove storage glc:ui ui
data remove storage glc:data data
data remove storage glc:temp temp
data remove storage glc:ui temp
data remove storage glc:config settings
data remove storage glc:sys loaded
data remove storage glc_menu:names temp

# Scoreboard'ları sil:
scoreboard objectives remove gulce_cooldown
scoreboard objectives remove gulce_id
scoreboard objectives remove gulce_load.dialog
scoreboard objectives remove gulce_menu
scoreboard objectives remove gulce_trigger
scoreboard objectives remove gulce.used
scoreboard objectives remove glc.used.mod_kit
scoreboard objectives remove glc.used.admin_panel
scoreboard objectives remove glc.used.quick_action
scoreboard objectives remove glc.used.spy
scoreboard objectives remove glc.used.broadcast
scoreboard objectives remove gulce_nametag
scoreboard objectives remove gulce_permission_level
scoreboard objectives remove global
scoreboard objectives remove glc.timer
scoreboard objectives remove glc_load_type
scoreboard objectives remove glc.rate_exec
scoreboard objectives remove glc.rate_bc
scoreboard objectives remove glc.rate_block_timer
scoreboard objectives remove glc.strikes

# Tag'ları sil (tüm oyunculardan):
tag @a remove gulce_admin
tag @a remove gulce_vip
tag @a remove gulce_mod
tag @a remove gulce_owner
tag @a remove glc.joined
tag @a remove glc.lang_tr
tag @a remove glc.lang_en
tag @a remove glc.lang_de
tag @a remove closed.glc
tag @a remove gulce_debug
tag @a remove ca.freezed
tag @a remove glc.rate_blocked
tag @a remove glc.show_pending

# Feedback
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 4 0
execute as @a[tag=glc.lang_tr] run tellraw @s {text:"═══════════════════════════════",color:"dark_gray",bold:true}
execute as @a[tag=glc.lang_en] run tellraw @s {text:"═══════════════════════════════",color:"dark_gray",bold:true}
execute as @a[tag=glc.lang_tr] run tellraw @s [{text:"[✓] ",color:"green",bold:true},{text:"Sistem Temizlendi",color:"gold",bold:true}]
execute as @a[tag=glc.lang_en] run tellraw @s [{text:"[✓] ",color:"green",bold:true},{text:"System Cleared",color:"gold",bold:true}]
execute as @a[tag=glc.lang_tr] run tellraw @s [{text:"• ",color:"gray"},{text:"Tüm storage'lar silindi",color:"yellow"}]
execute as @a[tag=glc.lang_en] run tellraw @s [{text:"• ",color:"gray"},{text:"All storages removed",color:"yellow"}]
execute as @a[tag=glc.lang_tr] run tellraw @s [{text:"• ",color:"gray"},{text:"Tüm scoreboard'lar kaldırıldı",color:"yellow"}]
execute as @a[tag=glc.lang_en] run tellraw @s [{text:"• ",color:"gray"},{text:"All scoreboards removed",color:"yellow"}]
execute as @a[tag=glc.lang_tr] run tellraw @s [{text:"• ",color:"gray"},{text:"Admin tag'ları temizlendi",color:"yellow"}]
execute as @a[tag=glc.lang_en] run tellraw @s [{text:"• ",color:"gray"},{text:"Admin tags cleared",color:"yellow"}]
execute as @a run tellraw @s [{text:"[i]",color:"aqua"},":"," ",{text:"Tekrar başlatmak için: ",color:"yellow"},{text:"/function glc_permissions:setup",color:"aqua"}]
execute as @a[tag=glc.lang_tr] run tellraw @s {text:"═══════════════════════════════",color:"dark_gray",bold:true}
execute as @a[tag=glc.lang_en] run tellraw @s {text:"═══════════════════════════════",color:"dark_gray",bold:true}
