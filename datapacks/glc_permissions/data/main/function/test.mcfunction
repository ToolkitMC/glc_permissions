# 🧪 GLC Permissions - Test Fonksiyonu
# Kullanım: /function main:test

tellraw @s [{"text":"\n","color":"white"},{"text":"========================================","color":"gold","bold":true}]
tellraw @s [{"text":"       🧪 GLC Permissions Test","color":"yellow","bold":true}]
tellraw @s [{"text":"========================================","color":"gold","bold":true}]

# 1. Scoreboard kontrolü
tellraw @s [{"text":"\n📊 Scoreboard Durumu:","color":"aqua","bold":true}]
execute if score #main glc.loop matches -2147483648.. run tellraw @s [{"text":"  ✅ #main loop: ","color":"green"},{"score":{"name":"#main","objective":"glc.loop"},"color":"yellow"},{"text":" tick","color":"gray"}]
execute unless score #main glc.loop matches -2147483648.. run tellraw @s [{"text":"  ❌ #main loop tanımlı değil!","color":"red"}]

execute if score #glc glc.loop matches -2147483648.. run tellraw @s [{"text":"  ✅ #glc loop: ","color":"green"},{"score":{"name":"#glc","objective":"glc.loop"},"color":"yellow"},{"text":" tick","color":"gray"}]
execute unless score #glc glc.loop matches -2147483648.. run tellraw @s [{"text":"  ❌ #glc loop tanımlı değil!","color":"red"}]

# 2. Storage kontrolü
tellraw @s [{"text":"\n💾 Storage Durumu:","color":"aqua","bold":true}]
execute if data storage glc:loops config[0] run tellraw @s [{"text":"  ✅ Storage yapılandırması mevcut","color":"green"}]
execute unless data storage glc:loops config[0] run tellraw @s [{"text":"  ❌ Storage yapılandırması eksik!","color":"red"}]

# 3. Oyuncu sayısı
tellraw @s [{"text":"\n👥 Aktif Oyuncular:","color":"aqua","bold":true}]
execute store result score #test_players glc.loop if entity @a
tellraw @s [{"text":"  ","color":"white"},{"score":{"name":"#test_players","objective":"glc.loop"},"color":"yellow"},{"text":" oyuncu çevrimiçi","color":"gray"}]

# 4. Predicate kontrolü
tellraw @s [{"text":"\n🔧 Predicate Durumu:","color":"aqua","bold":true}]
execute if predicate glc_menu:holding_menu_item run tellraw @s [{"text":"  ✅ Menu item elinde (predicate çalışıyor)","color":"green"}]
execute unless predicate glc_menu:holding_menu_item run tellraw @s [{"text":"  ℹ️  Menu item elinde değil","color":"gray"}]

# 5. Hızlı testler (NO interactive elements - commands only)
tellraw @s [{"text":"\n⚡ Hızlı Komutlar:","color":"aqua","bold":true}]
tellraw @s [{"text":"  /function main:loop/show","color":"yellow"},{"text":" - Loop değerlerini göster","color":"gray"}]
tellraw @s [{"text":"  /function glc_permissions:setup","color":"yellow"},{"text":" - Sistemi yeniden başlat","color":"gray"}]
tellraw @s [{"text":"  /tag @s add gulce_debug","color":"yellow"},{"text":" - Debug mode aç","color":"gray"}]
tellraw @s [{"text":"  /tag @s remove gulce_debug","color":"yellow"},{"text":" - Debug mode kapat","color":"gray"}]

# Sonuç
tellraw @s [{"text":"\n","color":"white"}]
execute if score #main glc.loop matches -2147483648.. if score #glc glc.loop matches -2147483648.. run tellraw @s [{"text":"✅ Sistem çalışıyor!","color":"green","bold":true}]
execute unless score #main glc.loop matches -2147483648.. run tellraw @s [{"text":"❌ Sistem kurulmamış! /function glc_permissions:setup","color":"red","bold":true}]
execute unless score #glc glc.loop matches -2147483648.. run tellraw @s [{"text":"❌ Sistem kurulmamış! /function glc_permissions:setup","color":"red","bold":true}]

tellraw @s [{"text":"========================================\n","color":"gold","bold":true}]

# Temizlik
scoreboard players reset #test_players glc.loop
