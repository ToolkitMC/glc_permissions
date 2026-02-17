# ═══════════════════════════════════════════════════
# Boş İzin Listesi
# ═══════════════════════════════════════════════════

# Loading göster
tag @s add glc.show_pending
scoreboard players set @s gulce_load.dialog 4

# Bilingual v2.0.2
execute if entity @s[tag=glc.lang_tr] run data modify storage glc:ui ui set value {type:"minecraft:notice",title:{text:"❌ İzin Yok",color:"red",bold:true},body:{type:"minecraft:plain_message",contents:"§l§cHenüz hiç izin eklenmemiş.\n\n§7Ana menüden yeni izin ekleyebilirsiniz."},can_close_with_escape:1b,pause:0b,action:{label:"◀️ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}}

execute if entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:notice",title:{text:"❌ No Permissions",color:"red",bold:true},body:{type:"minecraft:plain_message",contents:"§l§cNo permissions have been added yet.\n\n§7You can add new permissions from the main menu."},can_close_with_escape:1b,pause:0b,action:{label:"◀️ Back",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}}

# Default (Turkish)
execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] run data modify storage glc:ui ui set value {type:"minecraft:notice",title:{text:"❌ İzin Yok",color:"red",bold:true},body:{type:"minecraft:plain_message",contents:"§l§cHenüz hiç izin eklenmemiş.\n\n§7Ana menüden yeni izin ekleyebilirsiniz."},can_close_with_escape:true,pause:false,action:{label:"◀️ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}}
