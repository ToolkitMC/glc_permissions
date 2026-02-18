# ═══════════════════════════════════════════════════
# 🤖 GULCE OTOMASYON PANELİ (v2.5.1)
# Owner yetkisi gerekir
# ═══════════════════════════════════════════════════

# 1. YETKİ KONTROLÜ
execute unless entity @s[tag=gulce_owner] run return fail

# 2. UI
data modify storage glc:ui ui set value {type:"minecraft:multi_action",title:{text:"🤖 OTOMASYON PANELİ",color:"dark_aqua",bold:true},body:{type:"minecraft:plain_message",contents:"\n§7Sunucu otomasyonunu yönet:\n "},can_close_with_escape:1b,pause:0b,columns:2,actions:[]}

# [📢] OTO DUYURU EKLE
data modify storage glc:ui ui.actions append value {label:"📢 Oto Duyuru Ekle",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📢 Otomatik Duyuru",inputs:[{type:"minecraft:text",key:'msg',label:"Duyuru Metni"},{type:"minecraft:text",key:'interval',label:"Aralık (tick, 1200=1dk)",initial:"1200"}],actions:[{label:"💾 Ekle",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:handler/automation/add_announce {msg:\"$(msg)\",interval:$(interval)}"}}]}}}

# [🔔] OTO DUYURU AÇ/KAPAT
data modify storage glc:ui ui.actions append value {label:"🔔 Oto Duyuru Aç/Kapat",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔔 Oto Duyuru",inputs:[{type:"minecraft:single_option",key:'state',label:"Durum",options:[{id:"1b",display:"✅ Açık"},{id:"0b",display:"❌ Kapalı"}]}],actions:[{label:"✅ Uygula",action:{type:"minecraft:dynamic/run_command",template:"/data modify storage glc:config auto_announce.enabled set value $(state)"}}]}}}

# [⚡] ZAMANLAYICI LİSTESİ
data modify storage glc:ui ui.actions append value {label:"⏰ Zamanlayıcı Listesi",action:{type:"minecraft:run_command",command:"/function custom_admin:handler/schedule/list"}}

# [🗑️] TÜM ZAMANLAYICILARI TEMİZLE
data modify storage glc:ui ui.actions append value {label:"🗑️ Zamanlayıcıları Temizle",action:{type:"minecraft:run_command",command:"/function custom_admin:handler/schedule/clear_all"}}

# [🔄] OYUNCU GİRİŞ MESAJI AYARLA
data modify storage glc:ui ui.actions append value {label:"👋 Karşılama Mesajı Ayarla",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"👋 Karşılama Mesajı",inputs:[{type:"minecraft:text",key:'msg',label:"Mesaj (%player% = oyuncu adı)",initial:"Sunucuya hoş geldin!"},{type:"minecraft:boolean",key:'enabled',label:"Aktif",initial:true,on_true:"1b",on_false:"0b"}],actions:[{label:"💾 Kaydet",action:{type:"minecraft:dynamic/run_command",template:"/data modify storage glc:config welcome.message set value \"$(msg)\""}}]}}}

# [📊] SİSTEM DURUMU
data modify storage glc:ui ui.actions append value {label:"📊 Sistem Durumu",action:{type:"minecraft:run_command",command:"/function custom_admin:util/settings/show"}}

# 3. RENDER
function glc_menu:handler/dialog/show
return 0
