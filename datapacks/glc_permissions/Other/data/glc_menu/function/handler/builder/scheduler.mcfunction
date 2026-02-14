# ═══════════════════════════════════════════════════
# Zamanlayıcı Ana Menü Builder
# ═══════════════════════════════════════════════════

# Loading göster
scoreboard players set @s gulce_load.dialog 20
tag @s add glc.pending
function glc_menu:handler/dialog/loading

# Aktif zamanlama sayısını kontrol et
execute store result score #scheduled_count gulce_id run data get storage mc:handler data.scheduled

# Menü hazırla
data modify storage mc:dialog ui set value {type:"minecraft:multi_action",title:{"text":"⏰ Zamanlayıcı Yönetimi","color":"gold","bold":true},body:{type:"minecraft:plain_message",contents:"§l§6Zamanlanmış Eylemler\n\n§7• Eylem Zamanla\n§7• Aktif Görevler\n§7• Tekrarlayan Görevler"},can_close_with_escape:true,pause:false,actions:[]}

# Aktif görev sayısını göster
execute if score #scheduled_count gulce_id matches 1.. run data modify storage mc:dialog ui.body.contents set value "§l§6Zamanlanmış Eylemler\n\n§aAktif Görev: $(count)\n\n§7• Yeni Zamanlama Ekle\n§7• Aktif Görevleri Göster\n§7• Tümünü Temizle"

# Butonlar
data modify storage mc:dialog ui.actions append value {label:"➕ Yeni Zamanlama",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"➕ Eylem Zamanla",inputs:[{type:"minecraft:text",key:"action_id",label:"Eylem ID",max_length:50},{type:"minecraft:text",key:"delay",label:"Gecikme (tick)",initial:"100",max_length:10},{type:"minecraft:text",key:"player",label:"Hedef Oyuncu",initial:"@s",max_length:20},{type:"minecraft:single_option",key:"repeat",label:"Tekrar",options:[{id:"0",display:"Hayır"},{id:"1",display:"Evet"}]}],can_close_with_escape:true,pause:false,actions:[{label:"✅ Zamanla",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:schedule/add {action_id:\"$(action_id)\",delay:$(delay),player:\"$(player)\",repeat:$(repeat)}"}}]}}}

# Aktif görevler varsa göster
execute if score #scheduled_count gulce_id matches 1.. run data modify storage mc:dialog ui.actions append value {label:"📋 Aktif Görevler",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 61"}}

# Aktif görevler varsa temizleme butonu
execute if score #scheduled_count gulce_id matches 1.. run data modify storage mc:dialog ui.actions append value {label:"🗑️ Tümünü Temizle",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⚠️ Onay",body:{type:"minecraft:plain_message",contents:"§l§cTüm zamanlamaları silmek istediğinize emin misiniz?\n\n§7Bu işlem geri alınamaz!"},can_close_with_escape:true,pause:false,actions:[{label:"✅ Evet, Sil",action:{type:"minecraft:run_command",command:"/function custom_admin:schedule/clear_all"}},{label:"❌ Vazgeç",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 6"}}]}}}

# Geri butonu
data modify storage mc:dialog ui.actions append value {label:"◀️ Ana Menü",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}

# Dialog aç
function glc_menu:handler/dialog/open with storage mc:dialog