# ═══════════════════════════════════════════════════
# Zamanlama Buton Oluşturucu (MACRO)
# ═══════════════════════════════════════════════════

# Buton hazırla
$data modify storage mc:dialog temp.schedule_button set value {label:"$(repeat_icon) $(action_id) ($(remaining) tick)",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:{text:"⏰ $(action_id)",color:"gold",italic:0b},body:{type:"minecraft:plain_message",contents:"Eylem ID: $(action_id)Kalan: $(remaining) tickOrijinal: $(delay) tickOyuncu: $(player)Tekrar: $(repeat_text)Ne yapmak istersiniz?"},can_close_with_escape:1b,pause:0b,after_action:"close",actions:[{label:"▶️ Hemen Çalıştır",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/utils/schedule_run_now {schedule_id:$(schedule_id)}"}},{label:"🗑️ Sil",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:{text:"⚠️ Onay",color:"red"},body:{type:"minecraft:plain_message",contents:"$(action_id) zamanlamasını silmek istediğinize emin misiniz?Bu işlem geri alınamaz!"},can_close_with_escape:1b,pause:0b,actions:[{label:"✅ Evet, Sil",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/utils/schedule_delete {schedule_id:$(schedule_id)}"}},{label:"❌ Vazgeç",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 52"}}]}}},{label:"◀️ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 52"}}]}}}

# Ana menüye ekle
data modify storage mc:dialog ui.actions append from storage mc:dialog temp.schedule_button