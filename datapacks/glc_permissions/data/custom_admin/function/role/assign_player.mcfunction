# ═══════════════════════════════════════════════════
# Role: Assign PLAYER (Normal Oyuncu)
# Usage: /function custom_admin:role/assign_player {player:"oyuncu_adi"}
# Permission Level: 2 (MOD veya OWNER)
# ═══════════════════════════════════════════════════

# Oyuncuya player tag'i ver
$tag @a[name="$(player)",limit=1] add gulce_player

# Tüm üst rolleri kaldır
$tag @a[name="$(player)",limit=1] remove gulce_owner
$tag @a[name="$(player)",limit=1] remove gulce_mod
$tag @a[name="$(player)",limit=1] remove gulce_vip
$tag @a[name="$(player)",limit=1] remove gulce_admin

# Başarı mesajı
tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"✅ PLAYER rolü verildi","color":"green"}]
$tellraw @s ["",{"text":"  👤 Oyuncu: ","color":"gray"},{"text":"$(player)","color":"yellow"}]
tellraw @s ["",{"text":"  ⭐ Yetki: ","color":"gray"},{"text":"NORMAL OYUNCU","color":"white"}]

# Loglama
$tellraw @a[tag=gulce_mod] ["",{"text":"[LOG] ","color":"dark_gray"},{"selector":"@s","color":"gray"},{"text":" verdi PLAYER rolünü → ","color":"gray"},{"text":"$(player)","color":"yellow"}]

# Oyuncuya bildirim
$tellraw @a[name="$(player)"] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
$tellraw @a[name="$(player)"] ["",{"text":"  👤 Normal Oyuncu Yetkisi","color":"white","bold":true}]
$tellraw @a[name="$(player)"] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
$tellraw @a[name="$(player)"] ["",{"text":"  Standart oyun yetkilerine sahipsiniz","color":"gray"}]
$tellraw @a[name="$(player)"] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
