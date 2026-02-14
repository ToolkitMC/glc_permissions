# ═══════════════════════════════════════════════════
# Boş Zamanlama Listesi
# ═══════════════════════════════════════════════════

data modify storage mc:dialog ui set value {type:"minecraft:notice",title:{"text":"❌ Görev Yok","color":"red","bold":true},body:{type:"minecraft:plain_message",contents:"§l§cHenüz hiç zamanlama eklenmemiş.\n\n§7Ana menüden yeni zamanlama ekleyebilirsiniz."},can_close_with_escape:true,pause:false,action:{label:"◀️ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 6"}}}

function glc_menu:handler/dialog/show