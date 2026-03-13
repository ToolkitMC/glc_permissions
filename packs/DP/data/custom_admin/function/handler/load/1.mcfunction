# ═══════════════════════════════════════════════════
# GULCE Admin Power - Load Handler
# v2.5.9: EN mesajı düzeltildi, sürüm dinamik hale getirildi
# ═══════════════════════════════════════════════════

# Scoreboards oluştur
scoreboard objectives add gulce_trigger trigger

# Trigger'ı aktif et
scoreboard players enable @a gulce_trigger

# Başlangıç mesajı - DÜZELTME v2.5.9: EN mesajı Türkçe yazılmıştı + sürüm dinamik
execute as @a[tag=glc.lang_tr] run tellraw @s [{text:"════════════════════════════════",color:"aqua",bold:true},"\n",{text:"  🎮 GULCE Admin Power ",color:"gold",bold:true},{nbt:'version',"storage":"glc:data",color:"yellow"},"\n",{text:"  ⚡ Sistem başarıyla yüklendi!",color:"green"},"\n",{text:"════════════════════════════════",color:"aqua",bold:true}]
execute as @a[tag=glc.lang_en] run tellraw @s [{text:"════════════════════════════════",color:"aqua",bold:true},"\n",{text:"  🎮 GULCE Admin Power ",color:"gold",bold:true},{nbt:'version',"storage":"glc:data",color:"yellow"},"\n",{text:"  ⚡ System loaded successfully!",color:"green"},"\n",{text:"════════════════════════════════",color:"aqua",bold:true}]
execute as @a[tag=glc.lang_de] run tellraw @s [{text:"════════════════════════════════",color:"aqua",bold:true},"\n",{text:"  🎮 GULCE Admin Power ",color:"gold",bold:true},{nbt:'version',"storage":"glc:data",color:"yellow"},"\n",{text:"  ⚡ System erfolgreich geladen!",color:"green"},"\n",{text:"════════════════════════════════",color:"aqua",bold:true}]

# Load tamamlandı log
execute as @a[tag=gulce_admin,tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Yükleme tamamlandı. Timer başlatıldı.",color:"gray"}]
execute as @a[tag=gulce_admin,tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Load complete. Timer started.",color:"gray"}]
execute as @a[tag=gulce_admin,tag=glc.lang_de] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Laden abgeschlossen. Timer gestartet.",color:"gray"}]

# Menüleri yükle
function custom_admin:handler/dialog/load/about
