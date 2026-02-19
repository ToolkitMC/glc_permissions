# ═══════════════════════════════════════════════════
# GULCE Admin Power - Load Handler
# ═══════════════════════════════════════════════════

# Scoreboards oluştur
scoreboard objectives add gulce_trigger trigger

# Trigger'ı aktif et
scoreboard players enable @a gulce_trigger

# Başlangıç mesajı
execute as @a[tag=glc.lang_tr] run tellraw @s [{text:"════════════════════════════════",color:"aqua",bold:true},"\n",{text:"  🎮 GULCE Admin Power ",color:"gold",bold:true},{text:"v1.0.0",color:"yellow"},"\n",{text:"  ⚡ Sistem başarıyla yüklendi!",color:"green"},"\n",{text:"════════════════════════════════",color:"aqua",bold:true}]
execute as @a[tag=glc.lang_en] run tellraw @s [{text:"════════════════════════════════",color:"aqua",bold:true},"\n",{text:"  🎮 GULCE Admin Power ",color:"gold",bold:true},{text:"v1.0.0",color:"yellow"},"\n",{text:"  ⚡ Sistem başarıyla yüklendi!",color:"green"},"\n",{text:"════════════════════════════════",color:"aqua",bold:true}]

# Load tamamlandı log
execute as @a[tag=gulce_admin] if entity @s[tag=glc.lang_tr] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Yükleme tamamlandı. Timer başlatıldı.",color:"gray"}]
execute as @a[tag=gulce_admin] if entity @s[tag=glc.lang_en] run tellraw @s [{text:"[GULCE] ",color:"gold",bold:true},{text:"Yükleme tamamlandı. Timer başlatıldı.",color:"gray"}]

# Menüleri yükle
function custom_admin:handler/dialog/load/about