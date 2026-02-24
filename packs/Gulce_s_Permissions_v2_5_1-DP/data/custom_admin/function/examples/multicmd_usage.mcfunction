# ═══════════════════════════════════════════════════════════════════
# Multi-Command Kullanım Örnekleri
# ═══════════════════════════════════════════════════════════════════

# ÖRNEK 1: Teleport + Mesaj + Ses
# Oyuncuyu teleport et, mesaj göster ve ses çal
function custom_admin:api/add/action_multicmd {id:"welcome_spawn",selector:"@s",commands:['tp @s 0 64 0','tellraw @s [{text:"Spawn noktasına hoş geldin!",color:"gold"}]','playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1']}

# ÖRNEK 2: VIP Ödülü
# Oyuncuya birden fazla item ver ve mesaj göster
function custom_admin:api/add/action_multicmd {id:"vip_reward",selector:"@s",commands:['give @s minecraft:diamond 10','give @s minecraft:emerald 5','give @s minecraft:gold_ingot 20','tellraw @s [{text:"VIP ödülün verildi!",color:"green"}]','effect give @s minecraft:speed 30 1']}

# ÖRNEK 3: Admin TP Menüsü
# Admin için hızlı teleport + görünmezlik
function custom_admin:api/add/action_multicmd {id:"admin_tp_spawn",selector:"@s",commands:['tp @s 0 64 0','effect give @s minecraft:invisibility 10 0 true','tellraw @s [{text:"Admin moda geçildi",color:"red"}]']}

# ÖRNEK 4: Arena Hazırlığı
# Oyuncuyu hazırla: temizle, gamemode, heal, teleport
function custom_admin:api/add/action_multicmd {id:"prepare_arena",selector:"@s",commands:['clear @s','gamemode adventure @s','effect clear @s','effect give @s minecraft:instant_health 1 10','tp @s 100 64 100','title @s title [{text:"ARENA",color:"red",bold:true}]']}

# ÖRNEK 5: Event Başlangıcı
# Tüm oyunculara duyuru + teleport + süre ayarla
function custom_admin:api/add/action_multicmd {id:"start_event",selector:"@a",commands:['tellraw @a [{text:"=== EVENT BAŞLIYOR ===",color:"gold",bold:true}]','tp @a 200 80 200','time set day','weather clear','effect give @a minecraft:resistance 20 4']}

# ÖRNEK 6: Hızlı Kit
# Başlangıç kiti ver
function custom_admin:api/add/action_multicmd {id:"starter_kit",selector:"@s",commands:['give @s minecraft:iron_sword','give @s minecraft:iron_pickaxe','give @s minecraft:bread 16','give @s minecraft:torch 32','tellraw @s [{text:"Başlangıç kiti verildi!",color:"green"}]']}

# ═══════════════════════════════════════════════════════════════════
# KULLANIM NOTU:
# 
# 1. commands parametresi bir JSON array olmalı: ["komut1","komut2","komut3"]
# 2. Komutlar sırayla çalıştırılır
# 3. selector parametresi hangi oyuncuda çalışacağını belirler (@s, @a, @p vb.)
# 4. Her komut, belirtilen selector'da execute as $(selector) at @s ile çalışır
# 
# Eylem çalıştırma:
# /function custom_admin:handler/execute/action {id:"welcome_spawn"}
# ═══════════════════════════════════════════════════════════════════
