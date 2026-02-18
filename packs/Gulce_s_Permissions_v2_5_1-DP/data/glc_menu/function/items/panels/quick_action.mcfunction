# ═══════════════════════════════════════════════════
# QUICK ACTION Panel - Son Eylemi Tekrar Çalıştır (MOD+)
# Son kullanılan eylem ID'sini storage'dan okur
# ═══════════════════════════════════════════════════

execute unless score @s gulce_permission_level matches 3.. run return fail

# Son eylem var mı?
execute store success score #has_last glc.timer if data storage glc:data last_action[]

tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

# ── TR ────────────────────────────────────────────
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:["",{text:"⚡ HIZLI EYLEM",color:"yellow",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Son çalıştırılan eylemi bir tıkla tekrarla\n§8veya eylem listesine git"},can_close_with_escape:1b,pause:0b,columns:1,actions:[]}

# Son eylem butonu (varsa)
execute if score #has_last glc.timer matches 1 if entity @s[tag=glc.lang_tr] run function glc_menu:items/panels/quick_last_btn_tr
execute if score #has_last glc.timer matches 0 if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"⚠ Henüz eylem çalıştırılmadı",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}

execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"📋 Eylem Listesi",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"▶ ID ile Çalıştır",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"▶ Eylem Çalıştır",inputs:[{type:"minecraft:text",key:"id",label:"Eylem ID",max_length:64,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"▶ Çalıştır",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:handler/execute/action {id:\"$(id)\"}"}}]}}}
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui.actions append value {label:"◀ Ana Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# ── EN ────────────────────────────────────────────
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:["",{text:"⚡ QUICK ACTION",color:"yellow",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Repeat the last action with one click\n§8or go to the action list"},can_close_with_escape:1b,pause:0b,columns:1,actions:[]}

execute if score #has_last glc.timer matches 1 if entity @s[tag=glc.lang_en] run function glc_menu:items/panels/quick_last_btn_en
execute if score #has_last glc.timer matches 0 if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"⚠ No action run yet",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📋 Action List",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"▶ Run by ID",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"▶ Run Action",inputs:[{type:"minecraft:text",key:"id",label:"Action ID",max_length:64,label_visible:1b}],can_close_with_escape:1b,pause:0b,actions:[{label:"▶ Run",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:handler/execute/action {id:\"$(id)\"}"}}]}}}
execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀ Main Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

# Fallback
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:["",{text:"⚡ HIZLI EYLEM",color:"yellow",bold:true}],body:{type:"minecraft:plain_message",contents:"§7Son eylemi tekrarla"},can_close_with_escape:1b,pause:0b,columns:1,actions:[]}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"📋 Eylem Listesi",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui.actions append value {label:"◀ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

function glc_menu:handler/dialog/show with storage glc:ui ui
