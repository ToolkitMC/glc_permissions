# ═══════════════════════════════════════════════════
# Role: Assign VIP
# Usage: /function custom_admin:role/assign_vip {player:"oyuncu_adi"}
# Permission Level: 2 (MOD veya OWNER)
# ═══════════════════════════════════════════════════

# Oyuncuya vip tag'i ver
$tag @a[name="$(player)",limit=1] add gulce_vip
$tag @a[name="$(player)",limit=1] add gulce_player

# Üst rolleri kaldır (güvenlik)
$tag @a[name="$(player)",limit=1] remove gulce_owner
$tag @a[name="$(player)",limit=1] remove gulce_mod

# Başarı mesajı
tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"✅ VIP rolü verildi","color":"green"}]
$tellraw @s ["",{"text":"  ⭐ Oyuncu: ","color":"gray"},{"text":"$(player)","color":"yellow"}]
tellraw @s ["",{"text":"  ⭐ Yetki: ","color":"gray"},{"text":"VIP","color":"light_purple","bold":true}]

# Loglama
$tellraw @a[tag=gulce_mod] ["",{"text":"[LOG] ","color":"dark_gray"},{"selector":"@s","color":"gray"},{"text":" verdi VIP rolünü → ","color":"gray"},{"text":"$(player)","color":"yellow"}]

# Oyuncuya bildirim
$tellraw @a[name="$(player)"] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
$tellraw @a[name="$(player)"] ["",{"text":"  ⭐ VIP Yetkisi Alındı!","color":"light_purple","bold":true}]
$tellraw @a[name="$(player)"] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
$tellraw @a[name="$(player)"] ["",{"text":"  VIP özelliklerine erişim","color":"gray"}]
$tellraw @a[name="$(player)"] ["",{"text":"  ✨ Özel eşyalar","color":"aqua"}]
$tellraw @a[name="$(player)"] ["",{"text":"  ✨ Hızlı erişim","color":"aqua"}]
$tellraw @a[name="$(player)"] ["",{"text":"  ✨ Özel efektler","color":"aqua"}]
$tellraw @a[name="$(player)"] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
