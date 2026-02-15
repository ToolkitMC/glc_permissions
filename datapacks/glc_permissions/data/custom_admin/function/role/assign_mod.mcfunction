# ═══════════════════════════════════════════════════
# Role: Assign MOD (Moderatör)
# Usage: /function custom_admin:role/assign_mod {player:"oyuncu_adi"}
# Permission Level: 3 (OP gerekli veya OWNER)
# ═══════════════════════════════════════════════════

# Oyuncuya mod tag'i ver
$tag @a[name="$(player)",limit=1] add gulce_mod

# Alt rolleri de ekle
$tag @a[name="$(player)",limit=1] add gulce_vip
$tag @a[name="$(player)",limit=1] add gulce_player

# OWNER tag'ini kaldır (güvenlik)
$tag @a[name="$(player)",limit=1] remove gulce_owner

# Başarı mesajı
tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"✅ MOD rolü verildi","color":"green"}]
$tellraw @s ["",{"text":"  👮 Oyuncu: ","color":"gray"},{"text":"$(player)","color":"yellow"}]
tellraw @s ["",{"text":"  ⭐ Yetki: ","color":"gray"},{"text":"MODERATÖR","color":"blue","bold":true}]

# Loglama
$tellraw @a[tag=gulce_owner] ["",{"text":"[LOG] ","color":"dark_gray"},{"selector":"@s","color":"gray"},{"text":" verdi MOD rolünü → ","color":"gray"},{"text":"$(player)","color":"yellow"}]

# Oyuncuya bildirim
$tellraw @a[name="$(player)"] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
$tellraw @a[name="$(player)"] ["",{"text":"  👮 MOD Yetkisi Alındı!","color":"blue","bold":true}]
$tellraw @a[name="$(player)"] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
$tellraw @a[name="$(player)"] ["",{"text":"  Moderatör yetkilerine sahipsiniz","color":"gray"}]
$tellraw @a[name="$(player)"] ["",{"text":"  ⚡ Oyuncu yönetimi","color":"aqua"}]
$tellraw @a[name="$(player)"] ["",{"text":"  ⚡ Mesaj yönetimi","color":"aqua"}]
$tellraw @a[name="$(player)"] ["",{"text":"  ⚡ Teleport yetkisi","color":"aqua"}]
$tellraw @a[name="$(player)"] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
