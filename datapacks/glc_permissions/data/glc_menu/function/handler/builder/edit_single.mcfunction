
# ═══════════════════════════════════════════════════
# Tek İzin Düzenleme (MACRO) - DÜZELTİLDİ
# ═══════════════════════════════════════════════════

# Loading göster
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 10

# İzni geçici storage'a al
$data modify storage glc:ui temp.edit_perm set from storage glc:data permissions[{id:"$(id)"}]

# Düzenleme menüsü hazırla
data modify storage glc:ui ui set value {  "type": "minecraft:multi_action",  "can_close_with_escape": true,  "pause": false,  "title": {    "text": "✏️ Düzenle",    "color": "gold"  },  "inputs": [    {      "type": "minecraft:text",      "key": "player",      "label": "Oyuncu",      "max_length": 100    },    {      "type": "minecraft:text",      "key": "permission",      "label": "İzin Adı",      "max_length": 100    },    {      "type": "minecraft:text",      "key": "level",      "label": "Seviye",      "max_length": 10    },    {      "type": "minecraft:text",      "key": "id",      "label": "ID (Salt Okunur)",      "max_length": 100,      "initial": ""    }  ],  "actions": [    {      "label": "💾 Kaydet",      "action": {        "type": "minecraft:dynamic/run_command",        "template": "/function glc_menu:handler/utils/update_permission {id:\"$(id)\",player:\"$(player)\",permission:\"$(permission)\",level:$(level)}"      }    },    {      "label": "❌ İptal",      "action": {        "type": "minecraft:run_command","command":"/trigger gulce_menu set 2"}}]}
$data modify storage glc:ui ui.inputs[3].initial set value "$(id)"

# Debug
tellraw @s[tag=gulce_debug] ["",{"text":"[GLC] ","color":"light_purple","bold":true},{"text":"Dialog gösterildi","color":"green"}]