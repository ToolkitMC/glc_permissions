# ═══════════════════════════════════════════════════
# Confirm: Request Dialog (v2.5.8)
# Macro: {action:"fonksiyon_yolu", action_tr:"TR", action_en:"EN", action_de:"DE"}
playsound custom_admin:ui.open master @s ~ ~ ~ 1 1
# ═══════════════════════════════════════════════════

# Bekleyen işlemi storage'a kaydet
$data modify storage glc:confirm pending.action set value "$(action)"

# Tag ekle (tick'te enable yapılması için)
tag @s add glc.confirm_pending

# Dialog - TR
$execute if entity @s[tag=glc.lang_tr] run dialog show @s {type:"minecraft:multi_action",title:['',{text:"⚠ ONAY GEREKLİ",color:"red",bold:true}],body:{type:"minecraft:plain_message",contents:"§cBu işlem geri alınamaz!\n\n§f$(action_tr)"},can_close_with_escape:1b,pause:0b,actions:[{label:"§a✅ Onayla",action:{type:"minecraft:run_command",command:"/trigger glc.confirm set 1"}},{label:"§c❌ İptal",action:{type:"minecraft:run_command",command:"/trigger glc.confirm set 2"}}]}

# Dialog - EN
$execute if entity @s[tag=glc.lang_en] run dialog show @s {type:"minecraft:multi_action",title:['',{text:"⚠ CONFIRMATION REQUIRED",color:"red",bold:true}],body:{type:"minecraft:plain_message",contents:"§cThis action cannot be undone!\n\n§f$(action_en)"},can_close_with_escape:1b,pause:0b,actions:[{label:"§a✅ Confirm",action:{type:"minecraft:run_command",command:"/trigger glc.confirm set 1"}},{label:"§c❌ Cancel",action:{type:"minecraft:run_command",command:"/trigger glc.confirm set 2"}}]}

# Dialog - DE
$execute if entity @s[tag=glc.lang_de] run dialog show @s {type:"minecraft:multi_action",title:['',{text:"⚠ BESTÄTIGUNG ERFORDERLICH",color:"red",bold:true}],body:{type:"minecraft:plain_message",contents:"§cDiese Aktion kann nicht rückgängig gemacht werden!\n\n§f$(action_de)"},can_close_with_escape:1b,pause:0b,actions:[{label:"§a✅ Bestätigen",action:{type:"minecraft:run_command",command:"/trigger glc.confirm set 1"}},{label:"§c❌ Abbrechen",action:{type:"minecraft:run_command",command:"/trigger glc.confirm set 2"}}]}

# Fallback - dil tag'i yoksa TR
$execute unless entity @s[tag=glc.lang_tr] unless entity @s[tag=glc.lang_en] unless entity @s[tag=glc.lang_de] run dialog show @s {type:"minecraft:multi_action",title:['',{text:"⚠ ONAY GEREKLİ",color:"red",bold:true}],body:{type:"minecraft:plain_message",contents:"§cBu işlem geri alınamaz!\n\n§f$(action_tr)"},can_close_with_escape:1b,pause:0b,actions:[{label:"§a✅ Onayla",action:{type:"minecraft:run_command",command:"/trigger glc.confirm set 1"}},{label:"§c❌ İptal",action:{type:"minecraft:run_command",command:"/trigger glc.confirm set 2"}}]}
