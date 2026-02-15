# ═══════════════════════════════════════════════════
# Role: Assign OWNER (Tam Yetki)
# Usage: /function custom_admin:role/assign_owner {player:"oyuncu_adi"}
# Permission Level: 3 (OP gerekli)
# ═══════════════════════════════════════════════════

# Oyuncuya owner tag'i ver
$tag @a[name="$(player)",limit=1] add gulce_owner
$tag @a[name="$(player)",limit=1] add gulce_admin

# Alt rolleri de ekle (hiyerarşi)
$tag @a[name="$(player)",limit=1] add gulce_mod
$tag @a[name="$(player)",limit=1] add gulce_vip
$tag @a[name="$(player)",limit=1] add gulce_player

# Başarı mesajı
tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"✅ OWNER rolü verildi","color":"green"}]
$tellraw @s ["",{"text":"  👑 Oyuncu: ","color":"gray"},{"text":"$(player)","color":"yellow"}]
tellraw @s ["",{"text":"  ⭐ Yetki: ","color":"gray"},{"text":"TAM YETKİ","color":"red","bold":true}]

# Loglama
$tellraw @a[tag=gulce_owner] ["",{"text":"[LOG] ","color":"dark_gray"},{"selector":"@s","color":"gray"},{"text":" verdi OWNER rolünü → ","color":"gray"},{"text":"$(player)","color":"yellow"}]

# Oyuncuya bildirim
$tellraw @a[name="$(player)"] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
$tellraw @a[name="$(player)"] ["",{"text":"  👑 OWNER Yetkisi Alındı!","color":"red","bold":true}]
$tellraw @a[name="$(player)"] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
$tellraw @a[name="$(player)"] ["",{"text":"  Artık tüm yetkileriniz var","color":"gray"}]
$tellraw @a[name="$(player)"] ["",{"text":"  ⚡ /function minecraft:open_gulce_menu ","color":"aqua"},{"text":"ile menüye erişebilirsiniz","color":"gray"}]
$tellraw @a[name="$(player)"] ["",{"text":"═══════════════════════════════════","color":"gold","bold":true}]
