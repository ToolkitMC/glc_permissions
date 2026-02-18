# ═══════════════════════════════════════════════════
# Chat Prefix: Setup Teams (v2.5.1)
# Scoreboard team'leri oluşturur - isim rengi için
# Bir kez load'da çalışır
# ═══════════════════════════════════════════════════

# Team'leri oluştur — reload güvenli (scoreboard flag ile idempotent)
execute if score #teams_setup global matches 1 run return 0

team add glc.owner
team add glc.mod
team add glc.vip
team add glc.player
team add glc.none

# Owner - kırmızı + prefix
team modify glc.owner color dark_red
team modify glc.owner prefix [{text:'[',color:'dark_gray'},{text:'OWNER',color:'dark_red',bold:true},{text:'] ',color:'dark_gray'}]

# Mod - turuncu + prefix
team modify glc.mod color gold
team modify glc.mod prefix [{text:'[',color:'dark_gray'},{text:'MOD',color:'gold',bold:true},{text:'] ',color:'dark_gray'}]

# VIP - altın + prefix
team modify glc.vip color yellow
team modify glc.vip prefix [{text:'[',color:'dark_gray'},{text:'VIP',color:'yellow',bold:true},{text:'] ',color:'dark_gray'}]

# Player - yeşil
team modify glc.player color green
team modify glc.player prefix [{text:'[',color:'dark_gray'},{text:'Oyuncu',color:'green'},{text:'] ',color:'dark_gray'}]

# None - gri (rol atanmamış)
team modify glc.none color gray
team modify glc.none prefix [{text:'[',color:'dark_gray'},{text:'?',color:'gray'},{text:'] ',color:'dark_gray'}]

# Friendly fire kapalı
team modify glc.owner friendlyFire false
team modify glc.mod friendlyFire false
team modify glc.vip friendlyFire false
team modify glc.player friendlyFire false
team modify glc.none friendlyFire false

# Flag: bir daha çalışmasın
scoreboard players set #teams_setup global 1
