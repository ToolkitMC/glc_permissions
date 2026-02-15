# ═══════════════════════════════════════════════════
# Buton Ekle (MACRO) - DÜZELTİLDİ
# ═══════════════════════════════════════════════════

# Alt menü oluştur - ✅ Geri butonuna tag ekle
$data modify storage glc:ui temp.button_data set value {label:"🔐 $(permission) ($(id))","width":305,action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔐 $(permission)",body:{type:"minecraft:plain_message",contents:"§l§eID: §a$(id)\n§l§eOyuncu: §b$(player)\n§l§eİzin: §6$(permission)\n§l§eSeviye: §d$(level)\n\n§7Ne yapmak istersiniz?"},can_close_with_escape:true,pause:false,actions:[{label:"▶️ Yürüt",action:{type:"minecraft:run_command",command:"/function custom_admin:handler/execute/action {id:\"$(id)\"}"}},{label:"✏️ Düzenle",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/utils/edit_start {id:\"$(id)\"}"}},{label:"🗑️ Sil",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚠️ Onay",body:{type:"minecraft:plain_message",contents:"§l§c$(permission) iznini silmek istediğinize emin misiniz?\n\n§7Bu işlem geri alınamaz!"},can_close_with_escape:true,pause:false,actions:[{label:"✅ Evet, Sil",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/utils/delete_confirm {id:\"$(id)\"}"}},{label:"❌ Vazgeç",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 2"}}]}}},{label:"◀️ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set -4"}}]}}}

# Ana menüye ekle
data modify storage glc:ui ui.actions append from storage glc:ui temp.button_data